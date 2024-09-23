@implementation HalogenMeasurement

- (HalogenMeasurement)initWithSize:(int)a3 onPort:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  HalogenMeasurement *v7;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  objc_super v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)HalogenMeasurement;
  v6 = -[HalogenMeasurement init](&v12, sel_init);
  v7 = (HalogenMeasurement *)v6;
  if (!v6)
    return v7;
  *(_OWORD *)(v6 + 36) = xmmword_1D13E8550;
  *(_OWORD *)(v6 + 52) = xmmword_1D13E8560;
  *((_DWORD *)v6 + 17) = v5;
  *((_QWORD *)v6 + 9) = 0x780000012C0;
  *((_DWORD *)v6 + 20) = 2 * v5 + 10816;
  *((_DWORD *)v6 + 21) = 4096;
  *(_QWORD *)(v6 + 20) = 0x12C000000EC0;
  *((_QWORD *)v6 + 54) = objc_alloc_init(MEMORY[0x1E0CB3530]);
  v7->_audioTimeoutInSec = 1;
  v7->_signalFreq = 110.0;
  v7->_initalPhaseInDegrees = 0;
  v7->_halogenLdcmCalc = -[HalogenLdcmCalc initWithSize:]([HalogenLdcmCalc alloc], "initWithSize:", v5);
  if (!-[HalogenMeasurement _allocBuffers](v7, "_allocBuffers"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = MEMORY[0x1E0C81028];
      v10 = "HalogenMeasurement:_allocBuffers() failed";
      v11 = 2;
LABEL_15:
      _os_log_impl(&dword_1D13BF000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  -[HalogenMeasurement _generateSineWave](v7, "_generateSineWave");
  if (!-[HalogenMeasurement _connectToAccessoryManager:](v7, "_connectToAccessoryManager:", v4))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v4;
      v9 = MEMORY[0x1E0C81028];
      v10 = "HalogenMeasurement:_connectToAccessoryManager() failed for port %d";
LABEL_14:
      v11 = 8;
      goto LABEL_15;
    }
LABEL_16:

    return 0;
  }
  if (!-[HalogenMeasurement _createSleepWakeNotifier](v7, "_createSleepWakeNotifier"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v4;
      v9 = MEMORY[0x1E0C81028];
      v10 = "HalogenMeasurement:_createSleepWakeNotifier() failed for port %d";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  -[HalogenMeasurement _initArbiter](v7, "_initArbiter");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:HalogenMeasurement Started!", buf, 2u);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[HalogenMeasurement _destroySleepWakeNotifier](self, "_destroySleepWakeNotifier");
  -[HalogenMeasurement _disconnectFromAccessoryManager](self, "_disconnectFromAccessoryManager");
  -[HalogenMeasurement _deinitArbiter](self, "_deinitArbiter");
  -[HalogenMeasurement _freeBuffers](self, "_freeBuffers");

  v3.receiver = self;
  v3.super_class = (Class)HalogenMeasurement;
  -[HalogenMeasurement dealloc](&v3, sel_dealloc);
}

- (BOOL)_connectToAccessoryManager:(int)a3
{
  unsigned int ServiceWithPrimaryPort;
  kern_return_t v6;
  BOOL result;
  _BOOL4 v8;
  NSObject *v9;
  const char *v10;
  kern_return_t v11;
  _BOOL4 v12;
  int v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  self->_service = ServiceWithPrimaryPort;
  if (ServiceWithPrimaryPort)
  {
    v6 = IOServiceOpen(ServiceWithPrimaryPort, *MEMORY[0x1E0C83DA0], 0, &self->_connect);
    if (!v6)
      return 1;
    v11 = v6;
    v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v12)
    {
      v13 = 67109120;
      v14 = v11;
      v9 = MEMORY[0x1E0C81028];
      v10 = "HalogenMeasurement:Failed to open IOAccessoryManager manager (ret = 0x%x)";
      goto LABEL_9;
    }
  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v8)
    {
      v13 = 67109120;
      v14 = a3;
      v9 = MEMORY[0x1E0C81028];
      v10 = "HalogenMeasurement:Could not find IOAccessoryManager service for port=%d";
LABEL_9:
      _os_log_impl(&dword_1D13BF000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 8u);
      return 0;
    }
  }
  return result;
}

- (void)_disconnectFromAccessoryManager
{
  io_connect_t connect;
  io_object_t service;

  connect = self->_connect;
  if (connect)
  {
    IOServiceClose(connect);
    self->_connect = 0;
  }
  service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_service = 0;
  }
}

- (BOOL)_initArbiter
{
  const __CFAllocator *v3;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  _BOOL4 v7;
  BaseResourceArbiterClient *v8;
  BaseResourceArbiterClient *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  self->_arbiterLocked = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(self->_service, CFSTR("SupportsEisAfe"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v5 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(self->_service, CFSTR("RequiresEisAfeArbiter"), v3, 0);
  v6 = v5;
  self->_arbitrationRequired = 1;
  if (!v5)
  {
    if (!CFProperty)
      goto LABEL_9;
    if (CFBooleanGetValue(CFProperty))
    {
      self->_arbitrationRequired = 0;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:Skipping arbitration.", buf, 2u);
    }
    if (self->_arbitrationRequired)
      goto LABEL_9;
LABEL_10:
    v8 = (BaseResourceArbiterClient *)objc_alloc_init(MEMORY[0x1E0DE0268]);
    goto LABEL_11;
  }
  v7 = CFBooleanGetValue(v5) != 0;
  self->_arbitrationRequired = v7;
  if (!v7)
    goto LABEL_10;
LABEL_9:
  v8 = (BaseResourceArbiterClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0DE0270]), "initWithID:", 0);
LABEL_11:
  v9 = v8;
  self->_arbiterClient = v8;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:failed to allocate halogen ResourceArbiterClient", v11, 2u);
  }
  if (CFProperty)
    CFRelease(CFProperty);
  if (v6)
    CFRelease(v6);
  return v9 != 0;
}

- (void)_deinitArbiter
{
  if (self->_arbiterLocked)
    -[BaseResourceArbiterClient releaseResourceAccess](self->_arbiterClient, "releaseResourceAccess");

}

- (BOOL)_allocBuffers
{
  int v3;
  NSMutableData *v4;
  NSMutableData *v5;
  NSMutableData *v6;
  NSMutableData *v7;
  BOOL result;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;

  v3 = self->_inputFrameSizeInBytes * self->_nTotalSamples;
  *(_QWORD *)&self->_pcmInputDataIndexInBytes = 0;
  self->_pcmInputDataMaxSzInBytes = v3;
  v4 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  self->_pcmInputData = v4;
  if (!v4)
  {
    v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v9)
      return result;
    v19 = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "HalogenMeasurement:Failed to alloc _pcmInputData";
    v12 = (uint8_t *)&v19;
    goto LABEL_15;
  }
  *(_QWORD *)&self->_pcmOutputDataMaxSzInBytes = (self->_outputFrameSizeInBytes * self->_nTotalSamples);
  v5 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  self->_pcmOutputData = v5;
  if (!v5)
  {
    v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v13)
      return result;
    v18 = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "HalogenMeasurement:Failed to alloc _pcmOutputData";
    v12 = (uint8_t *)&v18;
    goto LABEL_15;
  }
  v6 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * self->_nMeasurementSamples);
  self->_currentData = v6;
  if (!v6)
  {
    v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v14)
      return result;
    v17 = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "HalogenMeasurement:Failed to alloc _currentData";
    v12 = (uint8_t *)&v17;
LABEL_15:
    _os_log_impl(&dword_1D13BF000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    return 0;
  }
  v7 = (NSMutableData *)(id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * self->_nMeasurementSamples);
  self->_voltageData = v7;
  if (v7)
    return 1;
  v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v15)
  {
    v16 = 0;
    v10 = MEMORY[0x1E0C81028];
    v11 = "HalogenMeasurement:Failed to alloc _voltageData";
    v12 = (uint8_t *)&v16;
    goto LABEL_15;
  }
  return result;
}

- (void)_freeBuffers
{

}

- (void)_generateSineWave
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[NSMutableData bytes](self->_pcmOutputData, "bytes");
  if (self->_nTotalSamples >= 1)
  {
    v4 = v3;
    v5 = 0;
    v6 = self->_signalFreq * 6.28318531 / (double)self->_sampleRate;
    v7 = ((double)self->_initalPhaseInDegrees / 360.0 + (double)self->_initalPhaseInDegrees / 360.0) * 3.14159265;
    do
    {
      v8 = sin(v7);
      v9 = (double)-[HalogenMeasurement maxOutputAmplitude](self, "maxOutputAmplitude");
      *(_WORD *)(v4 + 2 * v5) = (int)-((double)-[HalogenMeasurement signalOffset](self, "signalOffset") - v8 * v9);
      v7 = v6 + v7;
      ++v5;
    }
    while (v5 < self->_nTotalSamples);
  }
}

- (BOOL)_initAudioPath
{
  unsigned int bitDepth;
  double sampleRate;
  int nOutputChannels;
  int inputFrameSizeInBytes;
  int outputFrameSizeInBytes;
  OpaqueAudioComponent *Next;
  OpaqueAudioComponentInstance **p_audioComponentInst;
  OSStatus v10;
  OpaqueAudioComponentInstance *v11;
  OSStatus v12;
  OSStatus v13;
  OSStatus v14;
  OSStatus v15;
  OSStatus v16;
  OSStatus v17;
  OSStatus v18;
  OSStatus v19;
  BOOL result;
  _BOOL4 v21;
  NSObject *v22;
  const char *v23;
  _BOOL4 v24;
  uint32_t v25;
  OSStatus v26;
  _BOOL4 v27;
  OSStatus v28;
  _BOOL4 v29;
  OSStatus v30;
  _BOOL4 v31;
  OSStatus v32;
  _BOOL4 v33;
  OSStatus v34;
  _BOOL4 v35;
  OSStatus v36;
  _BOOL4 v37;
  OSStatus v38;
  _BOOL4 v39;
  OSStatus v40;
  _BOOL4 v41;
  int v42;
  int inData;
  AudioComponentDescription inDesc;
  _QWORD v45[2];
  int v46;
  int v47;
  int v48;
  int v49;
  uint64_t v50;
  _QWORD v51[2];
  int v52;
  int v53;
  int v54;
  int nInputChannels;
  uint64_t v56;
  void *v57;
  HalogenMeasurement *v58;
  uint8_t buf[4];
  OSStatus v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v57 = (void *)0xAAAAAAAAAAAAAAAALL;
  v58 = (HalogenMeasurement *)0xAAAAAAAAAAAAAAAALL;
  v56 = 0;
  bitDepth = self->_bitDepth;
  sampleRate = (double)self->_sampleRate;
  nOutputChannels = self->_nOutputChannels;
  inputFrameSizeInBytes = self->_inputFrameSizeInBytes;
  outputFrameSizeInBytes = self->_outputFrameSizeInBytes;
  nInputChannels = self->_nInputChannels;
  LODWORD(v56) = bitDepth;
  v49 = nOutputChannels;
  v50 = bitDepth;
  v52 = inputFrameSizeInBytes;
  v53 = 1;
  v54 = inputFrameSizeInBytes;
  *(double *)v51 = sampleRate;
  v51[1] = 0xC6C70636DLL;
  v47 = 1;
  v48 = outputFrameSizeInBytes;
  v46 = outputFrameSizeInBytes;
  *(double *)v45 = sampleRate;
  v45[1] = 0xC6C70636DLL;
  *(_OWORD *)&inDesc.componentType = xmmword_1D13E7E50;
  inDesc.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &inDesc);
  if (!Next)
  {
    v24 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v24)
    {
      *(_WORD *)buf = 0;
      v22 = MEMORY[0x1E0C81028];
      v23 = "HalogenMeasurement:AudioComponentFindNext() failed to find kAudioUnitSubType_LDCMIO";
      v25 = 2;
LABEL_35:
      _os_log_impl(&dword_1D13BF000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      return 0;
    }
    return result;
  }
  p_audioComponentInst = &self->_audioComponentInst;
  v10 = AudioComponentInstanceNew(Next, &self->_audioComponentInst);
  if (v10 || (v11 = *p_audioComponentInst) == 0)
  {
    v21 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v21)
      return result;
    *(_DWORD *)buf = 67109120;
    v60 = v10;
    v22 = MEMORY[0x1E0C81028];
    v23 = "HalogenMeasurement:AudioComponentInstanceNew() failed (status = 0x%x) ";
    goto LABEL_34;
  }
  inData = 1;
  v12 = AudioUnitSetProperty(v11, 0x7D3u, 1u, 1u, &inData, 4u);
  if (v12)
  {
    v26 = v12;
    v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v27)
      return result;
    *(_DWORD *)buf = 67109120;
    v60 = v26;
    v22 = MEMORY[0x1E0C81028];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_EnableIO/1 (status = 0x%x)";
    goto LABEL_34;
  }
  v13 = AudioUnitSetProperty(*p_audioComponentInst, 0x7D3u, 2u, 0, &inData, 4u);
  if (v13)
  {
    v28 = v13;
    v29 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v29)
      return result;
    *(_DWORD *)buf = 67109120;
    v60 = v28;
    v22 = MEMORY[0x1E0C81028];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_EnableIO/0 (status = 0x%x)";
    goto LABEL_34;
  }
  v14 = AudioUnitSetProperty(*p_audioComponentInst, 8u, 1u, 0, v45, 0x28u);
  if (v14)
  {
    v30 = v14;
    v31 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v31)
      return result;
    *(_DWORD *)buf = 67109120;
    v60 = v30;
    v22 = MEMORY[0x1E0C81028];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioUnitProperty_StreamFormat/kAudioUnitScope_Input (status = 0x%x)";
    goto LABEL_34;
  }
  v42 = 0;
  v15 = AudioUnitSetProperty(*p_audioComponentInst, 0x33u, 2u, 1u, &v42, 4u);
  if (v15)
  {
    v32 = v15;
    v33 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v33)
      return result;
    *(_DWORD *)buf = 67109120;
    v60 = v32;
    v22 = MEMORY[0x1E0C81028];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioUnitProperty_ShouldAllocateBuffer (status = 0x%x)";
    goto LABEL_34;
  }
  v16 = AudioUnitSetProperty(*p_audioComponentInst, 8u, 2u, 1u, v51, 0x28u);
  if (v16)
  {
    v34 = v16;
    v35 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v35)
      return result;
    *(_DWORD *)buf = 67109120;
    v60 = v34;
    v22 = MEMORY[0x1E0C81028];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioUnitProperty_StreamFormat/kAudioUnitScope_Output"
          " (status = 0x%x)";
    goto LABEL_34;
  }
  v57 = recordCallback_0;
  v58 = self;
  v17 = AudioUnitSetProperty(self->_audioComponentInst, 0x7D5u, 0, 1u, &v57, 0x10u);
  if (v17)
  {
    v36 = v17;
    v37 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v37)
      return result;
    *(_DWORD *)buf = 67109120;
    v60 = v36;
    v22 = MEMORY[0x1E0C81028];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_SetInputCallback (status = 0x%x)";
    goto LABEL_34;
  }
  v57 = playbackCallback_0;
  v58 = self;
  v18 = AudioUnitSetProperty(self->_audioComponentInst, 0x17u, 0, 0, &v57, 0x10u);
  if (v18)
  {
    v38 = v18;
    v39 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v39)
      return result;
    *(_DWORD *)buf = 67109120;
    v60 = v38;
    v22 = MEMORY[0x1E0C81028];
    v23 = "HalogenMeasurement:AudioUnitSetProperty() failed to set kAudioOutputUnitProperty_SetRenderCallback (status = 0x%x)";
LABEL_34:
    v25 = 8;
    goto LABEL_35;
  }
  v19 = AudioUnitInitialize(*p_audioComponentInst);
  if (!v19)
    return 1;
  v40 = v19;
  v41 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v41)
  {
    *(_DWORD *)buf = 67109120;
    v60 = v40;
    v22 = MEMORY[0x1E0C81028];
    v23 = "HalogenMeasurement:AudioUnitInitialize() failed (status = 0x%x)";
    goto LABEL_34;
  }
  return result;
}

- (void)_deinitAudioPath
{
  OpaqueAudioComponentInstance *audioComponentInst;

  audioComponentInst = self->_audioComponentInst;
  if (audioComponentInst)
  {
    AudioUnitUninitialize(audioComponentInst);
    AudioComponentInstanceDispose(self->_audioComponentInst);
    self->_audioComponentInst = 0;
  }
}

- (BOOL)_createSleepWakeNotifier
{
  BOOL result;
  _BOOL4 v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;

  -[HalogenMeasurement setPowerState:](self, "setPowerState:", 2);
  -[HalogenMeasurement setSystemPowerPort:](self, "setSystemPowerPort:", 0);
  -[HalogenMeasurement setSystemPowerIterator:](self, "setSystemPowerIterator:", 0);
  -[HalogenMeasurement setSystemPowerNotifyPortRef:](self, "setSystemPowerNotifyPortRef:", 0);
  -[HalogenMeasurement setSystemPowerQueue:](self, "setSystemPowerQueue:", dispatch_queue_create("com.apple.ioaccessorymanager.halogenMeasurement.systemPower.queue", 0));
  if (!-[HalogenMeasurement systemPowerQueue](self, "systemPowerQueue"))
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v4)
      return result;
    v12 = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "HalogenMeasurement:dispatch_queue_create() failed";
    v7 = (uint8_t *)&v12;
    goto LABEL_12;
  }
  -[HalogenMeasurement setSystemPowerPort:](self, "setSystemPowerPort:", IORegisterForSystemPower(self, &self->_systemPowerNotifyPortRef, (IOServiceInterestCallback)systemPowerCallback_0, &self->_systemPowerIterator));
  if (!-[HalogenMeasurement systemPowerPort](self, "systemPowerPort"))
  {
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v8)
      return result;
    v11 = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "HalogenMeasurement:IORegisterForSystemPower() failed";
    v7 = (uint8_t *)&v11;
LABEL_12:
    _os_log_impl(&dword_1D13BF000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    return 0;
  }
  -[HalogenMeasurement setPowerStateCond:](self, "setPowerStateCond:", objc_alloc_init(MEMORY[0x1E0CB3530]));
  if (-[HalogenMeasurement powerStateCond](self, "powerStateCond"))
  {
    IONotificationPortSetDispatchQueue(-[HalogenMeasurement systemPowerNotifyPortRef](self, "systemPowerNotifyPortRef"), (dispatch_queue_t)-[HalogenMeasurement systemPowerQueue](self, "systemPowerQueue"));
    return 1;
  }
  v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v9)
  {
    v10 = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "HalogenMeasurement:Failed to create NSCondition: powerStateCond";
    v7 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  return result;
}

- (void)_destroySleepWakeNotifier
{
  if (-[HalogenMeasurement systemPowerIterator](self, "systemPowerIterator"))
    IODeregisterForSystemPower(&self->_systemPowerIterator);
  if (-[HalogenMeasurement systemPowerNotifyPortRef](self, "systemPowerNotifyPortRef"))
    IONotificationPortDestroy(-[HalogenMeasurement systemPowerNotifyPortRef](self, "systemPowerNotifyPortRef"));
  if (-[HalogenMeasurement systemPowerPort](self, "systemPowerPort"))
    IOServiceClose(-[HalogenMeasurement systemPowerPort](self, "systemPowerPort"));
  if (-[HalogenMeasurement systemPowerQueue](self, "systemPowerQueue"))
    dispatch_release((dispatch_object_t)-[HalogenMeasurement systemPowerQueue](self, "systemPowerQueue"));

}

- (int)doMeasurement:(BOOL)a3 onPin:(int)a4 isReceptacleEmpty:(BOOL)a5 isReceptacleWet:(BOOL)a6 withWetTransitionThreshold:(double)a7 withDryTransitionThreshold:(double)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  char v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  OSStatus v17;
  uint64_t v18;
  int v19;
  _BOOL4 v20;
  int v21;
  unint64_t eisPinToken2;
  int v23;
  int v24;
  int v25;
  int v27;
  NSObject *v28;
  const char *v29;
  OSStatus v30;
  int v31;
  NSObject *v32;
  const char *v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  v8 = a6;
  v9 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&self->_pcmInputDataIndexInBytes = 0;
  self->_pcmOutputDataIndexInBytes = 0;
  *(_WORD *)&self->_isCalibrationDone = 0;
  self->_pinToMeasure = a4;
  v13 = -[BaseResourceArbiterClient synchRequestResourceAccess](self->_arbiterClient, "synchRequestResourceAccess", a3);
  self->_arbiterLocked = v13;
  if ((v13 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return 6;
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:Arbiter failed to grant access to Halogen", buf, 2u);
    v23 = 0;
    v25 = 0;
    v24 = 6;
    goto LABEL_29;
  }
  v14 = IOAccessoryManagerSelectEisPin();
  if (v14)
  {
    v27 = v14;
    if (v14 != -536870187)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v35 = v27;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:IOAccessoryManagerSelectEisPin() failed (ret = 0x%x)", buf, 8u);
      }
      v23 = 0;
      v25 = 0;
      goto LABEL_68;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v35 = -536870187;
      v24 = 8;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:IOAccessoryManagerSelectEisPin() device busy (ret = 0x%x)", buf, 8u);
      v23 = 0;
      v25 = 0;
    }
    else
    {
      v23 = 0;
      v25 = 0;
      v24 = 8;
    }
    goto LABEL_29;
  }
  self->_eisPinToken2 = self->_eisPinToken1;
  if (!-[HalogenMeasurement powerState](self, "powerState"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v28 = MEMORY[0x1E0C81028];
      v29 = "HalogenMeasurement:abort measurement... system going to sleep";
LABEL_49:
      _os_log_impl(&dword_1D13BF000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
    }
LABEL_50:
    v25 = 0;
    v23 = 1;
    v24 = 4;
    goto LABEL_29;
  }
  if (-[HalogenMeasurement powerState](self, "powerState") == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:Waiting for kHalogenPowerStateAwake", buf, 2u);
    }
    -[NSCondition lock](-[HalogenMeasurement powerStateCond](self, "powerStateCond"), "lock");
    v15 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
    if (-[HalogenMeasurement powerState](self, "powerState") == 1)
    {
      do
        v16 = -[NSCondition waitUntilDate:](self->_powerStateCond, "waitUntilDate:", v15);
      while (-[HalogenMeasurement powerState](self, "powerState") == 1 && v16);
    }
    -[NSCondition unlock](-[HalogenMeasurement powerStateCond](self, "powerStateCond"), "unlock");
  }
  if (-[HalogenMeasurement powerState](self, "powerState") != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v28 = MEMORY[0x1E0C81028];
      v29 = "HalogenMeasurement:abort measurement... system is not yet awake";
      goto LABEL_49;
    }
    goto LABEL_50;
  }
  if (-[HalogenMeasurement _initAudioPath](self, "_initAudioPath"))
  {
    v17 = AudioOutputUnitStart(self->_audioComponentInst);
    if (v17)
    {
      v30 = v17;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v35 = v30;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:AudioUnitStart() failed (status = 0x%x)", buf, 8u);
      }
      v23 = 1;
      v24 = 3;
      goto LABEL_28;
    }
    v18 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)self->_audioTimeoutInSec);
    -[NSCondition lock](self->_audioTimeoutCond, "lock");
    if (self->_isMeasurementDone)
    {
      v19 = 0;
    }
    else
    {
      do
        v20 = -[NSCondition waitUntilDate:](self->_audioTimeoutCond, "waitUntilDate:", v18);
      while (!self->_isMeasurementDone && v20);
      v19 = !v20;
    }
    -[NSCondition unlock](self->_audioTimeoutCond, "unlock");
    AudioOutputUnitStop(self->_audioComponentInst);
    -[BaseResourceArbiterClient releaseResourceAccess](self->_arbiterClient, "releaseResourceAccess");
    self->_arbiterLocked = 0;
    v21 = IOAccessoryManagerSelectEisPin();
    if (v21)
    {
      v31 = v21;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v35 = v31;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:IOAccessoryManagerSelectEisPin() failed (ret = 0x%x)", buf, 8u);
      }
      v23 = 1;
      v24 = 2;
      goto LABEL_28;
    }
    eisPinToken2 = self->_eisPinToken2;
    if (eisPinToken2 == 0xAAAAAAAAAAAAAAAALL)
    {
      if (self->_pinToMeasure == 6 || eisPinToken2 == LODWORD(self->_eisPinToken1) + 1)
      {
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:Timeout!", buf, 2u);
          }
          v23 = 0;
          v24 = 1;
        }
        else
        {
          -[HalogenMeasurement _doHalogenLdcmCalc:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:](self, "_doHalogenLdcmCalc:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:", v9, v8, a7, a8);
          v24 = 0;
          v23 = 0;
        }
LABEL_28:
        v25 = 1;
        goto LABEL_29;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_67;
      *(_DWORD *)buf = 67109120;
      v35 = v19;
      v32 = MEMORY[0x1E0C81028];
      v33 = "HalogenMeasurement:_eisPinToken2 != _eisPinToken1+1 due to change on lightning port. isTimeout=%d";
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
LABEL_67:
        v23 = 0;
        v25 = 1;
LABEL_68:
        v24 = 2;
        goto LABEL_29;
      }
      *(_DWORD *)buf = 67109120;
      v35 = v19;
      v32 = MEMORY[0x1E0C81028];
      v33 = "HalogenMeasurement:_eisPinToken2 != eisPinTokenFinal due to change on lightning port. isTimeout=%d";
    }
    _os_log_impl(&dword_1D13BF000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 8u);
    goto LABEL_67;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:AudioUnit is not initialized", buf, 2u);
  }
  v25 = 0;
  v23 = 1;
  v24 = 3;
LABEL_29:
  if (self->_arbiterLocked)
  {
    self->_arbiterLocked = 0;
    -[BaseResourceArbiterClient releaseResourceAccess](self->_arbiterClient, "releaseResourceAccess");
    if ((v23 & 1) != 0)
      goto LABEL_31;
  }
  else if (v23)
  {
LABEL_31:
    IOAccessoryManagerSelectEisPin();
    if ((v25 & 1) == 0)
      return v24;
    goto LABEL_35;
  }
  if (v25)
LABEL_35:
    -[HalogenMeasurement _deinitAudioPath](self, "_deinitAudioPath");
  return v24;
}

- (int)saveAsWav:(id)a3
{
  const char *v4;
  const UInt8 *v5;
  size_t v6;
  const __CFURL *v7;
  const __CFURL *v8;
  UInt32 bitDepth;
  Float64 sampleRate;
  OSStatus v11;
  UInt32 pcmInputDataSampleCnt;
  UInt32 v13;
  int v14;
  NSObject *v16;
  const char *v17;
  OSStatus v18;
  AudioBufferList v19;
  ExtAudioFileRef outExtAudioFile;
  AudioStreamBasicDescription inStreamDesc;
  uint8_t buf[4];
  OSStatus v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  outExtAudioFile = (ExtAudioFileRef)0xAAAAAAAAAAAAAAAALL;
  v4 = (const char *)objc_msgSend(a3, "UTF8String");
  if (!self->_isMeasurementDone)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(inStreamDesc.mSampleRate) = 0;
      v16 = MEMORY[0x1E0C81028];
      v17 = "HalogenMeasurement:Measurement did not complete... cannot save WAV file";
LABEL_11:
      _os_log_impl(&dword_1D13BF000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&inStreamDesc, 2u);
    }
    return -1;
  }
  v5 = (const UInt8 *)v4;
  v6 = strlen(v4);
  v7 = CFURLCreateFromFileSystemRepresentation(0, v5, v6, 0);
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(inStreamDesc.mSampleRate) = 0;
      v16 = MEMORY[0x1E0C81028];
      v17 = "HalogenMeasurement:CFURLCreateFromFileSystemRepresentation() returned NULL.";
      goto LABEL_11;
    }
    return -1;
  }
  v8 = v7;
  *(_QWORD *)&inStreamDesc.mBitsPerChannel = 0;
  bitDepth = self->_bitDepth;
  sampleRate = (double)self->_sampleRate;
  inStreamDesc.mChannelsPerFrame = self->_nInputChannels;
  inStreamDesc.mBitsPerChannel = bitDepth;
  inStreamDesc.mBytesPerPacket = self->_inputFrameSizeInBytes;
  inStreamDesc.mFramesPerPacket = 1;
  inStreamDesc.mBytesPerFrame = inStreamDesc.mBytesPerPacket;
  inStreamDesc.mSampleRate = sampleRate;
  *(_QWORD *)&inStreamDesc.mFormatID = 0xC6C70636DLL;
  v11 = ExtAudioFileCreateWithURL(v7, 0x57415645u, &inStreamDesc, 0, 1u, &outExtAudioFile);
  if (v11)
  {
    v18 = v11;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v23 = v18;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenMeasurement:AudioFileCreateWithURL() returned ostatus=0x%x", buf, 8u);
    }
    v14 = -1;
  }
  else
  {
    v19.mBuffers[0].mData = (void *)-[NSMutableData bytes](self->_pcmInputData, "bytes", 0xAAAAAAAA00000001);
    pcmInputDataSampleCnt = self->_pcmInputDataSampleCnt;
    v13 = self->_inputFrameSizeInBytes * pcmInputDataSampleCnt;
    v19.mBuffers[0].mNumberChannels = self->_nInputChannels;
    v19.mBuffers[0].mDataByteSize = v13;
    ExtAudioFileWrite(outExtAudioFile, pcmInputDataSampleCnt, &v19);
    ExtAudioFileDispose(outExtAudioFile);
    v14 = 0;
  }
  CFRelease(v8);
  return v14;
}

- (void)_resetCalcValues
{
  self->_precalVoltageSNR = 0.0;
  self->_calVoltageSNR = 0.0;
  self->_measurementVoltageSNR = 0.0;
  *(_OWORD *)&self->_precalCurrentSNR = 0u;
  *(_OWORD *)&self->_currentGainCorrection = 0u;
  *(_OWORD *)&self->_calCurrentSNR = 0u;
  *(_OWORD *)&self->_goertzelPhase = 0u;
  *(_OWORD *)&self->_compensatedPhase = 0u;
  *(_OWORD *)&self->_capacitanceInNanoF = 0u;
  self->_measurementCurrentSNR = 0.0;
  self->_measurementCondetSNR = 0.0;
}

- (BOOL)_doHalogenLdcmCalc:(BOOL)a3 isReceptacleWet:(BOOL)a4 withWetTransitionThreshold:(double)a5 withDryTransitionThreshold:(double)a6
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  double *v16;
  uint64_t nMeasurementSamples;
  int v18;
  double *v19;
  double *v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  int v29;
  double *v30;
  double *v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  int v43;
  int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;

  v8 = a4;
  v9 = a3;
  v11 = -[NSMutableData bytes](self->_pcmInputData, "bytes");
  v12 = -[HalogenMeasurement shouldInvertData](self, "shouldInvertData");
  if (v12)
    v13 = 424;
  else
    v13 = 416;
  if (v12)
    v14 = 416;
  else
    v14 = 424;
  v15 = (double *)objc_msgSend(*(id *)((char *)&self->super.isa + v13), "bytes");
  v16 = (double *)objc_msgSend(*(id *)((char *)&self->super.isa + v14), "bytes");
  -[HalogenMeasurement _resetCalcValues](self, "_resetCalcValues");
  nMeasurementSamples = self->_nMeasurementSamples;
  if ((int)nMeasurementSamples >= 1)
  {
    v18 = 2 * self->_precalibrationSampleOffsetInFrames;
    v19 = v15;
    v20 = v16;
    do
    {
      *v19++ = (double)*(__int16 *)(v11 + 2 * v18) * 0.0000305175781;
      *v20++ = (double)*(__int16 *)(v11 + 2 * (v18 + 1)) * 0.0000305175781;
      v18 += 2;
      --nMeasurementSamples;
    }
    while (nMeasurementSamples);
  }
  v21 = -[HalogenLdcmCalc doPreCalibration:withCurrentData:](self->_halogenLdcmCalc, "doPreCalibration:withCurrentData:", self->_voltageData, self->_currentData);
  -[HalogenLdcmCalc precalVoltageSignalLevel](self->_halogenLdcmCalc, "precalVoltageSignalLevel");
  self->_precalVoltageSignalLevel = v22;
  -[HalogenLdcmCalc precalVoltageNoiseLevel](self->_halogenLdcmCalc, "precalVoltageNoiseLevel");
  self->_precalVoltageNoiseLevel = v23;
  -[HalogenLdcmCalc precalVoltageSNR](self->_halogenLdcmCalc, "precalVoltageSNR");
  self->_precalVoltageSNR = v24;
  -[HalogenLdcmCalc precalCurrentSignalLevel](self->_halogenLdcmCalc, "precalCurrentSignalLevel");
  self->_precalCurrentSignalLevel = v25;
  -[HalogenLdcmCalc precalCurrentNoiseLevel](self->_halogenLdcmCalc, "precalCurrentNoiseLevel");
  self->_precalCurrentNoiseLevel = v26;
  -[HalogenLdcmCalc precalCurrentSNR](self->_halogenLdcmCalc, "precalCurrentSNR");
  self->_precalCurrentSNR = v27;
  v28 = self->_nMeasurementSamples;
  if ((int)v28 >= 1)
  {
    v29 = 2 * self->_calibrationSampleOffsetInFrames;
    v30 = v15;
    v31 = v16;
    do
    {
      *v30++ = (double)*(__int16 *)(v11 + 2 * v29) * 0.0000305175781;
      *v31++ = (double)*(__int16 *)(v11 + 2 * (v29 + 1)) * 0.0000305175781;
      v29 += 2;
      --v28;
    }
    while (v28);
  }
  v32 = -[HalogenLdcmCalc doCalibration:withCurrentData:](self->_halogenLdcmCalc, "doCalibration:withCurrentData:", self->_voltageData, self->_currentData);
  -[HalogenLdcmCalc calVoltageSignalLevel](self->_halogenLdcmCalc, "calVoltageSignalLevel");
  self->_calVoltageSignalLevel = v33;
  -[HalogenLdcmCalc calVoltageNoiseLevel](self->_halogenLdcmCalc, "calVoltageNoiseLevel");
  self->_calVoltageNoiseLevel = v34;
  -[HalogenLdcmCalc calVoltageSNR](self->_halogenLdcmCalc, "calVoltageSNR");
  self->_calVoltageSNR = v35;
  -[HalogenLdcmCalc calCurrentSignalLevel](self->_halogenLdcmCalc, "calCurrentSignalLevel");
  self->_calCurrentSignalLevel = v36;
  -[HalogenLdcmCalc calCurrentNoiseLevel](self->_halogenLdcmCalc, "calCurrentNoiseLevel");
  self->_calCurrentNoiseLevel = v37;
  -[HalogenLdcmCalc calCurrentSNR](self->_halogenLdcmCalc, "calCurrentSNR");
  self->_calCurrentSNR = v38;
  -[HalogenLdcmCalc voltageGainCorrection](self->_halogenLdcmCalc, "voltageGainCorrection");
  self->_voltageGainCorrection = v39;
  -[HalogenLdcmCalc currentGainCorrection](self->_halogenLdcmCalc, "currentGainCorrection");
  self->_currentGainCorrection = v40;
  -[HalogenLdcmCalc currentPhaseCompensation](self->_halogenLdcmCalc, "currentPhaseCompensation");
  self->_currentPhaseCompensation = v41;
  v42 = self->_nMeasurementSamples;
  if ((int)v42 >= 1)
  {
    v43 = 2 * self->_measurementSampleOffsetInFrames;
    do
    {
      *v15++ = (double)*(__int16 *)(v11 + 2 * v43) * 0.0000305175781;
      *v16++ = (double)*(__int16 *)(v11 + 2 * (v43 + 1)) * 0.0000305175781;
      v43 += 2;
      --v42;
    }
    while (v42);
  }
  v44 = -[HalogenLdcmCalc doLiquidDetection:withCurrentData:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:](self->_halogenLdcmCalc, "doLiquidDetection:withCurrentData:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:", self->_voltageData, self->_currentData, v9, v8, a5, a6);
  -[HalogenLdcmCalc goertzelImpedance](self->_halogenLdcmCalc, "goertzelImpedance");
  self->_goertzelImpedance = v45;
  -[HalogenLdcmCalc goertzelPhase](self->_halogenLdcmCalc, "goertzelPhase");
  self->_goertzelPhase = v46;
  -[HalogenLdcmCalc compensatedImpedance](self->_halogenLdcmCalc, "compensatedImpedance");
  self->_compensatedImpedance = v47;
  -[HalogenLdcmCalc compensatedPhase](self->_halogenLdcmCalc, "compensatedPhase");
  self->_compensatedPhase = v48;
  -[HalogenLdcmCalc resistanceInOhms](self->_halogenLdcmCalc, "resistanceInOhms");
  self->_resistanceInOhms = v49;
  -[HalogenLdcmCalc capacitanceInNanoF](self->_halogenLdcmCalc, "capacitanceInNanoF");
  self->_capacitanceInNanoF = v50;
  -[HalogenLdcmCalc clippingScore](self->_halogenLdcmCalc, "clippingScore");
  self->_clippingScore = v51;
  -[HalogenLdcmCalc measurementVoltageSignalLevel](self->_halogenLdcmCalc, "measurementVoltageSignalLevel");
  self->_measurementVoltageSignalLevel = v52;
  -[HalogenLdcmCalc measurementVoltageNoiseLevel](self->_halogenLdcmCalc, "measurementVoltageNoiseLevel");
  self->_measurementVoltageNoiseLevel = v53;
  -[HalogenLdcmCalc measurementVoltageSNR](self->_halogenLdcmCalc, "measurementVoltageSNR");
  self->_measurementVoltageSNR = v54;
  -[HalogenLdcmCalc measurementCurrentSignalLevel](self->_halogenLdcmCalc, "measurementCurrentSignalLevel");
  self->_measurementCurrentSignalLevel = v55;
  -[HalogenLdcmCalc measurementCurrentNoiseLevel](self->_halogenLdcmCalc, "measurementCurrentNoiseLevel");
  self->_measurementCurrentNoiseLevel = v56;
  -[HalogenLdcmCalc measurementCurrentSNR](self->_halogenLdcmCalc, "measurementCurrentSNR");
  self->_measurementCurrentSNR = v57;
  -[HalogenLdcmCalc measurementCondetSNR](self->_halogenLdcmCalc, "measurementCondetSNR");
  self->_measurementCondetSNR = v58;
  if (v21 == 2)
  {
    v44 = 5;
    goto LABEL_22;
  }
  switch(v32)
  {
    case 1:
      v44 = 4;
      goto LABEL_22;
    case 2:
      v44 = 6;
LABEL_22:
      self->_halogenResult = v44;
      return 1;
    case 0:
      goto LABEL_22;
  }
  return 1;
}

- (id)getResultString
{
  uint64_t halogenResult;

  halogenResult = self->_halogenResult;
  if (halogenResult > 8)
    return CFSTR("Unknown");
  else
    return off_1E9214488[halogenResult];
}

- (unsigned)maxOutputAmplitude
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HalogenMeasurement_maxOutputAmplitude__block_invoke;
  block[3] = &unk_1E9214120;
  block[4] = self;
  if (maxOutputAmplitude_onceToken != -1)
    dispatch_once(&maxOutputAmplitude_onceToken, block);
  return self->_maxOutputAmplitude;
}

void __40__HalogenMeasurement_maxOutputAmplitude__block_invoke(uint64_t a1)
{
  __int16 v2;
  id v3;

  v3 = (id)MGGetStringAnswer();
  v2 = 0x7FFF;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone12,8")) & 1) == 0)
  {
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone11")))
      v2 = 0x7FFF;
    else
      v2 = 1057;
  }
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 14) = v2;
  if (v3)

}

- (unsigned)signalOffset
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HalogenMeasurement_signalOffset__block_invoke;
  block[3] = &unk_1E9214120;
  block[4] = self;
  if (signalOffset_onceToken != -1)
    dispatch_once(&signalOffset_onceToken, block);
  return self->_signalOffset;
}

void __34__HalogenMeasurement_signalOffset__block_invoke(uint64_t a1)
{
  __int16 v2;
  id v3;

  v3 = (id)MGGetStringAnswer();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone12,8")) & 1) != 0)
  {
    v2 = 0;
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone11")))
  {
    v2 = 0;
  }
  else
  {
    v2 = 15308;
  }
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 16) = v2;
  if (v3)

}

- (BOOL)shouldInvertData
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HalogenMeasurement_shouldInvertData__block_invoke;
  block[3] = &unk_1E9214120;
  block[4] = self;
  if (shouldInvertData_onceToken != -1)
    dispatch_once(&shouldInvertData_onceToken, block);
  return self->_shouldInvertData;
}

void __38__HalogenMeasurement_shouldInvertData__block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  v3 = (id)MGGetStringAnswer();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone12,8")) & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone11")) ^ 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = v2;
  if (v3)

}

- (BOOL)isBoundViolation_voltageGainCorrection
{
  return -[HalogenLdcmCalc isBoundViolation_voltageGainCorrection](self->_halogenLdcmCalc, "isBoundViolation_voltageGainCorrection");
}

- (BOOL)isBoundViolation_currentGainCorrection
{
  return -[HalogenLdcmCalc isBoundViolation_currentGainCorrection](self->_halogenLdcmCalc, "isBoundViolation_currentGainCorrection");
}

- (BOOL)isBoundViolation_currentPhaseCompensation
{
  return -[HalogenLdcmCalc isBoundViolation_currentGainCorrection](self->_halogenLdcmCalc, "isBoundViolation_currentGainCorrection");
}

- (BOOL)isLowerBoundViolation_goertzelImpedance
{
  return -[HalogenLdcmCalc isLowerBoundViolation_goertzelImpedance](self->_halogenLdcmCalc, "isLowerBoundViolation_goertzelImpedance");
}

- (BOOL)isUpperBoundViolation_goertzelImpedance
{
  return -[HalogenLdcmCalc isUpperBoundViolation_goertzelImpedance](self->_halogenLdcmCalc, "isUpperBoundViolation_goertzelImpedance");
}

- (BOOL)isLowerBoundViolation_goertzelPhase
{
  return -[HalogenLdcmCalc isLowerBoundViolation_goertzelPhase](self->_halogenLdcmCalc, "isLowerBoundViolation_goertzelPhase");
}

- (BOOL)isUpperBoundViolation_goertzelPhase
{
  return -[HalogenLdcmCalc isUpperBoundViolation_goertzelPhase](self->_halogenLdcmCalc, "isUpperBoundViolation_goertzelPhase");
}

- (BOOL)isBoundViolation_measurementCondetSNR
{
  return -[HalogenLdcmCalc isBoundViolation_measurementCondetSNR](self->_halogenLdcmCalc, "isBoundViolation_measurementCondetSNR");
}

- (int)precalibrationSampleOffsetInFrames
{
  return self->_precalibrationSampleOffsetInFrames;
}

- (double)precalVoltageSignalLevel
{
  return self->_precalVoltageSignalLevel;
}

- (double)precalVoltageNoiseLevel
{
  return self->_precalVoltageNoiseLevel;
}

- (double)precalVoltageSNR
{
  return self->_precalVoltageSNR;
}

- (double)precalCurrentSignalLevel
{
  return self->_precalCurrentSignalLevel;
}

- (double)precalCurrentNoiseLevel
{
  return self->_precalCurrentNoiseLevel;
}

- (double)precalCurrentSNR
{
  return self->_precalCurrentSNR;
}

- (int)calibrationSampleOffsetInFrames
{
  return self->_calibrationSampleOffsetInFrames;
}

- (double)voltageGainCorrection
{
  return self->_voltageGainCorrection;
}

- (double)currentGainCorrection
{
  return self->_currentGainCorrection;
}

- (double)currentPhaseCompensation
{
  return self->_currentPhaseCompensation;
}

- (double)calVoltageSignalLevel
{
  return self->_calVoltageSignalLevel;
}

- (double)calVoltageNoiseLevel
{
  return self->_calVoltageNoiseLevel;
}

- (double)calVoltageSNR
{
  return self->_calVoltageSNR;
}

- (double)calCurrentSignalLevel
{
  return self->_calCurrentSignalLevel;
}

- (double)calCurrentNoiseLevel
{
  return self->_calCurrentNoiseLevel;
}

- (double)calCurrentSNR
{
  return self->_calCurrentSNR;
}

- (int)measurementSampleOffsetInFrames
{
  return self->_measurementSampleOffsetInFrames;
}

- (void)setMeasurementSampleOffsetInFrames:(int)a3
{
  self->_measurementSampleOffsetInFrames = a3;
}

- (double)goertzelImpedance
{
  return self->_goertzelImpedance;
}

- (double)goertzelPhase
{
  return self->_goertzelPhase;
}

- (double)compensatedImpedance
{
  return self->_compensatedImpedance;
}

- (double)compensatedPhase
{
  return self->_compensatedPhase;
}

- (double)resistanceInOhms
{
  return self->_resistanceInOhms;
}

- (double)capacitanceInNanoF
{
  return self->_capacitanceInNanoF;
}

- (double)clippingScore
{
  return self->_clippingScore;
}

- (double)measurementVoltageSignalLevel
{
  return self->_measurementVoltageSignalLevel;
}

- (double)measurementVoltageNoiseLevel
{
  return self->_measurementVoltageNoiseLevel;
}

- (double)measurementVoltageSNR
{
  return self->_measurementVoltageSNR;
}

- (double)measurementCurrentSignalLevel
{
  return self->_measurementCurrentSignalLevel;
}

- (double)measurementCurrentNoiseLevel
{
  return self->_measurementCurrentNoiseLevel;
}

- (double)measurementCurrentSNR
{
  return self->_measurementCurrentSNR;
}

- (double)measurementCondetSNR
{
  return self->_measurementCondetSNR;
}

- (int)halogenResult
{
  return self->_halogenResult;
}

- (HalogenLdcmCalc)halogenLdcmCalc
{
  return self->_halogenLdcmCalc;
}

- (void)setHalogenLdcmCalc:(id)a3
{
  self->_halogenLdcmCalc = (HalogenLdcmCalc *)a3;
}

- (int)nInputChannels
{
  return self->_nInputChannels;
}

- (void)setNInputChannels:(int)a3
{
  self->_nInputChannels = a3;
}

- (int)nOutputChannels
{
  return self->_nOutputChannels;
}

- (void)setNOutputChannels:(int)a3
{
  self->_nOutputChannels = a3;
}

- (int)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int)a3
{
  self->_sampleRate = a3;
}

- (int)bitDepth
{
  return self->_bitDepth;
}

- (void)setBitDepth:(int)a3
{
  self->_bitDepth = a3;
}

- (int)inputFrameSizeInBytes
{
  return self->_inputFrameSizeInBytes;
}

- (void)setInputFrameSizeInBytes:(int)a3
{
  self->_inputFrameSizeInBytes = a3;
}

- (int)outputFrameSizeInBytes
{
  return self->_outputFrameSizeInBytes;
}

- (void)setOutputFrameSizeInBytes:(int)a3
{
  self->_outputFrameSizeInBytes = a3;
}

- (OpaqueAudioComponentInstance)audioComponentInst
{
  return self->_audioComponentInst;
}

- (void)setAudioComponentInst:(OpaqueAudioComponentInstance *)a3
{
  self->_audioComponentInst = a3;
}

- (int)warmupTimeInMs
{
  return self->_warmupTimeInMs;
}

- (void)setWarmupTimeInMs:(int)a3
{
  self->_warmupTimeInMs = a3;
}

- (int)hydraSettlingTimeInMs
{
  return self->_hydraSettlingTimeInMs;
}

- (void)setHydraSettlingTimeInMs:(int)a3
{
  self->_hydraSettlingTimeInMs = a3;
}

- (int)nMeasurementSamples
{
  return self->_nMeasurementSamples;
}

- (void)setNMeasurementSamples:(int)a3
{
  self->_nMeasurementSamples = a3;
}

- (int)nWarmupSamples
{
  return self->_nWarmupSamples;
}

- (void)setNWarmupSamples:(int)a3
{
  self->_nWarmupSamples = a3;
}

- (int)nHydraSettlingSamples
{
  return self->_nHydraSettlingSamples;
}

- (void)setNHydraSettlingSamples:(int)a3
{
  self->_nHydraSettlingSamples = a3;
}

- (int)nTotalSamples
{
  return self->_nTotalSamples;
}

- (void)setNTotalSamples:(int)a3
{
  self->_nTotalSamples = a3;
}

- (int)nPaddingSamples
{
  return self->_nPaddingSamples;
}

- (void)setNPaddingSamples:(int)a3
{
  self->_nPaddingSamples = a3;
}

- (double)signalFreq
{
  return self->_signalFreq;
}

- (void)setSignalFreq:(double)a3
{
  self->_signalFreq = a3;
}

- (int)initalPhaseInDegrees
{
  return self->_initalPhaseInDegrees;
}

- (void)setInitalPhaseInDegrees:(int)a3
{
  self->_initalPhaseInDegrees = a3;
}

- (NSMutableData)pcmInputData
{
  return self->_pcmInputData;
}

- (void)setPcmInputData:(id)a3
{
  self->_pcmInputData = (NSMutableData *)a3;
}

- (int)pcmInputDataMaxSzInBytes
{
  return self->_pcmInputDataMaxSzInBytes;
}

- (void)setPcmInputDataMaxSzInBytes:(int)a3
{
  self->_pcmInputDataMaxSzInBytes = a3;
}

- (int)pcmInputDataIndexInBytes
{
  return self->_pcmInputDataIndexInBytes;
}

- (void)setPcmInputDataIndexInBytes:(int)a3
{
  self->_pcmInputDataIndexInBytes = a3;
}

- (int)pcmInputDataSampleCnt
{
  return self->_pcmInputDataSampleCnt;
}

- (void)setPcmInputDataSampleCnt:(int)a3
{
  self->_pcmInputDataSampleCnt = a3;
}

- (BOOL)isCalibrationDone
{
  return self->_isCalibrationDone;
}

- (void)setIsCalibrationDone:(BOOL)a3
{
  self->_isCalibrationDone = a3;
}

- (BOOL)isMeasurementDone
{
  return self->_isMeasurementDone;
}

- (void)setIsMeasurementDone:(BOOL)a3
{
  self->_isMeasurementDone = a3;
}

- (NSMutableData)pcmOutputData
{
  return self->_pcmOutputData;
}

- (void)setPcmOutputData:(id)a3
{
  self->_pcmOutputData = (NSMutableData *)a3;
}

- (int)pcmOutputDataMaxSzInBytes
{
  return self->_pcmOutputDataMaxSzInBytes;
}

- (void)setPcmOutputDataMaxSzInBytes:(int)a3
{
  self->_pcmOutputDataMaxSzInBytes = a3;
}

- (int)pcmOutputDataIndexInBytes
{
  return self->_pcmOutputDataIndexInBytes;
}

- (void)setPcmOutputDataIndexInBytes:(int)a3
{
  self->_pcmOutputDataIndexInBytes = a3;
}

- (NSMutableData)currentData
{
  return self->_currentData;
}

- (void)setCurrentData:(id)a3
{
  self->_currentData = (NSMutableData *)a3;
}

- (NSMutableData)voltageData
{
  return self->_voltageData;
}

- (void)setVoltageData:(id)a3
{
  self->_voltageData = (NSMutableData *)a3;
}

- (int)audioTimeoutInSec
{
  return self->_audioTimeoutInSec;
}

- (void)setAudioTimeoutInSec:(int)a3
{
  self->_audioTimeoutInSec = a3;
}

- (NSCondition)audioTimeoutCond
{
  return self->_audioTimeoutCond;
}

- (void)setAudioTimeoutCond:(id)a3
{
  self->_audioTimeoutCond = (NSCondition *)a3;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->_connect = a3;
}

- (int)pinToMeasure
{
  return self->_pinToMeasure;
}

- (void)setPinToMeasure:(int)a3
{
  self->_pinToMeasure = a3;
}

- (unint64_t)eisPinToken1
{
  return self->_eisPinToken1;
}

- (void)setEisPinToken1:(unint64_t)a3
{
  self->_eisPinToken1 = a3;
}

- (unint64_t)eisPinToken2
{
  return self->_eisPinToken2;
}

- (void)setEisPinToken2:(unint64_t)a3
{
  self->_eisPinToken2 = a3;
}

- (OS_dispatch_queue)systemPowerQueue
{
  return self->_systemPowerQueue;
}

- (void)setSystemPowerQueue:(id)a3
{
  self->_systemPowerQueue = (OS_dispatch_queue *)a3;
}

- (unsigned)systemPowerPort
{
  return self->_systemPowerPort;
}

- (void)setSystemPowerPort:(unsigned int)a3
{
  self->_systemPowerPort = a3;
}

- (IONotificationPort)systemPowerNotifyPortRef
{
  return self->_systemPowerNotifyPortRef;
}

- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3
{
  self->_systemPowerNotifyPortRef = a3;
}

- (unsigned)systemPowerIterator
{
  return self->_systemPowerIterator;
}

- (void)setSystemPowerIterator:(unsigned int)a3
{
  self->_systemPowerIterator = a3;
}

- (int)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(int)a3
{
  self->_powerState = a3;
}

- (NSCondition)powerStateCond
{
  return self->_powerStateCond;
}

- (void)setPowerStateCond:(id)a3
{
  self->_powerStateCond = (NSCondition *)a3;
}

- (BaseResourceArbiterClient)arbiterClient
{
  return self->_arbiterClient;
}

- (BOOL)arbiterLocked
{
  return self->_arbiterLocked;
}

- (BOOL)arbitrationRequired
{
  return self->_arbitrationRequired;
}

@end
