@implementation ASDTIOA2LegacyDevice

- (ASDTIOA2LegacyDevice)initWithIOA2Device:(unsigned int)a3 plugin:(id)a4
{
  id v6;
  ASDT::IOA2UCDevice *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  ASDTIOA2LegacyDevice *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  CADeprecated::CADispatchQueue *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  id v20;
  dispatch_queue_t v21;
  void *v22;
  ASDTIOA2LegacyDevice *v23;
  char v24;
  char v25;
  ASDTIOA2LegacyDevice *v26;
  NSObject *v27;
  uint64_t v29;
  char v30;
  char v31;
  CADeprecated::CADispatchQueue *v32;
  int v33;
  uint8_t buf[8];
  id v35[2];
  _QWORD v36[4];
  ASDTIOA2LegacyDevice *v37;
  id v38;
  id location;
  std::recursive_mutex *v40;
  char v41;
  objc_super v42;
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (ASDT::IOA2UCDevice *)operator new();
  ASDT::IOA2UCDevice::IOA2UCDevice(v7, a3);
  v8 = *((_QWORD *)self + 66);
  *((_QWORD *)self + 66) = v7;
  if (!v8 || ((*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8), *((_QWORD *)self + 66)))
  {
    IOObjectRetain(a3);
    v9 = ASDT::IOA2UCDevice::CopyDeviceUID(*((ASDT::IOA2UCDevice **)self + 66));
    v43 = *MEMORY[0x24BE0A560];
    v44[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42.receiver = self;
    v42.super_class = (Class)ASDTIOA2LegacyDevice;
    v11 = -[ASDTAudioDevice initWithConfig:withDeviceManager:andPlugin:](&v42, sel_initWithConfig_withDeviceManager_andPlugin_, v10, 0, v6);
    self = v11;
    if (!v11)
      goto LABEL_23;
    -[ASDTIOA2LegacyDevice scopedLock](v11, "scopedLock");
    -[ASDAudioDevice setCanBeDefaultInputDevice:](self, "setCanBeDefaultInputDevice:", ASDT::IOA2UCDevice::GetNumberStreams(*((ASDT::IOA2UCDevice **)self + 66), 1) != 0);
    -[ASDAudioDevice setCanBeDefaultOutputDevice:](self, "setCanBeDefaultOutputDevice:", ASDT::IOA2UCDevice::GetNumberStreams(*((ASDT::IOA2UCDevice **)self + 66), 0) != 0);
    -[ASDAudioDevice setCanBeDefaultSystemDevice:](self, "setCanBeDefaultSystemDevice:", 1);
    v12 = (_BYTE *)*((_QWORD *)self + 66);
    v12[33] = 1;
    (*(void (**)(_BYTE *))(*(_QWORD *)v12 + 24))(v12);
    -[ASDTIOA2LegacyDevice setupCustomPropertySelectorMap](self, "setupCustomPropertySelectorMap");
    v13 = operator new();
    *(_QWORD *)v13 = MEMORY[0x24BE0A528] + 16;
    *(_DWORD *)(v13 + 8) = ASDT::MachPort::CreatePort((ASDT::MachPort *)1);
    *(_WORD *)(v13 + 12) = 257;
    *(_QWORD *)(v13 + 24) = 0;
    *(_QWORD *)(v13 + 32) = 0;
    *(_QWORD *)(v13 + 16) = 0;
    v14 = *((_QWORD *)self + 68);
    *((_QWORD *)self + 68) = v13;
    if (v14)
      (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
    v15 = (CADeprecated::CADispatchQueue *)operator new();
    CADeprecated::CADispatchQueue::CADispatchQueue(v15, "com.apple.audio.macaudio.IOA2.event");
    v16 = *((_QWORD *)self + 77);
    *((_QWORD *)self + 77) = v15;
    if (v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
    *((_DWORD *)self + 228) = 0;
    v17 = (void *)MEMORY[0x24BDD17C8];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%s.%@.%@"), "com.apple.AudioServerDriverTransports", v19, v9);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = dispatch_queue_create((const char *)objc_msgSend(v20, "UTF8String"), 0);
    v22 = (void *)*((_QWORD *)self + 116);
    *((_QWORD *)self + 116) = v21;

    objc_initWeak(&location, self);
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3321888768;
    v36[2] = __50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin___block_invoke;
    v36[3] = &__block_descriptor_48_ea8_32c63_ZTSKZ50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin__E3__0_e5_v8__0l;
    v23 = self;
    *(_QWORD *)buf = v23;
    objc_copyWeak(v35, &location);
    v37 = v23;
    objc_copyWeak(&v38, v35);
    v24 = ASDT::exceptionBarrierReturnSuccess(v36);
    objc_destroyWeak(v35);

    if ((v24 & 1) != 0)
    {
      if (-[ASDTIOA2LegacyDevice _updateControls:](v23, "_updateControls:", &v40))
      {
        if (-[ASDTIOA2LegacyDevice _updateStreams](v23, "_updateStreams"))
        {
          if (-[ASDTIOA2LegacyDevice _openConnection](v23, "_openConnection"))
          {
            v25 = 1;
          }
          else
          {
            v29 = *((_QWORD *)self + 68);
            v30 = *(_BYTE *)(v29 + 12);
            v31 = *(_BYTE *)(v29 + 13);
            v32 = (CADeprecated::CADispatchQueue *)*((_QWORD *)self + 77);
            v33 = *(_DWORD *)(v29 + 8);
            *(_DWORD *)(v29 + 8) = 0;
            CADeprecated::CADispatchQueue::RemoveMachPortReceiver(v32, v33, v30, v31);
            v25 = 0;
          }
LABEL_20:
          objc_destroyWeak(&v38);

          objc_destroyWeak(&location);
          if (v41)
            std::recursive_mutex::unlock(v40);
          if ((v25 & 1) == 0)
          {
            v26 = 0;
            goto LABEL_25;
          }
LABEL_23:
          v26 = self;
LABEL_25:

          goto LABEL_26;
        }
        v25 = 0;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        *(_WORD *)buf = 0;
        v27 = MEMORY[0x24BDACB70];
      }
      else
      {
        v25 = 0;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        *(_WORD *)buf = 0;
        v27 = MEMORY[0x24BDACB70];
      }
      _os_log_impl(&dword_236D43000, v27, OS_LOG_TYPE_DEFAULT, "Error creating streams", buf, 2u);
    }
    v25 = 0;
    goto LABEL_20;
  }
  v26 = 0;
LABEL_26:

  return v26;
}

void __50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 616);
  v3 = *(_DWORD *)(*(_QWORD *)(v1 + 544) + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = ___ZZ50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin__ENK3__0clEv_block_invoke;
  v4[3] = &unk_25084B4E0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  CADeprecated::CADispatchQueue::InstallMachPortReceiver(v2, v3, v4);
  objc_destroyWeak(&v5);
}

- (void)dealloc
{
  objc_super v3;

  -[ASDTIOA2LegacyDevice _closeConnection](self, "_closeConnection");
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2LegacyDevice;
  -[ASDAudioDevice dealloc](&v3, sel_dealloc);
}

- (void)handleMachPortMessage
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, " HALS_IOA2Device::_IOAudio2DeviceNotificationPortMessageHandler: failed to receive the message, Error: 0x%X", (uint8_t *)v1, 8u);
}

- (void)blockIORequests
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_4_0(v4, v5);
  OUTLINED_FUNCTION_6_0(&dword_236D43000, MEMORY[0x24BDACB70], v6, "%@: %s: IORequestCount: %d", v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)releaseIORequests
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_4_0(v4, v5);
  OUTLINED_FUNCTION_6_0(&dword_236D43000, MEMORY[0x24BDACB70], v6, "%@: %s: IORequestCount: %d", v7);

  OUTLINED_FUNCTION_1_1();
}

- (BOOL)startIORequest
{
  std::chrono::steady_clock::time_point v3;
  int *v4;
  int v5;
  std::chrono::steady_clock::time_point v6;
  std::chrono::system_clock::time_point v7;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v9;
  std::unique_lock<std::mutex> v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v11.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 800);
  v11.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)self + 800));
  v3.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_ + 2000000000;
  v4 = (int *)((char *)self + 912);
  while (1)
  {
    v5 = *v4;
    if (*v4 < 1)
      break;
    if (std::chrono::steady_clock::now().__d_.__rep_ >= v3.__d_.__rep_)
      goto LABEL_18;
    v6.__d_.__rep_ = v3.__d_.__rep_ - std::chrono::steady_clock::now().__d_.__rep_;
    if (v6.__d_.__rep_ >= 1)
    {
      std::chrono::steady_clock::now();
      v7.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (!v7.__d_.__rep_)
      {
        v8 = 0;
        goto LABEL_13;
      }
      if (v7.__d_.__rep_ < 1)
      {
        if ((unint64_t)v7.__d_.__rep_ >= 0xFFDF3B645A1CAC09)
          goto LABEL_12;
        v8 = 0x8000000000000000;
      }
      else
      {
        if ((unint64_t)v7.__d_.__rep_ > 0x20C49BA5E353F7)
        {
          v8 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_13;
        }
LABEL_12:
        v8 = 1000 * v7.__d_.__rep_;
LABEL_13:
        if (v8 > (v6.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
        {
          v9.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_16:
          std::condition_variable::__do_timed_wait((std::condition_variable *)self + 18, &v11, v9);
          std::chrono::steady_clock::now();
          goto LABEL_17;
        }
      }
      v9.__d_.__rep_ = v8 + v6.__d_.__rep_;
      goto LABEL_16;
    }
LABEL_17:
    if (std::chrono::steady_clock::now().__d_.__rep_ >= v3.__d_.__rep_)
    {
LABEL_18:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID", v11.__m_);
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2LegacyDevice startIORequest].cold.2();
      }
      goto LABEL_22;
    }
  }
  --*v4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID", v11.__m_);
    objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LegacyDevice startIORequest].cold.1();
  }
LABEL_22:
  if (v11.__owns_)
    std::mutex::unlock(v11.__m_);
  return v5 < 1;
}

- (void)stopIORequest
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_4_0(v4, v5);
  OUTLINED_FUNCTION_6_0(&dword_236D43000, MEMORY[0x24BDACB70], v6, "%@: %s: IORequestCount: %d", v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)handleConfigChange:(IOAudio2Notification *)a3
{
  void *v5;
  __int128 v6;
  _QWORD v7[5];
  id v8;
  id location;
  __int128 buf;
  uint64_t v11;
  __n128 (*v12)(uint64_t, uint64_t);
  uint64_t (*v13)();
  void *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Handle configuration change.", (uint8_t *)&buf, 0xCu);

  }
  -[ASDTIOA2LegacyDevice blockIORequests](self, "blockIORequests");
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v12 = __Block_byref_object_copy__0;
    v13 = __Block_byref_object_dispose__0;
    v11 = 0x5012000000;
    v14 = &unk_236D815AA;
    v6 = *(_OWORD *)&a3->var4;
    v15 = *(_OWORD *)&a3->var0;
    v16 = v6;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __43__ASDTIOA2LegacyDevice_handleConfigChange___block_invoke;
    v7[3] = &unk_25084B478;
    objc_copyWeak(&v8, &location);
    v7[4] = &buf;
    -[ASDAudioDevice requestConfigurationChange:](self, "requestConfigurationChange:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    -[ASDTIOA2LegacyDevice doConfigChange:](self, "doConfigChange:", a3);
    -[ASDTIOA2LegacyDevice releaseIORequests](self, "releaseIORequests");
  }
}

void __43__ASDTIOA2LegacyDevice_handleConfigChange___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "doConfigChange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "releaseIORequests");

}

- (void)doConfigChange:(IOAudio2Notification *)a3
{
  void *v5;
  int v6;
  _DWORD v7[4];
  _BYTE buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Do configuration change.", buf, 0xCu);

  }
  -[ASDTIOA2LegacyDevice forceStopIO](self, "forceStopIO");
  -[ASDTIOA2LegacyDevice scopedLock](self, "scopedLock");
  v6 = ASDT::IOA2UCDevice::PerformConfigChange(*((ASDT::IOA2UCDevice **)self + 66), a3);
  if (v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Error performing config change: %d", (uint8_t *)v7, 8u);
  }
  std::mutex::lock((std::mutex *)((char *)self + 688));
  std::condition_variable::notify_all((std::condition_variable *)((char *)self + 752));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Signaled sample rate waiting thread", (uint8_t *)v7, 2u);
  }
  std::mutex::unlock((std::mutex *)((char *)self + 688));
  -[ASDTIOA2LegacyDevice _releaseIOBuffers](self, "_releaseIOBuffers");
  ASDT::IOA2UCDevice::ReleaseEngineStatus(*((_QWORD *)self + 66), *((void **)self + 67));
  *((_QWORD *)self + 67) = 0;
  (*(void (**)(_QWORD))(**((_QWORD **)self + 66) + 16))(*((_QWORD *)self + 66));
  (*(void (**)(_QWORD))(**((_QWORD **)self + 66) + 24))(*((_QWORD *)self + 66));
  -[ASDTIOA2LegacyDevice setupCustomPropertySelectorMap](self, "setupCustomPropertySelectorMap");
  -[ASDTIOA2LegacyDevice _updateStreams](self, "_updateStreams");
  -[ASDTIOA2LegacyDevice _updateControls:](self, "_updateControls:", buf);
  ASDT::IOA2UCDevice::MapEngineStatus(*((ASDT::IOA2UCDevice **)self + 66), (IOAudio2EngineStatus **)self + 67);
  -[ASDTIOA2LegacyDevice _mapIOBuffers](self, "_mapIOBuffers");
  -[ASDTIOA2LegacyDevice _pushStreamActiveStates](self, "_pushStreamActiveStates");
  if (buf[8])
    std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
}

- (void)handleControlChange:(IOAudio2Notification *)a3
{
  void *v5;
  unsigned int var1;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unsigned int var2;
  std::recursive_mutex *v18;
  char v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[ASDTIOA2LegacyDevice scopedLock](self, "scopedLock");
  -[ASDTIOA2LegacyDevice _getControlByUCID:](self, "_getControlByUCID:", a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = a3->var1;
  if (var1 == 1668443751)
  {
    (*(void (**)(_QWORD))(**((_QWORD **)self + 66) + 16))(*((_QWORD *)self + 66));
    std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v18);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "objectClass") >> 29
        && objc_msgSend(v5, "objectClass") >> 24 <= 0x7E)
      {
        v10 = objc_msgSend(v5, "objectClass") >> 24;
      }
      else
      {
        v10 = 32;
      }
      if ((objc_msgSend(v5, "objectClass") & 0xE00000) != 0
        && (objc_msgSend(v5, "objectClass") >> 16) <= 0x7Eu)
      {
        v12 = (objc_msgSend(v5, "objectClass") >> 16);
      }
      else
      {
        v12 = 32;
      }
      if ((objc_msgSend(v5, "objectClass") & 0xE000) != 0
        && ((unsigned __int16)objc_msgSend(v5, "objectClass") >> 8) <= 0x7Eu)
      {
        v14 = ((unsigned __int16)objc_msgSend(v5, "objectClass") >> 8);
      }
      else
      {
        v14 = 32;
      }
      if ((objc_msgSend(v5, "objectClass") & 0xE0) != 0 && objc_msgSend(v5, "objectClass") <= 0x7Eu)
        v16 = objc_msgSend(v5, "objectClass");
      else
        v16 = 32;
      *(_DWORD *)buf = 138413314;
      v21 = v9;
      v22 = 1024;
      v23 = v10;
      v24 = 1024;
      v25 = v12;
      v26 = 1024;
      v27 = v14;
      v28 = 1024;
      v29 = v16;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' range change notification.", buf, 0x24u);

    }
    objc_msgSend(v5, "synchronizeWithRegistry");
  }
  else if (var1 == 1668702572)
  {
    std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v18);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "objectClass") >> 29
        && objc_msgSend(v5, "objectClass") >> 24 <= 0x7E)
      {
        v8 = objc_msgSend(v5, "objectClass") >> 24;
      }
      else
      {
        v8 = 32;
      }
      if ((objc_msgSend(v5, "objectClass") & 0xE00000) != 0
        && (objc_msgSend(v5, "objectClass") >> 16) <= 0x7Eu)
      {
        v11 = (objc_msgSend(v5, "objectClass") >> 16);
      }
      else
      {
        v11 = 32;
      }
      if ((objc_msgSend(v5, "objectClass") & 0xE000) != 0
        && ((unsigned __int16)objc_msgSend(v5, "objectClass") >> 8) <= 0x7Eu)
      {
        v13 = ((unsigned __int16)objc_msgSend(v5, "objectClass") >> 8);
      }
      else
      {
        v13 = 32;
      }
      if ((objc_msgSend(v5, "objectClass") & 0xE0) != 0 && objc_msgSend(v5, "objectClass") <= 0x7Eu)
        v15 = objc_msgSend(v5, "objectClass");
      else
        v15 = 32;
      var2 = a3->var2;
      *(_DWORD *)buf = 138413570;
      v21 = v7;
      v22 = 1024;
      v23 = v8;
      v24 = 1024;
      v25 = v11;
      v26 = 1024;
      v27 = v13;
      v28 = 1024;
      v29 = v15;
      v30 = 1024;
      v31 = var2;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' value change notification: %u", buf, 0x2Au);

    }
    objc_msgSend(v5, "pushValue:", a3->var2);
  }

  if (v19)
    std::recursive_mutex::unlock(v18);
}

- (void)handleTransportChanged:(IOAudio2Notification *)a3
{
  unsigned int var1;
  _BYTE v6[5];

  var1 = a3->var1;
  if (var1 == 1751215220 || var1 == 1735354734)
  {
    v6[0] = HIBYTE(a3->var1);
    v6[1] = BYTE2(var1);
    v6[2] = BYTE1(var1);
    v6[3] = var1;
    v6[4] = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[ASDTIOA2LegacyDevice handleTransportChanged:].cold.1(self, (uint64_t)v6);
  }
}

- (void)handleIOA2PropertyChanged:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[ASDTIOA2LegacyDevice propertyChangedDelegate](self, "propertyChangedDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", a3, v7);

}

- (void)handlePropertyChanged:(IOAudio2Notification *)a3
{
  int v5;
  ASDTIOA2LegacyDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ASDTIOA2LegacyDevice *v11;
  std::recursive_mutex *v12;
  int var4;

  v5 = -[ASDTIOA2LegacyDevice objectID](self, "objectID");
  v6 = self;
  -[ASDTIOA2LegacyDevice scopedLock](v6, "scopedLock");
  (*(void (**)(_QWORD))(**((_QWORD **)v6 + 66) + 16))(*((_QWORD *)v6 + 66));
  (*(void (**)(_QWORD))(**((_QWORD **)v6 + 66) + 24))(*((_QWORD *)v6 + 66));
  if (!a3->var0)
  {
    v5 = -[ASDTIOA2LegacyDevice objectID](v6, "objectID");
    v11 = v6;
    goto LABEL_9;
  }
  -[ASDTIOA2LegacyDevice _getControlByUCID:](v6, "_getControlByUCID:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTIOA2LegacyDevice _getStreamByUCID:](v6, "_getStreamByUCID:", a3->var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v5 = objc_msgSend(v8, "objectID");
    v10 = v9;
  }
  else
  {
    if (!v7)
    {
      v11 = v6;
      goto LABEL_8;
    }
    std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v12);
    objc_msgSend(v7, "synchronizeWithRegistry");
    v5 = objc_msgSend(v7, "objectID");
    v10 = v7;
  }
  v11 = v10;

LABEL_8:
LABEL_9:
  if ((_BYTE)var4)
    std::recursive_mutex::unlock(v12);
  if (v5)
  {
    v12 = *(std::recursive_mutex **)&a3->var2;
    var4 = a3->var4;
    -[ASDTIOA2LegacyDevice handleIOA2PropertyChanged:forObject:](v6, "handleIOA2PropertyChanged:forObject:", &v12, v11);
  }

}

- (array<std::vector<unsigned)_getStreamListUCIDLists
{
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  __CFArray *v8;
  int Count;
  uint64_t v10;
  void **p_var0;
  unsigned int **v12;
  _QWORD *v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  unsigned int *v22;
  unsigned int v23;
  array<std::vector<unsigned int>, 2UL> *result;
  unsigned int v26;
  CACFDictionary v27;
  __CFArray *v28;
  __int16 v29;

  v4 = 0;
  v5 = 0;
  *(_OWORD *)&retstr->var0[0].var2.var0 = 0u;
  *(_OWORD *)&retstr->var0[1].var1 = 0u;
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  v6 = 1;
  do
  {
    v7 = v6;
    v8 = ASDT::IOA2UCDevice::CopyStreamList(*((ASDT::IOA2UCDevice **)self + 66), v4 & 1);
    v28 = v8;
    v29 = 1;
    if (v8)
    {
      Count = CFArrayGetCount(v8);
      if (Count >= 1)
      {
        v10 = 0;
        p_var0 = (void **)&retstr->var0[v5].var0;
        v12 = (unsigned int **)(p_var0 + 1);
        v13 = p_var0 + 2;
        do
        {
          v27.var0 = 0;
          *(_WORD *)&v27.var1 = 1;
          CACFArray::GetCACFDictionary((CACFArray *)&v28, v10, &v27);
          if (v27.var0)
          {
            v26 = 0;
            if (CACFDictionary::GetUInt32(&v27, CFSTR("stream ID"), &v26))
            {
              v14 = *v12;
              if ((unint64_t)*v12 >= *v13)
              {
                v16 = (unsigned int *)*p_var0;
                v17 = ((char *)v14 - (_BYTE *)*p_var0) >> 2;
                v18 = v17 + 1;
                if ((unint64_t)(v17 + 1) >> 62)
                  std::vector<char>::__throw_length_error[abi:ne180100]();
                v19 = *v13 - (_QWORD)v16;
                if (v19 >> 1 > v18)
                  v18 = v19 >> 1;
                if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL)
                  v20 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v20 = v18;
                if (v20)
                {
                  v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)(p_var0 + 2), v20);
                  v14 = *v12;
                  v16 = (unsigned int *)*p_var0;
                }
                else
                {
                  v21 = 0;
                }
                v22 = (unsigned int *)&v21[4 * v17];
                *v22 = v26;
                v15 = v22 + 1;
                while (v14 != v16)
                {
                  v23 = *--v14;
                  *--v22 = v23;
                }
                *p_var0 = v22;
                *v12 = v15;
                *v13 = &v21[4 * v20];
                if (v16)
                  operator delete(v16);
              }
              else
              {
                *v14 = v26;
                v15 = v14 + 1;
              }
              *v12 = v15;
            }
          }
          CACFDictionary::~CACFDictionary(&v27);
          v10 = (v10 + 1);
        }
        while ((_DWORD)v10 != Count);
      }
    }
    CACFArray::~CACFArray((CACFArray *)&v28);
    v6 = 0;
    v4 = 1;
    v5 = 1;
  }
  while ((v7 & 1) != 0);
  return result;
}

- (id)_getStreamByUCID:(unsigned int)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[ASDAudioDevice inputStreams](self, "inputStreams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDAudioDevice outputStreams](self, "outputStreams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "userClientID", (_QWORD)v14) == a3)
        {
          v12 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)_getControlByUCID:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ASDAudioDevice controls](self, "controls", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "userClientID") == a3)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)createStreamForUserClientID:(unsigned int)a3 direction:(unsigned int)a4
{
  return -[ASDTIOA2LegacyStream initWithIOA2Device:userClientID:direction:]([ASDTIOA2LegacyStream alloc], "initWithIOA2Device:userClientID:direction:", self, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (id)_markOrCreateStreamsWithIDs:(vector<unsigned)int direction:(std:(unsigned int)a4 :allocator<unsigned int>> *)a3
{
  uint64_t v4;
  void *v8;
  unsigned int *var1;
  unsigned int *var0;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = a3->var0;
  var1 = a3->var1;
  if (a3->var0 != var1)
  {
    do
    {
      v11 = *var0;
      -[ASDTIOA2LegacyDevice _getStreamByUCID:](self, "_getStreamByUCID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "setMarked:", 1);
      }
      else
      {
        -[ASDTIOA2LegacyDevice createStreamForUserClientID:direction:](self, "createStreamForUserClientID:direction:", v11, v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            -[ASDAudioDevice deviceUID](self, "deviceUID");
            objc_claimAutoreleasedReturnValue();
            -[ASDTIOA2Device _markOrCreateStreamsWithIDs:direction:].cold.1();
          }
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDAudioDevice deviceUID](self, "deviceUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTIOA2LegacyDevice.mm"), 545, CFSTR("%@: Failed to create stream."), v16);

        }
        objc_msgSend(v8, "addObject:", v14);

      }
      ++var0;
    }
    while (var0 != var1);
  }
  return v8;
}

- (id)_synchronizeStreamsOrReturnForRemoval:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "marked", (_QWORD)v11) & 1) != 0)
          objc_msgSend(v9, "_synchronizeWithHardware");
        else
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v4;
}

- (BOOL)_updateStreams
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  void *__p;
  void *v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22[2];

  -[ASDTAudioDevice allStreams](self, "allStreams");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  clearMark(v3);

  -[ASDTIOA2LegacyDevice _getStreamListUCIDLists](self, "_getStreamListUCIDLists");
  __p = 0;
  v17 = 0;
  v18 = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, v21, v22[0], (v22[0] - (uint64_t)v21) >> 2);
  -[ASDTIOA2LegacyDevice _markOrCreateStreamsWithIDs:direction:](self, "_markOrCreateStreamsWithIDs:direction:", &__p, 1768845428);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  v13 = 0;
  v14 = 0;
  v15 = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v13, v19, v20, (v20 - (uint64_t)v19) >> 2);
  -[ASDTIOA2LegacyDevice _markOrCreateStreamsWithIDs:direction:](self, "_markOrCreateStreamsWithIDs:direction:", &v13, 1869968496);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v13;
    operator delete(v13);
  }
  -[ASDAudioDevice inputStreams](self, "inputStreams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTIOA2LegacyDevice _synchronizeStreamsOrReturnForRemoval:](self, "_synchronizeStreamsOrReturnForRemoval:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDAudioDevice outputStreams](self, "outputStreams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTIOA2LegacyDevice _synchronizeStreamsOrReturnForRemoval:](self, "_synchronizeStreamsOrReturnForRemoval:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDTIOA2LegacyDevice _removeInputStreams:](self, "_removeInputStreams:", v7);
  -[ASDTIOA2LegacyDevice _removeOutputStreams:](self, "_removeOutputStreams:", v9);
  -[ASDTIOA2LegacyDevice _addInputStreams:](self, "_addInputStreams:", v4);
  -[ASDTIOA2LegacyDevice _addOutputStreams:](self, "_addOutputStreams:", v5);

  for (i = 0; i != -6; i -= 3)
  {
    v11 = (void *)v22[i - 1];
    if (v11)
    {
      v22[i] = (uint64_t)v11;
      operator delete(v11);
    }
  }
  return 1;
}

- (id)_markOrCreateControlsWithDictionaries:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("control ID"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[ASDTIOA2LegacyDevice _getControlByUCID:](self, "_getControlByUCID:", objc_msgSend(v10, "unsignedIntValue"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v11)
            {
              objc_msgSend(v11, "setMarked:", 1);
            }
            else
            {
              +[ASDTIOA2LegacyControl controlWithDictionary:owningDevice:](ASDTIOA2LegacyControl, "controlWithDictionary:owningDevice:", v9, self);
              v13 = objc_claimAutoreleasedReturnValue();
              if (v13)
              {
                v12 = (void *)v13;
                objc_msgSend(v15, "addObject:");
              }
              else
              {
                v12 = 0;
              }
            }

          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v15;
}

- (BOOL)subclassUpdateControls
{
  return 1;
}

- (BOOL)_updateControls:(void *)a3
{
  NSArray *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  BOOL v21;
  __CFArray *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[ASDAudioDevice controls](self, "controls");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  clearMark(v5);

  v23 = ASDT::IOA2UCDevice::CopyControlList(*((ASDT::IOA2UCDevice **)self + 66));
  -[ASDTIOA2LegacyDevice _markOrCreateControlsWithDictionaries:](self, "_markOrCreateControlsWithDictionaries:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[ASDAudioDevice controls](self, "controls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[__CFArray count](v23, "count"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[ASDAudioDevice controls](self, "controls");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v15, "marked"))
          v16 = v10;
        else
          v16 = v9;
        objc_msgSend(v16, "addObject:", v15);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v12);
  }

  -[ASDTIOA2LegacyDevice _removeControls:](self, "_removeControls:", v9);
  -[ASDTIOA2LegacyDevice _addControls:](self, "_addControls:", v6);
  objc_msgSend(v10, "addObjectsFromArray:", v6);
  std::unique_lock<std::recursive_mutex>::unlock((uint64_t)a3);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = v10;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "synchronizeWithRegistry");
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v18);
  }

  v21 = -[ASDTIOA2LegacyDevice subclassUpdateControls](self, "subclassUpdateControls");
  std::unique_lock<std::recursive_mutex>::lock((uint64_t)a3);

  return v21;
}

- (id)deviceName
{
  _QWORD v3[5];
  ASDTIOA2LegacyDevice *v4;

  v4 = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3321888768;
  v3[2] = __34__ASDTIOA2LegacyDevice_deviceName__block_invoke;
  v3[3] = &__block_descriptor_40_ea8_32c47_ZTSKZ34__ASDTIOA2LegacyDevice_deviceName_E3__2_e15___NSString_8__0l;
  v3[4] = &v4;
  ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__ASDTIOA2LegacyDevice_deviceName__block_invoke(uint64_t a1)
{
  void *v2;
  std::recursive_mutex *v4;
  char v5;

  objc_msgSend(**(id **)(a1 + 32), "scopedLock");
  ASDT::IOA2UCDevice::CopyDeviceName(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    std::recursive_mutex::unlock(v4);
  return v2;
}

- (id)modelUID
{
  _QWORD v3[5];
  ASDTIOA2LegacyDevice *v4;

  v4 = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3321888768;
  v3[2] = __32__ASDTIOA2LegacyDevice_modelUID__block_invoke;
  v3[3] = &__block_descriptor_40_ea8_32c45_ZTSKZ32__ASDTIOA2LegacyDevice_modelUID_E3__3_e15___NSString_8__0l;
  v3[4] = &v4;
  ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __32__ASDTIOA2LegacyDevice_modelUID__block_invoke(uint64_t a1)
{
  void *v2;
  std::recursive_mutex *v4;
  char v5;

  objc_msgSend(**(id **)(a1 + 32), "scopedLock");
  ASDT::IOA2UCDevice::CopyModelUID(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    std::recursive_mutex::unlock(v4);
  return v2;
}

- (id)manufacturerName
{
  _QWORD v3[5];
  ASDTIOA2LegacyDevice *v4;

  v4 = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3321888768;
  v3[2] = __40__ASDTIOA2LegacyDevice_manufacturerName__block_invoke;
  v3[3] = &__block_descriptor_40_ea8_32c53_ZTSKZ40__ASDTIOA2LegacyDevice_manufacturerName_E3__4_e15___NSString_8__0l;
  v3[4] = &v4;
  ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __40__ASDTIOA2LegacyDevice_manufacturerName__block_invoke(uint64_t a1)
{
  void *v2;
  std::recursive_mutex *v4;
  char v5;

  objc_msgSend(**(id **)(a1 + 32), "scopedLock");
  ASDT::IOA2UCDevice::CopyDeviceManufacturer(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    std::recursive_mutex::unlock(v4);
  return v2;
}

- (double)samplingRate
{
  double v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[5];
  ASDTIOA2LegacyDevice *v7;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3321888768;
  v6[2] = __36__ASDTIOA2LegacyDevice_samplingRate__block_invoke;
  v6[3] = &__block_descriptor_40_ea8_32c49_ZTSKZ36__ASDTIOA2LegacyDevice_samplingRate_E3__5_e5_d8__0l;
  v6[4] = &v7;
  v8[0] = &off_25084BA48;
  v8[1] = 0;
  v9 = v8;
  v2 = ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == v8)
  {
    v4 = 4;
    v3 = v8;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return v2;
}

double __36__ASDTIOA2LegacyDevice_samplingRate__block_invoke(uint64_t a1)
{
  double NominalSampleRate;
  std::recursive_mutex *v4;
  char v5;

  objc_msgSend(**(id **)(a1 + 32), "scopedLock");
  NominalSampleRate = ASDT::IOA2UCDevice::GetNominalSampleRate(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528));
  if (v5)
    std::recursive_mutex::unlock(v4);
  return NominalSampleRate;
}

- (void)setSamplingRate:(double)a3
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[6];
  double v6;
  ASDTIOA2LegacyDevice *v7;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6 = a3;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3321888768;
  v5[2] = __40__ASDTIOA2LegacyDevice_setSamplingRate___block_invoke;
  v5[3] = &__block_descriptor_48_ea8_32c53_ZTSKZ40__ASDTIOA2LegacyDevice_setSamplingRate__E3__6_e5_v8__0l;
  v5[4] = &v7;
  v5[5] = &v6;
  v8[0] = &off_25084BAD8;
  v9 = v8;
  ASDT::exceptionBarrier<void({block_pointer} {__strong})(void)>(v5);
  v3 = v9;
  if (v9 == v8)
  {
    v4 = 4;
    v3 = v8;
  }
  else
  {
    if (!v9)
      return;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
}

void __40__ASDTIOA2LegacyDevice_setSamplingRate___block_invoke(uint64_t a1)
{
  double v2;
  id *v3;
  __int128 v4;
  double v5;
  double v6;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v7;
  NSObject *v8;
  uint64_t v9;
  _BOOL4 v10;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  std::string::size_type v16;
  double v17;
  void *exception;
  std::string *v19;
  __int128 v20;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  std::string::size_type size;
  std::string *v25;
  __int128 v26;
  __int128 v27;
  std::string v28;
  std::string v29;
  std::string v30;
  std::string v31;
  std::unique_lock<std::mutex> __lk;
  _BYTE buf[24];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(**(id **)(a1 + 32), "samplingRate");
  if (v2 != **(double **)(a1 + 40))
  {
    __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(**(_QWORD **)(a1 + 32) + 688);
    __lk.__owns_ = 1;
    std::mutex::lock(__lk.__m_);
    v3 = *(id **)(a1 + 32);
    if (*v3)
    {
      objc_msgSend(*v3, "scopedLock");
      v3 = *(id **)(a1 + 32);
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
    }
    ASDT::IOA2UCDevice::SetNominalSampleRate(*((ASDT::IOA2UCDevice **)*v3 + 66), **(double **)(a1 + 40));
    if (buf[8])
      std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
    v5 = (double)std::chrono::system_clock::now().__d_.__rep_ + 5000000.0;
    v6 = -9.22337204e18;
    if (v5 * 1000.0 > -9.22337204e18)
      v6 = v5 * 1000.0;
    if (v5 * 1000.0 < 9.22337204e18)
      v7 = (uint64_t)v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    v8 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v4 = 134218240;
    v27 = v4;
    while (1)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236D43000, v8, OS_LOG_TYPE_INFO, "Waiting to be signaled from IOA2 config change notification thread...", buf, 2u);
      }
      v9 = **(_QWORD **)(a1 + 32);
      if (v5 > (double)std::chrono::system_clock::now().__d_.__rep_)
      {
        v11.__d_.__rep_ = v7;
        std::condition_variable::__do_timed_wait((std::condition_variable *)(v9 + 752), &__lk, v11);
        v10 = v5 <= (double)std::chrono::system_clock::now().__d_.__rep_;
      }
      else
      {
        v10 = 1;
      }
      objc_msgSend(**(id **)(a1 + 32), "samplingRate", v27);
      v13 = v12;
      v14 = **(double **)(a1 + 40);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v27;
        *(double *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v14;
        _os_log_impl(&dword_236D43000, v8, OS_LOG_TYPE_INFO, "Woke! currentRate = %f, desiredRate = %f", buf, 0x16u);
      }
      if (v10)
        break;
      if (v13 == v14)
        goto LABEL_26;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "SetSampleRateSynchronously timed out", buf, 2u);
    }
    if (v13 != v14)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __40__ASDTIOA2LegacyDevice_setSamplingRate___block_invoke_cold_1();
      exception = __cxa_allocate_exception(0x10uLL);
      std::to_string(&v29, **(double **)(a1 + 40));
      v19 = std::string::insert(&v29, 0, "SetSampleRateSynchronously failed. DesiredSampleRate: ");
      v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
      v30.__r_.__value_.__r.__words[2] = v19->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v30.__r_.__value_.__l.__data_ = v20;
      v19->__r_.__value_.__l.__size_ = 0;
      v19->__r_.__value_.__r.__words[2] = 0;
      v19->__r_.__value_.__r.__words[0] = 0;
      v21 = std::string::append(&v30, " ExistingSampleRate: ");
      v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
      v31.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v22;
      v21->__r_.__value_.__l.__size_ = 0;
      v21->__r_.__value_.__r.__words[2] = 0;
      v21->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v28, v13);
      if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v23 = &v28;
      else
        v23 = (std::string *)v28.__r_.__value_.__r.__words[0];
      if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v28.__r_.__value_.__r.__words[2]);
      else
        size = v28.__r_.__value_.__l.__size_;
      v25 = std::string::append(&v31, (const std::string::value_type *)v23, size);
      v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
      *(_QWORD *)&buf[16] = *((_QWORD *)&v25->__r_.__value_.__l + 2);
      *(_OWORD *)buf = v26;
      v25->__r_.__value_.__l.__size_ = 0;
      v25->__r_.__value_.__r.__words[2] = 0;
      v25->__r_.__value_.__r.__words[0] = 0;
      MEMORY[0x23B802BF4](exception, buf);
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
LABEL_26:
    v15 = **(void ***)(a1 + 32);
    if (v15)
    {
      objc_msgSend(v15, "scopedLock");
      v16 = **(_QWORD **)(a1 + 32);
    }
    else
    {
      v16 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
    }
    v17 = **(double **)(a1 + 40);
    v31.__r_.__value_.__r.__words[0] = v16;
    v31.__r_.__value_.__l.__size_ = (std::string::size_type)ASDTIOA2LegacyDevice;
    unk_2564603C8((objc_super *)&v31, sel_setSamplingRate_, v17);
    if (buf[8])
      std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
    if (__lk.__owns_)
      std::mutex::unlock(__lk.__m_);
  }
}

- (id)samplingRates
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ASDTAudioDevice allStreams](self, "allStreams");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v5);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v6, "physicalFormats");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v17;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v17 != v9)
                objc_enumerationMutation(v7);
              v11 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "sampleRate");
              objc_msgSend(v11, "numberWithDouble:");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v3, "indexOfObject:", v12) == 0x7FFFFFFFFFFFFFFFLL)
                objc_msgSend(v3, "addObject:", v12);

              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v8);
        }

        ++v5;
      }
      while (v5 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

  return v3;
}

- (unsigned)timestampPeriod
{
  unsigned int RingBufferSize;
  uint64_t (***v4)();
  uint64_t v5;
  std::recursive_mutex *v7;
  char v8;
  uint64_t (**v9)();
  int v10;
  uint64_t (***v11)();
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = &off_25084BBF8;
  v10 = 0;
  v11 = &v9;
  -[ASDTIOA2LegacyDevice scopedLock](self, "scopedLock");
  RingBufferSize = ASDT::IOA2UCDevice::GetRingBufferSize(*((ASDT::IOA2UCDevice **)self + 66));
  if (v8)
    std::recursive_mutex::unlock(v7);
  v4 = v11;
  if (v11 == &v9)
  {
    v5 = 4;
    v4 = &v9;
    goto LABEL_7;
  }
  if (v11)
  {
    v5 = 5;
LABEL_7:
    (*v4)[v5]();
  }
  return RingBufferSize;
}

- (unsigned)inputLatency
{
  unsigned int v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  ASDTIOA2LegacyDevice *v7;
  uint64_t (**v8)();
  int v9;
  uint64_t (***v10)();
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3321888768;
  v6[2] = __36__ASDTIOA2LegacyDevice_inputLatency__block_invoke;
  v6[3] = &__block_descriptor_40_ea8_32c49_ZTSKZ36__ASDTIOA2LegacyDevice_inputLatency_E3__8_e5_I8__0l;
  v6[4] = &v7;
  v8 = &off_25084BB68;
  v9 = 0;
  v10 = &v8;
  v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v6);
  v3 = v10;
  if (v10 == &v8)
  {
    v4 = 4;
    v3 = &v8;
    goto LABEL_5;
  }
  if (v10)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __36__ASDTIOA2LegacyDevice_inputLatency__block_invoke(uint64_t a1)
{
  uint64_t Latency;
  std::recursive_mutex *v4;
  char v5;

  objc_msgSend(**(id **)(a1 + 32), "scopedLock");
  Latency = ASDT::IOA2UCDevice::GetLatency(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528), 1);
  if (v5)
    std::recursive_mutex::unlock(v4);
  return Latency;
}

- (unsigned)outputLatency
{
  unsigned int v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  ASDTIOA2LegacyDevice *v7;
  uint64_t (**v8)();
  int v9;
  uint64_t (***v10)();
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3321888768;
  v6[2] = __37__ASDTIOA2LegacyDevice_outputLatency__block_invoke;
  v6[3] = &__block_descriptor_40_ea8_32c50_ZTSKZ37__ASDTIOA2LegacyDevice_outputLatency_E3__9_e5_I8__0l;
  v6[4] = &v7;
  v8 = &off_25084BB68;
  v9 = 0;
  v10 = &v8;
  v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v6);
  v3 = v10;
  if (v10 == &v8)
  {
    v4 = 4;
    v3 = &v8;
    goto LABEL_5;
  }
  if (v10)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __37__ASDTIOA2LegacyDevice_outputLatency__block_invoke(uint64_t a1)
{
  uint64_t Latency;
  std::recursive_mutex *v4;
  char v5;

  objc_msgSend(**(id **)(a1 + 32), "scopedLock");
  Latency = ASDT::IOA2UCDevice::GetLatency(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528), 0);
  if (v5)
    std::recursive_mutex::unlock(v4);
  return Latency;
}

- (unsigned)inputSafetyOffset
{
  unsigned int v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  ASDTIOA2LegacyDevice *v7;
  uint64_t (**v8)();
  int v9;
  uint64_t (***v10)();
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3321888768;
  v6[2] = __41__ASDTIOA2LegacyDevice_inputSafetyOffset__block_invoke;
  v6[3] = &__block_descriptor_40_ea8_32c55_ZTSKZ41__ASDTIOA2LegacyDevice_inputSafetyOffset_E4__10_e5_I8__0l;
  v6[4] = &v7;
  v8 = &off_25084BB68;
  v9 = 0;
  v10 = &v8;
  v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v6);
  v3 = v10;
  if (v10 == &v8)
  {
    v4 = 4;
    v3 = &v8;
    goto LABEL_5;
  }
  if (v10)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __41__ASDTIOA2LegacyDevice_inputSafetyOffset__block_invoke(uint64_t a1)
{
  uint64_t SafetyOffset;
  std::recursive_mutex *v4;
  char v5;

  objc_msgSend(**(id **)(a1 + 32), "scopedLock");
  SafetyOffset = ASDT::IOA2UCDevice::GetSafetyOffset(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528), 1);
  if (v5)
    std::recursive_mutex::unlock(v4);
  return SafetyOffset;
}

- (unsigned)outputSafetyOffset
{
  unsigned int v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  ASDTIOA2LegacyDevice *v7;
  uint64_t (**v8)();
  int v9;
  uint64_t (***v10)();
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3321888768;
  v6[2] = __42__ASDTIOA2LegacyDevice_outputSafetyOffset__block_invoke;
  v6[3] = &__block_descriptor_40_ea8_32c56_ZTSKZ42__ASDTIOA2LegacyDevice_outputSafetyOffset_E4__11_e5_I8__0l;
  v6[4] = &v7;
  v8 = &off_25084BB68;
  v9 = 0;
  v10 = &v8;
  v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v6);
  v3 = v10;
  if (v10 == &v8)
  {
    v4 = 4;
    v3 = &v8;
    goto LABEL_5;
  }
  if (v10)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __42__ASDTIOA2LegacyDevice_outputSafetyOffset__block_invoke(uint64_t a1)
{
  uint64_t SafetyOffset;
  std::recursive_mutex *v4;
  char v5;

  objc_msgSend(**(id **)(a1 + 32), "scopedLock");
  SafetyOffset = ASDT::IOA2UCDevice::GetSafetyOffset(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528), 0);
  if (v5)
    std::recursive_mutex::unlock(v4);
  return SafetyOffset;
}

- (unsigned)transportType
{
  unsigned int v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  ASDTIOA2LegacyDevice *v7;
  uint64_t (**v8)();
  int v9;
  uint64_t (***v10)();
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3321888768;
  v6[2] = __37__ASDTIOA2LegacyDevice_transportType__block_invoke;
  v6[3] = &__block_descriptor_40_ea8_32c51_ZTSKZ37__ASDTIOA2LegacyDevice_transportType_E4__12_e5_I8__0l;
  v6[4] = &v7;
  v8 = &off_25084BB68;
  v9 = 0;
  v10 = &v8;
  v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v6);
  v3 = v10;
  if (v10 == &v8)
  {
    v4 = 4;
    v3 = &v8;
    goto LABEL_5;
  }
  if (v10)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __37__ASDTIOA2LegacyDevice_transportType__block_invoke(uint64_t a1)
{
  uint64_t TransportType;
  std::recursive_mutex *v4;
  char v5;

  objc_msgSend(**(id **)(a1 + 32), "scopedLock");
  TransportType = ASDT::IOA2UCDevice::GetTransportType(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528));
  if (v5)
    std::recursive_mutex::unlock(v4);
  return TransportType;
}

- (unsigned)clockDomain
{
  unsigned int v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  ASDTIOA2LegacyDevice *v7;
  uint64_t (**v8)();
  int v9;
  uint64_t (***v10)();
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3321888768;
  v6[2] = __35__ASDTIOA2LegacyDevice_clockDomain__block_invoke;
  v6[3] = &__block_descriptor_40_ea8_32c49_ZTSKZ35__ASDTIOA2LegacyDevice_clockDomain_E4__13_e5_I8__0l;
  v6[4] = &v7;
  v8 = &off_25084BB68;
  v9 = 0;
  v10 = &v8;
  v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v6);
  v3 = v10;
  if (v10 == &v8)
  {
    v4 = 4;
    v3 = &v8;
    goto LABEL_5;
  }
  if (v10)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __35__ASDTIOA2LegacyDevice_clockDomain__block_invoke(uint64_t a1)
{
  uint64_t ClockDomain;
  std::recursive_mutex *v4;
  char v5;

  objc_msgSend(**(id **)(a1 + 32), "scopedLock");
  ClockDomain = ASDT::IOA2UCDevice::GetClockDomain(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528));
  if (v5)
    std::recursive_mutex::unlock(v4);
  return ClockDomain;
}

- (BOOL)_openConnection
{
  ASDT::UCObject::OpenConnection(*((ASDT::UCObject **)self + 66), 0);
  ASDT::IOA2UCDevice::MapEngineStatus(*((ASDT::IOA2UCDevice **)self + 66), (IOAudio2EngineStatus **)self + 67);
  ASDT::UCObject::SetConnectionNotificationPort(*((ASDT::UCObject **)self + 66), 0, *(unsigned int *)(*((_QWORD *)self + 68) + 8), (void *)-[ASDTIOA2LegacyDevice objectID](self, "objectID"));
  -[ASDTIOA2LegacyDevice _mapIOBuffers](self, "_mapIOBuffers");
  -[ASDTIOA2LegacyDevice _pushStreamActiveStates](self, "_pushStreamActiveStates");
  return 1;
}

- (void)_closeConnection
{
  ASDT::UCObject::SetConnectionNotificationPort(*((ASDT::UCObject **)self + 66), 0, 0, 0);
  -[ASDTIOA2LegacyDevice _releaseIOBuffers](self, "_releaseIOBuffers");
  ASDT::IOA2UCDevice::ReleaseEngineStatus(*((_QWORD *)self + 66), *((void **)self + 67));
  *((_QWORD *)self + 67) = 0;
  ASDT::UCObject::CloseConnection(*((ASDT::UCObject **)self + 66));
}

- (void)_pushStreamActiveStates
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ASDTAudioDevice allStreams](self, "allStreams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "_pushActiveState");
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_mapIOBuffers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ASDTAudioDevice allStreams](self, "allStreams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "_mapIOBuffer");
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_releaseIOBuffers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ASDTAudioDevice allStreams](self, "allStreams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "_releaseIOBuffer");
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_addInputStreams:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[ASDAudioDevice addInputStream:](self, "addInputStream:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_removeInputStreams:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[ASDAudioDevice removeInputStream:](self, "removeInputStream:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_addOutputStreams:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[ASDAudioDevice addOutputStream:](self, "addOutputStream:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_removeOutputStreams:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[ASDAudioDevice removeOutputStream:](self, "removeOutputStream:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_addControls:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[ASDAudioDevice addControl:](self, "addControl:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_removeControls:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[ASDAudioDevice removeControl:](self, "removeControl:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)getZeroTimestampBlock
{
  uint64_t v2;
  _QWORD v4[5];

  v2 = *((_QWORD *)self + 67);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__ASDTIOA2LegacyDevice_getZeroTimestampBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e20_i36__0_d8_Q16_Q24I32l;
  v4[4] = v2;
  return (id)MEMORY[0x23B8030C8](v4, a2);
}

uint64_t __45__ASDTIOA2LegacyDevice_getZeroTimestampBlock__block_invoke(uint64_t a1, double *a2, unint64_t *a3, unint64_t *a4)
{
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = *(unint64_t **)(a1 + 32);
  if (!v4)
    return 1937010544;
  v5 = v4[2];
  v6 = v4[1];
  result = 0;
  *a2 = (double)*v4;
  *a3 = v6;
  *a4 = v5;
  return result;
}

- (IOA2UCDevice)ioa2Device
{
  IOA2UCDevice *result;

  result = (IOA2UCDevice *)*((_QWORD *)self + 66);
  if (!result)
    -[ASDTIOA2LegacyDevice ioa2Device].cold.1();
  return result;
}

- (void)setupCustomPropertySelectorMap
{
  __CFArray *v2;
  void *v3;
  __CFArray *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = ASDT::IOA2UCDevice::CopyCustomPropertyInfo(*((ASDT::IOA2UCDevice **)self + 66));
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "valueForKey:", CFSTR("registry key"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "valueForKey:", CFSTR("property selector"));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (!v13)
        {
          objc_msgSend(v3, "setObject:forKey:", v10, v11);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            v14 = objc_msgSend(v12, "unsignedIntValue");
            *(_DWORD *)buf = 138412546;
            v21 = v10;
            v22 = 1024;
            v23 = v14;
            _os_log_debug_impl(&dword_236D43000, v7, OS_LOG_TYPE_DEBUG, "Registry Key: %@, Selector: %u", buf, 0x12u);
          }
        }

      }
      v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }

  -[ASDTIOA2LegacyDevice setCustomPropertySelectorMap:](self, "setCustomPropertySelectorMap:", v3);
}

- (id)getKeyForCustomPropertyWithSelector:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[ASDTIOA2LegacyDevice customPropertySelectorMap](self, "customPropertySelectorMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)customPropertyWithKey:(id)a3
{
  id v4;

  v4 = 0;
  ASDT::UCObject::CopyProperty_CFDictionary(*((ASDT::UCObject **)self + 66), (const __CFString *)a3, (CFTypeRef *)&v4);
  return v4;
}

- (unsigned)customUInt32WithKey:(id)a3 defaultValue:(unsigned int)a4
{
  unsigned int v6;

  v6 = a4;
  if (ASDT::UCObject::CopyProperty_UInt32(*((ASDT::UCObject **)self + 66), (const __CFString *)a3, &v6))
    return v6;
  else
    return a4;
}

- (id)customDataPropertyWithKey:(id)a3
{
  __CFData *v4;

  v4 = 0;
  if (ASDT::UCObject::CopyProperty_CFData(*((ASDT::UCObject **)self + 66), (const __CFString *)a3, (CFTypeRef *)&v4))
    return v4;
  else
    return 0;
}

- (void)setMuteAllOutputs:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ASDAudioDevice controls](self, "controls", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "controlScope") == 1869968496)
          objc_msgSend(v8, "changeValue:", v3);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)setOutputVolumesToNominal
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ASDAudioDevice controls](self, "controls", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "controlScope") == 1869968496)
        {
          LODWORD(v7) = 0;
          objc_msgSend(v6, "changeDecibelValue:", v7);
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

- (int)doStartIO
{
  _QWORD v3[5];
  ASDTIOA2LegacyDevice *v4;

  v4 = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3321888768;
  v3[2] = __33__ASDTIOA2LegacyDevice_doStartIO__block_invoke;
  v3[3] = &__block_descriptor_40_ea8_32c47_ZTSKZ33__ASDTIOA2LegacyDevice_doStartIO_E4__14_e5_v8__0l;
  v3[4] = &v4;
  if (ASDT::exceptionBarrierReturnSuccess(v3))
    return 0;
  else
    return 2003329396;
}

uint64_t __33__ASDTIOA2LegacyDevice_doStartIO__block_invoke(uint64_t a1)
{
  return ASDT::IOA2UCDevice::StartIO(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528));
}

- (int)doStopIO
{
  _QWORD v3[5];
  ASDTIOA2LegacyDevice *v4;

  v4 = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3321888768;
  v3[2] = __32__ASDTIOA2LegacyDevice_doStopIO__block_invoke;
  v3[3] = &__block_descriptor_40_ea8_32c46_ZTSKZ32__ASDTIOA2LegacyDevice_doStopIO_E4__15_e5_v8__0l;
  v3[4] = &v4;
  if (ASDT::exceptionBarrierReturnSuccess(v3))
    return 0;
  else
    return 2003329396;
}

uint64_t __32__ASDTIOA2LegacyDevice_doStopIO__block_invoke(uint64_t a1)
{
  return ASDT::IOA2UCDevice::StopIO(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528));
}

- (int)performStartIO
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;
  std::unique_lock<std::mutex> v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 552);
  v10.__owns_ = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ PerformStartIO", buf, 0xCu);

  }
  if (-[ASDTIOA2LegacyDevice startIORequest](self, "startIORequest"))
  {
    std::unique_lock<std::mutex>::lock(&v10);
    ++*((_QWORD *)self + 117);
    v4 = -[ASDTIOA2LegacyDevice doStartIO](self, "doStartIO");
    if (!v4)
    {
      -[ASDTIOA2LegacyDevice setUcDeviceStarted:](self, "setUcDeviceStarted:", 1);
      std::unique_lock<std::mutex>::unlock(&v10);
      v8.receiver = self;
      v8.super_class = (Class)ASDTIOA2LegacyDevice;
      v4 = -[ASDTAudioDevice performStartIO](&v8, sel_performStartIO);
      std::unique_lock<std::mutex>::lock(&v10);
      if (v4)
      {
        if (-[ASDTIOA2LegacyDevice ucDeviceStarted](self, "ucDeviceStarted"))
        {
          -[ASDTIOA2LegacyDevice setUcDeviceStarted:](self, "setUcDeviceStarted:", 0);
          -[ASDTIOA2LegacyDevice doStopIO](self, "doStopIO");
        }
      }
    }
    std::unique_lock<std::mutex>::unlock(&v10);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v5;
      v13 = 1024;
      v14 = v4;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ PerformStartIO returned, result %d", buf, 0x12u);

    }
    -[ASDTIOA2LegacyDevice stopIORequest](self, "stopIORequest");
    if (v10.__owns_)
      std::mutex::unlock(v10.__m_);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ASDTIOA2LegacyDevice;
    v4 = -[ASDTAudioDevice performStartIO](&v9, sel_performStartIO);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v6;
      v13 = 1024;
      v14 = v4;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ PerformStartIO faked, result %d", buf, 0x12u);

    }
  }
  return v4;
}

- (int)performStopIO
{
  void *v3;
  int v4;
  void *v5;
  void *v7;
  objc_super v8;
  objc_super v9;
  std::unique_lock<std::mutex> v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 552);
  v10.__owns_ = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ PerformStopIO", buf, 0xCu);

  }
  std::unique_lock<std::mutex>::lock(&v10);
  if (-[ASDTIOA2LegacyDevice delayedStopIO](self, "delayedStopIO")
    && -[ASDTIOA2LegacyDevice ucDeviceStarted](self, "ucDeviceStarted")
    && !-[ASDTAudioDevice configurationChangesPending](self, "configurationChangesPending"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ Postpone underlying StopIO", buf, 0xCu);

    }
    -[ASDTIOA2LegacyDevice _requestUnderlyingStopIO](self, "_requestUnderlyingStopIO");
    v4 = 0;
  }
  else
  {
    -[ASDTIOA2LegacyDevice setUcDeviceStarted:](self, "setUcDeviceStarted:", 0);
    v4 = -[ASDTIOA2LegacyDevice doStopIO](self, "doStopIO");
  }
  std::unique_lock<std::mutex>::unlock(&v10);
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)ASDTIOA2LegacyDevice;
    -[ASDTAudioDevice performStopIO](&v8, sel_performStopIO);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ASDTIOA2LegacyDevice;
    v4 = -[ASDTAudioDevice performStopIO](&v9, sel_performStopIO);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ PerformStopIO returned. result %d", buf, 0x12u);

  }
  if (v10.__owns_)
    std::mutex::unlock(v10.__m_);
  return v4;
}

- (void)_requestUnderlyingStopIO
{
  dispatch_time_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  v3 = dispatch_time(0, 500000000);
  v4 = (void *)*((_QWORD *)self + 117);
  *((_BYTE *)self + 917) = 1;
  objc_initWeak(&location, self);
  v5 = *((_QWORD *)self + 116);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ASDTIOA2LegacyDevice__requestUnderlyingStopIO__block_invoke;
  block[3] = &unk_25084B3F0;
  objc_copyWeak(v7, &location);
  v7[1] = v4;
  dispatch_after(v3, v5, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __48__ASDTIOA2LegacyDevice__requestUnderlyingStopIO__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performUnderlyingStopIO:", *(_QWORD *)(a1 + 40));

}

- (void)_performUnderlyingStopIO:(unint64_t)a3
{
  std::mutex *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (std::mutex *)((char *)self + 552);
  std::mutex::lock((std::mutex *)((char *)self + 552));
  if (*((_BYTE *)self + 917) && *((_QWORD *)self + 117) == a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ PerformUnderlyingStopIO", (uint8_t *)&v9, 0xCu);

    }
    *((_BYTE *)self + 917) = 0;
    if (-[ASDTIOA2LegacyDevice ucDeviceStarted](self, "ucDeviceStarted"))
    {
      -[ASDTIOA2LegacyDevice setUcDeviceStarted:](self, "setUcDeviceStarted:", 0);
      v7 = -[ASDTIOA2LegacyDevice doStopIO](self, "doStopIO");
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v8;
        v11 = 1024;
        v12 = v7;
        _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ PerformUnderlyingStopIO returned, result %d", (uint8_t *)&v9, 0x12u);

      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device _performUnderlyingStopIO:].cold.1();
    }
  }
  std::mutex::unlock(v5);
}

- (void)forceStopIO
{
  void *v3;
  int v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *((unsigned __int8 *)self + 917);
    *(_DWORD *)buf = 138412546;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ forceStopIO, shouldStopIO %d", buf, 0x12u);

  }
  if (*((_BYTE *)self + 917))
  {
    v5 = *((_QWORD *)self + 116);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__ASDTIOA2LegacyDevice_forceStopIO__block_invoke;
    block[3] = &unk_25084B528;
    block[4] = self;
    dispatch_sync(v5, block);
  }
}

uint64_t __35__ASDTIOA2LegacyDevice_forceStopIO__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performUnderlyingStopIO:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 936));
}

- (id)updateClientOutputPositionBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__ASDTIOA2LegacyDevice_updateClientOutputPositionBlock__block_invoke;
  v3[3] = &__block_descriptor_40_e8_v16__0Q8l;
  v3[4] = (char *)self + 536;
  return (id)MEMORY[0x23B8030C8](v3, a2);
}

uint64_t __55__ASDTIOA2LegacyDevice_updateClientOutputPositionBlock__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(**(_QWORD **)(result + 32) + 32) = a2;
  return result;
}

- (id)updateClientInputPositionBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__ASDTIOA2LegacyDevice_updateClientInputPositionBlock__block_invoke;
  v3[3] = &__block_descriptor_40_e8_v16__0Q8l;
  v3[4] = (char *)self + 536;
  return (id)MEMORY[0x23B8030C8](v3, a2);
}

uint64_t __54__ASDTIOA2LegacyDevice_updateClientInputPositionBlock__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(**(_QWORD **)(result + 32) + 24) = a2;
  return result;
}

- (void)_setStreamActive:(BOOL)a3 streamUCID:(unsigned int)a4
{
  ASDT::IOA2UCDevice::SetStreamActive(*((ASDT::IOA2UCDevice **)self + 66), a4, a3);
}

- (void)_mapIOBuffer:(char *)a3 ofSize:(unsigned int *)a4 forStream:(unsigned int)a5
{
  ASDT::IOA2UCDevice::MapIOBufferForStream(*((ASDT::IOA2UCDevice **)self + 66), a5, a4, (unsigned __int8 **)a3);
}

- (void)_releaseIOBuffer:(char *)a3 forStream:(unsigned int)a4
{
  ASDT::IOA2UCDevice::ReleaseIOBufferForStream(*((ASDT::IOA2UCDevice **)self + 66), a4, (unsigned __int8 *)a3);
}

- (id)_availableFormatsForStream:(unsigned int)a3
{
  return (id)(id)ASDT::IOA2UCDevice::CopyStreamInfoByID_AvailableFormats(*((ASDT::IOA2UCDevice **)self + 66), a3);
}

- (AudioStreamBasicDescription)_currentFormatForStream:(SEL)a3
{
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  ASDT::IOA2UCDevice::GetStreamInfoByID_CurrentFormat(*((ASDT::IOA2UCDevice **)self + 66), a4, retstr);
  return result;
}

- (unsigned)_streamStartingChannel:(unsigned int)a3
{
  return ASDT::IOA2UCDevice::GetStreamInfoByID_StartingChannel(*((ASDT::IOA2UCDevice **)self + 66), a3);
}

- (void)_setCurrentFormat:(AudioStreamBasicDescription *)a3 forStream:(unsigned int)a4
{
  ASDT::IOA2UCDevice::SetStreamCurrentFormat(*((ASDT::IOA2UCDevice **)self + 66), a4, a3);
}

- (id)_controlDictionaryForControl:(unsigned int)a3
{
  return ASDT::IOA2UCDevice::CopyControlDictionaryByID(*((ASDT::IOA2UCDevice **)self + 66), *(const __CFArray **)&a3);
}

- (BOOL)_setControlValue:(unsigned int *)a3 forControl:(unsigned int)a4
{
  _QWORD v5[7];
  unsigned int v6;
  unsigned int *v7;
  ASDTIOA2LegacyDevice *v8;

  v7 = a3;
  v8 = self;
  v6 = a4;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3321888768;
  v5[2] = __52__ASDTIOA2LegacyDevice__setControlValue_forControl___block_invoke;
  v5[3] = &__block_descriptor_56_ea8_32c66_ZTSKZ52__ASDTIOA2LegacyDevice__setControlValue_forControl__E4__16_e5_v8__0l;
  v5[4] = &v8;
  v5[5] = &v6;
  v5[6] = &v7;
  return ASDT::exceptionBarrierReturnSuccess(v5);
}

uint64_t __52__ASDTIOA2LegacyDevice__setControlValue_forControl___block_invoke(uint64_t a1)
{
  return ASDT::IOA2UCDevice::SetControlValue(*(ASDT::IOA2UCDevice **)(**(_QWORD **)(a1 + 32) + 528), **(_DWORD **)(a1 + 40), **(unsigned int ***)(a1 + 48));
}

- (BOOL)_setControlValues:(const unsigned int *)a3 withCount:(unint64_t)a4 resultValues:(unsigned int *)a5 count:(unint64_t *)a6 forControl:(unsigned int)a7
{
  unsigned int v8;
  int v9;
  unsigned int v11;

  if (a6)
    v8 = *(_DWORD *)a6;
  else
    v8 = 0;
  v11 = v8;
  v9 = ASDT::IOA2UCDevice::SetMultiControlValue(*((ASDT::IOA2UCDevice **)self + 66), a7, a3, a4, a5, &v11);
  if (a6 && !v9)
    *a6 = v11;
  return v9 == 0;
}

- (unique_lock<std::recursive_mutex>)scopedLock
{
  uint64_t v2;
  std::recursive_mutex *v3;
  recursive_mutex *v4;
  _BOOL8 v5;
  unique_lock<std::recursive_mutex> result;

  v3 = (std::recursive_mutex *)((char *)self + 624);
  *(_QWORD *)v2 = v3;
  *(_BYTE *)(v2 + 8) = 1;
  std::recursive_mutex::lock(v3);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)clearOutputBuffers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[ASDAudioDevice outputStreams](self, "outputStreams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "clearBuffer");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)clearInputBuffers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[ASDAudioDevice inputStreams](self, "inputStreams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "clearBuffer");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)writeZerosToMixMilliseconds:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *((_QWORD *)self + 67);
  if (v3)
  {
    v4 = *(_QWORD *)&a3;
    v5 = *(_QWORD *)(v3 + 32);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[ASDAudioDevice outputStreams](self, "outputStreams", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "writeZerosToMixMilliseconds:atSampleTime:", v4, v5);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

+ (id)matcherWithDelegate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A288]), "initForIOServiceWithClassName:withDelegate:", CFSTR("IOAudio2Device"), v3);

  return v4;
}

- (BOOL)delayedStopIO
{
  return *((_BYTE *)self + 916);
}

- (void)setDelayedStopIO:(BOOL)a3
{
  *((_BYTE *)self + 916) = a3;
}

- (NSMapTable)customPropertySelectorMap
{
  return (NSMapTable *)*((_QWORD *)self + 115);
}

- (void)setCustomPropertySelectorMap:(id)a3
{
  objc_storeStrong((id *)self + 115, a3);
}

- (OS_dispatch_queue)stopIOQueue
{
  return (OS_dispatch_queue *)*((_QWORD *)self + 116);
}

- (void)setStopIOQueue:(id)a3
{
  objc_storeStrong((id *)self + 116, a3);
}

- (unint64_t)currentSeed
{
  return *((_QWORD *)self + 117);
}

- (void)setCurrentSeed:(unint64_t)a3
{
  *((_QWORD *)self + 117) = a3;
}

- (BOOL)shouldStopIO
{
  return *((_BYTE *)self + 917);
}

- (void)setShouldStopIO:(BOOL)a3
{
  *((_BYTE *)self + 917) = a3;
}

- (BOOL)ucDeviceStarted
{
  return *((_BYTE *)self + 918);
}

- (void)setUcDeviceStarted:(BOOL)a3
{
  *((_BYTE *)self + 918) = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_storeStrong((id *)self + 116, 0);
  objc_storeStrong((id *)self + 115, 0);
  std::condition_variable::~condition_variable((std::condition_variable *)self + 18);
  std::mutex::~mutex((std::mutex *)((char *)self + 800));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 752));
  std::mutex::~mutex((std::mutex *)((char *)self + 688));
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)self + 624));
  v3 = *((_QWORD *)self + 77);
  *((_QWORD *)self + 77) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  std::mutex::~mutex((std::mutex *)((char *)self + 552));
  v4 = *((_QWORD *)self + 68);
  *((_QWORD *)self + 68) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)self + 66);
  *((_QWORD *)self + 66) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 66) = 0;
  *((_QWORD *)self + 68) = 0;
  *((_QWORD *)self + 69) = 850045863;
  *((_QWORD *)self + 76) = 0;
  *((_OWORD *)self + 37) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *((_OWORD *)self + 35) = 0u;
  *((_QWORD *)self + 77) = 0;
  MEMORY[0x23B802C48]((char *)self + 624, a2);
  *((_QWORD *)self + 86) = 850045863;
  *(_OWORD *)((char *)self + 696) = 0u;
  *(_OWORD *)((char *)self + 712) = 0u;
  *(_OWORD *)((char *)self + 728) = 0u;
  *((_QWORD *)self + 93) = 0;
  *((_QWORD *)self + 94) = 1018212795;
  *(_OWORD *)((char *)self + 760) = 0u;
  *(_OWORD *)((char *)self + 776) = 0u;
  *((_QWORD *)self + 99) = 0;
  *((_QWORD *)self + 100) = 850045863;
  *(_OWORD *)((char *)self + 808) = 0u;
  *(_OWORD *)((char *)self + 824) = 0u;
  *(_OWORD *)((char *)self + 840) = 0u;
  *((_QWORD *)self + 107) = 0;
  *((_QWORD *)self + 108) = 1018212795;
  *(_OWORD *)((char *)self + 888) = 0u;
  *((_QWORD *)self + 113) = 0;
  *(_OWORD *)((char *)self + 872) = 0u;
  return self;
}

- (void)timestampPeriod
{
}

- (_DWORD)timestampPeriod
{
  _DWORD *result;

  result = operator new(0x10uLL);
  *(_QWORD *)result = &off_25084BBF8;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

- (uint64_t)timestampPeriod
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)startIORequest
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@: Waited to long to StartIO while change request is in progress.", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)handleTransportChanged:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "deviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2080;
  v7 = a2;
  _os_log_debug_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "IOA2Device %@ IO state = %s", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_2_3();
}

void __40__ASDTIOA2LegacyDevice_setSamplingRate___block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, " ", v0, 2u);
}

- (void)ioa2Device
{
  __assert_rtn("-[ASDTIOA2LegacyDevice ioa2Device]", "ASDTIOA2LegacyDevice.mm", 972, "_ucDevice");
}

@end
