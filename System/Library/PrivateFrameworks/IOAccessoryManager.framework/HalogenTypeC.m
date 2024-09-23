@implementation HalogenTypeC

- (HalogenTypeC)initWithParams:(int)a3 onPort:(int)a4
{
  uint64_t v4;
  char *v6;
  HalogenTypeC *v7;
  HalogenAudio *v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v15;
  const char *v16;
  uint32_t v17;
  uint64_t v18;
  objc_super v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v4 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)HalogenTypeC;
  v6 = -[HalogenTypeC init](&v19, sel_init);
  v7 = (HalogenTypeC *)v6;
  if (!v6)
    return v7;
  *(_OWORD *)(v6 + 36) = xmmword_1D13E7DA0;
  *(_DWORD *)(v6 + 14) = 1;
  *(_OWORD *)(v6 + 52) = xmmword_1D13E7DB0;
  *((_DWORD *)v6 + 17) = a3;
  *((_QWORD *)v6 + 9) = 0x3840000012C0;
  *((_DWORD *)v6 + 20) = 2 * a3 + 23296;
  *((_DWORD *)v6 + 21) = 4096;
  *((_DWORD *)v6 + 6) = 4800;
  v8 = [HalogenAudio alloc];
  LODWORD(v18) = v7->_outputFrameSizeInBytes;
  v9 = -[HalogenAudio initAudioWithParameters:nInputChannels:nOutputChannels:sampleRate:bitDepth:inputFrameSizeInBytes:outputFrameSizeInBytes:](v8, "initAudioWithParameters:nInputChannels:nOutputChannels:sampleRate:bitDepth:inputFrameSizeInBytes:outputFrameSizeInBytes:", v7, v7->_nInputChannels, v7->_nOutputChannels, v7->_sampleRate, v7->_bitDepth, v7->_inputFrameSizeInBytes, v18);
  v7->_halogenAudioUnit = (HalogenAudio *)v9;
  if (!v9)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return v7;
    *(_WORD *)buf = 0;
    v12 = MEMORY[0x1E0C81028];
    v13 = "HalogenTypeC:Could not initialize HalogenAudio.";
    goto LABEL_11;
  }
  v7->_audioTimeoutCond = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
  v7->_audioTimeoutInSec = 1;
  v7->_signalFreq = 110.0;
  v7->_initalPhaseInDegrees = 0;
  v10 = (const void *)MGCopyAnswer();
  if (v10)
  {
    v11 = v10;
    v7->_isInternalBuild = CFEqual(v10, CFSTR("Internal")) != 0;
    CFRelease(v11);
  }
  else
  {
    v7->_isInternalBuild = 0;
  }
  v7->_selfTestCapable = -[HalogenTypeC supportsSelfTest](v7, "supportsSelfTest");
  v7->_measurementInfoOutputString = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (!-[HalogenTypeC _allocBuffers](v7, "_allocBuffers"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = MEMORY[0x1E0C81028];
      v16 = "HalogenTypeC:_allocBuffers() failed";
      v17 = 2;
LABEL_22:
      _os_log_impl(&dword_1D13BF000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if (!-[HalogenTypeC _connectToAccessoryManager:](v7, "_connectToAccessoryManager:", v4))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v4;
      v15 = MEMORY[0x1E0C81028];
      v16 = "HalogenTypeC:_connectToAccessoryManager() failed for port %d";
LABEL_21:
      v17 = 8;
      goto LABEL_22;
    }
LABEL_23:

    return 0;
  }
  if (!-[HalogenTypeC _createSleepWakeNotifier](v7, "_createSleepWakeNotifier"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v4;
      v15 = MEMORY[0x1E0C81028];
      v16 = "HalogenTypeC:_createSleepWakeNotifier() failed for port %d";
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  -[HalogenTypeC _generateSineWave](v7, "_generateSineWave");
  v7->_halogenCalcTypeC = -[HalogenCalcTypeC initWithParams:signalFrequency:sampleRate:tiaGain:adcGain:parasiticCap:]([HalogenCalcTypeC alloc], "initWithParams:signalFrequency:sampleRate:tiaGain:adcGain:parasiticCap:", v7->_nMeasurementSamples, v7->_sampleRate, v7->_signalFreq, 12400.0, 1.0, 4.0e-12);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v12 = MEMORY[0x1E0C81028];
    v13 = "HalogenTypeC:HalogenTypeC Started!";
LABEL_11:
    _os_log_impl(&dword_1D13BF000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[HalogenTypeC _destroySleepWakeNotifier](self, "_destroySleepWakeNotifier");
  -[HalogenTypeC _disconnectFromAccessoryManager](self, "_disconnectFromAccessoryManager");
  -[HalogenTypeC _freeBuffers](self, "_freeBuffers");

  v3.receiver = self;
  v3.super_class = (Class)HalogenTypeC;
  -[HalogenTypeC dealloc](&v3, sel_dealloc);
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

  -[HalogenTypeC setPowerState:](self, "setPowerState:", 2);
  -[HalogenTypeC setSystemPowerPort:](self, "setSystemPowerPort:", 0);
  -[HalogenTypeC setSystemPowerIterator:](self, "setSystemPowerIterator:", 0);
  -[HalogenTypeC setSystemPowerNotifyPortRef:](self, "setSystemPowerNotifyPortRef:", 0);
  -[HalogenTypeC setSystemPowerQueue:](self, "setSystemPowerQueue:", dispatch_queue_create("com.apple.ioaccessorymanager.halogenTypeC.systemPower.queue", 0));
  if (!-[HalogenTypeC systemPowerQueue](self, "systemPowerQueue"))
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v4)
      return result;
    v12 = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "HalogenTypeC:dispatch_queue_create() failed";
    v7 = (uint8_t *)&v12;
    goto LABEL_12;
  }
  -[HalogenTypeC setSystemPowerPort:](self, "setSystemPowerPort:", IORegisterForSystemPower(self, &self->_systemPowerNotifyPortRef, (IOServiceInterestCallback)systemPowerCallback, &self->_systemPowerIterator));
  if (!-[HalogenTypeC systemPowerPort](self, "systemPowerPort"))
  {
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v8)
      return result;
    v11 = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "HalogenTypeC:IORegisterForSystemPower() failed";
    v7 = (uint8_t *)&v11;
LABEL_12:
    _os_log_impl(&dword_1D13BF000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    return 0;
  }
  -[HalogenTypeC setPowerStateCond:](self, "setPowerStateCond:", objc_alloc_init(MEMORY[0x1E0CB3530]));
  if (-[HalogenTypeC powerStateCond](self, "powerStateCond"))
  {
    IONotificationPortSetDispatchQueue(-[HalogenTypeC systemPowerNotifyPortRef](self, "systemPowerNotifyPortRef"), (dispatch_queue_t)-[HalogenTypeC systemPowerQueue](self, "systemPowerQueue"));
    return 1;
  }
  v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v9)
  {
    v10 = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "HalogenTypeC:Failed to create NSCondition: powerStateCond";
    v7 = (uint8_t *)&v10;
    goto LABEL_12;
  }
  return result;
}

- (void)_destroySleepWakeNotifier
{
  if (-[HalogenTypeC systemPowerIterator](self, "systemPowerIterator"))
    IODeregisterForSystemPower(&self->_systemPowerIterator);
  if (-[HalogenTypeC systemPowerNotifyPortRef](self, "systemPowerNotifyPortRef"))
    IONotificationPortDestroy(-[HalogenTypeC systemPowerNotifyPortRef](self, "systemPowerNotifyPortRef"));
  if (-[HalogenTypeC systemPowerPort](self, "systemPowerPort"))
    IOServiceClose(-[HalogenTypeC systemPowerPort](self, "systemPowerPort"));
  if (-[HalogenTypeC systemPowerQueue](self, "systemPowerQueue"))
    dispatch_release((dispatch_object_t)-[HalogenTypeC systemPowerQueue](self, "systemPowerQueue"));

}

- (BOOL)_connectToAccessoryManager:(int)a3
{
  unsigned int ServiceWithSupportedFeature;
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
  ServiceWithSupportedFeature = IOAccessoryManagerGetServiceWithSupportedFeature();
  self->_service = ServiceWithSupportedFeature;
  if (ServiceWithSupportedFeature)
  {
    v6 = IOServiceOpen(ServiceWithSupportedFeature, *MEMORY[0x1E0C83DA0], 0, &self->_connect);
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
      v10 = "HalogenTypeC:Failed to open IOAccessoryManager manager (ret = 0x%x)";
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
      v10 = "HalogenTypeC:Could not find IOAccessoryManager service for port=%d";
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
    v11 = "HalogenTypeC:Failed to alloc _pcmInputData";
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
    v11 = "HalogenTypeC:Failed to alloc _pcmOutputData";
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
    v11 = "HalogenTypeC:Failed to alloc _currentData";
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
    v11 = "HalogenTypeC:Failed to alloc _voltageData";
    v12 = (uint8_t *)&v16;
    goto LABEL_15;
  }
  return result;
}

- (void)_freeBuffers
{

}

- (BOOL)supportsSelfTest
{
  void *v2;
  void *v3;
  BOOL v4;
  BOOL result;
  uint8_t v6[16];

  v2 = (void *)MGGetStringAnswer();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "length"))
  {
    v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("iPad13,1")) & 1) == 0
      && !objc_msgSend(v3, "isEqualToString:", CFSTR("iPad13,2"));
LABEL_7:

    return v4;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Product Type string is NULL - No support for SelfTest", v6, 2u);
  }
  v4 = 0;
  result = 0;
  if (v3)
    goto LABEL_7;
  return result;
}

- (void)_generateSineWave
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  float v7;
  double v8;
  double v9;
  float v10;

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
      v9 = (double)-[HalogenTypeC maxOutputAmplitude](self, "maxOutputAmplitude");
      v10 = -((double)-[HalogenTypeC signalOffset](self, "signalOffset") - v8 * v9);
      *(float *)(v4 + 4 * v5) = v10;
      v7 = v7 + v6;
      ++v5;
    }
    while (v5 < self->_nTotalSamples);
  }
}

- (void)_runHPMTool:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[3];

  v3 = a3;
  v10[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processIdentifier");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v5 = (void *)objc_msgSend(v4, "fileHandleForReading");
  v6 = objc_alloc_init(MEMORY[0x1E0CB3958]);
  objc_msgSend(v6, "setLaunchPath:", CFSTR("/usr/local/bin/hpmtool"));
  v7 = CFSTR("--data=0x110B0402");
  if (v3)
    v7 = CFSTR("--data=0x110B0400");
  v10[0] = CFSTR("--command=DVEn");
  v10[1] = v7;
  objc_msgSend(v6, "setArguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2));
  objc_msgSend(v6, "setStandardOutput:", v4);
  objc_msgSend(v6, "launch");
  v8 = objc_msgSend(v5, "readDataToEndOfFile");
  objc_msgSend(v5, "closeFile");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
  NSLog(CFSTR("hpmtool returned:\n%@"), v9);

}

- (int)recordCallBackFunc:(unsigned int *)a3 AudioTimeStamp:(const AudioTimeStamp *)a4 busNum:(unsigned int)a5 numFrames:(unsigned int)a6 AudioBufferList:(AudioBufferList *)a7
{
  signed int v8;
  int pcmInputDataIndexInBytes;
  int pcmInputDataMaxSzInBytes;
  HalogenAudio *halogenAudioUnit;
  OSStatus v16;
  OSStatus v17;
  int pcmInputDataSampleCnt;
  int nMeasurementSamples;
  int v20;
  int v21;
  NSObject *v23;
  const char *v24;
  uint32_t v25;
  AudioBufferList ioData;
  uint8_t v27[4];
  int v28;
  uint8_t buf[8];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&ioData.mNumberBuffers = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&ioData.mBuffers[0].mNumberChannels = 0xAAAAAAAAAAAAAAAALL;
  v8 = self->_inputFrameSizeInBytes * a6;
  pcmInputDataMaxSzInBytes = self->_pcmInputDataMaxSzInBytes;
  pcmInputDataIndexInBytes = self->_pcmInputDataIndexInBytes;
  if (pcmInputDataMaxSzInBytes - pcmInputDataIndexInBytes < v8)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = a6;
    v30 = 1024;
    v31 = pcmInputDataMaxSzInBytes;
    v32 = 1024;
    v33 = pcmInputDataIndexInBytes;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenTypeC:recordCallback() insufficient space in pcmInputData buffer to render %d frames.  bufsize = %d idx=%d";
    v25 = 20;
LABEL_23:
    _os_log_impl(&dword_1D13BF000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
    return 0;
  }
  if (self->_isMeasurementDone)
    return 0;
  ioData.mNumberBuffers = 1;
  ioData.mBuffers[0].mData = (void *)(-[NSMutableData bytes](self->_pcmInputData, "bytes")
                                    + self->_pcmInputDataIndexInBytes);
  ioData.mBuffers[0].mDataByteSize = v8;
  halogenAudioUnit = self->_halogenAudioUnit;
  if (!halogenAudioUnit)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_WORD *)buf = 0;
    v23 = MEMORY[0x1E0C81028];
    v24 = "HalogenTypeC:Could not find a valid HalogenAudio instance.";
    v25 = 2;
    goto LABEL_23;
  }
  v16 = AudioUnitRender(-[HalogenAudio getAudioComponentInstance](halogenAudioUnit, "getAudioComponentInstance"), a3, a4, a5, a6, &ioData);
  if (v16)
  {
    v17 = v16;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v17;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:render failed osstatus=0x%x", buf, 8u);
    }
  }
  -[HalogenTypeC setPcmInputDataIndexInBytes:](self, "setPcmInputDataIndexInBytes:", (self->_pcmInputDataIndexInBytes + v8));
  -[HalogenTypeC setPcmInputDataSampleCnt:](self, "setPcmInputDataSampleCnt:", self->_pcmInputDataSampleCnt + a6);
  pcmInputDataSampleCnt = self->_pcmInputDataSampleCnt;
  nMeasurementSamples = self->_nMeasurementSamples;
  if (pcmInputDataSampleCnt >= nMeasurementSamples + self->_calibrationSampleOffsetInFrames)
  {
    if (!self->_isCalibrationDone)
    {
      self->_isCalibrationDone = 1;
      self->_measurementSampleOffsetInFrames = self->_nAceSettlingSamples + pcmInputDataSampleCnt;
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      if (self->_pinToMeasure == 4 && self->_isInternalBuild)
      {
        -[HalogenTypeC _runHPMTool:](self, "_runHPMTool:", 1, 0xAAAAAAAAAAAAAAAALL);
      }
      else
      {
        v20 = IOAccessoryManagerSetLDCM();
        if (v20)
        {
          v21 = v20;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v27 = 67109120;
            v28 = v21;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:IOAccessoryManagerSetLDCM failed with: 0x%x", v27, 8u);
          }
        }
      }
      pcmInputDataSampleCnt = self->_pcmInputDataSampleCnt;
      nMeasurementSamples = self->_nMeasurementSamples;
    }
    if (pcmInputDataSampleCnt >= nMeasurementSamples + self->_measurementSampleOffsetInFrames)
    {
      self->_isMeasurementDone = 1;
      -[NSCondition signal](self->_audioTimeoutCond, "signal");
    }
  }
  return 0;
}

- (int)playbackCallBackFunc:(unsigned int *)a3 AudioTimeStamp:(const AudioTimeStamp *)a4 busNum:(unsigned int)a5 numFrames:(unsigned int)a6 AudioBufferList:(AudioBufferList *)a7
{
  uint64_t v9;
  uint64_t pcmOutputDataIndexInBytes;
  unint64_t mNumberBuffers;
  uint64_t v12;
  unint64_t v13;
  int pcmOutputDataMaxSzInBytes;
  void **p_mData;
  unsigned int v16;
  size_t v17;

  v9 = -[NSMutableData bytes](self->_pcmOutputData, "bytes", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
  pcmOutputDataIndexInBytes = self->_pcmOutputDataIndexInBytes;
  mNumberBuffers = a7->mNumberBuffers;
  if ((_DWORD)mNumberBuffers)
  {
    v12 = v9;
    v13 = 0;
    pcmOutputDataMaxSzInBytes = self->_pcmOutputDataMaxSzInBytes;
    p_mData = &a7->mBuffers[0].mData;
    do
    {
      v16 = *((_DWORD *)p_mData - 1);
      if (pcmOutputDataMaxSzInBytes - (int)pcmOutputDataIndexInBytes >= v16)
        v17 = v16;
      else
        v17 = (pcmOutputDataMaxSzInBytes - pcmOutputDataIndexInBytes);
      if ((_DWORD)v17)
      {
        memcpy(*p_mData, (const void *)(v12 + self->_pcmOutputDataIndexInBytes), v17);
        pcmOutputDataIndexInBytes = (v17 + pcmOutputDataIndexInBytes);
        mNumberBuffers = a7->mNumberBuffers;
      }
      p_mData += 2;
      ++v13;
    }
    while (v13 < mNumberBuffers);
  }
  -[HalogenTypeC setPcmOutputDataIndexInBytes:](self, "setPcmOutputDataIndexInBytes:", pcmOutputDataIndexInBytes);
  return 0;
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
      v17 = "HalogenTypeC:Measurement did not complete... cannot save WAV file";
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
      v17 = "HalogenTypeC:CFURLCreateFromFileSystemRepresentation() returned NULL.";
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
  *(_QWORD *)&inStreamDesc.mFormatID = 0x96C70636DLL;
  v11 = ExtAudioFileCreateWithURL(v7, 0x57415645u, &inStreamDesc, 0, 1u, &outExtAudioFile);
  if (v11)
  {
    v18 = v11;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v23 = v18;
      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:AudioFileCreateWithURL() returned ostatus=0x%x", buf, 8u);
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

- (int)doLDCMMeasurement:(int)a3 isCalibrationNeeded:(BOOL)a4 isReceptacleEmpty:(BOOL)a5 isReceptacleWet:(BOOL)a6 withWetTransitionThreshold:(double)a7 withDryTransitionThreshold:(double)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v14;
  int v15;
  int v16;
  _DWORD v18[2];
  uint64_t v19;

  v10 = a6;
  v11 = a5;
  v12 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  self->_halogenResult = 11;
  self->_measurementInfoDefault.halogenResult = 11;
  -[HalogenTypeC _resetCalcValues](self, "_resetCalcValues", *(_QWORD *)&a3, a4);
  self->_ldcmState = 3;
  if ((_DWORD)v12 == 1)
  {
    v14 = 2;
    goto LABEL_7;
  }
  if ((_DWORD)v12 != 3)
  {
    v14 = 0;
LABEL_7:
    v15 = -[HalogenTypeC _doLDCMMeasurement:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:measurementType:](self, "_doLDCMMeasurement:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:measurementType:", v12, v11, v10, v14, a7, a8);
    if (v15)
    {
      v16 = v15;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 67109120;
        v18[1] = v16;
        _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:_doLDCMMeasurement failed (HalogenMeasurementStatus = 0x%x)", (uint8_t *)v18, 8u);
      }
    }
    else
    {
      -[NSMutableString setString:](self->_measurementInfoOutputString, "setString:", &stru_1E92146F8);
      -[HalogenTypeC _storeMeasurementData:measurementType:measurementInfo:halogenResult:](self, "_storeMeasurementData:measurementType:measurementInfo:halogenResult:", v12, v14, &self->_measurementInfoDefault, self->_halogenResult);
      -[NSMutableString appendString:](self->_measurementInfoOutputString, "appendString:", -[HalogenTypeC _buildMeasurementOutputString:](self, "_buildMeasurementOutputString:", &self->_measurementInfoDefault));
      return 0;
    }
    return v16;
  }
  if (self->_selfTestCapable)
  {
    self->_ldcmState = 4;
    v14 = 1;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18[0]) = 0;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:This device does not support self-test. Exiting...", (uint8_t *)v18, 2u);
  }
  return 9;
}

- (int)_doLDCMMeasurement:(int)a3 isReceptacleEmpty:(BOOL)a4 isReceptacleWet:(BOOL)a5 withWetTransitionThreshold:(double)a6 withDryTransitionThreshold:(double)a7 measurementType:(int)a8
{
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  double v15;
  int pinToMeasure;
  int v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
  int v23;
  int v25;
  NSObject *v26;
  const char *v27;
  unint64_t v28;
  uint8_t buf[4];
  _BYTE v30[14];
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&self->_pcmInputDataIndexInBytes = 0;
  self->_pcmOutputDataIndexInBytes = 0;
  *(_WORD *)&self->_isCalibrationDone = 0;
  if ((a3 - 5) > 0xFFFFFFFB)
  {
    v10 = *(_QWORD *)&a8;
    v11 = a5;
    v12 = a4;
    self->_pinToMeasure = a3;
    switch(a3)
    {
      case 1:
        v15 = 0.0;
        goto LABEL_8;
      case 2:
      case 3:
        v15 = 4.0e-11;
        goto LABEL_8;
      case 4:
        if (self->_isInternalBuild)
        {
          -[HalogenTypeC _runHPMTool:](self, "_runHPMTool:", 0, 0xAAAAAAAAAAAAAAAALL);
          v15 = 2.26e-10;
LABEL_8:
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            pinToMeasure = self->_pinToMeasure;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)v30 = "-[HalogenTypeC _doLDCMMeasurement:isReceptacleEmpty:isReceptacleWet:withWetTransitionThresh"
                             "old:withDryTransitionThreshold:measurementType:]";
            *(_WORD *)&v30[8] = 1024;
            *(_DWORD *)&v30[10] = a3;
            v31 = 1024;
            v32 = pinToMeasure;
            v33 = 1024;
            v34 = v10;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:%s pin:%d _pinToMeasure:%d measurementType:%d", buf, 0x1Eu);
          }
          v17 = IOAccessoryManagerSetLDCM();
          if (!v17)
          {
            if (-[HalogenTypeC powerState](self, "powerState"))
            {
              if (-[HalogenTypeC powerState](self, "powerState") == 1)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Waiting for kHalogenPowerStateAwake", buf, 2u);
                }
                -[NSCondition lock](-[HalogenTypeC powerStateCond](self, "powerStateCond", v28), "lock");
                v18 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
                if (-[HalogenTypeC powerState](self, "powerState") == 1)
                {
                  do
                    v19 = -[NSCondition waitUntilDate:](self->_powerStateCond, "waitUntilDate:", v18);
                  while (-[HalogenTypeC powerState](self, "powerState") == 1 && v19);
                }
                -[NSCondition unlock](-[HalogenTypeC powerStateCond](self, "powerStateCond"), "unlock");
              }
              if (-[HalogenTypeC powerState](self, "powerState", v28) == 2)
              {
                if (-[HalogenAudio startAudioUnit](self->_halogenAudioUnit, "startAudioUnit"))
                {
                  v20 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)self->_audioTimeoutInSec);
                  -[NSCondition lock](self->_audioTimeoutCond, "lock");
                  if (self->_isMeasurementDone)
                  {
                    -[NSCondition unlock](self->_audioTimeoutCond, "unlock");
                    -[HalogenAudio stopAudioUnit](self->_halogenAudioUnit, "stopAudioUnit");
LABEL_26:
                    IOAccessoryManagerLDCMGetMeasurementStatus();
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v30 = 789;
                      *(_WORD *)&v30[4] = 2048;
                      *(_QWORD *)&v30[6] = 0;
                      _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:%d:Measurement status:%llu", buf, 0x12u);
                    }
                    IOAccessoryManagerSetLDCM();
                    -[HalogenTypeC _doLDCMCalculation:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:pinParasitics:measurementType:](self, "_doLDCMCalculation:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:pinParasitics:measurementType:", v12, v11, v10, a6, a7, v15);
                    goto LABEL_29;
                  }
                  do
                  {
                    v21 = -[NSCondition waitUntilDate:](self->_audioTimeoutCond, "waitUntilDate:", v20);
                    v22 = v21;
                  }
                  while (!self->_isMeasurementDone && v21);
                  -[NSCondition unlock](self->_audioTimeoutCond, "unlock");
                  -[HalogenAudio stopAudioUnit](self->_halogenAudioUnit, "stopAudioUnit");
                  if (v22)
                    goto LABEL_26;
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Timeout!", buf, 2u);
                  }
                  v23 = 1;
                }
                else
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Could not start Halogen AudioUnit! Exiting ...", buf, 2u);
                  }
                  v23 = 3;
                }
                goto LABEL_33;
              }
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v26 = MEMORY[0x1E0C81028];
                v27 = "HalogenTypeC:abort measurement... system is not yet awake";
                goto LABEL_48;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v26 = MEMORY[0x1E0C81028];
              v27 = "HalogenTypeC:abort measurement... system going to sleep";
LABEL_48:
              _os_log_impl(&dword_1D13BF000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
            }
            v23 = 4;
            goto LABEL_33;
          }
          v25 = v17;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v30 = v25;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:IOAccessoryManagerSetLDCM() failed (ret = 0x%x)", buf, 8u);
          }
          v23 = 2;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Not an internal build, desired measurement pin SBU. Abort measurement.", buf, 2u);
          }
          v23 = 9;
        }
LABEL_33:
        -[HalogenAudio releaseAudioUnitInstance](self->_halogenAudioUnit, "releaseAudioUnitInstance", v28);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v30 = v23;
          _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Setting LDCM back to Idle with HalogenReturnStatus: %u", buf, 8u);
        }
        IOAccessoryManagerSetLDCM();
        goto LABEL_36;
      default:
        v15 = NAN;
        goto LABEL_8;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = a3;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Invalid pin to measure: %d. Exiting measurement...", buf, 8u);
  }
LABEL_29:
  -[HalogenAudio releaseAudioUnitInstance](self->_halogenAudioUnit, "releaseAudioUnitInstance", v28);
  v23 = 0;
LABEL_36:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = v23;
    _os_log_impl(&dword_1D13BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "HalogenTypeC:Exiting function with HalogenReturnStatus: %u", buf, 8u);
  }
  return v23;
}

- (BOOL)_doLDCMCalculation:(BOOL)a3 isReceptacleWet:(BOOL)a4 withWetTransitionThreshold:(double)a5 withDryTransitionThreshold:(double)a6 pinParasitics:(double)a7 measurementType:(int)a8
{
  uint64_t v8;
  _BOOL8 v12;
  _BOOL8 v13;
  uint64_t v15;
  double *v16;
  double *v17;
  uint64_t nMeasurementSamples;
  int v19;
  double *v20;
  double *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  int v31;
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
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;

  v8 = *(_QWORD *)&a8;
  v12 = a4;
  v13 = a3;
  v15 = -[NSMutableData bytes](self->_pcmInputData, "bytes");
  v16 = (double *)-[NSMutableData bytes](self->_voltageData, "bytes");
  v17 = (double *)-[NSMutableData bytes](self->_currentData, "bytes");
  -[HalogenTypeC _resetCalcValues](self, "_resetCalcValues");
  nMeasurementSamples = self->_nMeasurementSamples;
  if ((int)nMeasurementSamples >= 1)
  {
    v19 = 2 * self->_calibrationSampleOffsetInFrames;
    v20 = v16;
    v21 = v17;
    do
    {
      *v20++ = *(float *)(v15 + 4 * v19);
      *v21++ = *(float *)(v15 + 4 * (v19 + 1));
      v19 += 2;
      --nMeasurementSamples;
    }
    while (nMeasurementSamples);
  }
  v22 = -[HalogenCalcTypeC doCalibration:withCurrentData:](self->_halogenCalcTypeC, "doCalibration:withCurrentData:", self->_voltageData, self->_currentData);
  -[HalogenCalcTypeC calVoltageSNR](self->_halogenCalcTypeC, "calVoltageSNR");
  self->_calVoltageSNR = v23;
  -[HalogenCalcTypeC calCurrentSNR](self->_halogenCalcTypeC, "calCurrentSNR");
  self->_calCurrentSNR = v24;
  -[HalogenCalcTypeC calVoltageAmplitude](self->_halogenCalcTypeC, "calVoltageAmplitude");
  self->_calVoltageAmplitude = v25;
  -[HalogenCalcTypeC calCurrentAmplitude](self->_halogenCalcTypeC, "calCurrentAmplitude");
  self->_calCurrentAmplitude = v26;
  -[HalogenCalcTypeC voltageGainCorrection](self->_halogenCalcTypeC, "voltageGainCorrection");
  self->_voltageGainCorrection = v27;
  -[HalogenCalcTypeC currentGainCorrection](self->_halogenCalcTypeC, "currentGainCorrection");
  self->_currentGainCorrection = v28;
  -[HalogenCalcTypeC currentPhaseCompensation](self->_halogenCalcTypeC, "currentPhaseCompensation");
  self->_currentPhaseCompensation = v29;
  if ((_DWORD)v22)
  {
    NSLog(CFSTR("ERROR: calibration not successful. Result: x%x"), v22);
    v32 = 11;
  }
  else
  {
    -[HalogenTypeC _writeCalResults:](self, "_writeCalResults:", CFSTR("/var/logs/calibrationData.plist"));
    v30 = self->_nMeasurementSamples;
    if ((int)v30 >= 1)
    {
      v31 = 2 * self->_measurementSampleOffsetInFrames;
      do
      {
        *v16++ = *(float *)(v15 + 4 * v31);
        *v17++ = *(float *)(v15 + 4 * (v31 + 1));
        v31 += 2;
        --v30;
      }
      while (v30);
    }
    v32 = -[HalogenCalcTypeC doLiquidDetection:withCurrentData:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:pinParasitics:measurementType:](self->_halogenCalcTypeC, "doLiquidDetection:withCurrentData:isReceptacleEmpty:isReceptacleWet:withWetTransitionThreshold:withDryTransitionThreshold:pinParasitics:measurementType:", self->_voltageData, self->_currentData, v13, v12, v8, a5, a6, a7);
    -[HalogenCalcTypeC goertzelImpedance](self->_halogenCalcTypeC, "goertzelImpedance");
    self->_goertzelImpedance = v33;
    -[HalogenCalcTypeC goertzelPhase](self->_halogenCalcTypeC, "goertzelPhase");
    self->_goertzelPhase = v34;
    -[HalogenCalcTypeC compensatedImpedance](self->_halogenCalcTypeC, "compensatedImpedance");
    self->_compensatedImpedance = v35;
    -[HalogenCalcTypeC compensatedPhase](self->_halogenCalcTypeC, "compensatedPhase");
    self->_compensatedPhase = v36;
    -[HalogenCalcTypeC resistanceInOhms](self->_halogenCalcTypeC, "resistanceInOhms");
    self->_resistanceInOhms = v37;
    -[HalogenCalcTypeC capacitanceInNanoF](self->_halogenCalcTypeC, "capacitanceInNanoF");
    self->_capacitanceInNanoF = v38;
    -[HalogenCalcTypeC measurementVoltageSignalLevel](self->_halogenCalcTypeC, "measurementVoltageSignalLevel");
    self->_measurementVoltageSignalLevel = v39;
    -[HalogenCalcTypeC measurementVoltageNoiseLevel](self->_halogenCalcTypeC, "measurementVoltageNoiseLevel");
    self->_measurementVoltageNoiseLevel = v40;
    -[HalogenCalcTypeC measurementVoltageSNR](self->_halogenCalcTypeC, "measurementVoltageSNR");
    self->_measurementVoltageSNR = v41;
    -[HalogenCalcTypeC measurementCurrentSignalLevel](self->_halogenCalcTypeC, "measurementCurrentSignalLevel");
    self->_measurementCurrentSignalLevel = v42;
    -[HalogenCalcTypeC measurementCurrentNoiseLevel](self->_halogenCalcTypeC, "measurementCurrentNoiseLevel");
    self->_measurementCurrentNoiseLevel = v43;
    -[HalogenCalcTypeC measurementCurrentSNR](self->_halogenCalcTypeC, "measurementCurrentSNR");
    self->_measurementCurrentSNR = v44;
    -[HalogenCalcTypeC measurementVoltageAmplitude](self->_halogenCalcTypeC, "measurementVoltageAmplitude");
    self->_measurementVoltageAmplitude = v45;
    -[HalogenCalcTypeC measurementCurrentAmplitude](self->_halogenCalcTypeC, "measurementCurrentAmplitude");
    self->_measurementCurrentAmplitude = v46;
    -[HalogenCalcTypeC measurementVoltagePhase](self->_halogenCalcTypeC, "measurementVoltagePhase");
    self->_measurementVoltagePhase = v47;
    -[HalogenCalcTypeC measurementCurrentPhase](self->_halogenCalcTypeC, "measurementCurrentPhase");
    self->_measurementCurrentPhase = v48;
    -[HalogenCalcTypeC loadImpedanceInOhms](self->_halogenCalcTypeC, "loadImpedanceInOhms");
    self->_measurementLoadImpedanceMagnitude = v49;
    -[HalogenCalcTypeC loadPhase](self->_halogenCalcTypeC, "loadPhase");
    self->_measurementLoadImpedancePhase = v50;
  }
  self->_halogenResult = v32;
  if ((v22 - 1) <= 2)
    self->_halogenResult = dword_1D13E7E44[(int)v22 - 1];
  return 1;
}

- (BOOL)setMitigations:(BOOL)a3
{
  int v3;
  _BOOL4 v4;
  NSObject *v5;
  const char *v6;
  uint32_t v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = IOAccessoryManagerLDCMEnableMitigations();
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v4)
      return v3 == 0;
    v9[0] = 67109120;
    v9[1] = v3;
    v5 = MEMORY[0x1E0C81028];
    v6 = "HalogenTypeC:ERROR: Could not set EnableMitigations. %d";
    v7 = 8;
    goto LABEL_4;
  }
  if (v4)
  {
    LOWORD(v9[0]) = 0;
    v5 = MEMORY[0x1E0C81028];
    v6 = "HalogenTypeC:Mitigations Enabled: Turning off Type-C Port.";
    v7 = 2;
LABEL_4:
    _os_log_impl(&dword_1D13BF000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)v9, v7);
  }
  return v3 == 0;
}

- (BOOL)setLiquidDetected:(BOOL)a3
{
  _BOOL4 v3;
  int v4;
  _BOOL4 v5;
  NSObject *v6;
  const char *v7;
  int v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v4 = IOAccessoryManagerLDCMSetLiquidDetected();
  v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v5)
      return v4 == 0;
    v9 = 67109120;
    v10 = v4;
    v6 = MEMORY[0x1E0C81028];
    v7 = "HalogenTypeC:ERROR: Could not set LiquidDetected. %d";
    goto LABEL_4;
  }
  if (v5)
  {
    v9 = 67109120;
    v10 = v3;
    v6 = MEMORY[0x1E0C81028];
    v7 = "HalogenTypeC:Liquid Detected Set:%d.";
LABEL_4:
    _os_log_impl(&dword_1D13BF000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 8u);
  }
  return v4 == 0;
}

- (BOOL)_writeCalResults:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_voltageGainCorrection);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_currentGainCorrection);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_currentPhaseCompensation);
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("VoltageGainCorrection"));
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("CurrentGainCorrection"));
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("CurrentPhaseCompensation"));
  v9 = objc_msgSend(v5, "writeToFile:atomically:", a3, 1);

  if ((v9 & 1) == 0)
    NSLog(CFSTR("ERROR: Could not write calibration results to disc."));
  return v9;
}

- (BOOL)_readCalibrationParameters:(id)a3
{
  void *v4;
  double v10;
  double v11;
  double v12;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", a3);
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&self->_voltageGainCorrection = _Q0;
  self->_currentPhaseCompensation = 0.0;
  if (objc_msgSend(v4, "objectForKey:", CFSTR("VoltageGainCorrection")))
  {
    objc_msgSend((id)objc_msgSend(v4, "objectForKey:", CFSTR("VoltageGainCorrection")), "doubleValue");
    self->_voltageGainCorrection = v10;
  }
  else
  {
    NSLog(CFSTR("Could not find Voltage Gain Correction Value. Falling back to default value of 1.0."));
  }
  if (objc_msgSend(v4, "objectForKey:", CFSTR("CurrentGainCorrection")))
  {
    objc_msgSend((id)objc_msgSend(v4, "objectForKey:", CFSTR("CurrentGainCorrection")), "doubleValue");
    self->_currentGainCorrection = v11;
  }
  else
  {
    NSLog(CFSTR("Could not find Current Gain Correction Value. Falling back to default value of 1.0."));
  }
  if (objc_msgSend(v4, "objectForKey:", CFSTR("CurrentPhaseCompensation")))
  {
    objc_msgSend((id)objc_msgSend(v4, "objectForKey:", CFSTR("CurrentPhaseCompensation")), "doubleValue");
    self->_currentPhaseCompensation = v12;
  }
  else
  {
    NSLog(CFSTR("Could not find Current Phase Compensation Value. Falling back to default value of 0.0."));
  }
  return 1;
}

- (void)setWetTooLong:(BOOL)a3
{
  HalogenCalcTypeC *halogenCalcTypeC;

  self->_wetTooLong = a3;
  halogenCalcTypeC = self->_halogenCalcTypeC;
  if (halogenCalcTypeC)
    -[HalogenCalcTypeC setWetTooLong:](halogenCalcTypeC, "setWetTooLong:");
}

- (id)_buildMeasurementOutputString:(id *)a3
{
  id v5;
  void *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n%@\n%@\n%@\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n%.12f\n"), objc_msgSend(v5, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date")), -[HalogenTypeC _getHalogenMeasurementTypeString:](self, "_getHalogenMeasurementTypeString:", a3->var0), -[HalogenTypeC _getLDCMPinString:](self, "_getLDCMPinString:", a3->var1), -[HalogenTypeC getHalogenResultString:](self, "getHalogenResultString:", a3->var2), *(_QWORD *)&a3->var3, *(_QWORD *)&a3->var4, *(_QWORD *)&a3->var5, *(_QWORD *)&a3->var16, *(_QWORD *)&a3->var17, *(_QWORD *)&a3->var18, a3->var19 * 10000000.0, *(_QWORD *)&a3->var20, *(_QWORD *)&a3->var21,
                 *(_QWORD *)&a3->var10,
                 *(_QWORD *)&a3->var11,
                 *(_QWORD *)&a3->var14,
                 *(_QWORD *)&a3->var15,
                 *(_QWORD *)&a3->var22,
                 *(_QWORD *)&a3->var23);

  return v6;
}

- (id)_buildVerboseMeasurementOutputString:(id *)a3
{
  id v5;
  void *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TimeStamp,%@\nMeasurementType,%@\nMeasurementPin,%@\nMeasurementResult,%@\nVolGainCorrection,%.12f\nCurGainCorrection,%.12f\nCurPhaseCompensation,%.12f\nVolSNR,%.12f\nCurSNR,%.12f\nVolAmplitude,%.12f\nCurAmplitudeMicroA,%.12f\nVolPhase,%.12f\nCurPhase,%.12f\nGoertzelImpedance,%.12f\nGoertzelPhase,%.12f\nResistanceInOhms,%.12f\nCapacitanceInNanoF,%.12f\nLoadImpedenceMagnitude,%.12f\nLoadImpedancePhase,%.12f\n"), objc_msgSend(v5, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date")), -[HalogenTypeC _getHalogenMeasurementTypeString:](self, "_getHalogenMeasurementTypeString:", a3->var0), -[HalogenTypeC _getLDCMPinString:](self, "_getLDCMPinString:", a3->var1), -[HalogenTypeC getHalogenResultString:](self, "getHalogenResultString:", a3->var2), *(_QWORD *)&a3->var3, *(_QWORD *)&a3->var4, *(_QWORD *)&a3->var5, *(_QWORD *)&a3->var16, *(_QWORD *)&a3->var17, *(_QWORD *)&a3->var18, a3->var19 * 10000000.0, *(_QWORD *)&a3->var20, *(_QWORD *)&a3->var21,
                 *(_QWORD *)&a3->var10,
                 *(_QWORD *)&a3->var11,
                 *(_QWORD *)&a3->var14,
                 *(_QWORD *)&a3->var15,
                 *(_QWORD *)&a3->var22,
                 *(_QWORD *)&a3->var23);

  return v6;
}

- (id)getVerboseMeasurementOutputString
{
  return (id)objc_msgSend(-[HalogenTypeC _buildVerboseMeasurementOutputString:](self, "_buildVerboseMeasurementOutputString:", &self->_measurementInfoDefault), "copy");
}

- (id)getMeasurementOutputString
{
  return self->_measurementInfoOutputString;
}

- (void)_storeMeasurementData:(int)a3 measurementType:(int)a4 measurementInfo:(id *)a5 halogenResult:(int)a6
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  a5->var0 = a4;
  a5->var1 = a3;
  a5->var2 = a6;
  -[HalogenTypeC voltageGainCorrection](self, "voltageGainCorrection");
  a5->var3 = v8;
  -[HalogenTypeC currentGainCorrection](self, "currentGainCorrection");
  a5->var4 = v9;
  -[HalogenTypeC calVoltageSNR](self, "calVoltageSNR");
  a5->var6 = v10;
  -[HalogenTypeC calCurrentSNR](self, "calCurrentSNR");
  a5->var7 = v11;
  -[HalogenTypeC calVoltageAmplitude](self, "calVoltageAmplitude");
  a5->var8 = v12;
  -[HalogenTypeC calCurrentAmplitude](self, "calCurrentAmplitude");
  a5->var9 = v13;
  -[HalogenTypeC currentPhaseCompensation](self, "currentPhaseCompensation");
  a5->var5 = v14;
  -[HalogenTypeC measurementVoltageSNR](self, "measurementVoltageSNR");
  a5->var16 = v15;
  -[HalogenTypeC measurementCurrentSNR](self, "measurementCurrentSNR");
  a5->var17 = v16;
  -[HalogenTypeC measurementVoltageAmplitude](self, "measurementVoltageAmplitude");
  a5->var18 = v17;
  -[HalogenTypeC measurementCurrentAmplitude](self, "measurementCurrentAmplitude");
  a5->var19 = v18;
  -[HalogenTypeC measurementVoltagePhase](self, "measurementVoltagePhase");
  a5->var20 = v19;
  -[HalogenTypeC measurementCurrentPhase](self, "measurementCurrentPhase");
  a5->var21 = v20;
  -[HalogenTypeC goertzelImpedance](self, "goertzelImpedance");
  a5->var10 = v21;
  -[HalogenTypeC goertzelPhase](self, "goertzelPhase");
  a5->var11 = v22;
  -[HalogenTypeC resistanceInOhms](self, "resistanceInOhms");
  a5->var14 = v23;
  -[HalogenTypeC capacitanceInNanoF](self, "capacitanceInNanoF");
  a5->var15 = v24;
  -[HalogenTypeC measurementLoadImpedanceMagnitude](self, "measurementLoadImpedanceMagnitude");
  a5->var22 = v25;
  -[HalogenTypeC measurementLoadImpedancePhase](self, "measurementLoadImpedancePhase");
  a5->var23 = v26;
}

- (id)getHalogenResultString:(int)a3
{
  if (a3 > 0xB)
    return CFSTR("Unknown");
  else
    return off_1E9214140[a3];
}

- (id)_getHalogenMeasurementTypeString:(int)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E92141A0[a3];
}

- (id)_getLDCMPinString:(int)a3
{
  if (a3 > 4)
    return CFSTR("Undefined");
  else
    return off_1E92141B8[a3];
}

- (void)_resetCalcValues
{
  self->_calVoltageSNR = 0.0;
  self->_measurementVoltageSNR = 0.0;
  self->_measurementCurrentSNR = 0.0;
  self->_currentGainCorrection = 0.0;
  self->_currentPhaseCompensation = 0.0;
  self->_voltageGainCorrection = 0.0;
  *(_OWORD *)&self->_calCurrentSNR = 0u;
  *(_OWORD *)&self->_calCurrentAmplitude = 0u;
  *(_OWORD *)&self->_goertzelPhase = 0u;
  *(_OWORD *)&self->_compensatedPhase = 0u;
  self->_capacitanceInNanoF = 0.0;
  *(_OWORD *)&self->_measurementVoltageAmplitude = 0u;
  *(_OWORD *)&self->_measurementVoltagePhase = 0u;
  *(_OWORD *)&self->_measurementLoadImpedanceMagnitude = 0u;
}

- ($DE2CA4548F4C2DB4D89410195F9427A4)getMeasurementInfo
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  retstr->var23 = self[3].var23;
  v3 = *(_OWORD *)&self[3].var19;
  *(_OWORD *)&retstr->var17 = *(_OWORD *)&self[3].var17;
  *(_OWORD *)&retstr->var19 = v3;
  *(_OWORD *)&retstr->var21 = *(_OWORD *)&self[3].var21;
  v4 = *(_OWORD *)&self[3].var11;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self[3].var9;
  *(_OWORD *)&retstr->var11 = v4;
  v5 = *(_OWORD *)&self[3].var15;
  *(_OWORD *)&retstr->var13 = *(_OWORD *)&self[3].var13;
  *(_OWORD *)&retstr->var15 = v5;
  v6 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var0;
  *(_OWORD *)&retstr->var3 = v6;
  v7 = *(_OWORD *)&self[3].var7;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[3].var5;
  *(_OWORD *)&retstr->var7 = v7;
  return self;
}

- (BOOL)isHWSelfTestCapable
{
  return self->_selfTestCapable;
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

- (double)calVoltageAmplitude
{
  return self->_calVoltageAmplitude;
}

- (double)calCurrentAmplitude
{
  return self->_calCurrentAmplitude;
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

- (double)measurementVoltageAmplitude
{
  return self->_measurementVoltageAmplitude;
}

- (double)measurementCurrentAmplitude
{
  return self->_measurementCurrentAmplitude;
}

- (double)measurementVoltagePhase
{
  return self->_measurementVoltagePhase;
}

- (double)measurementCurrentPhase
{
  return self->_measurementCurrentPhase;
}

- (double)measurementLoadImpedanceMagnitude
{
  return self->_measurementLoadImpedanceMagnitude;
}

- (double)measurementLoadImpedancePhase
{
  return self->_measurementLoadImpedancePhase;
}

- (BOOL)wetTooLong
{
  return self->_wetTooLong;
}

- (int)halogenResult
{
  return self->_halogenResult;
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

- (HalogenAudio)halogenAudioUnit
{
  return self->_halogenAudioUnit;
}

- (void)setHalogenAudioUnit:(id)a3
{
  self->_halogenAudioUnit = (HalogenAudio *)a3;
}

- (int)warmupTimeInMs
{
  return self->_warmupTimeInMs;
}

- (void)setWarmupTimeInMs:(int)a3
{
  self->_warmupTimeInMs = a3;
}

- (int)AceSettlingTimeInMs
{
  return self->_AceSettlingTimeInMs;
}

- (void)setAceSettlingTimeInMs:(int)a3
{
  self->_AceSettlingTimeInMs = a3;
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

- (int)nAceSettlingSamples
{
  return self->_nAceSettlingSamples;
}

- (void)setNAceSettlingSamples:(int)a3
{
  self->_nAceSettlingSamples = a3;
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

- (unsigned)maxOutputAmplitude
{
  return self->_maxOutputAmplitude;
}

- (unsigned)signalOffset
{
  return self->_signalOffset;
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

- (BOOL)selfTestCapable
{
  return self->_selfTestCapable;
}

- (void)setSelfTestCapable:(BOOL)a3
{
  self->_selfTestCapable = a3;
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

- (HalogenCalcTypeC)halogenCalcTypeC
{
  return self->_halogenCalcTypeC;
}

- (void)setHalogenCalcTypeC:(id)a3
{
  self->_halogenCalcTypeC = (HalogenCalcTypeC *)a3;
}

- ($DE2CA4548F4C2DB4D89410195F9427A4)measurementInfoDefault
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  retstr->var23 = self[3].var23;
  v3 = *(_OWORD *)&self[3].var19;
  *(_OWORD *)&retstr->var17 = *(_OWORD *)&self[3].var17;
  *(_OWORD *)&retstr->var19 = v3;
  *(_OWORD *)&retstr->var21 = *(_OWORD *)&self[3].var21;
  v4 = *(_OWORD *)&self[3].var11;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self[3].var9;
  *(_OWORD *)&retstr->var11 = v4;
  v5 = *(_OWORD *)&self[3].var15;
  *(_OWORD *)&retstr->var13 = *(_OWORD *)&self[3].var13;
  *(_OWORD *)&retstr->var15 = v5;
  v6 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var0;
  *(_OWORD *)&retstr->var3 = v6;
  v7 = *(_OWORD *)&self[3].var7;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[3].var5;
  *(_OWORD *)&retstr->var7 = v7;
  return self;
}

- (void)setMeasurementInfoDefault:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var3;
  v5 = *(_OWORD *)&a3->var7;
  *(_OWORD *)&self->_measurementInfoDefault.currentPhaseCompensation = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_measurementInfoDefault.calCurrentSNR = v5;
  *(_OWORD *)&self->_measurementInfoDefault.type = v3;
  *(_OWORD *)&self->_measurementInfoDefault.voltageGainCorrection = v4;
  v6 = *(_OWORD *)&a3->var9;
  v7 = *(_OWORD *)&a3->var11;
  v8 = *(_OWORD *)&a3->var15;
  *(_OWORD *)&self->_measurementInfoDefault.compensatedPhase = *(_OWORD *)&a3->var13;
  *(_OWORD *)&self->_measurementInfoDefault.capacitanceInNanoF = v8;
  *(_OWORD *)&self->_measurementInfoDefault.calCurrentAmplitude = v6;
  *(_OWORD *)&self->_measurementInfoDefault.goertzelPhase = v7;
  v9 = *(_OWORD *)&a3->var17;
  v10 = *(_OWORD *)&a3->var19;
  v11 = *(_OWORD *)&a3->var21;
  self->_measurementInfoDefault.measurementLoadImpedancePhase = a3->var23;
  *(_OWORD *)&self->_measurementInfoDefault.measurementCurrentAmplitude = v10;
  *(_OWORD *)&self->_measurementInfoDefault.measurementCurrentPhase = v11;
  *(_OWORD *)&self->_measurementInfoDefault.measurementCurrentSNR = v9;
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

- (BOOL)measureSBU
{
  return self->_measureSBU;
}

- (void)setMeasureSBU:(BOOL)a3
{
  self->_measureSBU = a3;
}

- (int)pinToMeasure
{
  return self->_pinToMeasure;
}

- (void)setPinToMeasure:(int)a3
{
  self->_pinToMeasure = a3;
}

- (int)ldcmState
{
  return self->_ldcmState;
}

- (void)setLdcmState:(int)a3
{
  self->_ldcmState = a3;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (NSMutableString)measurementInfoOutputString
{
  return self->_measurementInfoOutputString;
}

- (void)setMeasurementInfoOutputString:(id)a3
{
  self->_measurementInfoOutputString = (NSMutableString *)a3;
}

- (NSMutableString)measurementInfoAcchalogenOutputString
{
  return self->_measurementInfoAcchalogenOutputString;
}

- (void)setMeasurementInfoAcchalogenOutputString:(id)a3
{
  self->_measurementInfoAcchalogenOutputString = (NSMutableString *)a3;
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

@end
