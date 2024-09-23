@implementation VCAudioIO

+ (id)defaultControllerForAudioType:(unsigned int)a3 forDirection:(unsigned __int8)a4 forOperatingMode:(int)a5 remoteDeviceInfo:(id)a6
{
  uint64_t v6;
  id v8;
  VCSystemAudioCaptureController *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)&a3;
  switch(a3)
  {
    case 0u:
      goto LABEL_9;
    case 1u:
    case 5u:
      if (a4 == 2 && a5 == 12)
      {
        if (!+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass"))
        {
          v8 = +[VCAudioManager sharedSystemAudioInputInstance](VCAudioManager, "sharedSystemAudioInputInstance");
          goto LABEL_10;
        }
        goto LABEL_17;
      }
      if (a4 == 2)
      {
LABEL_17:
        v12 = 0xFFFFFFFF00000000;
        DWORD1(v13) = -1431655766;
        LODWORD(v13) = +[VCAudioIO systemAudioCaptureSourceForAudioType:](VCAudioIO, "systemAudioCaptureSourceForAudioType:", v6);
        *((_QWORD *)&v13 + 1) = a6;
        goto LABEL_18;
      }
      if (a4 == 1)
      {
        v8 = +[VCAudioManager sharedSystemAudioOutputInstance](VCAudioManager, "sharedSystemAudioOutputInstance");
LABEL_10:
        v9 = (VCSystemAudioCaptureController *)v8;
      }
      else
      {
LABEL_21:
        v9 = 0;
      }
      return v9;
    case 2u:
      if (a4 == 1)
      {
LABEL_9:
        v8 = +[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance");
        goto LABEL_10;
      }
      if (a4 != 2)
        goto LABEL_21;
      v13 = 0uLL;
      v12 = 1uLL;
LABEL_18:
      v9 = -[VCSystemAudioCaptureController initWithConfig:]([VCSystemAudioCaptureController alloc], "initWithConfig:", &v12);
      return v9;
    case 3u:
      if (a4 != 2)
        goto LABEL_21;
      v12 = 0u;
      v13 = 0u;
      v10 = -3;
      goto LABEL_15;
    case 4u:
      if (a4 != 2)
        goto LABEL_21;
      v12 = 0u;
      v13 = 0u;
      v10 = -2;
LABEL_15:
      DWORD1(v12) = v10;
      goto LABEL_18;
    default:
      goto LABEL_21;
  }
}

+ (unsigned)systemAudioCaptureSourceForAudioType:(unsigned int)a3
{
  unsigned int v5;
  unsigned int IntValueForKey;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unsigned int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = 1;
  if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableAudioHALPluginCaptureSource"), 1))
  {
    v5 = a3 == 5 ? 3 : 1;
    IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("forceSystemAudioCaptureSource"), 0);
    if (IntValueForKey)
      v5 = IntValueForKey;
  }
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315906;
        v17 = v8;
        v18 = 2080;
        v19 = "+[VCAudioIO systemAudioCaptureSourceForAudioType:]";
        v20 = 1024;
        v21 = 296;
        v22 = 1024;
        LODWORD(v23) = v5;
        v10 = " [%s] %s:%d Configuring system audio captureSource=%d";
        v11 = v9;
        v12 = 34;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136316418;
        v17 = v13;
        v18 = 2080;
        v19 = "+[VCAudioIO systemAudioCaptureSourceForAudioType:]";
        v20 = 1024;
        v21 = 296;
        v22 = 2112;
        v23 = v7;
        v24 = 2048;
        v25 = a1;
        v26 = 1024;
        v27 = v5;
        v10 = " [%s] %s:%d %@(%p) Configuring system audio captureSource=%d";
        v11 = v14;
        v12 = 54;
        goto LABEL_17;
      }
    }
  }
  return v5;
}

+ (id)controllerForDeviceRole:(int)a3 audioType:(unsigned int)a4 direction:(unsigned __int8)a5 operatingMode:(int)a6 streamInputID:(int64_t)a7 streamToken:(int64_t)a8 networkClockID:(unint64_t)a9 remoteDeviceInfo:(id)a10
{
  const __CFString *v12;
  int v13;
  id result;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BYTE v33[10];
  id v34;
  __int16 v35;
  int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a3 < 9)
  {
    v13 = a5;
    switch(a3)
    {
      case 0:
        result = +[VCAudioIO defaultControllerForAudioType:forDirection:forOperatingMode:remoteDeviceInfo:](VCAudioIO, "defaultControllerForAudioType:forDirection:forOperatingMode:remoteDeviceInfo:", *(_QWORD *)&a4, a5, *(_QWORD *)&a6, a10, a7, a8);
        if (!result)
          goto LABEL_24;
        break;
      case 1:
      case 2:
      case 6:
        result = +[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance");
        if (!result)
          goto LABEL_24;
        break;
      case 3:
        result = +[VCAudioRelayIOController sharedInstanceRemoteFacing](VCAudioRelayIOController, "sharedInstanceRemoteFacing");
        if (!result)
          goto LABEL_24;
        break;
      case 4:
        result = +[VCAudioRelayIOController sharedInstanceClientFacing](VCAudioRelayIOController, "sharedInstanceClientFacing");
        if (!result)
          goto LABEL_24;
        break;
      case 5:
        result = +[VCAudioRelayIOController sharedInstanceSafeViewRemoteFacing](VCAudioRelayIOController, "sharedInstanceSafeViewRemoteFacing");
        if (!result)
          goto LABEL_24;
        break;
      case 7:
      case 8:
        result = -[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]([VCStreamIOAudioController alloc], "initWithStreamInputID:streamToken:networkClockID:", a7, a8, a9);
        if (!result)
          goto LABEL_24;
        break;
      default:
LABEL_24:
        if ((id)objc_opt_class() == a1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v26 = 136316418;
              v27 = v22;
              v28 = 2080;
              v29 = "+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:netw"
                    "orkClockID:remoteDeviceInfo:]";
              v30 = 1024;
              v31 = 338;
              v32 = 1024;
              *(_DWORD *)v33 = a3;
              *(_WORD *)&v33[4] = 1024;
              *(_DWORD *)&v33[6] = a4;
              LOWORD(v34) = 1024;
              *(_DWORD *)((char *)&v34 + 2) = v13;
              v18 = " [%s] %s:%d Failed to create controller for deviceRole=%d audioType=%d direction=%d";
              v19 = v23;
              v20 = 46;
              goto LABEL_36;
            }
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v21 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
          else
            v21 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v24 = VRTraceErrorLogLevelToCSTR();
            v25 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v26 = 136316930;
              v27 = v24;
              v28 = 2080;
              v29 = "+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:netw"
                    "orkClockID:remoteDeviceInfo:]";
              v30 = 1024;
              v31 = 338;
              v32 = 2112;
              *(_QWORD *)v33 = v21;
              *(_WORD *)&v33[8] = 2048;
              v34 = a1;
              v35 = 1024;
              v36 = a3;
              v37 = 1024;
              v38 = a4;
              v39 = 1024;
              v40 = v13;
              v18 = " [%s] %s:%d %@(%p) Failed to create controller for deviceRole=%d audioType=%d direction=%d";
              v19 = v25;
              v20 = 66;
              goto LABEL_36;
            }
          }
        }
        return 0;
    }
  }
  else
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          +[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v26 = 136316418;
          v27 = v16;
          v28 = 2080;
          v29 = "+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkC"
                "lockID:remoteDeviceInfo:]";
          v30 = 1024;
          v31 = 309;
          v32 = 2112;
          *(_QWORD *)v33 = v12;
          *(_WORD *)&v33[8] = 2048;
          v34 = a1;
          v35 = 1024;
          v36 = a3;
          v18 = " [%s] %s:%d %@(%p) No controller found for device role:%d";
          v19 = v17;
          v20 = 54;
LABEL_36:
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v26, v20);
        }
      }
    }
    return 0;
  }
  return result;
}

- (void)setUpAndTransferDelegateContext:(const tagVCAudioIODelegateContext *)a3 toDestinationContext:(tagVCAudioIODelegateContext *)a4
{
  VCAudioCaptionsCoordinator *captionsCoordinator;
  VCAudioCaptionsCoordinator *v8;
  __int128 v9;
  _BYTE v10[56];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    *(_OWORD *)&a4->clientCallback = *(_OWORD *)&a3->clientCallback;
    captionsCoordinator = a3->captionsCoordinator;
    if (captionsCoordinator)
    {
      v8 = captionsCoordinator;
      a4->captionsCoordinator = v8;
      a4->captionsToken = a3->captionsToken;
      a4->captionsUseSecondaryThread = a3->captionsUseSecondaryThread;
      memset(&v10[16], 170, 40);
      *(_OWORD *)v10 = xmmword_1D910D950;
      v9 = *(_OWORD *)&self->_clientFormat.format.mSampleRate;
      *(_OWORD *)&v10[24] = *(_OWORD *)&self->_clientFormat.format.mBytesPerPacket;
      *(_QWORD *)v10 = a3->captionsToken;
      *(_QWORD *)&v10[40] = *(_QWORD *)&self->_clientFormat.format.mBitsPerChannel;
      *(_OWORD *)&v10[8] = v9;
      v10[48] = a3->captionsUseSecondaryThread;
      -[VCAudioCaptionsCoordinator registerStreamWithConfig:](v8, "registerStreamWithConfig:", v10);
    }
    a4->injector = a3->injector;
  }
}

- (VCAudioIO)initWithConfiguration:(const tagVCAudioIOConfiguration *)a3
{
  VCAudioIO *v4;
  VCAudioIO *v5;
  uint64_t var3;
  uint64_t var2;
  VCAudioIOControllerControl *v8;
  __int128 v9;
  VCAudioIOControllerClient *v10;
  VCAudioIOControllerClient *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCAudioIO *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)VCAudioIO;
  v4 = -[VCAudioIO init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    var2 = a3->var2;
    var3 = a3->var3;
    v4->_audioType = a3->var4;
    v8 = (VCAudioIOControllerControl *)+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:](VCAudioIO, "controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:", var3, a3->var16, a3->var21);
    v5->_audioIOController = v8;
    if (v8)
    {
      -[VCAudioIO setupClientFormatWithConfiguration:](v5, "setupClientFormatWithConfiguration:", a3);
      v9 = *(_OWORD *)&v5->_clientFormat.format.mBytesPerPacket;
      *(_OWORD *)&v5->_controllerFormat.format.mSampleRate = *(_OWORD *)&v5->_clientFormat.format.mSampleRate;
      *(_OWORD *)&v5->_controllerFormat.format.mBytesPerPacket = v9;
      *(_OWORD *)&v5->_controllerFormat.format.mBitsPerChannel = *(_OWORD *)&v5->_clientFormat.format.mBitsPerChannel;
      v10 = [VCAudioIOControllerClient alloc];
      BYTE1(v17) = a3->var17;
      LOBYTE(v17) = a3->var18;
      BYTE4(v16) = a3->var11;
      LODWORD(v16) = a3->var8;
      v11 = -[VCAudioIOControllerClient initWithDelegate:audioSessionId:channelIndex:sourceContext:sourceProcess:sinkContext:sinkProcess:clientPid:isPrewarmingClient:spatialToken:isVoiceActivityEnabled:isMediaPriorityEnabled:](v10, "initWithDelegate:audioSessionId:channelIndex:sourceContext:sourceProcess:sinkContext:sinkProcess:clientPid:isPrewarmingClient:spatialToken:isVoiceActivityEnabled:isMediaPriorityEnabled:", v5, a3->var0, a3->var1, &v5->_sourceData, VCAudioIO_PullAudioSamples, &v5->_sinkData, VCAudioIO_PushAudioSamples, v16, a3->var12, v17);
      v5->_controllerClient = v11;
      -[VCAudioIOControllerClient setAllowAudioRecording:](v11, "setAllowAudioRecording:", a3->var6);
      -[VCAudioIOControllerClient setDeviceRole:](v5->_controllerClient, "setDeviceRole:", var3);
      -[VCAudioIOControllerClient setOperatingMode:](v5->_controllerClient, "setOperatingMode:", var2);
      -[VCAudioIOControllerClient setDirection:](v5->_controllerClient, "setDirection:", a3->var5);
      -[VCAudioIOControllerClient setNetworkUplinkClockUsesBaseband:](v5->_controllerClient, "setNetworkUplinkClockUsesBaseband:", a3->var22);
      -[VCAudioIOControllerClient setOptOutOfSmartRouting:](v5->_controllerClient, "setOptOutOfSmartRouting:", a3->var23);
      -[VCAudioIOControllerClient setClientFormat:](v5->_controllerClient, "setClientFormat:", &v5->_clientFormat);
      pthread_mutex_init(&v5->_stateMutex, 0);
      objc_storeWeak(&v5->_delegate, a3->var7);
      objc_storeWeak(&v5->_sourceDelegate, a3->var19.delegate);
      -[VCAudioIO setUpAndTransferDelegateContext:toDestinationContext:](v5, "setUpAndTransferDelegateContext:toDestinationContext:", &a3->var19, &v5->_sourceData.delegateContext);
      objc_storeWeak(&v5->_sinkDelegate, a3->var20.delegate);
      -[VCAudioIO setUpAndTransferDelegateContext:toDestinationContext:](v5, "setUpAndTransferDelegateContext:toDestinationContext:", &a3->var20, &v5->_sinkData.delegateContext);
    }
    else
    {
      if ((VCAudioIO *)objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioIO initWithConfiguration:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v12 = (const __CFString *)-[VCAudioIO performSelector:](v5, "performSelector:", sel_logPrefix);
        else
          v12 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v20 = v13;
            v21 = 2080;
            v22 = "-[VCAudioIO initWithConfiguration:]";
            v23 = 1024;
            v24 = 391;
            v25 = 2112;
            v26 = v12;
            v27 = 2048;
            v28 = v5;
            v29 = 1024;
            v30 = var3;
            _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Controller not found for device role:%d", buf, 0x36u);
          }
        }
      }

      return 0;
    }
  }
  return v5;
}

- (void)setupClientFormatWithConfiguration:(const tagVCAudioIOConfiguration *)a3
{
  tagVCAudioFrameFormat *p_clientFormat;
  id v6;
  unsigned int var9;
  unsigned int var10;
  double v9[2];

  v9[1] = *(double *)MEMORY[0x1E0C80C00];
  v9[0] = NAN;
  p_clientFormat = &self->_clientFormat;
  if (self->_audioType == 1)
    v6 = +[VCAudioManager sharedSystemAudioOutputInstance](VCAudioManager, "sharedSystemAudioOutputInstance");
  else
    v6 = +[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance");
  objc_msgSend(v6, "getPreferredFormat:blockSize:vpOperatingMode:forOperatingMode:deviceRole:suggestedFormat:", &self->_clientFormat, v9, 0, a3->var2, a3->var3, 0);
  var9 = a3->var9;
  if (var9)
    p_clientFormat->format.mSampleRate = (double)var9;
  var10 = a3->var10;
  if (!var10)
    var10 = (p_clientFormat->format.mSampleRate * v9[0]);
  self->_clientFormat.samplesPerFrame = var10;
  self->_clientFormat.format.mChannelsPerFrame = a3->var13;
}

- (BOOL)reconfigureWithConfig:(const tagVCAudioIOConfiguration *)a3
{
  _opaque_pthread_mutex_t *p_stateMutex;
  int *p_var3;
  id v7;
  void *v8;
  BOOL v9;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  VCAudioIO *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_state)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioIO reconfigureWithConfig:].cold.2();
      }
      goto LABEL_24;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_24;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 136316162;
    v22 = v13;
    v23 = 2080;
    v24 = "-[VCAudioIO reconfigureWithConfig:]";
    v25 = 1024;
    v26 = 454;
    v27 = 2112;
    v28 = v11;
    v29 = 2048;
    v30 = self;
    v15 = " [%s] %s:%d %@(%p) Operation not allowed while the audio IO is running";
    v16 = v14;
    v17 = 48;
    goto LABEL_26;
  }
  p_var3 = &a3->var3;
  v7 = +[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:](VCAudioIO, "controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:", a3->var3, a3->var4, a3->var5, a3->var2, a3->var14, a3->var15, a3->var16, a3->var21);
  if (!v7)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioIO reconfigureWithConfig:].cold.1();
      }
      goto LABEL_24;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v18 = VRTraceErrorLogLevelToCSTR(),
          v19 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_24:
      v9 = 0;
      goto LABEL_4;
    }
    v20 = *p_var3;
    *(_DWORD *)buf = 136316418;
    v22 = v18;
    v23 = 2080;
    v24 = "-[VCAudioIO reconfigureWithConfig:]";
    v25 = 1024;
    v26 = 464;
    v27 = 2112;
    v28 = v12;
    v29 = 2048;
    v30 = self;
    v31 = 1024;
    v32 = v20;
    v15 = " [%s] %s:%d %@(%p) Controller not found for device role:%d";
    v16 = v19;
    v17 = 54;
LABEL_26:
    _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_24;
  }
  v8 = v7;

  self->_audioIOController = (VCAudioIOControllerControl *)v8;
  -[VCAudioIOControllerClient setAllowAudioRecording:](self->_controllerClient, "setAllowAudioRecording:", a3->var6);
  -[VCAudioIOControllerClient setDeviceRole:](self->_controllerClient, "setDeviceRole:", a3->var3);
  -[VCAudioIOControllerClient setOperatingMode:](self->_controllerClient, "setOperatingMode:", a3->var2);
  -[VCAudioIOControllerClient setDirection:](self->_controllerClient, "setDirection:", a3->var5);
  -[VCAudioIOControllerClient setIsMediaPriorityEnabled:](self->_controllerClient, "setIsMediaPriorityEnabled:", a3->var17);
  -[VCAudioIOControllerClient setIsVoiceActivityEnabled:](self->_controllerClient, "setIsVoiceActivityEnabled:", a3->var18);
  -[VCAudioIOControllerClient setChannelIndex:](self->_controllerClient, "setChannelIndex:", a3->var1);
  -[VCAudioIOControllerClient setNetworkUplinkClockUsesBaseband:](self->_controllerClient, "setNetworkUplinkClockUsesBaseband:", a3->var22);
  v9 = 1;
  self->_sinkData.controllerChanged = 1;
  self->_sourceData.controllerChanged = 1;
LABEL_4:
  pthread_mutex_unlock(p_stateMutex);
  return v9;
}

- (NSDictionary)reportingStats
{
  _opaque_pthread_mutex_t *p_stateMutex;
  NSDictionary *v4;

  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_audioIOController && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = (NSDictionary *)-[VCAudioIOControllerControl reportingStats](self->_audioIOController, "reportingStats");
  else
    v4 = 0;
  pthread_mutex_unlock(p_stateMutex);
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_delegate, 0);
  objc_storeWeak(&self->_sourceDelegate, 0);
  objc_storeWeak(&self->_sinkDelegate, 0);
  -[VCAudioIO forceCleanup](self, "forceCleanup");
  -[VCAudioIO cleanUpRealtimeDelegatesAndContext:](self, "cleanUpRealtimeDelegatesAndContext:", 1);
  -[VCAudioIO releaseConverters](self, "releaseConverters");
  -[VCAudioIO destroyBuffers](self, "destroyBuffers");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCAudioIOControllerControl invalidate](self->_audioIOController, "invalidate");

  pthread_mutex_destroy(&self->_stateMutex);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioIO;
  -[VCAudioIO dealloc](&v3, sel_dealloc);
}

- (void)cleanUpRealtimeDelegatesAndContext:(BOOL)a3
{
  _BOOL4 v3;
  VCAudioIOSink *delegate;
  VCAudioIOSink *v6;
  VCAudioCaptionsCoordinator *captionsCoordinator;
  VCAudioCaptionsCoordinator *v8;
  VCCannedAudioInjector *injector;
  VCCannedAudioInjector *v10;

  v3 = a3;
  delegate = self->_sinkData.delegateContext.delegate;
  if (delegate)
  {
    CFRelease(delegate);
    self->_sinkData.delegateContext.delegate = 0;
  }
  v6 = self->_sourceData.delegateContext.delegate;
  if (v6)
  {
    CFRelease(v6);
    self->_sourceData.delegateContext.delegate = 0;
  }
  if (v3)
  {
    captionsCoordinator = self->_sinkData.delegateContext.captionsCoordinator;
    if (captionsCoordinator)
    {
      CFRelease(captionsCoordinator);
      self->_sinkData.delegateContext.captionsCoordinator = 0;
    }
    v8 = self->_sourceData.delegateContext.captionsCoordinator;
    if (v8)
    {
      CFRelease(v8);
      self->_sourceData.delegateContext.captionsCoordinator = 0;
    }
    injector = self->_sinkData.delegateContext.injector;
    if (injector)
    {
      CFRelease(injector);
      self->_sinkData.delegateContext.injector = 0;
    }
    v10 = self->_sourceData.delegateContext.injector;
    if (v10)
    {
      CFRelease(v10);
      self->_sourceData.delegateContext.injector = 0;
    }
  }
}

- (void)forceCleanup
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCAudioIO is being released but it is not in the right state: %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

intptr_t __25__VCAudioIO_forceCleanup__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (const)clientFormat
{
  return &self->_clientFormat;
}

- (const)controllerFormat
{
  return &self->_controllerFormat;
}

- (void)setFarEndVersionInfo:(VoiceIOFarEndVersionInfo *)a3
{
  _opaque_pthread_mutex_t *p_stateMutex;
  VCAudioIOControllerClient *controllerClient;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  _BYTE v14[48];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unsigned int farEndAUVersion;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    p_stateMutex = &self->_stateMutex;
    pthread_mutex_lock(&self->_stateMutex);
    if (self->_state)
    {
      if ((VCAudioIO *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioIO setFarEndVersionInfo:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v11 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v14 = 136316162;
            *(_QWORD *)&v14[4] = v12;
            *(_WORD *)&v14[12] = 2080;
            *(_QWORD *)&v14[14] = "-[VCAudioIO setFarEndVersionInfo:]";
            *(_WORD *)&v14[22] = 1024;
            *(_DWORD *)&v14[24] = 603;
            *(_WORD *)&v14[28] = 2112;
            *(_QWORD *)&v14[30] = v11;
            *(_WORD *)&v14[38] = 2048;
            *(_QWORD *)&v14[40] = self;
            _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Operation not allowed while the audio IO is running", v14, 0x30u);
          }
        }
      }
    }
    else
    {
      controllerClient = self->_controllerClient;
      v7 = *(_OWORD *)&a3->farEndOSVersion[48];
      v18 = *(_OWORD *)&a3->farEndOSVersion[32];
      v19 = v7;
      farEndAUVersion = a3->farEndAUVersion;
      v8 = *(_OWORD *)&a3->farEndHwModel[48];
      *(_OWORD *)&v14[32] = *(_OWORD *)&a3->farEndHwModel[32];
      v15 = v8;
      v9 = *(_OWORD *)&a3->farEndOSVersion[16];
      v16 = *(_OWORD *)a3->farEndOSVersion;
      v17 = v9;
      v10 = *(_OWORD *)&a3->farEndHwModel[16];
      *(_OWORD *)v14 = *(_OWORD *)a3->farEndHwModel;
      *(_OWORD *)&v14[16] = v10;
      -[VCAudioIOControllerClient setFarEndVersionInfo:](controllerClient, "setFarEndVersionInfo:", v14);
    }
    pthread_mutex_unlock(p_stateMutex);
  }
}

- (void)setRemoteCodecType:(unsigned int)a3 sampleRate:(double)a4
{
  uint64_t v5;

  v5 = *(_QWORD *)&a3;
  -[VCAudioIOControllerClient setRemoteCodecType:sampleRate:](self->_controllerClient, "setRemoteCodecType:sampleRate:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCAudioIOControllerControl refreshRemoteCodecType:sampleRate:](self->_audioIOController, "refreshRemoteCodecType:sampleRate:", v5, a4);
}

- (BOOL)isInputMeteringEnabled
{
  return -[VCAudioIOControllerClient isInputMeteringEnabled](self->_controllerClient, "isInputMeteringEnabled");
}

- (void)setInputMeteringEnabled:(BOOL)a3
{
  -[VCAudioIOControllerClient setInputMeteringEnabled:](self->_controllerClient, "setInputMeteringEnabled:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCAudioIOControllerControl refreshInputMetering](self->_audioIOController, "refreshInputMetering");
}

- (BOOL)isOutputMeteringEnabled
{
  return -[VCAudioIOControllerClient isInputMeteringEnabled](self->_controllerClient, "isInputMeteringEnabled");
}

- (void)setOutputMeteringEnabled:(BOOL)a3
{
  -[VCAudioIOControllerClient setOutputMeteringEnabled:](self->_controllerClient, "setOutputMeteringEnabled:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCAudioIOControllerControl refreshOutputMetering](self->_audioIOController, "refreshOutputMetering");
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCAudioIO *v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  self->_isMuted = a3;
  self->_sinkData.isMuted = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VCAudioIOControllerControl setMute:forClient:](self->_audioIOController, "setMute:forClient:", v3, self->_controllerClient);
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = v6;
        v15 = 2080;
        v16 = "-[VCAudioIO setMuted:]";
        v17 = 1024;
        v18 = 649;
        v19 = 1024;
        LODWORD(v20) = v3;
        v8 = " [%s] %s:%d isMuted=%d";
        v9 = v7;
        v10 = 34;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316418;
        v14 = v11;
        v15 = 2080;
        v16 = "-[VCAudioIO setMuted:]";
        v17 = 1024;
        v18 = 649;
        v19 = 2112;
        v20 = v5;
        v21 = 2048;
        v22 = self;
        v23 = 1024;
        v24 = v3;
        v8 = " [%s] %s:%d %@(%p) isMuted=%d";
        v9 = v12;
        v10 = 54;
        goto LABEL_13;
      }
    }
  }
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  VCAudioIOControllerControl *audioIOController;

  self->_isGKVoiceChat = a3;
  audioIOController = self->_audioIOController;
  if (audioIOController == +[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"))objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "setIsGKVoiceChat:", self->_isGKVoiceChat);
}

- (unsigned)direction
{
  return -[VCAudioIOControllerClient direction](self->_controllerClient, "direction");
}

- (void)setDirection:(unsigned __int8)a3
{
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  unsigned int state;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  unsigned int v16;
  _BYTE v17[12];
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BYTE v23[10];
  VCAudioIO *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v8 = -[VCAudioIOControllerClient direction](self->_controllerClient, "direction");
    state = self->_state;
    *(_DWORD *)v17 = 136316418;
    *(_QWORD *)&v17[4] = v6;
    v18 = 2080;
    v19 = "-[VCAudioIO setDirection:]";
    v20 = 1024;
    v21 = 665;
    v22 = 1024;
    *(_DWORD *)v23 = v8;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v3;
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = state;
    v10 = " [%s] %s:%d Set direction from %d to %d. Current state:%d";
    v11 = v7;
    v12 = 46;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v5 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[VCAudioIOControllerClient direction](self->_controllerClient, "direction");
      v16 = self->_state;
      *(_DWORD *)v17 = 136316930;
      *(_QWORD *)&v17[4] = v13;
      v18 = 2080;
      v19 = "-[VCAudioIO setDirection:]";
      v20 = 1024;
      v21 = 665;
      v22 = 2112;
      *(_QWORD *)v23 = v5;
      *(_WORD *)&v23[8] = 2048;
      v24 = self;
      v25 = 1024;
      v26 = v15;
      v27 = 1024;
      v28 = v3;
      v29 = 1024;
      v30 = v16;
      v10 = " [%s] %s:%d %@(%p) Set direction from %d to %d. Current state:%d";
      v11 = v14;
      v12 = 66;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v17, v12);
    }
  }
LABEL_12:
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_state)
  {
    v17[0] = v3;
    v17[1] = -[VCAudioIOControllerClient spatialAudioDisabled](self->_controllerClient, "spatialAudioDisabled", *(_QWORD *)v17);
    v17[2] = -[VCAudioIOControllerClient isVoiceActivityEnabled](self->_controllerClient, "isVoiceActivityEnabled");
    v17[3] = -[VCAudioIOControllerClient isMediaPriorityEnabled](self->_controllerClient, "isMediaPriorityEnabled");
    -[VCAudioIOControllerControl updateClient:settings:](self->_audioIOController, "updateClient:settings:", self->_controllerClient, v17);
  }
  else
  {
    -[VCAudioIOControllerClient setDirection:](self->_controllerClient, "setDirection:", v3);
  }
  pthread_mutex_unlock(&self->_stateMutex);
}

- (unsigned)pullAudioSamplesCount
{
  return self->_sourceData.framesProcessed;
}

- (BOOL)spatialAudioDisabled
{
  return -[VCAudioIOControllerClient spatialAudioDisabled](self->_controllerClient, "spatialAudioDisabled");
}

- (void)setSpatialAudioDisabled:(BOOL)a3
{
  _BOOL8 v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  unsigned int state;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  unsigned int v16;
  _BYTE v17[12];
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BYTE v23[10];
  VCAudioIO *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v8 = -[VCAudioIOControllerClient spatialAudioDisabled](self->_controllerClient, "spatialAudioDisabled");
    state = self->_state;
    *(_DWORD *)v17 = 136316418;
    *(_QWORD *)&v17[4] = v6;
    v18 = 2080;
    v19 = "-[VCAudioIO setSpatialAudioDisabled:]";
    v20 = 1024;
    v21 = 690;
    v22 = 1024;
    *(_DWORD *)v23 = v8;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v3;
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = state;
    v10 = " [%s] %s:%d Set spatialAudioDisabled from %d to %d. Current state:%d";
    v11 = v7;
    v12 = 46;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v5 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[VCAudioIOControllerClient spatialAudioDisabled](self->_controllerClient, "spatialAudioDisabled");
      v16 = self->_state;
      *(_DWORD *)v17 = 136316930;
      *(_QWORD *)&v17[4] = v13;
      v18 = 2080;
      v19 = "-[VCAudioIO setSpatialAudioDisabled:]";
      v20 = 1024;
      v21 = 690;
      v22 = 2112;
      *(_QWORD *)v23 = v5;
      *(_WORD *)&v23[8] = 2048;
      v24 = self;
      v25 = 1024;
      v26 = v15;
      v27 = 1024;
      v28 = v3;
      v29 = 1024;
      v30 = v16;
      v10 = " [%s] %s:%d %@(%p) Set spatialAudioDisabled from %d to %d. Current state:%d";
      v11 = v14;
      v12 = 66;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v17, v12);
    }
  }
LABEL_12:
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_state)
  {
    v17[0] = -[VCAudioIOControllerClient direction](self->_controllerClient, "direction");
    v17[1] = v3;
    v17[2] = -[VCAudioIOControllerClient isVoiceActivityEnabled](self->_controllerClient, "isVoiceActivityEnabled", *(_QWORD *)v17);
    v17[3] = -[VCAudioIOControllerClient isMediaPriorityEnabled](self->_controllerClient, "isMediaPriorityEnabled");
    -[VCAudioIOControllerControl updateClient:settings:](self->_audioIOController, "updateClient:settings:", self->_controllerClient, v17);
  }
  else
  {
    -[VCAudioIOControllerClient setSpatialAudioDisabled:](self->_controllerClient, "setSpatialAudioDisabled:", v3);
  }
  pthread_mutex_unlock(&self->_stateMutex);
}

- (BOOL)supportsVoiceActivityDetection
{
  VCAudioIO *v2;
  _opaque_pthread_mutex_t *p_stateMutex;

  v2 = self;
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  LOBYTE(v2) = -[VCAudioIOControllerControl supportsVoiceActivityDetection](v2->_audioIOController, "supportsVoiceActivityDetection");
  pthread_mutex_unlock(p_stateMutex);
  return (char)v2;
}

- (void)updateVoiceActivityEnabled:(BOOL)a3 isMediaPriorityEnabled:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  unsigned int state;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  unsigned int v20;
  _BYTE v21[12];
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[10];
  VCAudioIO *v28;
  _BYTE v29[6];
  _BYTE v30[6];
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v4 = a4;
  v5 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v10 = -[VCAudioIOControllerClient isVoiceActivityEnabled](self->_controllerClient, "isVoiceActivityEnabled");
    v11 = -[VCAudioIOControllerClient isMediaPriorityEnabled](self->_controllerClient, "isMediaPriorityEnabled");
    state = self->_state;
    *(_DWORD *)v21 = 136316930;
    *(_QWORD *)&v21[4] = v8;
    v22 = 2080;
    v23 = "-[VCAudioIO updateVoiceActivityEnabled:isMediaPriorityEnabled:]";
    v24 = 1024;
    v25 = 714;
    v26 = 1024;
    *(_DWORD *)v27 = v5;
    *(_WORD *)&v27[4] = 1024;
    *(_DWORD *)&v27[6] = v10;
    LOWORD(v28) = 1024;
    *(_DWORD *)((char *)&v28 + 2) = v4;
    HIWORD(v28) = 1024;
    *(_DWORD *)v29 = v11;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)v30 = state;
    v13 = " [%s] %s:%d Set isVoiceActivityEnabled previous=%d new=%d, isMediaPriorityEnabled previous=%d new=%d, state=%d";
    v14 = v9;
    v15 = 58;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = -[VCAudioIOControllerClient isVoiceActivityEnabled](self->_controllerClient, "isVoiceActivityEnabled");
      v19 = -[VCAudioIOControllerClient isMediaPriorityEnabled](self->_controllerClient, "isMediaPriorityEnabled");
      v20 = self->_state;
      *(_DWORD *)v21 = 136317442;
      *(_QWORD *)&v21[4] = v16;
      v22 = 2080;
      v23 = "-[VCAudioIO updateVoiceActivityEnabled:isMediaPriorityEnabled:]";
      v24 = 1024;
      v25 = 714;
      v26 = 2112;
      *(_QWORD *)v27 = v7;
      *(_WORD *)&v27[8] = 2048;
      v28 = self;
      *(_WORD *)v29 = 1024;
      *(_DWORD *)&v29[2] = v5;
      *(_WORD *)v30 = 1024;
      *(_DWORD *)&v30[2] = v18;
      v31 = 1024;
      v32 = v4;
      v33 = 1024;
      v34 = v19;
      v35 = 1024;
      v36 = v20;
      v13 = " [%s] %s:%d %@(%p) Set isVoiceActivityEnabled previous=%d new=%d, isMediaPriorityEnabled previous=%d new=%d, state=%d";
      v14 = v17;
      v15 = 78;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, v21, v15);
    }
  }
LABEL_12:
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_state)
  {
    v21[0] = -[VCAudioIOControllerClient direction](self->_controllerClient, "direction");
    v21[1] = -[VCAudioIOControllerClient spatialAudioDisabled](self->_controllerClient, "spatialAudioDisabled", *(_QWORD *)v21);
    v21[2] = v5;
    v21[3] = v4;
    -[VCAudioIOControllerControl updateClient:settings:](self->_audioIOController, "updateClient:settings:", self->_controllerClient, v21);
  }
  else
  {
    -[VCAudioIOControllerClient setIsVoiceActivityEnabled:](self->_controllerClient, "setIsVoiceActivityEnabled:", v5);
    -[VCAudioIOControllerClient setIsMediaPriorityEnabled:](self->_controllerClient, "setIsMediaPriorityEnabled:", v4);
  }
  pthread_mutex_unlock(&self->_stateMutex);
}

- (BOOL)createConverterForSource:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int samplesPerFrame;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  VCAudioIO *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  unsigned int v37;
  __int128 v38;
  int v39;
  _BOOL4 v40;
  const __CFString *v41;
  uint64_t v42;
  NSObject *v43;
  const __CFString *v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  int v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  uint8_t v66[4];
  uint64_t v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  VCAudioIO *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  VCAudioIO *v79;
  __int16 v80;
  int v81;
  _BYTE buf[40];
  VCAudioIO *v83;
  int v84;
  int v85;
  uint64_t v86;
  int v87;
  int v88;
  int v89;
  int v90;
  unint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  if (!self->_isControllerAudioFormatValid)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v40)
          return v40;
        -[VCAudioIO createConverterForSource:error:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v41 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v41 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v42 = VRTraceErrorLogLevelToCSTR();
        v43 = *MEMORY[0x1E0CF2758];
        v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v40)
          return v40;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioIO createConverterForSource:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 735;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v41;
        *(_WORD *)&buf[38] = 2048;
        v83 = self;
        _os_log_error_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) The controller audio format is invalid!", buf, 0x30u);
      }
    }
    LOBYTE(v40) = 0;
    return v40;
  }
  v5 = a3;
  v6 = 368;
  if (a3)
    v6 = 240;
  v7 = (char *)self + v6;
  if (!memcmp(&_VCAudioIO_EmptyContext, (char *)&self->_clientFormat.format.mBytesPerFrame + v6, 0x38uLL))
    goto LABEL_65;
  v8 = 96;
  if (v5)
    v9 = 48;
  else
    v9 = 96;
  if (v5)
    v10 = 56;
  else
    v10 = 104;
  v11 = 108;
  if (v5)
    v12 = 60;
  else
    v12 = 108;
  if (!v5)
    v11 = 60;
  v13 = *(_DWORD *)((char *)&self->super.isa + v11);
  if (v5)
    v14 = 124;
  else
    v14 = 76;
  if (v5)
    v15 = 128;
  else
    v15 = 80;
  v64 = *(_DWORD *)((char *)&self->super.isa + v14);
  v65 = v13;
  v16 = *(_DWORD *)((char *)&self->super.isa + v15);
  v17 = 84;
  if (v5)
    v18 = 132;
  else
    v18 = 84;
  v62 = *(_DWORD *)((char *)&self->super.isa + v18);
  v63 = v16;
  v19 = *(_DWORD *)((char *)&self->super.isa + v12);
  if (v5)
    v20 = 76;
  else
    v20 = 124;
  if (v5)
    v21 = 80;
  else
    v21 = 128;
  v60 = *(_DWORD *)((char *)&self->super.isa + v20);
  v61 = v19;
  if (v5)
    v22 = 64;
  else
    v22 = 112;
  if (!v5)
    v17 = 132;
  v58 = *(_DWORD *)((char *)&self->super.isa + v17);
  v59 = *(_DWORD *)((char *)&self->super.isa + v21);
  samplesPerFrame = self->_clientFormat.samplesPerFrame;
  v24 = *((_QWORD *)v7 + 2);
  *((_DWORD *)v7 + 3) = samplesPerFrame;
  if (v5)
    v25 = 68;
  else
    v25 = 116;
  if (v5)
    v26 = 72;
  else
    v26 = 120;
  if (v5)
  {
    v27 = 104;
  }
  else
  {
    v8 = 48;
    v27 = 56;
  }
  if (v5)
    v28 = 112;
  else
    v28 = 64;
  if (v5)
    v29 = 116;
  else
    v29 = 68;
  v30 = *(VCAudioIO **)((char *)&self->super.isa + v8);
  if (v5)
    v31 = 120;
  else
    v31 = 72;
  v55 = *(_DWORD *)((char *)&self->super.isa + v27);
  LODWORD(v56) = *(_DWORD *)((char *)&self->super.isa + v28);
  HIDWORD(v56) = *(_DWORD *)((char *)&self->super.isa + v29);
  v57 = *(_DWORD *)((char *)&self->super.isa + v31);
  v32 = *(uint64_t *)((char *)&self->super.isa + v9);
  v33 = *(_DWORD *)((char *)&self->super.isa + v10);
  v34 = *(_DWORD *)((char *)&self->super.isa + v22);
  v35 = *(_DWORD *)((char *)&self->super.isa + v25);
  v36 = *(_DWORD *)((char *)&self->super.isa + v26);
  v37 = 2 * samplesPerFrame;
  if (!v24)
    goto LABEL_58;
  if (VCAudioBufferList_GetSampleCapacity(v24) < v37)
  {
    VCAudioBufferList_Destroy((uint64_t *)v7 + 2);
    VCAudioBufferList_Destroy((uint64_t *)v7 + 3);
  }
  if (!*((_QWORD *)v7 + 2))
  {
LABEL_58:
    v38 = *(_OWORD *)&self->_clientFormat.format.mBytesPerPacket;
    *(_OWORD *)buf = *(_OWORD *)&self->_clientFormat.format.mSampleRate;
    *(_OWORD *)&buf[16] = v38;
    *(_QWORD *)&buf[32] = *(_QWORD *)&self->_clientFormat.format.mBitsPerChannel;
    VCAudioBufferList_Allocate((__int128 *)buf, v37, (_QWORD *)v7 + 2);
  }
  if (v5 && !*((_QWORD *)v7 + 3))
    VCAudioBufferList_AllocateFrame((uint64_t)&self->_clientFormat, (_QWORD *)v7 + 3);
  if (!v7[8])
  {
LABEL_65:
    LOBYTE(v40) = 1;
    return v40;
  }
  v91 = 0xAAAAAAAAAAAA0000;
  *(_QWORD *)buf = v32;
  *(_DWORD *)&buf[8] = v33;
  *(_DWORD *)&buf[12] = v61;
  *(_DWORD *)&buf[16] = v34;
  *(_DWORD *)&buf[20] = v35;
  *(_DWORD *)&buf[24] = v36;
  *(_DWORD *)&buf[28] = v60;
  *(_DWORD *)&buf[32] = v59;
  *(_DWORD *)&buf[36] = v58;
  v83 = v30;
  v84 = v55;
  v85 = v65;
  v86 = v56;
  v87 = v57;
  v88 = v64;
  v89 = v63;
  v90 = v62;
  v39 = SoundDec_Create(v7, (uint64_t)buf);
  if (v39 < 0)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_64;
      v45 = VRTraceErrorLogLevelToCSTR();
      v46 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      v47 = "sink";
      *(_DWORD *)v66 = 136316418;
      v67 = v45;
      v68 = 2080;
      v69 = "-[VCAudioIO createConverterForSource:error:]";
      if (v5)
        v47 = "source";
      v70 = 1024;
      v71 = 776;
      v72 = 2080;
      v73 = (void *)v47;
      v74 = 2048;
      v75 = self;
      v76 = 1024;
      LODWORD(v77) = v39;
      v48 = " [%s] %s:%d Failed to create %s converter for audioIO:%p! Err:%d";
      v49 = v46;
      v50 = 54;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v44 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v44 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_64;
      v51 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      v53 = "sink";
      *(_DWORD *)v66 = 136316930;
      v67 = v51;
      v68 = 2080;
      v69 = "-[VCAudioIO createConverterForSource:error:]";
      if (v5)
        v53 = "source";
      v70 = 1024;
      v71 = 776;
      v72 = 2112;
      v73 = (void *)v44;
      v74 = 2048;
      v75 = self;
      v76 = 2080;
      v77 = v53;
      v78 = 2048;
      v79 = self;
      v80 = 1024;
      v81 = v39;
      v48 = " [%s] %s:%d %@(%p) Failed to create %s converter for audioIO:%p! Err:%d";
      v49 = v52;
      v50 = 74;
    }
    _os_log_error_impl(&dword_1D8A54000, v49, OS_LOG_TYPE_ERROR, v48, v66, v50);
  }
LABEL_64:
  LOBYTE(v40) = v39 >= 0;
  return v40;
}

- (void)destroyBuffers
{
  VCAudioBufferList_Destroy((uint64_t *)&self->_sinkData.sampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.sampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.clientBuffer);
}

- (void)releaseConverters
{
  SoundDec_Destroy((uint64_t)self->_sinkData.converter);
  self->_sinkData.converter = 0;
  SoundDec_Destroy((uint64_t)self->_sourceData.converter);
  self->_sourceData.converter = 0;
}

- (void)setClientFormat:(const tagVCAudioFrameFormat *)a3
{
  __int128 v5;
  __int128 v6;

  -[VCAudioIOControllerClient setClientFormat:](self->_controllerClient, "setClientFormat:");
  v5 = *(_OWORD *)&a3->format.mSampleRate;
  v6 = *(_OWORD *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&self->_clientFormat.format.mBytesPerPacket = *(_OWORD *)&a3->format.mBytesPerPacket;
  *(_OWORD *)&self->_clientFormat.format.mBitsPerChannel = v6;
  *(_OWORD *)&self->_clientFormat.format.mSampleRate = v5;
}

- (int)operatingMode
{
  return -[VCAudioIOControllerClient operatingMode](self->_controllerClient, "operatingMode");
}

- (void)didStart:(BOOL)a3 error:(id)a4
{
  _BOOL4 v5;
  _opaque_pthread_mutex_t *p_stateMutex;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int state;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  id startCompletionBlock;
  NSObject *global_queue;
  unsigned int v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD block[6];
  BOOL v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  VCAudioIO *v43;
  __int16 v44;
  unsigned int v45;
  uint64_t v46;

  v5 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if (self->_state != 1)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          state = self->_state;
          *(_DWORD *)buf = 136315906;
          v35 = v9;
          v36 = 2080;
          v37 = "-[VCAudioIO didStart:error:]";
          v38 = 1024;
          v39 = 810;
          v40 = 1024;
          LODWORD(v41) = state;
          v12 = " [%s] %s:%d Unexpected audioIO state:%d. Stop may have been called before the didStart callback";
          v13 = v10;
          v14 = 34;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = self->_state;
          *(_DWORD *)buf = 136316418;
          v35 = v15;
          v36 = 2080;
          v37 = "-[VCAudioIO didStart:error:]";
          v38 = 1024;
          v39 = 810;
          v40 = 2112;
          v41 = v8;
          v42 = 2048;
          v43 = self;
          v44 = 1024;
          v45 = v17;
          v12 = " [%s] %s:%d %@(%p) Unexpected audioIO state:%d. Stop may have been called before the didStart callback";
          v13 = v16;
          v14 = 54;
          goto LABEL_12;
        }
      }
    }
  }
  startCompletionBlock = self->_startCompletionBlock;
  self->_startCompletionBlock = 0;
  if (startCompletionBlock)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__VCAudioIO_didStart_error___block_invoke;
    block[3] = &unk_1E9E56520;
    v33 = v5;
    block[4] = a4;
    block[5] = startCompletionBlock;
    dispatch_async(global_queue, block);
  }
  if (v5)
    v20 = 2;
  else
    v20 = 0;
  self->_state = v20;
  if (v5)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v35 = v23;
          v36 = 2080;
          v37 = "-[VCAudioIO didStart:error:]";
          v38 = 1024;
          v39 = 825;
          v25 = " [%s] %s:%d Stream successfully started";
          v26 = v24;
          v27 = 28;
LABEL_35:
          _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v21 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v35 = v28;
          v36 = 2080;
          v37 = "-[VCAudioIO didStart:error:]";
          v38 = 1024;
          v39 = 825;
          v40 = 2112;
          v41 = v21;
          v42 = 2048;
          v43 = self;
          v25 = " [%s] %s:%d %@(%p) Stream successfully started";
          v26 = v29;
          v27 = 48;
          goto LABEL_35;
        }
      }
    }
  }
  else
  {
    -[VCAudioIO cleanUpRealtimeDelegatesAndContext:](self, "cleanUpRealtimeDelegatesAndContext:", 0);
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioIO didStart:error:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v22 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v35 = v30;
          v36 = 2080;
          v37 = "-[VCAudioIO didStart:error:]";
          v38 = 1024;
          v39 = 828;
          v40 = 2112;
          v41 = v22;
          v42 = 2048;
          v43 = self;
          _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to start!!", buf, 0x30u);
        }
      }
    }
  }
  pthread_mutex_unlock(p_stateMutex);
}

void __28__VCAudioIO_didStart_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
}

- (void)didStop:(BOOL)a3 error:(id)a4
{
  _BOOL4 v5;
  _opaque_pthread_mutex_t *p_stateMutex;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *stopCompletionBlock;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  unsigned int state;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  unsigned int v27;
  id v28;
  NSObject *global_queue;
  VCAudioIO *v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  _QWORD v42[7];
  BOOL v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  VCAudioIO *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v5 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        stopCompletionBlock = (const __CFString *)self->_stopCompletionBlock;
        *(_DWORD *)buf = 136315906;
        v45 = v9;
        v46 = 2080;
        v47 = "-[VCAudioIO didStop:error:]";
        v48 = 1024;
        v49 = 836;
        v50 = 2048;
        v51 = stopCompletionBlock;
        v12 = " [%s] %s:%d completionHandler:%p";
        v13 = v10;
        v14 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_stopCompletionBlock;
        *(_DWORD *)buf = 136316418;
        v45 = v15;
        v46 = 2080;
        v47 = "-[VCAudioIO didStop:error:]";
        v48 = 1024;
        v49 = 836;
        v50 = 2112;
        v51 = v8;
        v52 = 2048;
        v53 = self;
        v54 = 2048;
        v55 = v17;
        v12 = " [%s] %s:%d %@(%p) completionHandler:%p";
        v13 = v16;
        v14 = 58;
        goto LABEL_11;
      }
    }
  }
  if (self->_state == 3)
    goto LABEL_24;
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        state = self->_state;
        *(_DWORD *)buf = 136315906;
        v45 = v19;
        v46 = 2080;
        v47 = "-[VCAudioIO didStop:error:]";
        v48 = 1024;
        v49 = 839;
        v50 = 1024;
        LODWORD(v51) = state;
        v22 = " [%s] %s:%d Unexpected audioIO state:%d. Start may have been called before the didStop callback";
        v23 = v20;
        v24 = 34;
LABEL_23:
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_state;
        *(_DWORD *)buf = 136316418;
        v45 = v25;
        v46 = 2080;
        v47 = "-[VCAudioIO didStop:error:]";
        v48 = 1024;
        v49 = 839;
        v50 = 2112;
        v51 = v18;
        v52 = 2048;
        v53 = self;
        v54 = 1024;
        LODWORD(v55) = v27;
        v22 = " [%s] %s:%d %@(%p) Unexpected audioIO state:%d. Start may have been called before the didStop callback";
        v23 = v26;
        v24 = 54;
        goto LABEL_23;
      }
    }
  }
LABEL_24:
  v28 = self->_stopCompletionBlock;
  self->_stopCompletionBlock = 0;
  if (v28)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __27__VCAudioIO_didStop_error___block_invoke;
    v42[3] = &unk_1E9E56548;
    v42[5] = a4;
    v42[6] = v28;
    v43 = v5;
    v42[4] = self;
    dispatch_async(global_queue, v42);
  }
  -[VCAudioIO cleanUpRealtimeDelegatesAndContext:](self, "cleanUpRealtimeDelegatesAndContext:", 0);
  self->_state = 0;
  v30 = (VCAudioIO *)objc_opt_class();
  if (v5)
  {
    if (v30 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v33 = VRTraceErrorLogLevelToCSTR();
        v34 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v45 = v33;
          v46 = 2080;
          v47 = "-[VCAudioIO didStop:error:]";
          v48 = 1024;
          v49 = 856;
          v35 = " [%s] %s:%d Stream successfully stopped";
          v36 = v34;
          v37 = 28;
LABEL_43:
          _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v31 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v31 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v38 = VRTraceErrorLogLevelToCSTR();
        v39 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v45 = v38;
          v46 = 2080;
          v47 = "-[VCAudioIO didStop:error:]";
          v48 = 1024;
          v49 = 856;
          v50 = 2112;
          v51 = v31;
          v52 = 2048;
          v53 = self;
          v35 = " [%s] %s:%d %@(%p) Stream successfully stopped";
          v36 = v39;
          v37 = 48;
          goto LABEL_43;
        }
      }
    }
  }
  else if (v30 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioIO didStop:error:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v32 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v32 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v40 = VRTraceErrorLogLevelToCSTR();
      v41 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v45 = v40;
        v46 = 2080;
        v47 = "-[VCAudioIO didStop:error:]";
        v48 = 1024;
        v49 = 858;
        v50 = 2112;
        v51 = v32;
        v52 = 2048;
        v53 = self;
        _os_log_error_impl(&dword_1D8A54000, v41, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to stop!!", buf, 0x30u);
      }
    }
  }
  pthread_mutex_unlock(p_stateMutex);
}

void __27__VCAudioIO_didStop_error___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315650;
        v15 = v6;
        v16 = 2080;
        v17 = "-[VCAudioIO didStop:error:]_block_invoke";
        v18 = 1024;
        v19 = 847;
        v8 = " [%s] %s:%d ";
        v9 = v7;
        v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v14 = 136316162;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCAudioIO didStop:error:]_block_invoke";
        v18 = 1024;
        v19 = 847;
        v20 = 2112;
        v21 = v2;
        v22 = 2048;
        v23 = v13;
        v8 = " [%s] %s:%d %@(%p) ";
        v9 = v12;
        v10 = 48;
        goto LABEL_11;
      }
    }
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), v3, v4, v5);
  _Block_release(*(const void **)(a1 + 48));
}

- (void)controllerFormatChanged:(const tagVCAudioFrameFormat *)a3
{
  _opaque_pthread_mutex_t *p_stateMutex;
  __int128 v6;
  __int128 v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  Float64 mSampleRate;
  char *v12;
  AudioFormatFlags mFormatFlags;
  UInt32 mBytesPerPacket;
  UInt32 mFramesPerPacket;
  UInt32 mBytesPerFrame;
  UInt32 mChannelsPerFrame;
  UInt32 mBitsPerChannel;
  unsigned int samplesPerFrame;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  Float64 v25;
  char *v26;
  AudioFormatFlags v27;
  UInt32 v28;
  UInt32 v29;
  UInt32 v30;
  UInt32 v31;
  UInt32 v32;
  unsigned int v33;
  const __CFString *v34;
  uint64_t v35;
  NSObject *v36;
  Float64 v37;
  char *v38;
  AudioFormatFlags v39;
  UInt32 v40;
  UInt32 v41;
  UInt32 v42;
  UInt32 v43;
  UInt32 v44;
  unsigned int v45;
  const char *v46;
  NSObject *v47;
  uint32_t v48;
  uint64_t v49;
  NSObject *v50;
  Float64 v51;
  char *v52;
  AudioFormatFlags v53;
  UInt32 v54;
  UInt32 v55;
  UInt32 v56;
  UInt32 v57;
  UInt32 v58;
  unsigned int v59;
  __int128 v60;
  __int128 v61;
  BOOL v62;
  unint64_t v63;
  unsigned int v64;
  BOOL v65;
  _BYTE v66[24];
  __int128 v67;
  VCAudioIO *v68;
  _BYTE v69[32];
  _BYTE v70[24];
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  v7 = *(_OWORD *)&a3->format.mBytesPerPacket;
  v6 = *(_OWORD *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&self->_controllerFormat.format.mSampleRate = *(_OWORD *)&a3->format.mSampleRate;
  *(_OWORD *)&self->_controllerFormat.format.mBytesPerPacket = v7;
  *(_OWORD *)&self->_controllerFormat.format.mBitsPerChannel = v6;
  self->_controllerFormat.format.mChannelsPerFrame = self->_clientFormat.format.mChannelsPerFrame;
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        mSampleRate = self->_controllerFormat.format.mSampleRate;
        v12 = FourccToCStr(self->_controllerFormat.format.mFormatID);
        mFormatFlags = self->_controllerFormat.format.mFormatFlags;
        mBytesPerPacket = self->_controllerFormat.format.mBytesPerPacket;
        mFramesPerPacket = self->_controllerFormat.format.mFramesPerPacket;
        mBytesPerFrame = self->_controllerFormat.format.mBytesPerFrame;
        mChannelsPerFrame = self->_controllerFormat.format.mChannelsPerFrame;
        mBitsPerChannel = self->_controllerFormat.format.mBitsPerChannel;
        samplesPerFrame = self->_controllerFormat.samplesPerFrame;
        *(_DWORD *)v66 = 136317954;
        *(_QWORD *)&v66[4] = v9;
        *(_WORD *)&v66[12] = 2080;
        *(_QWORD *)&v66[14] = "-[VCAudioIO controllerFormatChanged:]";
        *(_WORD *)&v66[22] = 1024;
        LODWORD(v67) = 879;
        WORD2(v67) = 2048;
        *(Float64 *)((char *)&v67 + 6) = mSampleRate;
        HIWORD(v67) = 2080;
        v68 = (VCAudioIO *)v12;
        *(_WORD *)v69 = 1024;
        *(_DWORD *)&v69[2] = mFormatFlags;
        *(_WORD *)&v69[6] = 1024;
        *(_DWORD *)&v69[8] = mBytesPerPacket;
        *(_WORD *)&v69[12] = 1024;
        *(_DWORD *)&v69[14] = mFramesPerPacket;
        *(_WORD *)&v69[18] = 1024;
        *(_DWORD *)&v69[20] = mBytesPerFrame;
        *(_WORD *)&v69[24] = 1024;
        *(_DWORD *)&v69[26] = mChannelsPerFrame;
        *(_WORD *)&v69[30] = 1024;
        *(_DWORD *)v70 = mBitsPerChannel;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)&v70[6] = samplesPerFrame;
        v20 = " [%s] %s:%d Controller format: {%f, %7s, 0x%08x, %u, %u, %u, %u, %u} samplesPerFrame=%u";
        v21 = v10;
        v22 = 90;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, v66, v22);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v25 = self->_controllerFormat.format.mSampleRate;
        v26 = FourccToCStr(self->_controllerFormat.format.mFormatID);
        v27 = self->_controllerFormat.format.mFormatFlags;
        v28 = self->_controllerFormat.format.mBytesPerPacket;
        v29 = self->_controllerFormat.format.mFramesPerPacket;
        v30 = self->_controllerFormat.format.mBytesPerFrame;
        v31 = self->_controllerFormat.format.mChannelsPerFrame;
        v32 = self->_controllerFormat.format.mBitsPerChannel;
        v33 = self->_controllerFormat.samplesPerFrame;
        *(_DWORD *)v66 = 136318466;
        *(_QWORD *)&v66[4] = v23;
        *(_WORD *)&v66[12] = 2080;
        *(_QWORD *)&v66[14] = "-[VCAudioIO controllerFormatChanged:]";
        *(_WORD *)&v66[22] = 1024;
        LODWORD(v67) = 879;
        WORD2(v67) = 2112;
        *(_QWORD *)((char *)&v67 + 6) = v8;
        HIWORD(v67) = 2048;
        v68 = self;
        *(_WORD *)v69 = 2048;
        *(Float64 *)&v69[2] = v25;
        *(_WORD *)&v69[10] = 2080;
        *(_QWORD *)&v69[12] = v26;
        *(_WORD *)&v69[20] = 1024;
        *(_DWORD *)&v69[22] = v27;
        *(_WORD *)&v69[26] = 1024;
        *(_DWORD *)&v69[28] = v28;
        *(_WORD *)v70 = 1024;
        *(_DWORD *)&v70[2] = v29;
        *(_WORD *)&v70[6] = 1024;
        *(_DWORD *)&v70[8] = v30;
        *(_WORD *)&v70[12] = 1024;
        *(_DWORD *)&v70[14] = v31;
        *(_WORD *)&v70[18] = 1024;
        *(_DWORD *)&v70[20] = v32;
        LOWORD(v71) = 1024;
        *(_DWORD *)((char *)&v71 + 2) = v33;
        v20 = " [%s] %s:%d %@(%p) Controller format: {%f, %7s, 0x%08x, %u, %u, %u, %u, %u} samplesPerFrame=%u";
        v21 = v24;
        v22 = 110;
        goto LABEL_11;
      }
    }
  }
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v37 = self->_clientFormat.format.mSampleRate;
        v38 = FourccToCStr(self->_clientFormat.format.mFormatID);
        v39 = self->_clientFormat.format.mFormatFlags;
        v40 = self->_clientFormat.format.mBytesPerPacket;
        v41 = self->_clientFormat.format.mFramesPerPacket;
        v42 = self->_clientFormat.format.mBytesPerFrame;
        v43 = self->_clientFormat.format.mChannelsPerFrame;
        v44 = self->_clientFormat.format.mBitsPerChannel;
        v45 = self->_clientFormat.samplesPerFrame;
        *(_DWORD *)v66 = 136317954;
        *(_QWORD *)&v66[4] = v35;
        *(_WORD *)&v66[12] = 2080;
        *(_QWORD *)&v66[14] = "-[VCAudioIO controllerFormatChanged:]";
        *(_WORD *)&v66[22] = 1024;
        LODWORD(v67) = 889;
        WORD2(v67) = 2048;
        *(Float64 *)((char *)&v67 + 6) = v37;
        HIWORD(v67) = 2080;
        v68 = (VCAudioIO *)v38;
        *(_WORD *)v69 = 1024;
        *(_DWORD *)&v69[2] = v39;
        *(_WORD *)&v69[6] = 1024;
        *(_DWORD *)&v69[8] = v40;
        *(_WORD *)&v69[12] = 1024;
        *(_DWORD *)&v69[14] = v41;
        *(_WORD *)&v69[18] = 1024;
        *(_DWORD *)&v69[20] = v42;
        *(_WORD *)&v69[24] = 1024;
        *(_DWORD *)&v69[26] = v43;
        *(_WORD *)&v69[30] = 1024;
        *(_DWORD *)v70 = v44;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)&v70[6] = v45;
        v46 = " [%s] %s:%d Client format: {%f, %7s, 0x%08x, %u, %u, %u, %u, %u} samplesPerFrame=%u";
        v47 = v36;
        v48 = 90;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v47, OS_LOG_TYPE_DEFAULT, v46, v66, v48);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v34 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v34 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v51 = self->_clientFormat.format.mSampleRate;
        v52 = FourccToCStr(self->_clientFormat.format.mFormatID);
        v53 = self->_clientFormat.format.mFormatFlags;
        v54 = self->_clientFormat.format.mBytesPerPacket;
        v55 = self->_clientFormat.format.mFramesPerPacket;
        v56 = self->_clientFormat.format.mBytesPerFrame;
        v57 = self->_clientFormat.format.mChannelsPerFrame;
        v58 = self->_clientFormat.format.mBitsPerChannel;
        v59 = self->_clientFormat.samplesPerFrame;
        *(_DWORD *)v66 = 136318466;
        *(_QWORD *)&v66[4] = v49;
        *(_WORD *)&v66[12] = 2080;
        *(_QWORD *)&v66[14] = "-[VCAudioIO controllerFormatChanged:]";
        *(_WORD *)&v66[22] = 1024;
        LODWORD(v67) = 889;
        WORD2(v67) = 2112;
        *(_QWORD *)((char *)&v67 + 6) = v34;
        HIWORD(v67) = 2048;
        v68 = self;
        *(_WORD *)v69 = 2048;
        *(Float64 *)&v69[2] = v51;
        *(_WORD *)&v69[10] = 2080;
        *(_QWORD *)&v69[12] = v52;
        *(_WORD *)&v69[20] = 1024;
        *(_DWORD *)&v69[22] = v53;
        *(_WORD *)&v69[26] = 1024;
        *(_DWORD *)&v69[28] = v54;
        *(_WORD *)v70 = 1024;
        *(_DWORD *)&v70[2] = v55;
        *(_WORD *)&v70[6] = 1024;
        *(_DWORD *)&v70[8] = v56;
        *(_WORD *)&v70[12] = 1024;
        *(_DWORD *)&v70[14] = v57;
        *(_WORD *)&v70[18] = 1024;
        *(_DWORD *)&v70[20] = v58;
        LOWORD(v71) = 1024;
        *(_DWORD *)((char *)&v71 + 2) = v59;
        v46 = " [%s] %s:%d %@(%p) Client format: {%f, %7s, 0x%08x, %u, %u, %u, %u, %u} samplesPerFrame=%u";
        v47 = v50;
        v48 = 110;
        goto LABEL_22;
      }
    }
  }
  v60 = *(_OWORD *)&a3->format.mSampleRate;
  v61 = *(_OWORD *)&a3->format.mBitsPerChannel;
  *(_OWORD *)&self->_controllerFormat.format.mBytesPerPacket = *(_OWORD *)&a3->format.mBytesPerPacket;
  *(_OWORD *)&self->_controllerFormat.format.mBitsPerChannel = v61;
  *(_OWORD *)&self->_controllerFormat.format.mSampleRate = v60;
  self->_isControllerAudioFormatValid = 1;
  v62 = memcmp(&self->_clientFormat, &self->_controllerFormat, 0x28uLL) != 0;
  self->_sinkData.isConverterNeeded = v62;
  LODWORD(v63) = self->_controllerFormat.samplesPerFrame;
  v64 = vcvtad_u64_f64(self->_clientFormat.format.mSampleRate * (double)v63 / self->_controllerFormat.format.mSampleRate);
  self->_sourceData.isConverterNeeded = v62;
  v65 = self->_clientFormat.samplesPerFrame > v64;
  self->_sinkData.isAccumulatorNeeded = v65;
  self->_sourceData.isAccumulatorNeeded = v65;
  -[VCAudioIO releaseConverters](self, "releaseConverters", *(_OWORD *)v66, *(_QWORD *)&v66[16], v67, v68, *(_OWORD *)v69, *(_QWORD *)&v69[16], *(_QWORD *)&v69[24], *(_OWORD *)v70, *(_QWORD *)&v70[16], v71);
  -[VCAudioIO createConverterForSource:error:](self, "createConverterForSource:error:", 1, 0);
  -[VCAudioIO createConverterForSource:error:](self, "createConverterForSource:error:", 0, 0);
  -[VCAudioIOControllerClient setControllerFormat:](self->_controllerClient, "setControllerFormat:", &self->_controllerFormat);
  pthread_mutex_unlock(p_stateMutex);
}

- (void)didSuspend
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  _BYTE v11[24];
  __int128 v12;
  VCAudioIO *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136315650;
        *(_QWORD *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCAudioIO didSuspend]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 905;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136316162;
        *(_QWORD *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCAudioIO didSuspend]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 905;
        WORD2(v12) = 2112;
        *(_QWORD *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        v13 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(-[VCAudioIO delegate](self, "delegate", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13), "didSuspendAudioIO:", self);
}

- (void)didResume
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  _BYTE v11[24];
  __int128 v12;
  VCAudioIO *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136315650;
        *(_QWORD *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCAudioIO didResume]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 910;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136316162;
        *(_QWORD *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCAudioIO didResume]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 910;
        WORD2(v12) = 2112;
        *(_QWORD *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        v13 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(-[VCAudioIO delegate](self, "delegate", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13), "didResumeAudioIO:", self);
}

- (void)serverDidDie
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCAudioIO serverDidDie]";
      v9 = 1024;
      v10 = 920;
      v11 = 1024;
      v12 = 920;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioIO.m:%d: ", (uint8_t *)&v5, 0x22u);
    }
  }
  objc_msgSend(-[VCAudioIO delegate](self, "delegate"), "serverDidDie");
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  objc_msgSend(-[VCAudioIO delegate](self, "delegate"), "didUpdateBasebandCodec:", a3);
}

- (void)startWithCompletionHandler:(id)a3
{
  _opaque_pthread_mutex_t *p_stateMutex;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  VCAudioIOControllerControl *audioIOController;
  VCAudioIOControllerClient *controllerClient;
  id delegate;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  VCAudioIOControllerControl *v17;
  VCAudioIOControllerClient *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  VCAudioIO *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  VCAudioIOControllerClient *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        audioIOController = self->_audioIOController;
        controllerClient = self->_controllerClient;
        delegate = self->_delegate;
        *(_DWORD *)buf = 136316418;
        v35 = v7;
        v36 = 2080;
        v37 = "-[VCAudioIO startWithCompletionHandler:]";
        v38 = 1024;
        v39 = 936;
        v40 = 2112;
        v41 = audioIOController;
        v42 = 2112;
        v43 = (VCAudioIO *)controllerClient;
        v44 = 2112;
        v45 = (uint64_t)delegate;
        v12 = " [%s] %s:%d Starting... audioController=%@, controllerClient=%@, delegate=%@";
        v13 = v8;
        v14 = 58;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_audioIOController;
        v18 = self->_controllerClient;
        v19 = self->_delegate;
        *(_DWORD *)buf = 136316930;
        v35 = v15;
        v36 = 2080;
        v37 = "-[VCAudioIO startWithCompletionHandler:]";
        v38 = 1024;
        v39 = 936;
        v40 = 2112;
        v41 = (void *)v6;
        v42 = 2048;
        v43 = self;
        v44 = 2112;
        v45 = (uint64_t)v17;
        v46 = 2112;
        v47 = v18;
        v48 = 2112;
        v49 = v19;
        v12 = " [%s] %s:%d %@(%p) Starting... audioController=%@, controllerClient=%@, delegate=%@";
        v13 = v16;
        v14 = 78;
        goto LABEL_11;
      }
    }
  }
  if (self->_state)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v32 = CFSTR("state");
    v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v22 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v23 = v21;
    v24 = -1;
  }
  else
  {
    self->_state = 1;
    v20 = _Block_copy(a3);
    self->_startCompletionBlock = v20;
    if (v20)
    {
      self->_sinkData.delegateContext.delegate = (VCAudioIOSink *)objc_loadWeak(&self->_sinkDelegate);
      self->_sourceData.delegateContext.delegate = (VCAudioIOSink *)objc_loadWeak(&self->_sourceDelegate);
      -[VCAudioIOControllerControl startClient:](self->_audioIOController, "startClient:", self->_controllerClient);
      pthread_mutex_unlock(p_stateMutex);
      return;
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_state, CFSTR("state"));
    v22 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v23 = v25;
    v24 = -3;
  }
  v26 = objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("VCAudioIO"), v24, v22);
  pthread_mutex_unlock(p_stateMutex);
  if (!v26)
    return;
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_29;
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    -[VCAudioIO startWithCompletionHandler:].cold.1();
    if (!a3)
      return;
LABEL_30:
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v26);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v27 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v27 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v35 = v28;
      v36 = 2080;
      v37 = "-[VCAudioIO startWithCompletionHandler:]";
      v38 = 1024;
      v39 = 952;
      v40 = 2112;
      v41 = (void *)v27;
      v42 = 2048;
      v43 = self;
      v44 = 2112;
      v45 = v26;
      _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Start failed. error:%@", buf, 0x3Au);
      if (!a3)
        return;
      goto LABEL_30;
    }
  }
LABEL_29:
  if (a3)
    goto LABEL_30;
}

- (id)start
{
  NSObject *v3;
  dispatch_time_t v4;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCAudioIO *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__18;
  v17 = __Block_byref_object_dispose__18;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __18__VCAudioIO_start__block_invoke;
  v12[3] = &unk_1E9E56570;
  v12[5] = v3;
  v12[6] = &v13;
  v12[4] = self;
  -[VCAudioIO startWithCompletionHandler:](self, "startWithCompletionHandler:", v12);
  v4 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioIO start].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v20 = v7;
          v21 = 2080;
          v22 = "-[VCAudioIO start]";
          v23 = 1024;
          v24 = 970;
          v25 = 2112;
          v26 = v5;
          v27 = 2048;
          v28 = self;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) start timed out", buf, 0x30u);
        }
      }
    }
    v9 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCAudioIO"), -4, &unk_1E9EFB330);
    v14[5] = v9;
    -[VCAudioIO stop](self, "stop");
  }
  else
  {
    v6 = (id)v14[5];
  }
  dispatch_release(v3);
  v10 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

intptr_t __18__VCAudioIO_start__block_invoke(uint64_t a1, int a2, void *a3)
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BYTE v23[18];
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136316162;
        v17 = v7;
        v18 = 2080;
        v19 = "-[VCAudioIO start]_block_invoke";
        v20 = 1024;
        v21 = 964;
        v22 = 1024;
        *(_DWORD *)v23 = a2;
        *(_WORD *)&v23[4] = 2112;
        *(_QWORD *)&v23[6] = a3;
        v9 = " [%s] %s:%d Executing start completion handler, succeeded=%d error=%@";
        v10 = v8;
        v11 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v16 = 136316674;
        v17 = v12;
        v18 = 2080;
        v19 = "-[VCAudioIO start]_block_invoke";
        v20 = 1024;
        v21 = 964;
        v22 = 2112;
        *(_QWORD *)v23 = v6;
        *(_WORD *)&v23[8] = 2048;
        *(_QWORD *)&v23[10] = v14;
        v24 = 1024;
        v25 = a2;
        v26 = 2112;
        v27 = a3;
        v9 = " [%s] %s:%d %@(%p) Executing start completion handler, succeeded=%d error=%@";
        v10 = v13;
        v11 = 64;
        goto LABEL_11;
      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)stopWithCompletionHandlerInternal:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  VCAudioIOControllerControl *audioIOController;
  VCAudioIOControllerClient *controllerClient;
  VCAudioIOControllerControl *delegate;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  VCAudioIOControllerControl *v16;
  VCAudioIOControllerClient *v17;
  id v18;
  id stopCompletionBlock;
  void *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  VCAudioIO *v40;
  __int16 v41;
  VCAudioIOControllerControl *v42;
  __int16 v43;
  VCAudioIOControllerClient *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if ((VCAudioIO *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        audioIOController = self->_audioIOController;
        controllerClient = self->_controllerClient;
        delegate = (VCAudioIOControllerControl *)self->_delegate;
        *(_DWORD *)buf = 136316418;
        v32 = v6;
        v33 = 2080;
        v34 = "-[VCAudioIO stopWithCompletionHandlerInternal:]";
        v35 = 1024;
        v36 = 984;
        v37 = 2112;
        v38 = audioIOController;
        v39 = 2112;
        v40 = (VCAudioIO *)controllerClient;
        v41 = 2112;
        v42 = delegate;
        v11 = " [%s] %s:%d Stopping... audioController=%@, controllerClient=%@, delegate=%@";
        v12 = v7;
        v13 = 58;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_audioIOController;
        v17 = self->_controllerClient;
        v18 = self->_delegate;
        *(_DWORD *)buf = 136316930;
        v32 = v14;
        v33 = 2080;
        v34 = "-[VCAudioIO stopWithCompletionHandlerInternal:]";
        v35 = 1024;
        v36 = 984;
        v37 = 2112;
        v38 = (void *)v5;
        v39 = 2048;
        v40 = self;
        v41 = 2112;
        v42 = v16;
        v43 = 2112;
        v44 = v17;
        v45 = 2112;
        v46 = v18;
        v11 = " [%s] %s:%d %@(%p) Stopping... audioController=%@, controllerClient=%@, delegate=%@";
        v12 = v15;
        v13 = 78;
        goto LABEL_11;
      }
    }
  }
  if (!self->_state)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v29 = CFSTR("state");
    v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
    v23 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v24 = v22;
    v25 = -1;
    return (id)objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("VCAudioIO"), v25, v23);
  }
  stopCompletionBlock = self->_stopCompletionBlock;
  if (stopCompletionBlock)
    _Block_release(stopCompletionBlock);
  if (a3)
  {
    v20 = _Block_copy(a3);
    self->_stopCompletionBlock = v20;
    if (!v20)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_state, CFSTR("state"));
      v23 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v24 = v26;
      v25 = -3;
      return (id)objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("VCAudioIO"), v25, v23);
    }
  }
  self->_state = 3;
  -[VCAudioIOControllerControl stopClient:](self->_audioIOController, "stopClient:", self->_controllerClient);
  return 0;
}

- (void)stopWithCompletionHandler:(id)a3
{
  _opaque_pthread_mutex_t *p_stateMutex;
  id v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  VCAudioIO *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  v6 = -[VCAudioIO stopWithCompletionHandlerInternal:](self, "stopWithCompletionHandlerInternal:", a3);
  pthread_mutex_unlock(p_stateMutex);
  if (v6)
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_12;
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      -[VCAudioIO stopWithCompletionHandler:].cold.1();
      if (!a3)
        return;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v8 = VRTraceErrorLogLevelToCSTR(),
            v9 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_12:
        if (!a3)
          return;
        goto LABEL_13;
      }
      v10 = 136316418;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCAudioIO stopWithCompletionHandler:]";
      v14 = 1024;
      v15 = 1009;
      v16 = 2112;
      v17 = v7;
      v18 = 2048;
      v19 = self;
      v20 = 2112;
      v21 = v6;
      _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Stop failed. error:%@", (uint8_t *)&v10, 0x3Au);
      if (!a3)
        return;
    }
LABEL_13:
    (*((void (**)(id, _QWORD, id))a3 + 2))(a3, 0, v6);
  }
}

- (id)stop
{
  NSObject *v3;
  dispatch_time_t v4;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  VCAudioIO *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__18;
  v18 = __Block_byref_object_dispose__18;
  v19 = 0;
  v3 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __17__VCAudioIO_stop__block_invoke;
  v13[3] = &unk_1E9E56570;
  v13[5] = v3;
  v13[6] = &v14;
  v13[4] = self;
  -[VCAudioIO stopWithCompletionHandler:](self, "stopWithCompletionHandler:", v13);
  v4 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    if ((VCAudioIO *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioIO stop].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCAudioIO performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v23 = v7;
          v24 = 2080;
          v25 = "-[VCAudioIO stop]";
          v26 = 1024;
          v27 = 1027;
          v28 = 2112;
          v29 = v5;
          v30 = 2048;
          v31 = self;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stop timed out", buf, 0x30u);
        }
      }
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("state");
    v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_state);
    v10 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("VCAudioIO"), -4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v15[5] = v10;
  }
  else
  {
    v6 = (id)v15[5];
  }
  dispatch_release(v3);
  v11 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

intptr_t __17__VCAudioIO_stop__block_invoke(uint64_t a1, int a2, void *a3)
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BYTE v23[18];
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136316162;
        v17 = v7;
        v18 = 2080;
        v19 = "-[VCAudioIO stop]_block_invoke";
        v20 = 1024;
        v21 = 1021;
        v22 = 1024;
        *(_DWORD *)v23 = a2;
        *(_WORD *)&v23[4] = 2112;
        *(_QWORD *)&v23[6] = a3;
        v9 = " [%s] %s:%d Executing stop completion handler, succeeded=%d error=%@";
        v10 = v8;
        v11 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v16 = 136316674;
        v17 = v12;
        v18 = 2080;
        v19 = "-[VCAudioIO stop]_block_invoke";
        v20 = 1024;
        v21 = 1021;
        v22 = 2112;
        *(_QWORD *)v23 = v6;
        *(_WORD *)&v23[8] = 2048;
        *(_QWORD *)&v23[10] = v14;
        v24 = 1024;
        v25 = a2;
        v26 = 2112;
        v27 = a3;
        v9 = " [%s] %s:%d %@(%p) Executing stop completion handler, succeeded=%d error=%@";
        v10 = v13;
        v11 = 64;
        goto LABEL_11;
      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)isGKVoiceChat
{
  return self->_isGKVoiceChat;
}

- (unsigned)state
{
  return self->_state;
}

+ (void)controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:ne"
                      "tworkClockID:remoteDeviceInfo:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d No controller found for device role:%d", v2, *(const char **)v3, (unint64_t)"+[VCAudioIO controllerForDeviceRole:audioType:direction:operatingMode:streamInputID:streamToken:networkClockID:remoteDeviceInfo:]" >> 16, 309);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioIO initWithConfiguration:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Controller not found for device role:%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioIO initWithConfiguration:]" >> 16, 391);
  OUTLINED_FUNCTION_3();
}

- (void)reconfigureWithConfig:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Controller not found for device role:%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)reconfigureWithConfig:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Operation not allowed while the audio IO is running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setFarEndVersionInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Operation not allowed while the audio IO is running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createConverterForSource:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d The controller audio format is invalid!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didStart:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to start!!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didStop:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to stop!!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startWithCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Start failed. error:%@");
  OUTLINED_FUNCTION_3();
}

- (void)start
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d start timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopWithCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stop failed. error:%@");
  OUTLINED_FUNCTION_3();
}

- (void)stop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stop timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
