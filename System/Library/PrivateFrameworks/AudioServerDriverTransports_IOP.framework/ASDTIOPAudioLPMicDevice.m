@implementation ASDTIOPAudioLPMicDevice

+ (id)enableListeningPropertyForService:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BE0A5A8];
  v10[0] = *MEMORY[0x24BE0A5D8];
  v10[1] = v4;
  v11[0] = CFSTR("ASDTIOPAudioCMEnableProperty");
  v11[1] = &unk_250852F28;
  v5 = *MEMORY[0x24BE0A5B8];
  v11[2] = v3;
  v6 = *MEMORY[0x24BE0A5B0];
  v10[2] = v5;
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ioServiceDependenciesForConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "asdtServiceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDTIOServiceManager dependencyForID:andConfiguration:](ASDTIOPAudioLPMicServiceManager, "dependencyForID:andConfiguration:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (double)defaultSamplingRate
{
  return 16000.0;
}

- (ASDTIOPAudioLPMicDevice)initWithConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  ASDT::IOUserClient *v13;
  UserClient *value;
  id v15;
  ASDT::IOPAudio::LPMic::EngineStatus **v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  ASDTIOPAudioLPMicDevice *v24;
  objc_super v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "asdtServiceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDTIOServiceManager matchedIOServiceForID:](ASDTIOPAudioLPMicServiceManager, "matchedIOServiceForID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "ioObject");
  v13 = (ASDT::IOUserClient *)operator new();
  ASDT::IOUserClient::IOUserClient(v13);
  *(_QWORD *)v13 = &unk_250850B40;
  value = self->_lpMicUserClient.__ptr_.__value_;
  self->_lpMicUserClient.__ptr_.__value_ = (UserClient *)v13;
  if (value
    && ((*(void (**)(UserClient *))(*(_QWORD *)value + 8))(value),
        (v13 = (ASDT::IOUserClient *)self->_lpMicUserClient.__ptr_.__value_) == 0)
    || (ASDT::IOUserClient::IsValid(v13) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "asdtDeviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioLPMicDevice initWithConfig:withDeviceManager:andPlugin:].cold.5();
    }
    goto LABEL_19;
  }
  v26.receiver = self;
  v26.super_class = (Class)ASDTIOPAudioLPMicDevice;
  v15 = -[ASDTAudioDevice initWithConfig:withDeviceManager:andPlugin:](&v26, sel_initWithConfig_withDeviceManager_andPlugin_, v8, v9, v10);
  v16 = (ASDT::IOPAudio::LPMic::EngineStatus **)v15;
  self = (ASDTIOPAudioLPMicDevice *)v15;
  if (v15)
  {
    ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(*((ASDT::IOUserClient **)v15 + 66));
    if ((ASDT::IOUserClient::OpenConnection((ASDT::IOUserClient *)self->_lpMicUserClient.__ptr_.__value_) & 1) != 0)
    {
      -[ASDAudioDevice modelName](self, "modelName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("AOP Audio-1"));

      if (v18)
        -[ASDAudioDevice setModelName:](self, "setModelName:", CFSTR("ASDTIOPAudioLPMicDevice"));
      -[ASDAudioDevice deviceName](self, "deviceName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("AOP Audio-1"));

      if (v20)
        -[ASDAudioDevice setDeviceName:](self, "setDeviceName:", CFSTR("AOP Audio"));
      if (!-[ASDAudioDevice transportType](self, "transportType"))
        -[ASDAudioDevice setTransportType:](self, "setTransportType:", 1651274862);
      -[ASDAudioDevice setClockDomain:](self, "setClockDomain:", ASDT::IOPAudio::LPMic::UserClient::GetClockDomain((ASDT::IOPAudio::LPMic::UserClient *)self->_lpMicUserClient.__ptr_.__value_));
      -[ASDAudioDevice inputStreams](self, "inputStreams");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioLPMicDevice setInputStream:](self, "setInputStream:", v22);

      -[ASDTIOPAudioLPMicDevice inputStream](self, "inputStream");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      LOBYTE(v22) = objc_opt_isKindOfClass();

      if ((v22 & 1) != 0)
      {
        if (-[ASDTIOPAudioLPMicDevice setupCustomProperties](self, "setupCustomProperties"))
        {
          if (-[ASDTIOPAudioLPMicDevice updateFromStreamDescription](self, "updateFromStreamDescription"))
          {
            if (ASDT::IOPAudio::LPMic::UserClient::MapEngineStatus((ASDT::IOPAudio::LPMic::UserClient *)self->_lpMicUserClient.__ptr_.__value_, v16 + 67))
            {
              goto LABEL_16;
            }
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              -[ASDAudioDevice deviceUID](self, "deviceUID");
              objc_claimAutoreleasedReturnValue();
              -[ASDTIOPAudioLPMicDevice initWithConfig:withDeviceManager:andPlugin:].cold.1();
            }
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          -[ASDAudioDevice deviceUID](self, "deviceUID");
          objc_claimAutoreleasedReturnValue();
          -[ASDTIOPAudioLPMicDevice initWithConfig:withDeviceManager:andPlugin:].cold.2();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDAudioDevice deviceUID](self, "deviceUID");
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOPAudioLPMicDevice initWithConfig:withDeviceManager:andPlugin:].cold.3();
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioLPMicDevice initWithConfig:withDeviceManager:andPlugin:].cold.4();
    }
LABEL_19:
    v24 = 0;
    goto LABEL_20;
  }
LABEL_16:
  self = self;
  v24 = self;
LABEL_20:

  return v24;
}

- (BOOL)setupCustomProperties
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v16;
  _BOOL4 HistoricDataSupported;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[7];

  v28[5] = *MEMORY[0x24BDAC8D0];
  HistoricDataSupported = ASDT::IOPAudio::LPMic::UserClient::GetHistoricDataSupported((ASDT::IOPAudio::LPMic::UserClient *)self->_lpMicUserClient.__ptr_.__value_);
  v3 = *MEMORY[0x24BE0A5A8];
  v26[0] = *MEMORY[0x24BE0A5D8];
  v2 = v26[0];
  v26[1] = v3;
  v4 = *MEMORY[0x24BE0A580];
  v5 = MEMORY[0x24BDBD1C0];
  v27[1] = &unk_250852F40;
  v27[2] = MEMORY[0x24BDBD1C0];
  v6 = *MEMORY[0x24BE0A598];
  v26[4] = *MEMORY[0x24BE0A590];
  v27[0] = CFSTR("ASDTPListProperty");
  v26[2] = v4;
  v26[3] = v6;
  v7 = *MEMORY[0x24BE0A5E0];
  v27[3] = CFSTR("com.apple.private.audio.hal.aop-audio.user-access");
  v27[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v16;
  v24[0] = v2;
  v24[1] = v3;
  v25[0] = CFSTR("ASDTRawProperty");
  v25[1] = &unk_250852F58;
  v25[2] = v5;
  v24[2] = v4;
  v24[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &HistoricDataSupported, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  v22[0] = v2;
  v22[1] = v3;
  v23[0] = CFSTR("ASDTIOPAudioLPMicUInt32Property");
  v23[1] = &unk_250852F70;
  v22[2] = v4;
  v23[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v10;
  v20[0] = v2;
  v20[1] = v3;
  v21[0] = CFSTR("ASDTIOPAudioLPMicUInt32Property");
  v21[1] = &unk_250852F88;
  v20[2] = v4;
  v21[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v11;
  v18[0] = v2;
  v18[1] = v3;
  v19[0] = CFSTR("ASDTIOPAudioLPMicUInt32Property");
  v19[1] = &unk_250852FA0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = -[ASDTAudioDevice addCustomProperties:](self, "addCustomProperties:", v13);
  return v5;
}

- (BOOL)updateFromStreamDescription
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  StreamDescription v14;
  uint8_t buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[ASDAudioDevice isRunning](self, "isRunning"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioLPMicDevice updateFromStreamDescription].cold.1(self);
    return 0;
  }
  memset(&v14, 0, sizeof(v14));
  if ((ASDT::IOPAudio::LPMic::UserClient::GetStreamDescription((ASDT::IOPAudio::LPMic::UserClient *)self->_lpMicUserClient.__ptr_.__value_, &v14) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOPAudioLPMicDevice updateFromStreamDescription].cold.3(self);
    return 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14.var0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDAudioDevice samplingRates](self, "samplingRates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDAudioDevice deviceUID](self, "deviceUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioLPMicDevice updateFromStreamDescription].cold.2(v6, (uint64_t *)&v14, buf);
    }
    v7 = (void *)MEMORY[0x24BDBCEF0];
    -[ASDAudioDevice samplingRates](self, "samplingRates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v3);
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDAudioDevice setSamplingRates:](self, "setSamplingRates:", v10);

  }
  -[ASDTIOPAudioLPMicDevice inputStream](self, "inputStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "updateFromStreamDescription:", &v14);

  if ((v12 & 1) != 0)
    -[ASDTAudioDevice setSamplingRate:](self, "setSamplingRate:", v14.var0);

  return v12;
}

- (unsigned)timestampPeriod
{
  UserClient *value;

  value = self->_lpMicUserClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioLPMicDevice timestampPeriod].cold.1();
  return ASDT::IOPAudio::LPMic::UserClient::GetZeroTimeStampInterval((ASDT::IOPAudio::LPMic::UserClient *)value);
}

- (unsigned)ioBufferSizeFrames
{
  UserClient *value;

  value = self->_lpMicUserClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioLPMicDevice ioBufferSizeFrames].cold.1();
  return ASDT::IOPAudio::LPMic::UserClient::GetRingBufferSize((ASDT::IOPAudio::LPMic::UserClient *)value);
}

- (unsigned)availablePastDataFrames
{
  unsigned int result;
  _OWORD v4[2];

  if (!self->_lpMicEngineStatus)
    return 0;
  result = -[ASDAudioDevice isRunning](self, "isRunning");
  if (result)
  {
    memset(v4, 0, sizeof(v4));
    ASDT::IOPAudio::LPMic::EngineStatus::Snapshot((uint64_t)self->_lpMicEngineStatus, (uint64_t)v4);
    result = -[ASDTIOPAudioLPMicDevice maximumPastDataFrames](self, "maximumPastDataFrames");
    if (DWORD2(v4[0]) - LODWORD(v4[0]) + 1 < result)
      return DWORD2(v4[0]) - LODWORD(v4[0]) + 1;
  }
  return result;
}

- (unsigned)maximumPastDataFrames
{
  unsigned int v3;

  v3 = -[ASDTIOPAudioLPMicDevice ioBufferSizeFrames](self, "ioBufferSizeFrames");
  return v3 - -[ASDAudioDevice inputSafetyOffset](self, "inputSafetyOffset");
}

- (BOOL)getEnabledChannelMask:(unsigned int *)a3
{
  UserClient *value;

  value = self->_lpMicUserClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioLPMicDevice getEnabledChannelMask:].cold.1();
  if (!a3)
    -[ASDTIOPAudioLPMicDevice getEnabledChannelMask:].cold.2();
  return ASDT::IOPAudio::LPMic::UserClient::GetEnabledChannelMask((ASDT::IOPAudio::LPMic::UserClient *)value, a3);
}

- (BOOL)setEnabledChannelMask:(unsigned int)a3
{
  UserClient *value;
  _BOOL4 SupportedChannelMask;
  _BOOL4 v7;
  unsigned int v9;

  value = self->_lpMicUserClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioLPMicDevice setEnabledChannelMask:].cold.1();
  v9 = 0;
  SupportedChannelMask = ASDT::IOPAudio::LPMic::UserClient::GetSupportedChannelMask((ASDT::IOPAudio::LPMic::UserClient *)value, &v9);
  LOBYTE(v7) = 0;
  if (SupportedChannelMask)
  {
    if ((v9 | a3) == v9)
    {
      LOBYTE(v7) = ASDT::IOPAudio::LPMic::UserClient::SetEnabledChannelMask((ASDT::IOPAudio::LPMic::UserClient *)self->_lpMicUserClient.__ptr_.__value_, a3);
    }
    else
    {
      v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v7)
      {
        -[ASDTIOPAudioLPMicDevice setEnabledChannelMask:].cold.2(self, (uint64_t)&v9, a3);
        LOBYTE(v7) = 0;
      }
    }
  }
  return v7;
}

- (EngineStatus)lpMicEngineStatus
{
  return self->_lpMicEngineStatus;
}

- (int)performPowerStatePrepare:(int)a3
{
  UserClient *value;
  uint64_t v5;
  objc_super v7;

  value = self->_lpMicUserClient.__ptr_.__value_;
  if (!value)
    -[ASDTIOPAudioLPMicDevice performPowerStatePrepare:].cold.1();
  v5 = *(_QWORD *)&a3;
  if (a3 == 1685090418)
    ASDT::IOPAudio::LPMic::UserClient::StopIO((ASDT::IOPAudio::LPMic::UserClient *)value);
  v7.receiver = self;
  v7.super_class = (Class)ASDTIOPAudioLPMicDevice;
  return -[ASDTAudioDevice performPowerStatePrepare:](&v7, sel_performPowerStatePrepare_, v5);
}

- (int)performPowerStatePrewarm:(int)a3
{
  int v5;
  UserClient *value;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASDTIOPAudioLPMicDevice;
  v5 = -[ASDTAudioDevice performPowerStatePrewarm:](&v8, sel_performPowerStatePrewarm_);
  if (!v5)
  {
    if (a3 != 1970304877)
      return 0;
    value = self->_lpMicUserClient.__ptr_.__value_;
    if (!value)
      -[ASDTIOPAudioLPMicDevice performPowerStatePrewarm:].cold.1();
    if (!ASDT::IOPAudio::LPMic::UserClient::StartIO((ASDT::IOPAudio::LPMic::UserClient *)value))
    {
      v5 = 1852990585;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ASDTIOPAudioLPMicDevice performPowerStatePrewarm:].cold.2(self);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)getZeroTimestampBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__ASDTIOPAudioLPMicDevice_getZeroTimestampBlock__block_invoke;
  aBlock[3] = &__block_descriptor_40_e20_i36__0_d8_Q16_Q24I32l;
  aBlock[4] = &self->_lpMicEngineStatus;
  return _Block_copy(aBlock);
}

uint64_t __48__ASDTIOPAudioLPMicDevice_getZeroTimestampBlock__block_invoke(uint64_t a1, double *a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v4;
  double v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;

  v4 = **(_QWORD **)(a1 + 32);
  if (!v4)
    return 1937010544;
  v10 = 0u;
  v11 = 0u;
  ASDT::IOPAudio::LPMic::EngineStatus::Snapshot(v4, (uint64_t)&v10);
  if ((_QWORD)v11)
    v8 = (double)(unint64_t)(*((_QWORD *)&v10 + 1) - v10 + 1);
  else
    v8 = 0.0;
  result = 0;
  *a2 = v8;
  *a3 = v11;
  *a4 = *((_QWORD *)&v11 + 1);
  return result;
}

- (int)setupIsolatedIOForStream:(id)a3 frameSize:(unsigned int)a4 useCase:(unint64_t)a5
{
  uint64_t v6;
  id v7;
  int v8;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = objc_msgSend(v7, "setupIsolatedIOForUseCase:withFrameSize:", a5, v6);
  else
    v8 = 561214578;

  return v8;
}

- (int)teardownIsolatedIOForStream:(id)a3 useCase:(unint64_t)a4
{
  id v5;
  int v6;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "teardownIsolatedIOForUseCase:", a4);
  else
    v6 = 561214578;

  return v6;
}

- (ASDTIOPAudioLPMicStream)inputStream
{
  return (ASDTIOPAudioLPMicStream *)objc_loadWeakRetained((id *)&self->_inputStream);
}

- (void)setInputStream:(id)a3
{
  objc_storeWeak((id *)&self->_inputStream, a3);
}

- (void).cxx_destruct
{
  UserClient *value;

  objc_destroyWeak((id *)&self->_inputStream);
  value = self->_lpMicUserClient.__ptr_.__value_;
  self->_lpMicUserClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(UserClient *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 66) = 0;
  return self;
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_236D88000, MEMORY[0x24BDACB70], v3, "%@: Failed to map the engine status.", v4);

  OUTLINED_FUNCTION_1();
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_236D88000, MEMORY[0x24BDACB70], v3, "%@: Failed to allocate custom properties.", v4);

  OUTLINED_FUNCTION_1();
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_236D88000, MEMORY[0x24BDACB70], v3, "%@: Bad input stream.", v4);

  OUTLINED_FUNCTION_1();
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_236D88000, MEMORY[0x24BDACB70], v3, "%@: Failed to open connection to LPMicDevice user client", v4);

  OUTLINED_FUNCTION_1();
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_236D88000, MEMORY[0x24BDACB70], v3, "%@: Failed to create LPMicDevice user client", v4);

  OUTLINED_FUNCTION_1();
}

- (void)updateFromStreamDescription
{
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "deviceUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Invalid stream description.", v3);

  OUTLINED_FUNCTION_2_0();
}

- (void)timestampPeriod
{
  __assert_rtn("-[ASDTIOPAudioLPMicDevice timestampPeriod]", "ASDTIOPAudioLPMicDevice.mm", 214, "_lpMicUserClient");
}

- (void)ioBufferSizeFrames
{
  __assert_rtn("-[ASDTIOPAudioLPMicDevice ioBufferSizeFrames]", "ASDTIOPAudioLPMicDevice.mm", 220, "_lpMicUserClient");
}

- (void)getEnabledChannelMask:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioLPMicDevice getEnabledChannelMask:]", "ASDTIOPAudioLPMicDevice.mm", 243, "_lpMicUserClient");
}

- (void)getEnabledChannelMask:.cold.2()
{
  __assert_rtn("-[ASDTIOPAudioLPMicDevice getEnabledChannelMask:]", "ASDTIOPAudioLPMicDevice.mm", 244, "outEnabledChannelMask");
}

- (void)setEnabledChannelMask:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioLPMicDevice setEnabledChannelMask:]", "ASDTIOPAudioLPMicDevice.mm", 251, "_lpMicUserClient");
}

- (void)setEnabledChannelMask:(int)a3 .cold.2(void *a1, uint64_t a2, int a3)
{
  void *v4;
  int v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "deviceUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  v7 = 1024;
  v8 = a3;
  v9 = 1024;
  v10 = v5;
  _os_log_error_impl(&dword_236D88000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Bad enabled channel mask value: %x; supported %x",
    v6,
    0x18u);

}

- (void)performPowerStatePrepare:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioLPMicDevice performPowerStatePrepare:]", "ASDTIOPAudioLPMicDevice.mm", 273, "_lpMicUserClient");
}

- (void)performPowerStatePrewarm:.cold.1()
{
  __assert_rtn("-[ASDTIOPAudioLPMicDevice performPowerStatePrewarm:]", "ASDTIOPAudioLPMicDevice.mm", 290, "_lpMicUserClient");
}

- (void)performPowerStatePrewarm:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "deviceUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236D88000, MEMORY[0x24BDACB70], v2, "%@: Failed to StartIO.", v3);

  OUTLINED_FUNCTION_2_0();
}

@end
