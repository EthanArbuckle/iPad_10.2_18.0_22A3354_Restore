@implementation ASDTIOA2Device

+ (Class)ioServiceManagerClass
{
  return (Class)objc_opt_class();
}

+ (id)ioServiceDependenciesForConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "asdtDeviceUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend((id)objc_msgSend(a1, "ioServiceManagerClass"), "dependencyForIdentifier:andConfiguration:", v5, v4);
  else
    objc_msgSend((id)objc_msgSend(a1, "ioServiceManagerClass"), "dependencyForConfiguration:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (unique_ptr<ASDT::IOA2UserClient,)createIOA2UserClient:(unsigned int)a3
{
  ASDT::IOA2UserClient **v3;
  ASDT::IOA2UserClient **v5;
  ASDT::IOA2UserClient *v6;
  unique_ptr<ASDT::IOA2UserClient, std::default_delete<ASDT::IOA2UserClient>> v7;

  v5 = v3;
  v6 = (ASDT::IOA2UserClient *)operator new();
  v7.__ptr_.__value_ = (IOA2UserClient *)ASDT::IOA2UserClient::IOA2UserClient(v6, a3);
  *v5 = v6;
  return v7;
}

- (ASDTIOA2Device)initWithIOA2Device:(unsigned int)a3 config:(id)a4 deviceManager:(id)a5 plugin:(id)a6
{
  uint64_t v8;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  ASDTIOA2Device *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  const char *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  id v34;
  const char *v35;
  NSObject *v36;
  dispatch_queue_t v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  id v43;
  const char *v44;
  NSObject *v45;
  dispatch_queue_t v46;
  void *v47;
  _BOOL4 v48;
  int NumberStreams;
  uint64_t v50;
  void *v51;
  _BOOL4 v52;
  unsigned int v53;
  int v54;
  uint64_t v55;
  void *v56;
  BOOL v57;
  unsigned int v58;
  void *v59;
  _BOOL4 v60;
  id v62;
  id v63;
  id v64;
  objc_super v65;
  CFTypeRef cf[2];
  uint8_t buf[8];
  uint64_t v68;
  _QWORD v69[2];

  v8 = *(_QWORD *)&a3;
  v69[1] = *MEMORY[0x24BDAC8D0];
  v64 = a4;
  v62 = a5;
  v63 = a6;
  v10 = (id)objc_opt_class();
  if (v10)
  {
    objc_msgSend(v10, "createIOA2UserClient:", v8);
    v10 = *(id *)buf;
  }
  *(_QWORD *)buf = 0;
  v11 = *((_QWORD *)self + 66);
  *((_QWORD *)self + 66) = v10;
  if (v11)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    v12 = *(id *)buf;
    *(_QWORD *)buf = 0;
    if (v12)
      (*(void (**)(id))(*(_QWORD *)v12 + 8))(v12);
    v10 = (id)*((_QWORD *)self + 66);
  }
  if (v10)
  {
    ASDT::IOA2UserClient::CopyDeviceUID((ASDT::IOA2UserClient *)v10, (const applesauce::CF::TypeRef *)buf);
    v13 = *(id *)buf;
    v14 = v13;
    if (v13)
    {
      CFRelease(v13);
      if (v64)
      {
        objc_msgSend(v64, "asdtDeviceUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v14);

        if ((v16 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v64, "asdtDeviceUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:].cold.5(v17, (uint64_t)v14, buf);
        }
      }
      else
      {
        v68 = *MEMORY[0x24BE0A560];
        v69[0] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
        v64 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v65.receiver = self;
    v65.super_class = (Class)ASDTIOA2Device;
    v19 = -[ASDTAudioDevice initWithConfig:withDeviceManager:andPlugin:](&v65, sel_initWithConfig_withDeviceManager_andPlugin_, v64, v62, v63);
    if (!v19)
      goto LABEL_37;
    objc_msgSend(v64, "asdtExclavesInputBufferName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setExclavesInputBufferName:", v20);

    objc_msgSend(v19, "setIsolatedInputUseCaseID:", objc_msgSend(v64, "asdtIsolatedInputUseCaseID"));
    v21 = (void *)MEMORY[0x24BDD17C8];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%s.%@.%@.stopIO"), "com.apple.AudioServerDriverTransports", v23, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_retainAutorelease(v24);
    v26 = (const char *)objc_msgSend(v25, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create(v26, v27);
    v29 = (void *)*((_QWORD *)v19 + 121);
    *((_QWORD *)v19 + 121) = v28;

    v30 = (void *)MEMORY[0x24BDD17C8];
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%s.%@.%@.notification"), "com.apple.AudioServerDriverTransports", v32, v14);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_retainAutorelease(v33);
    v35 = (const char *)objc_msgSend(v34, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = dispatch_queue_create(v35, v36);
    v38 = (void *)*((_QWORD *)v19 + 123);
    *((_QWORD *)v19 + 123) = v37;

    v39 = (void *)MEMORY[0x24BDD17C8];
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("%s.%@.%@.concurrent"), "com.apple.AudioServerDriverTransports", v41, v14);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_retainAutorelease(v42);
    v44 = (const char *)objc_msgSend(v43, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = dispatch_queue_create(v44, v45);
    objc_msgSend(v19, "setConcurrentQueue:", v46);

    if (!*((_QWORD *)v19 + 121)
      || !*((_QWORD *)v19 + 123)
      || (objc_msgSend(v19, "concurrentQueue"),
          v47 = (void *)objc_claimAutoreleasedReturnValue(),
          v48 = v47 == 0,
          v47,
          v48))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "deviceUID");
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:].cold.1();
      }
      goto LABEL_40;
    }
    NumberStreams = ASDT::IOA2UserClient::GetNumberStreams(*((ASDT::IOA2UserClient **)v19 + 66), 1);
    v50 = NumberStreams != 0;
    objc_msgSend(v64, "objectForKey:", *MEMORY[0x24BE0A548]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51 == 0;

    if (!v52)
    {
      v53 = objc_msgSend(v19, "canBeDefaultInputDevice");
      if (NumberStreams)
        v50 = v53;
      else
        v50 = 0;
    }
    objc_msgSend(v19, "setCanBeDefaultInputDevice:", v50);
    v54 = ASDT::IOA2UserClient::GetNumberStreams(*((ASDT::IOA2UserClient **)v19 + 66), 0);
    v55 = v54 != 0;
    objc_msgSend(v64, "objectForKey:", *MEMORY[0x24BE0A550]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56 == 0;

    if (!v57)
    {
      v58 = objc_msgSend(v19, "canBeDefaultOutputDevice");
      if (v54)
        v55 = v58;
      else
        v55 = 0;
    }
    objc_msgSend(v19, "setCanBeDefaultOutputDevice:", v55);
    objc_msgSend(v64, "objectForKey:", *MEMORY[0x24BE0A558]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59 == 0;

    if (v60)
      objc_msgSend(v19, "setCanBeDefaultSystemDevice:", 1);
    ASDT::IOA2UserClient::CopyDeviceName(*((ASDT::IOA2UserClient **)v19 + 66), (const applesauce::CF::TypeRef *)cf);
    objc_msgSend(v19, "setDeviceName:", cf[0]);
    if (cf[0])
      CFRelease(cf[0]);
    ASDT::IOA2UserClient::CopyDeviceManufacturer(*((ASDT::IOA2UserClient **)v19 + 66), (const applesauce::CF::TypeRef *)cf);
    objc_msgSend(v19, "setManufacturerName:", cf[0]);
    if (cf[0])
      CFRelease(cf[0]);
    if ((objc_msgSend(v19, "_openConnection") & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "deviceUID");
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:].cold.4();
      }
      goto LABEL_40;
    }
    objc_msgSend(v19, "_updateProperties");
    if ((objc_msgSend(v19, "_updateControls") & 1) != 0)
    {
      if ((objc_msgSend(v19, "_updateStreams") & 1) != 0)
      {
        ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(*((ASDT::IOUserClient **)v19 + 66));
        ASDT::IOUserClient::SetTerminationNotificationEnabled(*((ASDT::IOUserClient **)v19 + 66));

LABEL_37:
        v18 = (ASDTIOA2Device *)v19;
LABEL_41:

        self = (ASDTIOA2Device *)v19;
        goto LABEL_42;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_46;
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
LABEL_46:
      objc_msgSend(v19, "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:].cold.2();
    }
LABEL_40:

    v18 = 0;
    goto LABEL_41;
  }
  v18 = 0;
LABEL_42:

  return v18;
}

- (ASDTIOA2Device)initWithConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ASDTIOA2Device *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BE0A280];
  objc_msgSend(v8, "asdtDeviceUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "forIdentifier:andClientType:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "ioServiceManagerClass"), "matchedIOServiceForID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:](self, "initWithIOA2Device:config:deviceManager:plugin:", objc_msgSend(v14, "ioObject"), v8, v9, v10);

  return v15;
}

- (ASDTIOA2Device)initWithIOA2Device:(unsigned int)a3 plugin:(id)a4
{
  return -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:](self, "initWithIOA2Device:config:deviceManager:plugin:", *(_QWORD *)&a3, 0, 0, a4);
}

- (void)dealloc
{
  objc_super v3;

  (*(void (**)(_QWORD, SEL))(**((_QWORD **)self + 66) + 32))(*((_QWORD *)self + 66), a2);
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2Device;
  -[ASDAudioDevice dealloc](&v3, sel_dealloc);
}

- (void)terminate
{
  ASDT::IOUserClient *v3;
  objc_super v4;

  v3 = (ASDT::IOUserClient *)*((_QWORD *)self + 66);
  if (v3 && ASDT::IOUserClient::IsServiceAlive(v3))
    (*(void (**)(_QWORD))(**((_QWORD **)self + 66) + 16))(*((_QWORD *)self + 66));
  *((_QWORD *)self + 67) = 0;
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOA2Device;
  -[ASDTAudioDevice terminate](&v4, sel_terminate);
}

- (void)ioa2UserClient
{
  return (void *)*((_QWORD *)self + 66);
}

- (unique_lock<std::shared_mutex>)lockConfigExclusive
{
  uint64_t v2;
  std::__shared_mutex_base *v3;
  shared_mutex *v4;
  _BOOL8 v5;
  unique_lock<std::shared_mutex> result;

  v3 = (std::__shared_mutex_base *)((char *)self + 608);
  *(_QWORD *)v2 = v3;
  *(_BYTE *)(v2 + 8) = 1;
  std::__shared_mutex_base::lock(v3);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (shared_lock<std::shared_mutex>)lockConfigShared
{
  uint64_t v2;
  std::__shared_mutex_base *v3;
  shared_mutex *v4;
  _BOOL8 v5;
  shared_lock<std::shared_mutex> result;

  v3 = (std::__shared_mutex_base *)((char *)self + 608);
  *(_QWORD *)v2 = v3;
  *(_BYTE *)(v2 + 8) = 1;
  std::__shared_mutex_base::lock_shared(v3);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)handleMachPortMessage
{
  void *v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "deviceUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v1;
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v2, "%@: Failed to receive a message.", (uint8_t *)&v3);

}

void __39__ASDTIOA2Device_handleMachPortMessage__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleConfigChange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);

}

- (void)ioRequestsBlock
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

- (void)ioRequestsRelease
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@: Unbalanced IORequest block/release.", v4);

  OUTLINED_FUNCTION_1_1();
}

- (BOOL)ioRequestBegin
{
  std::mutex *v3;
  int v4;

  v3 = (std::mutex *)((char *)self + 840);
  std::mutex::lock((std::mutex *)((char *)self + 840));
  v4 = *((_DWORD *)self + 238);
  if (v4 <= 0)
  {
    *((_DWORD *)self + 238) = v4 - 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device ioRequestBegin].cold.1();
    }
  }
  std::mutex::unlock(v3);
  return v4 < 1;
}

- (void)ioRequestEnd
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@: Unbalanced IORequest start/stop.", v4);

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
  -[ASDTAudioDevice powerState](self, "powerState");
  if ((asdtPowerStateCompare() & 0x80000000) != 0)
  {
    -[ASDTIOA2Device doConfigChange:](self, "doConfigChange:", a3);
  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    v11 = 0x5012000000;
    v14 = &unk_236D815AA;
    v6 = *(_OWORD *)&a3->var4;
    v15 = *(_OWORD *)&a3->var0;
    v16 = v6;
    objc_initWeak(&location, self);
    -[ASDTIOA2Device ioRequestsBlock](self, "ioRequestsBlock");
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __37__ASDTIOA2Device_handleConfigChange___block_invoke;
    v7[3] = &unk_25084B478;
    objc_copyWeak(&v8, &location);
    v7[4] = &buf;
    -[ASDAudioDevice requestConfigurationChange:](self, "requestConfigurationChange:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
}

void __37__ASDTIOA2Device_handleConfigChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "doConfigChange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  objc_msgSend(WeakRetained, "ioRequestsRelease");

}

- (void)doConfigChange:(IOAudio2Notification *)a3
{
  void *v5;
  std::mutex *v6;
  void *v7;
  int v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Do configuration change.", buf, 0xCu);

  }
  -[ASDTIOA2Device forceStopIO](self, "forceStopIO");
  -[ASDTIOA2Device lockConfigExclusive](self, "lockConfigExclusive");
  if (!ASDT::IOA2UserClient::PerformConfigChange(*((ASDT::IOA2UserClient **)self + 66), a3)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2Device doConfigChange:].cold.2();
  }
  v6 = (std::mutex *)*((_QWORD *)self + 103);
  std::mutex::lock(v6);
  std::mutex::unlock(v6);
  std::condition_variable::notify_all((std::condition_variable *)((char *)self + 776));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%@: Signaled sample rate waiting thread", (uint8_t *)&v8, 0xCu);

  }
  if (*((_QWORD *)self + 67))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device doConfigChange:].cold.1();
    }
    ASDT::IOUserClient::ReleaseMemory(*((ASDT::IOUserClient **)self + 66), *((void **)self + 67));
    *((_QWORD *)self + 67) = 0;
  }
  -[ASDTIOA2Device _updateProperties](self, "_updateProperties");
  -[ASDTIOA2Device _updateControls](self, "_updateControls");
  -[ASDTIOA2Device _updateStreams](self, "_updateStreams");
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
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
  uint64_t v18;
  _BYTE buf[12];
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[ASDTIOA2Device lockConfigShared](self, "lockConfigShared");
  -[ASDTIOA2Device _getControlByUCID:](self, "_getControlByUCID:", a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  var1 = a3->var1;
  if (var1 == 1668443751)
  {
    (*(void (**)(_QWORD))(**((_QWORD **)self + 66) + 24))(*((_QWORD *)self + 66));
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
      *(_QWORD *)&buf[4] = v9;
      v20 = 1024;
      v21 = v10;
      v22 = 1024;
      v23 = v12;
      v24 = 1024;
      v25 = v14;
      v26 = 1024;
      v27 = v16;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' range change notification.", buf, 0x24u);

    }
    ASDT::IOA2UserClient::CopyControlDictionaryByID(*((ASDT::IOA2UserClient **)self + 66), (const applesauce::CF::ArrayRef *)a3->var0, (applesauce::CF::DictionaryRef *)buf);
    objc_msgSend(v5, "synchronizeWithRegistryDictionary:", *(_QWORD *)buf);
    if (*(_QWORD *)buf)
      CFRelease(*(CFTypeRef *)buf);
  }
  else if (var1 == 1668702572)
  {
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
      *(_QWORD *)&buf[4] = v7;
      v20 = 1024;
      v21 = v8;
      v22 = 1024;
      v23 = v11;
      v24 = 1024;
      v25 = v13;
      v26 = 1024;
      v27 = v15;
      v28 = 1024;
      v29 = var2;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' value change notification: %u", buf, 0x2Au);

    }
    objc_msgSend(v5, "pushValue:", a3->var2);
  }

  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v18);
}

- (void)handleTransportChanged:(IOAudio2Notification *)a3
{
  unsigned int var1;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  _BYTE v13[24];
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  var1 = a3->var1;
  if (var1 == 1751215220 || var1 == 1735354734)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = a3->var1;
      v10 = HIBYTE(v9);
      if ((v9 - 0x20000000) >> 24 >= 0x5F)
        v10 = 32;
      v11 = BYTE2(v9);
      if (BYTE2(v9) - 32 >= 0x5F)
        v11 = 32;
      v12 = BYTE1(v9);
      if (BYTE1(v9) - 32 >= 0x5F)
        v12 = 32;
      *(_DWORD *)v13 = 138413314;
      *(_QWORD *)&v13[4] = v7;
      v9 = v9;
      *(_WORD *)&v13[12] = 1024;
      *(_DWORD *)&v13[14] = v10;
      *(_WORD *)&v13[18] = 1024;
      *(_DWORD *)&v13[20] = v11;
      LOWORD(v14) = 1024;
      *(_DWORD *)((char *)&v14 + 2) = v12;
      if (v9 - 32 >= 0x5F)
        v9 = 32;
      HIWORD(v14) = 1024;
      v15 = v9;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: change in IO state to '%c%c%c%c'", v13, 0x24u);

    }
    -[ASDTIOA2Device setNotifiedIORunning:](self, "setNotifiedIORunning:", a3->var1 == 1735354734, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14);
  }
}

- (void)handleIOA2PropertyChanged:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[ASDTIOA2Device propertyChangedDelegate](self, "propertyChangedDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedProperty:forObject:", a3, v7);

}

- (void)handlePropertyChanged:(IOAudio2Notification *)a3
{
  int v5;
  ASDTIOA2Device *v6;
  ASDT::IOA2UserClient **v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  CFTypeRef cf;
  uint64_t v13;
  int var4;

  v5 = -[ASDTIOA2Device objectID](self, "objectID");
  v6 = self;
  v7 = (ASDT::IOA2UserClient **)v6;
  if (!a3->var0)
  {
    v10 = v6;
    if (!v5)
      goto LABEL_8;
LABEL_7:
    v13 = *(_QWORD *)&a3->var2;
    var4 = a3->var4;
    objc_msgSend(v7, "handleIOA2PropertyChanged:forObject:", &v13, v10);
    goto LABEL_8;
  }
  -[ASDTIOA2Device lockConfigShared](v6, "lockConfigShared");
  (*(void (**)(ASDT::IOA2UserClient *))(*(_QWORD *)v7[66] + 24))(v7[66]);
  objc_msgSend(v7, "_getStreamByUCID:", a3->var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v5 = objc_msgSend(v8, "objectID");
    v10 = v9;
    v11 = v7;
  }
  else
  {
    objc_msgSend(v7, "_getControlByUCID:", a3->var0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      ASDT::IOA2UserClient::CopyControlDictionaryByID(v7[66], (const applesauce::CF::ArrayRef *)a3->var0, (applesauce::CF::DictionaryRef *)&cf);
      objc_msgSend(v11, "synchronizeWithRegistryDictionary:", cf);
      v5 = objc_msgSend(v11, "objectID");
      v10 = v11;

      if (cf)
        CFRelease(cf);
    }
    else
    {
      v10 = v7;
    }
  }

  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v13);
  if (v5)
    goto LABEL_7;
LABEL_8:

}

- (array<std::vector<unsigned)_getStreamListUCIDLists
{
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  const __CFArray *v8;
  CFIndex Count;
  unint64_t v10;
  void **p_var0;
  char **v12;
  _QWORD *v13;
  CFArrayRef v14;
  CFIndex v15;
  const __CFDictionary *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  int v27;
  array<std::vector<unsigned int>, 2UL> *result;
  void *exception;
  char v31;
  CFTypeRef cf;
  CFTypeRef *v33;
  CFTypeRef v34;
  CFArrayRef theArray;

  v4 = 0;
  v5 = 0;
  *(_OWORD *)&retstr->var0[0].var2.var0 = 0u;
  *(_OWORD *)&retstr->var0[1].var1 = 0u;
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  v6 = 1;
  do
  {
    v7 = v6;
    ASDT::IOA2UserClient::CopyStreamList(*((ASDT::IOA2UserClient **)self + 66), v4 & 1, (const applesauce::CF::TypeRef *)&theArray);
    v8 = theArray;
    if (theArray)
      Count = CFArrayGetCount(theArray);
    else
      Count = 0;
    v31 = v7;
    v10 = 0;
    p_var0 = (void **)&retstr->var0[v5].var0;
    v12 = (char **)(p_var0 + 1);
    v13 = p_var0 + 2;
    while (1)
    {
      v14 = theArray;
      if (theArray)
      {
        v15 = CFArrayGetCount(theArray);
        if (!v8)
          break;
      }
      else
      {
        v15 = 0;
        if (!v8)
          break;
      }
      if (v10 == Count)
        break;
      if (v8 == v14 && v10 == v15)
        break;
      applesauce::CF::details::at_to<applesauce::CF::DictionaryRef>(v8, v10, (applesauce::CF::DictionaryRef *)&v34);
      if (!v34)
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x23B802BE8](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
      }
      v33 = &v34;
      applesauce::CF::make_StringRef(CFSTR("stream ID"), (applesauce::CF::StringRef *)&cf);
      v17 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&v33, &cf);
      if (cf)
        CFRelease(cf);
      if (((unint64_t)v17 & 0xFF00000000) != 0)
      {
        v18 = *v12;
        if ((unint64_t)*v12 >= *v13)
        {
          v20 = (char *)*p_var0;
          v21 = (v18 - (_BYTE *)*p_var0) >> 2;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62)
            std::vector<char>::__throw_length_error[abi:ne180100]();
          v23 = *v13 - (_QWORD)v20;
          if (v23 >> 1 > v22)
            v22 = v23 >> 1;
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
            v24 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v24 = v22;
          if (v24)
          {
            v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)(p_var0 + 2), v24);
            v18 = *v12;
            v20 = (char *)*p_var0;
          }
          else
          {
            v25 = 0;
          }
          v26 = &v25[4 * v21];
          *(_DWORD *)v26 = (_DWORD)v17;
          v19 = v26 + 4;
          while (v18 != v20)
          {
            v27 = *((_DWORD *)v18 - 1);
            v18 -= 4;
            *((_DWORD *)v26 - 1) = v27;
            v26 -= 4;
          }
          *p_var0 = v26;
          *v12 = v19;
          *v13 = &v25[4 * v24];
          if (v20)
            operator delete(v20);
        }
        else
        {
          *(_DWORD *)v18 = (_DWORD)v17;
          v19 = v18 + 4;
        }
        *v12 = v19;
      }
      if (v34)
        CFRelease(v34);
      ++v10;
    }
    result = (array<std::vector<unsigned int>, 2UL> *)theArray;
    if (theArray)
      CFRelease(theArray);
    v6 = 0;
    v4 = 1;
    v5 = 1;
  }
  while ((v31 & 1) != 0);
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
  return -[ASDTIOA2Stream initWithIOA2Device:userClientID:direction:]([ASDTIOA2Stream alloc], "initWithIOA2Device:userClientID:direction:", self, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (id)_markOrCreateStreamsWithIDs:(vector<unsigned)int direction:(std:(unsigned int)a4 :allocator<unsigned int>> *)a3
{
  uint64_t v4;
  void *v7;
  unsigned int *var1;
  unsigned int *var0;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = a3->var0;
  var1 = a3->var1;
  if (a3->var0 != var1)
  {
    do
    {
      v10 = *var0;
      -[ASDTIOA2Device _getStreamByUCID:](self, "_getStreamByUCID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "setMarked:", 1);
      }
      else
      {
        -[ASDTIOA2Device createStreamForUserClientID:direction:](self, "createStreamForUserClientID:direction:", v10, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            -[ASDAudioDevice deviceUID](self, "deviceUID");
            objc_claimAutoreleasedReturnValue();
            -[ASDTIOA2Device _markOrCreateStreamsWithIDs:direction:].cold.1();
          }
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDAudioDevice deviceUID](self, "deviceUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTIOA2Device.mm"), 624, CFSTR("%@: Failed to create stream."), v15);

        }
        objc_msgSend(v7, "addObject:", v13);
        if ((_DWORD)v4 == 1768845428 && objc_msgSend(v13, "usesIsolatedIO"))
        {
          objc_msgSend(v13, "setIsolatedUseCaseID:", -[ASDTIOA2Device isolatedInputUseCaseID](self, "isolatedInputUseCaseID"));
          -[ASDTIOA2Device exclavesInputBufferName](self, "exclavesInputBufferName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setExclavesBufferName:", v16);

        }
      }

      ++var0;
    }
    while (var0 != var1);
  }
  return v7;
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

- (void)_updateProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(_QWORD, SEL))(**((_QWORD **)self + 66) + 24))(*((_QWORD *)self + 66), a2);
  -[ASDTIOA2Device setupCustomPropertySelectorMap](self, "setupCustomPropertySelectorMap");
  +[ASDTIOA2DefaultChannelLayout forIOA2Device:andScope:](ASDTIOA2DefaultChannelLayout, "forIOA2Device:andScope:", self, 1869968496);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDTIOA2DefaultChannelLayout addressForDirection:](ASDTIOA2DefaultChannelLayout, "addressForDirection:", 1869968496);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ASDTAudioDevice updateCustomProperty:withAddress:](self, "updateCustomProperty:withAddress:", v3, v4)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);

  }
  +[ASDTIOA2DefaultChannelLayout forIOA2Device:andScope:](ASDTIOA2DefaultChannelLayout, "forIOA2Device:andScope:", self, 1768845428);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASDTIOA2DefaultChannelLayout addressForDirection:](ASDTIOA2DefaultChannelLayout, "addressForDirection:", 1768845428);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ASDTAudioDevice updateCustomProperty:withAddress:](self, "updateCustomProperty:withAddress:", v6, v7)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);

  }
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

  -[ASDTIOA2Device _getStreamListUCIDLists](self, "_getStreamListUCIDLists");
  __p = 0;
  v17 = 0;
  v18 = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, v21, v22[0], (v22[0] - (uint64_t)v21) >> 2);
  -[ASDTIOA2Device _markOrCreateStreamsWithIDs:direction:](self, "_markOrCreateStreamsWithIDs:direction:", &__p, 1768845428);
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
  -[ASDTIOA2Device _markOrCreateStreamsWithIDs:direction:](self, "_markOrCreateStreamsWithIDs:direction:", &v13, 1869968496);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v13;
    operator delete(v13);
  }
  -[ASDAudioDevice inputStreams](self, "inputStreams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTIOA2Device _synchronizeStreamsOrReturnForRemoval:](self, "_synchronizeStreamsOrReturnForRemoval:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDAudioDevice outputStreams](self, "outputStreams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTIOA2Device _synchronizeStreamsOrReturnForRemoval:](self, "_synchronizeStreamsOrReturnForRemoval:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDTIOA2Device _removeInputStreams:](self, "_removeInputStreams:", v7);
  -[ASDTIOA2Device _removeOutputStreams:](self, "_removeOutputStreams:", v9);
  -[ASDTIOA2Device _addInputStreams:](self, "_addInputStreams:", v4);
  -[ASDTIOA2Device _addOutputStreams:](self, "_addOutputStreams:", v5);

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

- (BOOL)subclassUpdateControls
{
  return 1;
}

- (BOOL)_updateControls
{
  NSArray *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  id v31;
  id obj;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  _QWORD v49[2];
  _QWORD v50[2];
  _BYTE v51[128];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  -[ASDAudioDevice controls](self, "controls");
  v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  clearMark(v2);

  ASDT::IOA2UserClient::CopyControlList(*((ASDT::IOA2UserClient **)self + 66), (const applesauce::CF::TypeRef *)&v47);
  v3 = v47;
  v4 = v3;
  if (v3)
    CFRelease(v3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v44 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("control ID"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[ASDTIOA2Device _getControlByUCID:](self, "_getControlByUCID:", objc_msgSend(v9, "unsignedIntValue"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (v10)
            {
              objc_msgSend(v10, "setMarked:", 1);
              v54[0] = CFSTR("control");
              v54[1] = CFSTR("operation");
              v55[0] = v11;
              v55[1] = &unk_250850260;
              v54[2] = CFSTR("registryDict");
              v55[2] = v8;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v12);
              goto LABEL_14;
            }
            +[ASDTIOA2Control controlWithDictionary:owningDevice:](ASDTIOA2Control, "controlWithDictionary:owningDevice:", v8, self);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = (void *)v13;
            if (v13)
            {
              v52[0] = CFSTR("control");
              v52[1] = CFSTR("operation");
              v53[0] = v13;
              v53[1] = &unk_250850278;
              v52[2] = CFSTR("registryDict");
              v53[2] = v8;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v12);
              v11 = v14;
LABEL_14:

            }
          }

          continue;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v5);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[ASDAudioDevice controls](self, "controls");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        if ((objc_msgSend(v19, "marked") & 1) == 0)
        {
          v49[0] = CFSTR("control");
          v49[1] = CFSTR("operation");
          v50[0] = v19;
          v50[1] = &unk_250850290;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "insertObject:atIndex:", v20, 0);

        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v16);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v31 = v33;
  v21 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v31);
        v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("registryDict"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("control"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("operation"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "unsignedIntValue");

        switch(v28)
        {
          case 0:
            -[ASDAudioDevice addControl:](self, "addControl:", v26);
LABEL_37:
            objc_msgSend(v26, "synchronizeWithRegistryDictionary:", v25);
            break;
          case 1:
            goto LABEL_37;
          case 2:
            -[ASDAudioDevice removeControl:](self, "removeControl:", v26);
            break;
        }

      }
      v21 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v21);
  }

  v29 = -[ASDTIOA2Device subclassUpdateControls](self, "subclassUpdateControls");
  return v29;
}

- (double)_samplingRate
{
  double result;

  ASDT::IOA2UserClient::GetNominalSampleRate(*((ASDT::IOA2UserClient **)self + 66));
  return result;
}

- (void)setSamplingRate:(double)a3
{
  objc_super v5;

  if (-[ASDTIOA2Device _setSamplingRate:](self, "_setSamplingRate:"))
  {
    v5.receiver = self;
    v5.super_class = (Class)ASDTIOA2Device;
    -[ASDTAudioDevice setSamplingRate:](&v5, sel_setSamplingRate_, a3);
  }
}

- (BOOL)_setSamplingRate:(double)a3
{
  double v5;
  BOOL v6;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  uint8_t v16[16];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[ASDTIOA2Device lockConfigExclusive](self, "lockConfigExclusive");
  -[ASDTIOA2Device _samplingRate](self, "_samplingRate");
  if (v5 != a3)
  {
    if (ASDT::IOA2UserClient::SetNominalSampleRate(*((ASDT::IOA2UserClient **)self + 66), a3))
    {
      v15 = (double)std::chrono::system_clock::now().__d_.__rep_ + 5000000.0;
      v8 = MEMORY[0x24BDACB70];
      while (1)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          -[ASDAudioDevice deviceUID](self, "deviceUID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v18 = v9;
          _os_log_impl(&dword_236D43000, v8, OS_LOG_TYPE_INFO, "%@: Waiting to be signaled from IOA2 config change notification thread...", buf, 0xCu);

        }
        v10 = std::condition_variable_any::wait_until<std::unique_lock<std::shared_mutex>,std::chrono::system_clock,std::chrono::duration<double,std::ratio<1l,1000000l>>>((uint64_t)self + 776, (uint64_t)v16, &v15);
        -[ASDTIOA2Device _samplingRate](self, "_samplingRate");
        v12 = v11;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          -[ASDAudioDevice deviceUID](self, "deviceUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v18 = v13;
          v19 = 2048;
          v20 = v12;
          v21 = 2048;
          v22 = a3;
          _os_log_impl(&dword_236D43000, v8, OS_LOG_TYPE_INFO, "%@: Woke! currentRate = %f, desiredRate = %f", buf, 0x20u);

        }
        if (v10)
          break;
        if (v12 == a3)
          goto LABEL_18;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: setSamplingRate timed out", buf, 0xCu);

      }
      if (v12 == a3)
      {
LABEL_18:
        std::unique_lock<std::shared_mutex>::unlock((uint64_t)v16);
        v6 = 1;
        goto LABEL_3;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device _setSamplingRate:].cold.1();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device _setSamplingRate:].cold.2();
    }
  }
  v6 = 0;
LABEL_3:
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v16);
  return v6;
}

- (id)_getCurrentFormatForStream:(unsigned int)a3
{
  AudioStreamBasicDescription *v4;
  void *v5;
  _BYTE v7[40];
  CFTypeRef cf[5];

  cf[4] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  ASDT::IOA2UserClient::CopyStreamDictionaryByID(*((ASDT::IOA2UserClient **)self + 66), a3, (applesauce::CF::DictionaryRef *)cf);
  if ((ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat((const __CFDictionary **)cf, (const applesauce::CF::DictionaryRef *)v7, v4) & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A270]), "initWithAudioStreamBasicDescription:", v7);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device _getCurrentFormatForStream:].cold.1();
    }
    v5 = 0;
  }
  if (cf[0])
    CFRelease(cf[0]);
  return v5;
}

- (BOOL)_setCurrentFormat:(id)a3 forStream:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  BOOL v8;
  ASDT::IOA2UserClient *v10;
  AudioFormatFlags v11;
  NSObject *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  _BYTE v21[16];
  AudioStreamBasicDescription buf;
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ASDTIOA2Device lockConfigExclusive](self, "lockConfigExclusive");
  -[ASDTIOA2Device _getCurrentFormatForStream:](self, "_getCurrentFormatForStream:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    v10 = (ASDT::IOA2UserClient *)*((_QWORD *)self + 66);
    if (v6)
      objc_msgSend(v6, "audioStreamBasicDescription");
    else
      memset(&buf, 0, sizeof(buf));
    if (ASDT::IOA2UserClient::SetStreamCurrentFormat(v10, v4, &buf))
    {
      LOBYTE(v11) = 0;
      v20 = (double)std::chrono::system_clock::now().__d_.__rep_ + 5000000.0;
      v12 = MEMORY[0x24BDACB70];
      do
      {
        if ((v11 & 1) != 0)
          goto LABEL_18;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          -[ASDAudioDevice deviceUID](self, "deviceUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.mSampleRate) = 138412290;
          *(_QWORD *)((char *)&buf.mSampleRate + 4) = v13;
          _os_log_impl(&dword_236D43000, v12, OS_LOG_TYPE_INFO, "%@: Waiting to be signaled from IOA2 config change notification thread...", (uint8_t *)&buf, 0xCu);

        }
        v14 = std::condition_variable_any::wait_until<std::unique_lock<std::shared_mutex>,std::chrono::system_clock,std::chrono::duration<double,std::ratio<1l,1000000l>>>((uint64_t)self + 776, (uint64_t)v21, &v20);
        -[ASDTIOA2Device _getCurrentFormatForStream:](self, "_getCurrentFormatForStream:", v4);
        v15 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v15;
        v11 = objc_msgSend(v6, "isEqual:", v15);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          -[ASDAudioDevice deviceUID](self, "deviceUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.mSampleRate) = 138412546;
          *(_QWORD *)((char *)&buf.mSampleRate + 4) = v16;
          LOWORD(buf.mFormatFlags) = 1024;
          *(AudioFormatFlags *)((char *)&buf.mFormatFlags + 2) = v11;
          _os_log_impl(&dword_236D43000, v12, OS_LOG_TYPE_INFO, "%@: Woke! Desired format set: %hhu", (uint8_t *)&buf, 0x12u);

        }
      }
      while (!v14);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.mSampleRate) = 138412290;
        *(_QWORD *)((char *)&buf.mSampleRate + 4) = v17;
        _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: _setCurrentFormat timed out", (uint8_t *)&buf, 0xCu);

      }
      if ((v11 & 1) != 0)
      {
LABEL_18:
        v8 = 1;
        goto LABEL_3;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device _setCurrentFormat:forStream:].cold.1(v19, (uint64_t)v6, (uint64_t)v7, (uint64_t)&buf);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device _setCurrentFormat:forStream:].cold.2(v18, (uint64_t)v6, (uint8_t *)&buf, v4);
    }
  }
  v8 = 0;
LABEL_3:

  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v21);
  return v8;
}

- (id)samplingRates
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ASDTAudioDevice allStreams](self, "allStreams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    obj = v4;
    v25 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v7, "physicalFormats", obj);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v27 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              objc_msgSend(v12, "sampleRate");
              if (v13 != 0.0)
              {
                v14 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v12, "sampleRate");
                objc_msgSend(v14, "numberWithDouble:");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v15);
LABEL_17:

                continue;
              }
              objc_msgSend(v12, "minimumSampleRate");
              if (v16 != 0.0)
              {
                v17 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v12, "minimumSampleRate");
                objc_msgSend(v17, "numberWithDouble:");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v18);

              }
              objc_msgSend(v12, "maximumSampleRate");
              if (v19 != 0.0)
              {
                v20 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v12, "maximumSampleRate");
                objc_msgSend(v20, "numberWithDouble:");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v15);
                goto LABEL_17;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v9);
        }

      }
      v4 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortedArrayUsingComparator:", &__block_literal_global);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __31__ASDTIOA2Device_samplingRates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unsigned)timestampPeriod
{
  return ASDT::IOA2UserClient::GetRingBufferSize(*((ASDT::IOA2UserClient **)self + 66));
}

- (unsigned)inputLatency
{
  return ASDT::IOA2UserClient::GetLatency(*((ASDT::IOA2UserClient **)self + 66), 1);
}

- (unsigned)outputLatency
{
  return ASDT::IOA2UserClient::GetLatency(*((ASDT::IOA2UserClient **)self + 66), 0);
}

- (unsigned)inputSafetyOffset
{
  return ASDT::IOA2UserClient::GetSafetyOffset(*((ASDT::IOA2UserClient **)self + 66), 1);
}

- (unsigned)outputSafetyOffset
{
  return ASDT::IOA2UserClient::GetSafetyOffset(*((ASDT::IOA2UserClient **)self + 66), 0);
}

- (unsigned)transportType
{
  return ASDT::IOA2UserClient::GetTransportType(*((ASDT::IOA2UserClient **)self + 66));
}

- (unsigned)clockDomain
{
  return ASDT::IOA2UserClient::GetClockDomain(*((ASDT::IOA2UserClient **)self + 66));
}

- (unique_ptr<ASDT::MachPort,)createNotificationPort
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t Port;

  v3 = v2;
  v4 = operator new();
  *(_QWORD *)v4 = MEMORY[0x24BE0A528] + 16;
  Port = ASDT::MachPort::CreatePort((ASDT::MachPort *)1);
  *(_DWORD *)(v4 + 8) = Port;
  *(_WORD *)(v4 + 12) = 257;
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *v3 = v4;
  return (unique_ptr<ASDT::MachPort, std::default_delete<ASDT::MachPort>>)Port;
}

- (BOOL)_openConnection
{
  uint64_t v3;
  char v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  id location;
  id v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  -[ASDTIOA2Device createNotificationPort](self, "createNotificationPort");
  if (v14)
  {
    v16 = *((id *)self + 123);
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __33__ASDTIOA2Device__openConnection__block_invoke;
    v12 = &unk_25084B4E0;
    objc_copyWeak(&v13, &location);
    v17 = (id)MEMORY[0x23B8030C8](&v9);
    if (((*(uint64_t (**)(uint64_t, id *))(*(_QWORD *)v14 + 16))(v14, &v16) & 1) != 0)
    {
      if ((ASDT::IOUserClient::OpenConnection(*((ASDT::IOUserClient **)self + 66)) & 1) != 0)
      {
        v3 = v14;
        v14 = 0;
        v8 = v3;
        -[ASDTIOA2Device objectID](self, "objectID");
        v4 = ASDT::IOUserClient::SetConnectionNotification();
        if (v8)
          (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
        if ((v4 & 1) != 0)
        {
          v5 = 1;
LABEL_18:

          objc_destroyWeak(&v13);
          goto LABEL_19;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[ASDAudioDevice deviceUID](self, "deviceUID", 0, v9, v10, v11, v12);
          objc_claimAutoreleasedReturnValue();
          -[ASDTIOA2Device _openConnection].cold.2();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device _openConnection].cold.3();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device _openConnection].cold.4();
    }
    v5 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2Device _openConnection].cold.1();
  }
  v5 = 0;
LABEL_19:
  v6 = v14;
  v14 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  objc_destroyWeak(&location);
  return v5;
}

void __33__ASDTIOA2Device__openConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleMachPortMessage");

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
  IOAudio2EngineStatus **v2;
  _QWORD v4[5];

  v2 = -[ASDTIOA2Device engineStatusIndirection](self, "engineStatusIndirection");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__ASDTIOA2Device_getZeroTimestampBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e20_i36__0_d8_Q16_Q24I32l;
  v4[4] = v2;
  return (id)MEMORY[0x23B8030C8](v4);
}

uint64_t __39__ASDTIOA2Device_getZeroTimestampBlock__block_invoke(uint64_t a1, double *a2, unint64_t *a3, unint64_t *a4)
{
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v4 = **(unint64_t ***)(a1 + 32);
  if (!v4)
    return 1937010544;
  v5 = *v4;
  v6 = v4[1];
  v7 = v4[2];
  result = 0;
  *a2 = (double)v5;
  *a3 = v6;
  *a4 = v7;
  return result;
}

- (void)setupCustomPropertySelectorMap
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  int v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE buf[12];
  __int16 v23;
  int v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  ASDT::IOA2UserClient::CopyCustomPropertyInfo(*((ASDT::IOA2UserClient **)self + 66), (const applesauce::CF::TypeRef *)buf);
  v2 = *(id *)buf;
  v3 = v2;
  if (v2)
    CFRelease(v2);
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 0, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    v8 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "valueForKey:", CFSTR("registry key"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "valueForKey:", CFSTR("property selector"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11)
          v14 = v12 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          objc_msgSend(v4, "setObject:forKey:", v11, v12);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            v15 = objc_msgSend(v13, "unsignedIntValue");
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v11;
            v23 = 1024;
            v24 = v15;
            _os_log_debug_impl(&dword_236D43000, v8, OS_LOG_TYPE_DEBUG, "Registry Key: %@, Selector: %u", buf, 0x12u);
          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(v17, "setCustomPropertySelectorMap:", v4);
}

- (id)getKeyForCustomPropertyWithSelector:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[ASDTIOA2Device customPropertySelectorMap](self, "customPropertySelectorMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)customPropertyWithKey:(id)a3
{
  applesauce::CF::StringRef *v4;
  ASDT::IOUserClient *v5;
  int v6;
  void *v7;
  CFTypeRef cf;
  CFTypeRef v10;

  v4 = (applesauce::CF::StringRef *)a3;
  v10 = 0;
  v5 = (ASDT::IOUserClient *)*((_QWORD *)self + 66);
  applesauce::CF::StringRef::from_ns_noexcept(v4, (applesauce::CF::StringRef **)&cf);
  v6 = ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(v5, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v10);
  if (cf)
    CFRelease(cf);
  if (v6)
    v7 = (id)v10;
  else
    v7 = 0;
  if (v10)
    CFRelease(v10);

  return v7;
}

- (unsigned)customUInt32WithKey:(id)a3 defaultValue:(unsigned int)a4
{
  applesauce::CF::StringRef *v6;
  ASDT::IOUserClient *v7;
  int v8;
  CFTypeRef cf;
  unsigned int v11;

  v6 = (applesauce::CF::StringRef *)a3;
  v11 = a4;
  v7 = (ASDT::IOUserClient *)*((_QWORD *)self + 66);
  applesauce::CF::StringRef::from_ns_noexcept(v6, (applesauce::CF::StringRef **)&cf);
  v8 = ASDT::IOUserClient::CopyProperty<unsigned int>(v7, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v11);
  if (cf)
    CFRelease(cf);
  if (v8)
    a4 = v11;

  return a4;
}

- (id)customDataPropertyWithKey:(id)a3
{
  applesauce::CF::StringRef *v4;
  ASDT::IOUserClient *v5;
  int v6;
  void *v7;
  CFTypeRef cf;
  CFTypeRef v10;

  v4 = (applesauce::CF::StringRef *)a3;
  v10 = 0;
  v5 = (ASDT::IOUserClient *)*((_QWORD *)self + 66);
  applesauce::CF::StringRef::from_ns_noexcept(v4, (applesauce::CF::StringRef **)&cf);
  v6 = ASDT::IOUserClient::CopyProperty<applesauce::CF::DataRef>(v5, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v10);
  if (cf)
    CFRelease(cf);
  if (v6)
    v7 = (id)v10;
  else
    v7 = 0;
  if (v10)
    CFRelease(v10);

  return v7;
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
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v6, "controlScope") == 1869968496
          && objc_msgSend(v6, "objectClass") == 1986817381)
        {
          LODWORD(v7) = 1.0;
          objc_msgSend(v6, "changeScalarValue:", v7);
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

- (int)performPowerStatePrewarm:(int)a3
{
  unsigned int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  std::unique_lock<std::mutex> v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)ASDTIOA2Device;
  v5 = -[ASDTAudioDevice performPowerStatePrewarm:](&v12, sel_performPowerStatePrewarm_);
  v6 = v5;
  if (a3 != 1970304877 || v5)
    return v6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ Starting IO", buf, 0xCu);

  }
  if (-[ASDTIOA2Device ioRequestBegin](self, "ioRequestBegin"))
  {
    v11.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 544);
    v11.__owns_ = 1;
    std::mutex::lock((std::mutex *)((char *)self + 544));
    ++*((_QWORD *)self + 122);
    *((_BYTE *)self + 957) = 0;
    if (!-[ASDTIOA2Device ucDeviceStarted](self, "ucDeviceStarted"))
    {
      if (!ASDT::IOA2UserClient::StartIO(*((ASDT::IOA2UserClient **)self + 66)))
      {
        v6 = 2003329396;
        goto LABEL_13;
      }
      -[ASDTIOA2Device setUcDeviceStarted:](self, "setUcDeviceStarted:", 1, v11.__m_);
    }
    v6 = 0;
LABEL_13:
    std::unique_lock<std::mutex>::unlock(&v11);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v9;
      v15 = 1024;
      v16 = v6;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ Start of IO result %d", buf, 0x12u);

    }
    -[ASDTIOA2Device ioRequestEnd](self, "ioRequestEnd", v11.__m_);
    if (v11.__owns_)
      std::mutex::unlock(v11.__m_);
    return v6;
  }
  v6 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ Start of IO faked.", buf, 0xCu);

    return 0;
  }
  return v6;
}

- (int)performPowerStatePrepare:(int)a3
{
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  objc_super v11;
  std::unique_lock<std::mutex> v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a3 == 1970303090)
  {
    v13.receiver = self;
    v13.super_class = (Class)ASDTIOA2Device;
    v4 = -[ASDTAudioDevice performPowerStatePrepare:](&v13, sel_performPowerStatePrepare_, 1970303090);
    if (!v4)
    {
      -[ASDTIOA2Device lockConfigExclusive](self, "lockConfigExclusive");
      if (ASDT::IOA2UserClient::MapEngineStatus(*((ASDT::IOA2UserClient **)self + 66), (IOAudio2EngineStatus **)self + 67))
      {
        v4 = 0;
      }
      else
      {
        v4 = 1852990585;
      }
      std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    }
    return v4;
  }
  v5 = *(_QWORD *)&a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ Stopping IO", buf, 0xCu);

  }
  v12.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 544);
  v12.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)self + 544));
  if (-[ASDTIOA2Device delayedStopIO](self, "delayedStopIO")
    && -[ASDTIOA2Device ucDeviceStarted](self, "ucDeviceStarted")
    && !-[ASDTAudioDevice configurationChangesPending](self, "configurationChangesPending"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ Postpone underlying StopIO", buf, 0xCu);

    }
    -[ASDTIOA2Device _requestUnderlyingStopIO](self, "_requestUnderlyingStopIO");
  }
  else
  {
    -[ASDTIOA2Device setUcDeviceStarted:](self, "setUcDeviceStarted:", 0);
    if (!-[ASDTAudioDevice terminated](self, "terminated"))
    {
      if (ASDT::IOA2UserClient::StopIO(*((ASDT::IOA2UserClient **)self + 66)))
        v7 = 0;
      else
        v7 = 2003329396;
      goto LABEL_20;
    }
  }
  v7 = 0;
LABEL_20:
  std::unique_lock<std::mutex>::unlock(&v12);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDAudioDevice deviceUID](self, "deviceUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v9;
    v16 = 1024;
    v17 = v7;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ Stop of IO result %d", buf, 0x12u);

  }
  v11.receiver = self;
  v11.super_class = (Class)ASDTIOA2Device;
  v4 = -[ASDTAudioDevice performPowerStatePrepare:](&v11, sel_performPowerStatePrepare_, v5);
  if (v12.__owns_)
    std::mutex::unlock(v12.__m_);
  return v4;
}

- (int)performPowerStateIdle:(int)a3
{
  uint64_t v3;
  objc_super v6;
  _BYTE v7[16];

  v3 = *(_QWORD *)&a3;
  if (a3 == 1684628588)
  {
    -[ASDTIOA2Device lockConfigExclusive](self, "lockConfigExclusive");
    ASDT::IOUserClient::ReleaseMemory(*((ASDT::IOUserClient **)self + 66), *((void **)self + 67));
    *((_QWORD *)self + 67) = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v7);
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOA2Device;
  return -[ASDTAudioDevice performPowerStateIdle:](&v6, sel_performPowerStateIdle_, v3);
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
  v4 = (void *)*((_QWORD *)self + 122);
  *((_BYTE *)self + 957) = 1;
  objc_initWeak(&location, self);
  v5 = *((_QWORD *)self + 121);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ASDTIOA2Device__requestUnderlyingStopIO__block_invoke;
  block[3] = &unk_25084B3F0;
  objc_copyWeak(v7, &location);
  v7[1] = v4;
  dispatch_after(v3, v5, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __42__ASDTIOA2Device__requestUnderlyingStopIO__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performUnderlyingStopIO:", *(_QWORD *)(a1 + 40));

}

- (void)_performUnderlyingStopIO:(unint64_t)a3
{
  std::mutex *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (std::mutex *)((char *)self + 544);
  std::mutex::lock((std::mutex *)((char *)self + 544));
  if (*((_BYTE *)self + 957) && *((_QWORD *)self + 122) == a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = (uint64_t)v6;
      _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ PerformUnderlyingStopIO", (uint8_t *)&v11, 0xCu);

    }
    *((_BYTE *)self + 957) = 0;
    if (-[ASDTIOA2Device ucDeviceStarted](self, "ucDeviceStarted"))
    {
      -[ASDTIOA2Device setUcDeviceStarted:](self, "setUcDeviceStarted:", 0);
      v7 = -[ASDTAudioDevice terminated](self, "terminated")
        || ASDT::IOA2UserClient::StopIO(*((ASDT::IOA2UserClient **)self + 66));
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        v10 = "failed";
        if (v7)
          v10 = "succeeded";
        v11 = 138412546;
        v12 = v8;
        v13 = 2080;
        v14 = v10;
        _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ PerformUnderlyingStopIO %s", (uint8_t *)&v11, 0x16u);

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
    v4 = *((unsigned __int8 *)self + 957);
    *(_DWORD *)buf = 138412546;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@ forceStopIO, shouldStopIO %d", buf, 0x12u);

  }
  v5 = *((_QWORD *)self + 121);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ASDTIOA2Device_forceStopIO__block_invoke;
  block[3] = &unk_25084B528;
  block[4] = self;
  dispatch_sync(v5, block);
}

uint64_t __29__ASDTIOA2Device_forceStopIO__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performUnderlyingStopIO:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
}

- (int)systemSleepPending
{
  objc_super v4;

  -[ASDTIOA2Device forceStopIO](self, "forceStopIO");
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOA2Device;
  return -[ASDTAudioDevice systemSleepPending](&v4, sel_systemSleepPending);
}

- (id)updateClientOutputPositionBlock
{
  IOAudio2EngineStatus **v2;
  _QWORD v4[5];

  v2 = -[ASDTIOA2Device engineStatusIndirection](self, "engineStatusIndirection");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__ASDTIOA2Device_updateClientOutputPositionBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0Q8l;
  v4[4] = v2;
  return (id)MEMORY[0x23B8030C8](v4);
}

uint64_t __49__ASDTIOA2Device_updateClientOutputPositionBlock__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = **(_QWORD **)(result + 32);
  if (v2)
    *(_QWORD *)(v2 + 32) = a2;
  return result;
}

- (id)updateClientInputPositionBlock
{
  IOAudio2EngineStatus **v2;
  _QWORD v4[5];

  v2 = -[ASDTIOA2Device engineStatusIndirection](self, "engineStatusIndirection");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__ASDTIOA2Device_updateClientInputPositionBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0Q8l;
  v4[4] = v2;
  return (id)MEMORY[0x23B8030C8](v4);
}

uint64_t __48__ASDTIOA2Device_updateClientInputPositionBlock__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = **(_QWORD **)(result + 32);
  if (v2)
    *(_QWORD *)(v2 + 24) = a2;
  return result;
}

- (BOOL)_setStreamActive:(BOOL)a3 streamUCID:(unsigned int)a4
{
  return ASDT::IOA2UserClient::SetStreamActive(*((ASDT::IOA2UserClient **)self + 66), a4, a3);
}

- (BOOL)_setupForIsolatedIO:(unsigned int)a3 forUseCase:(unint64_t)a4 withIOFrameBufferSize:(unsigned int)a5
{
  return ASDT::IOA2UserClient::SetupForIsolatedIO(*((ASDT::IOA2UserClient **)self + 66), a3, a4, a5);
}

- (int)setupIsolatedIOForStream:(id)a3 frameSize:(unsigned int)a4 useCase:(unint64_t)a5
{
  id v8;
  int v9;
  id v10;

  v8 = a3;
  objc_opt_class();
  v9 = 561214578;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    if ((objc_msgSend(v10, "usesIsolatedIO") & 1) != 0)
    {
      if (ASDT::IOA2UserClient::SetupForIsolatedIO(*((ASDT::IOA2UserClient **)self + 66), objc_msgSend(v10, "userClientID"), a5, a4))
      {
        v9 = 0;
      }
      else
      {
        v9 = 2003329396;
      }
    }

  }
  return v9;
}

- (BOOL)_teardownForIsolatedIO:(unsigned int)a3 forUseCase:(unint64_t)a4
{
  return ASDT::IOA2UserClient::TeardownForIsolatedIO(*((ASDT::IOA2UserClient **)self + 66), a3, a4);
}

- (int)teardownIsolatedIOForStream:(id)a3 useCase:(unint64_t)a4
{
  id v6;
  int v7;
  id v8;

  v6 = a3;
  objc_opt_class();
  v7 = 561214578;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    if ((objc_msgSend(v8, "usesIsolatedIO") & 1) != 0)
    {
      if (ASDT::IOA2UserClient::TeardownForIsolatedIO(*((ASDT::IOA2UserClient **)self + 66), objc_msgSend(v8, "userClientID"), a4))
      {
        v7 = 0;
      }
      else
      {
        v7 = 2003329396;
      }
    }

  }
  return v7;
}

- (IOAudio2EngineStatus)_getIOA2EngineStatus
{
  return (IOAudio2EngineStatus *)*((_QWORD *)self + 67);
}

- (IOAudio2EngineStatus)engineStatusIndirection
{
  return (IOAudio2EngineStatus **)((char *)self + 536);
}

- (unsigned)_getIOBufferFrameSize
{
  return ASDT::IOA2UserClient::GetRingBufferSize(*((ASDT::IOA2UserClient **)self + 66));
}

- (BOOL)_mapIOBuffer:(char *)a3 ofSize:(unsigned int *)a4 forStream:(unsigned int)a5
{
  return ASDT::IOA2UserClient::MapIOBufferForStream(*((ASDT::IOA2UserClient **)self + 66), a5, a4, (unsigned __int8 **)a3);
}

- (void)_releaseIOBuffer:(char *)a3
{
  ASDT::IOUserClient::ReleaseMemory(*((ASDT::IOUserClient **)self + 66), a3);
}

- (id)_streamInfoForStream:(unsigned int)a3
{
  id v3;
  void *v4;
  id v6;

  ASDT::IOA2UserClient::CopyStreamDictionaryByID(*((ASDT::IOA2UserClient **)self + 66), a3, (applesauce::CF::DictionaryRef *)&v6);
  v3 = v6;
  v4 = v3;
  if (v3)
    CFRelease(v3);
  return v4;
}

- (id)_controlDictionaryForControl:(unsigned int)a3
{
  id v3;
  void *v4;
  id v6;

  ASDT::IOA2UserClient::CopyControlDictionaryByID(*((ASDT::IOA2UserClient **)self + 66), *(const applesauce::CF::ArrayRef **)&a3, (applesauce::CF::DictionaryRef *)&v6);
  v3 = v6;
  v4 = v3;
  if (v3)
    CFRelease(v3);
  return v4;
}

- (BOOL)_setControlValue:(unsigned int *)a3 forControl:(unsigned int)a4
{
  return ASDT::IOA2UserClient::SetControlValue(*((ASDT::IOA2UserClient **)self + 66), a4, a3);
}

- (BOOL)_setControlValues:(const unsigned int *)a3 withCount:(unint64_t)a4 resultValues:(unsigned int *)a5 count:(unint64_t *)a6 forControl:(unsigned int)a7
{
  unsigned int v8;
  _BOOL4 v9;
  unsigned int v11;

  if (a6)
    v8 = *(_DWORD *)a6;
  else
    v8 = 0;
  v11 = v8;
  v9 = ASDT::IOA2UserClient::SetMultiControlValue(*((ASDT::IOA2UserClient **)self + 66), a7, a3, a4, a5, &v11);
  if (a6 && v9)
    *a6 = v11;
  return v9;
}

- (id)_channelLayoutForDirection:(unsigned int)a3
{
  id v3;
  void *v4;
  id v6;

  ASDT::IOA2UserClient::CopyDefaultChannelLayoutData(*((ASDT::IOA2UserClient **)self + 66), a3 == 1768845428, (applesauce::CF::DataRef *)&v6);
  v3 = v6;
  v4 = v3;
  if (v3)
    CFRelease(v3);
  return v4;
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
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[16];
  _BYTE v16[128];
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[ASDTIOA2Device lockConfigShared](self, "lockConfigShared");
  v5 = *((_QWORD *)self + 67);
  if (v5)
  {
    v6 = *(_QWORD *)(v5 + 32);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[ASDAudioDevice outputStreams](self, "outputStreams", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "writeZerosToMixMilliseconds:atSampleTime:", v3, v6);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)v15);
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
  return *((_BYTE *)self + 956);
}

- (void)setDelayedStopIO:(BOOL)a3
{
  *((_BYTE *)self + 956) = a3;
}

- (NSMapTable)customPropertySelectorMap
{
  return (NSMapTable *)*((_QWORD *)self + 120);
}

- (void)setCustomPropertySelectorMap:(id)a3
{
  objc_storeStrong((id *)self + 120, a3);
}

- (OS_dispatch_queue)stopIOQueue
{
  return (OS_dispatch_queue *)*((_QWORD *)self + 121);
}

- (void)setStopIOQueue:(id)a3
{
  objc_storeStrong((id *)self + 121, a3);
}

- (unint64_t)currentSeed
{
  return *((_QWORD *)self + 122);
}

- (void)setCurrentSeed:(unint64_t)a3
{
  *((_QWORD *)self + 122) = a3;
}

- (BOOL)shouldStopIO
{
  return *((_BYTE *)self + 957);
}

- (void)setShouldStopIO:(BOOL)a3
{
  *((_BYTE *)self + 957) = a3;
}

- (BOOL)ucDeviceStarted
{
  return *((_BYTE *)self + 958);
}

- (void)setUcDeviceStarted:(BOOL)a3
{
  *((_BYTE *)self + 958) = a3;
}

- (OS_dispatch_queue)ucDeviceNotificationQueue
{
  return (OS_dispatch_queue *)*((_QWORD *)self + 123);
}

- (void)setUcDeviceNotificationQueue:(id)a3
{
  objc_storeStrong((id *)self + 123, a3);
}

- (BOOL)notifiedIORunning
{
  return *((_BYTE *)self + 959);
}

- (void)setNotifiedIORunning:(BOOL)a3
{
  *((_BYTE *)self + 959) = a3;
}

- (unint64_t)exclavesInputBufferID
{
  return *((_QWORD *)self + 124);
}

- (void)setExclavesInputBufferID:(unint64_t)a3
{
  *((_QWORD *)self + 124) = a3;
}

- (NSString)exclavesInputBufferName
{
  return (NSString *)*((_QWORD *)self + 125);
}

- (void)setExclavesInputBufferName:(id)a3
{
  objc_storeStrong((id *)self + 125, a3);
}

- (unint64_t)isolatedInputUseCaseID
{
  return *((_QWORD *)self + 126);
}

- (void)setIsolatedInputUseCaseID:(unint64_t)a3
{
  *((_QWORD *)self + 126) = a3;
}

- (OS_dispatch_queue)concurrentQueue
{
  return (OS_dispatch_queue *)*((_QWORD *)self + 127);
}

- (void)setConcurrentQueue:(id)a3
{
  objc_storeStrong((id *)self + 127, a3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)self + 127, 0);
  objc_storeStrong((id *)self + 125, 0);
  objc_storeStrong((id *)self + 123, 0);
  objc_storeStrong((id *)self + 121, 0);
  objc_storeStrong((id *)self + 120, 0);
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 904));
  std::mutex::~mutex((std::mutex *)((char *)self + 840));
  std::shared_ptr<std::mutex>::~shared_ptr[abi:ne180100]((uint64_t)self + 824);
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 776));
  std::condition_variable::~condition_variable((std::condition_variable *)self + 15);
  std::condition_variable::~condition_variable((std::condition_variable *)self + 14);
  std::mutex::~mutex((std::mutex *)((char *)self + 608));
  std::mutex::~mutex((std::mutex *)((char *)self + 544));
  v3 = *((_QWORD *)self + 66);
  *((_QWORD *)self + 66) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
}

- (id).cxx_construct
{
  _QWORD *v3;

  *((_QWORD *)self + 66) = 0;
  *((_QWORD *)self + 68) = 850045863;
  *((_QWORD *)self + 75) = 0;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 552) = 0u;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)((char *)self + 608));
  *((_QWORD *)self + 97) = 1018212795;
  *((_OWORD *)self + 49) = 0u;
  *((_OWORD *)self + 50) = 0u;
  *((_QWORD *)self + 102) = 0;
  v3 = operator new(0x58uLL);
  v3[2] = 0;
  *v3 = &unk_25084B578;
  v3[1] = 0;
  v3[3] = 850045863;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  v3[10] = 0;
  *((_QWORD *)self + 103) = v3 + 3;
  *((_QWORD *)self + 104) = v3;
  *((_QWORD *)self + 105) = 850045863;
  *((_OWORD *)self + 53) = 0u;
  *((_OWORD *)self + 54) = 0u;
  *((_OWORD *)self + 55) = 0u;
  *((_QWORD *)self + 112) = 0;
  *((_QWORD *)self + 113) = 1018212795;
  *((_OWORD *)self + 58) = 0u;
  *((_QWORD *)self + 118) = 0;
  *((_OWORD *)self + 57) = 0u;
  return self;
}

- (void)initWithIOA2Device:config:deviceManager:plugin:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@: Failed to allocate dispatch queue.", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithIOA2Device:config:deviceManager:plugin:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@: Error creating streams", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithIOA2Device:config:deviceManager:plugin:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@: Failed to open connection.", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithIOA2Device:(uint8_t *)buf config:deviceManager:plugin:.cold.5(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ASDTIOA2Device: Configuration device UID does not match: %@ vs. %@", buf, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

- (void)ioRequestBegin
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

- (void)doConfigChange:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@: Engine status is not released!", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)doConfigChange:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@: Error performing config change.", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)_markOrCreateStreamsWithIDs:direction:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  *v1 = 138412290;
  *v3 = v2;
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], (uint64_t)v3, "%@: Failed to create stream.", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)_setSamplingRate:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_2_1();
  *(_DWORD *)v1 = 138412802;
  *(_QWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2048;
  *(_QWORD *)(v1 + 14) = v3;
  *(_WORD *)(v1 + 22) = 2048;
  *(_QWORD *)(v1 + 24) = v4;
  OUTLINED_FUNCTION_8_0(&dword_236D43000, MEMORY[0x24BDACB70], v5, "%@: setSamplingRate failed. Desired: %lf, Existing: %lf", v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)_setSamplingRate:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@: Failed to set nominal sampling rate.", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)_getCurrentFormatForStream:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.778e-34);
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = v4;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed to retrieve format for stream %u", v5, 0x12u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_setCurrentFormat:(uint64_t)a3 forStream:(uint64_t)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)a4 = 138412802;
  *(_QWORD *)(a4 + 4) = a1;
  *(_WORD *)(a4 + 12) = 2112;
  *(_QWORD *)(a4 + 14) = a2;
  *(_WORD *)(a4 + 22) = 2112;
  *(_QWORD *)(a4 + 24) = a3;
  OUTLINED_FUNCTION_8_0(&dword_236D43000, MEMORY[0x24BDACB70], a3, "%@: _setCurrentFormat failed.\nDesired: %@\nCurrent: %@", (uint8_t *)a4);

  OUTLINED_FUNCTION_1_1();
}

- (void)_setCurrentFormat:(uint8_t *)buf forStream:(int)a4 .cold.2(void *a1, uint64_t a2, uint8_t *buf, int a4)
{
  *(_DWORD *)buf = 138412802;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a4;
  *((_WORD *)buf + 9) = 2112;
  *(_QWORD *)(buf + 20) = a2;
  _os_log_error_impl(&dword_236D43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed to set stream %u current format to: %@", buf, 0x1Cu);

  OUTLINED_FUNCTION_1_1();
}

- (void)_openConnection
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@: Failed to set notification handler.", v4);

  OUTLINED_FUNCTION_1_1();
}

- (void)_performUnderlyingStopIO:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_236D43000, MEMORY[0x24BDACB70], v3, "%@ PerformUnderlyingStopIO ucDevice not started.", v4);

  OUTLINED_FUNCTION_1_1();
}

@end
