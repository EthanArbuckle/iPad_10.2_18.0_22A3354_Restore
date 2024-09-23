@implementation VCSystemAudioCaptureController

- (VCSystemAudioCaptureController)init
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 0u;
  v4 = 0u;
  DWORD1(v3) = -1;
  LODWORD(v4) = 1;
  return -[VCSystemAudioCaptureController initWithConfig:](self, "initWithConfig:", &v3);
}

- (VCSystemAudioCaptureController)initWithConfig:(const tagVCSystemAudioCaptureControllerConfig *)a3
{
  char *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  NSObject *CustomRootQueue;
  dispatch_queue_t v17;
  __CFString *captureContext;
  __int128 v19;
  uint64_t v20;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  objc_super v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  char *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)VCSystemAudioCaptureController;
  v4 = -[VCObject init](&v33, sel_init);
  if (!v4)
    return (VCSystemAudioCaptureController *)v4;
  if (!+[VCSystemAudioCaptureController isValidConfiguration:](VCSystemAudioCaptureController, "isValidConfiguration:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCaptureController initWithConfig:].cold.3();
    }
    goto LABEL_45;
  }
  objc_msgSend(v4, "setupLogPrefixWithConfig:", a3);
  if ((char *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v35 = v6;
        v36 = 2080;
        v37 = "-[VCSystemAudioCaptureController initWithConfig:]";
        v38 = 1024;
        v39 = 53;
        v8 = " [%s] %s:%d ";
        v9 = v7;
        v10 = 28;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v35 = v11;
        v36 = 2080;
        v37 = "-[VCSystemAudioCaptureController initWithConfig:]";
        v38 = 1024;
        v39 = 53;
        v40 = 2112;
        v41 = v5;
        v42 = 2048;
        v43 = v4;
        v8 = " [%s] %s:%d %@(%p) ";
        v9 = v12;
        v10 = 48;
        goto LABEL_13;
      }
    }
  }
  v13 = (void *)objc_msgSend(v4, "dispatchQueueNameWithConfig:", a3);
  if (!v13)
  {
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCaptureController initWithConfig:].cold.1();
      }
      goto LABEL_45;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_45;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_DWORD *)buf = 136316162;
    v35 = v26;
    v36 = 2080;
    v37 = "-[VCSystemAudioCaptureController initWithConfig:]";
    v38 = 1024;
    v39 = 55;
    v40 = 2112;
    v41 = v22;
    v42 = 2048;
    v43 = v4;
    v28 = " [%s] %s:%d %@(%p) Failed to generate dispatch queue name";
    v29 = v27;
    v30 = 48;
    goto LABEL_47;
  }
  v14 = v13;
  v15 = (const char *)objc_msgSend(v13, "UTF8String");
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v17 = dispatch_queue_create_with_target_V2(v15, 0, CustomRootQueue);
  *((_QWORD *)v4 + 21) = v17;
  if (!v17)
  {
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSystemAudioCaptureController initWithConfig:].cold.2();
      }
      goto LABEL_45;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v31 = VRTraceErrorLogLevelToCSTR(),
          v32 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_45:

      return 0;
    }
    *(_DWORD *)buf = 136316418;
    v35 = v31;
    v36 = 2080;
    v37 = "-[VCSystemAudioCaptureController initWithConfig:]";
    v38 = 1024;
    v39 = 57;
    v40 = 2112;
    v41 = v23;
    v42 = 2048;
    v43 = v4;
    v44 = 2112;
    v45 = v14;
    v28 = " [%s] %s:%d %@(%p) Failed to generate dispatch queue. queueName=%@";
    v29 = v32;
    v30 = 58;
LABEL_47:
    _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    goto LABEL_45;
  }
  captureContext = a3->tapSettings.captureContext;
  if (captureContext)
    CFRetain(captureContext);
  v19 = *(_OWORD *)&a3->tapSettings.source;
  *(_OWORD *)(v4 + 200) = *(_OWORD *)&a3->tapSettings.tapType;
  *(_OWORD *)(v4 + 216) = v19;
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AE8]), "initAuxiliarySession");
  *((_QWORD *)v4 + 24) = v20;
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v35 = v24;
        v36 = 2080;
        v37 = "-[VCSystemAudioCaptureController initWithConfig:]";
        v38 = 1024;
        v39 = 62;
        _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initAuxiliarySession failed", buf, 0x1Cu);
      }
    }
    goto LABEL_45;
  }
  return (VCSystemAudioCaptureController *)v4;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *dispatchQueue;
  __CFString *captureContext;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCSystemAudioCaptureController *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v15 = v4;
        v16 = 2080;
        v17 = "-[VCSystemAudioCaptureController dealloc]";
        v18 = 1024;
        v19 = 80;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSystemAudioCaptureController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v15 = v9;
        v16 = 2080;
        v17 = "-[VCSystemAudioCaptureController dealloc]";
        v18 = 1024;
        v19 = 80;
        v20 = 2112;
        v21 = v3;
        v22 = 2048;
        v23 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  captureContext = self->_configuration.tapSettings.captureContext;
  if (captureContext)
    CFRelease(captureContext);
  v13.receiver = self;
  v13.super_class = (Class)VCSystemAudioCaptureController;
  -[VCObject dealloc](&v13, sel_dealloc);
}

+ (BOOL)isValidConfiguration:(const tagVCSystemAudioCaptureControllerConfig *)a3
{
  unsigned int tapType;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  char IsOSFaultDisabled;
  NSObject *v8;

  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v6)
          return v6;
        +[VCSystemAudioCaptureController isValidConfiguration:].cold.1();
      }
      else
      {
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
        if (!v6)
          return v6;
        +[VCSystemAudioCaptureController isValidConfiguration:].cold.2();
      }
    }
    goto LABEL_33;
  }
  tapType = a3->tapSettings.tapType;
  if (a3->tapSettings.tapType >= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v8 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        v6 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
        if (!v6)
          return v6;
        +[VCSystemAudioCaptureController isValidConfiguration:].cold.3();
      }
      else
      {
        v6 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);
        if (!v6)
          return v6;
        +[VCSystemAudioCaptureController isValidConfiguration:].cold.4();
      }
    }
    goto LABEL_33;
  }
  if (tapType == 2)
  {
    if (a3->tapSettings.captureContext)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v6)
            return v6;
          +[VCSystemAudioCaptureController isValidConfiguration:].cold.7();
        }
        else
        {
          v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
          if (!v6)
            return v6;
          +[VCSystemAudioCaptureController isValidConfiguration:].cold.8();
        }
      }
      goto LABEL_33;
    }
LABEL_11:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (tapType != 1 || !a3->tapSettings.var0.audioProcessIdToTap)
    goto LABEL_11;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    v4 = VRTraceIsOSFaultDisabled();
    v5 = *MEMORY[0x1E0CF2758];
    if ((v4 & 1) != 0)
    {
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      +[VCSystemAudioCaptureController isValidConfiguration:].cold.5();
    }
    else
    {
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);
      if (!v6)
        return v6;
      +[VCSystemAudioCaptureController isValidConfiguration:].cold.6();
    }
  }
LABEL_33:
  LOBYTE(v6) = 0;
  return v6;
}

- (void)setupLogPrefixWithConfig:(const tagVCSystemAudioCaptureControllerConfig *)a3
{
  unsigned int tapType;
  uint64_t v5;

  tapType = a3->tapSettings.tapType;
  if (a3->tapSettings.tapType == 2)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CaptureContext=%@ "), a3->tapSettings.captureContext);
  }
  else if (tapType == 1)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SessionType(pre-spatial)=%d "), a3->tapSettings.var0.sessionTypeToTap);
  }
  else
  {
    if (tapType)
      return;
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PID=%d "), a3->tapSettings.var0.sessionTypeToTap);
  }
  -[VCObject setLogPrefix:](self, "setLogPrefix:", v5);
}

- (id)dispatchQueueNameWithConfig:(const tagVCSystemAudioCaptureControllerConfig *)a3
{
  void *v4;
  void *v5;
  unsigned int tapType;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("com.apple.AVConference.systemAudioCaptureController"));
  v5 = v4;
  tapType = a3->tapSettings.tapType;
  if (a3->tapSettings.tapType == 2)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(".scene_id%@"), a3->tapSettings.captureContext);
  }
  else if (tapType == 1)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(".session_type_%d"), 1);
  }
  else if (!tapType)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(".pid_%d"), a3->tapSettings.var0.sessionTypeToTap);
  }
  return v5;
}

+ (id)captureServerConfigForAudioConfig:(tagVCSystemAudioCaptureControllerConfig *)a3 forClient:(id)a4
{
  _QWORD *v6;
  uint64_t v7;
  VCAudioHALPluginRemoteDeviceInfo *remoteDeviceInfo;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v17 = *(_OWORD *)&a3->tapSettings.tapType;
  v18 = *(_QWORD *)&a3->tapSettings.source;
  v19 = 0;
  v6 = (_QWORD *)objc_msgSend(a4, "clientFormat");
  v15 = objc_msgSend(a4, "sinkIO", *v6, v6[1], v6[2], v6[3], v6[4], v6[5]);
  v16 = VCSystemAudioCaptureController_PushAudioSamples;
  v7 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v14, "{?={tagVCAudioFrameFormat={AudioStreamBasicDescription=dIIIIIIII}I}^v^?{tagVCSystemAudioCaptureTapSettings=I(?=iI)^{__CFString}I}@}");
  remoteDeviceInfo = a3->remoteDeviceInfo;
  if (remoteDeviceInfo)
  {
    v22[0] = CFSTR("SystemAudioCaptureConfig");
    v22[1] = CFSTR("SystemAudioCaptureClient");
    v23[0] = v7;
    v23[1] = a4;
    v22[2] = CFSTR("SystemAudioRemoteDeviceInfo");
    v23[2] = remoteDeviceInfo;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = v23;
    v11 = v22;
    v12 = 3;
  }
  else
  {
    v20[0] = CFSTR("SystemAudioCaptureConfig");
    v20[1] = CFSTR("SystemAudioCaptureClient");
    v21[0] = v7;
    v21[1] = a4;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = v21;
    v11 = v20;
    v12 = 2;
  }
  return (id)objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, v12);
}

+ (int)captureSourceForTypePreSpatialSessionType:(unsigned int)a3
{
  if (a3)
    return 0;
  else
    return 7;
}

+ (int)captureSourceForTypeProcessID:(int)a3
{
  if (a3 < 0xFFFFFFFD)
    return 0;
  else
    return dword_1D910C0B8[a3 + 3];
}

+ (int)captureSourceForSystemAudioCaptureControllerConfig:(tagVCSystemAudioCaptureControllerConfig *)a3
{
  if (a3->tapSettings.tapType == 1)
    return +[VCSystemAudioCaptureController captureSourceForTypePreSpatialSessionType:](VCSystemAudioCaptureController, "captureSourceForTypePreSpatialSessionType:", a3->tapSettings.var0.sessionTypeToTap);
  if (a3->tapSettings.tapType)
    return 0;
  return +[VCSystemAudioCaptureController captureSourceForTypeProcessID:](VCSystemAudioCaptureController, "captureSourceForTypeProcessID:", a3->tapSettings.var0.sessionTypeToTap);
}

- (void)handleAudioSessionMediaServicesWereResetNotification:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  VCAudioIOControllerClient *client;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  VCAudioIOControllerClient *v14;
  NSObject *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  VCSystemAudioCaptureController *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  VCAudioIOControllerClient *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        client = self->_client;
        *(_DWORD *)buf = 136316162;
        v18 = v6;
        v19 = 2080;
        v20 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]";
        v21 = 1024;
        v22 = 200;
        v23 = 2112;
        v24 = a3;
        v25 = 2112;
        v26 = (VCSystemAudioCaptureController *)client;
        v9 = " [%s] %s:%d notification=%@, _client=%@";
        v10 = v7;
        v11 = 48;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSystemAudioCaptureController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_client;
        *(_DWORD *)buf = 136316674;
        v18 = v12;
        v19 = 2080;
        v20 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]";
        v21 = 1024;
        v22 = 200;
        v23 = 2112;
        v24 = (id)v5;
        v25 = 2048;
        v26 = self;
        v27 = 2112;
        v28 = a3;
        v29 = 2112;
        v30 = v14;
        v9 = " [%s] %s:%d %@(%p) notification=%@, _client=%@";
        v10 = v13;
        v11 = 68;
        goto LABEL_11;
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__VCSystemAudioCaptureController_handleAudioSessionMediaServicesWereResetNotification___block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __87__VCSystemAudioCaptureController_handleAudioSessionMediaServicesWereResetNotification___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 184) || !*(_BYTE *)(v1 + 176))
    return;
  v3 = +[VCSystemAudioCaptureController captureServerConfigForAudioConfig:forClient:](VCSystemAudioCaptureController, "captureServerConfigForAudioConfig:forClient:", v1 + 200);
  v4 = +[VCSystemAudioCaptureController captureSourceForSystemAudioCaptureControllerConfig:](VCSystemAudioCaptureController, "captureSourceForSystemAudioCaptureControllerConfig:", *(_QWORD *)(a1 + 32) + 200);
  if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterCaptureConfig:forSource:", v3, v4) & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerCaptureConfig:forSource:", v3, v4);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
      goto LABEL_5;
    if (objc_opt_class() != *(_QWORD *)(a1 + 32))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v31 = *(_QWORD *)(a1 + 32);
          v32 = *(_QWORD *)(v31 + 184);
          v33 = 136316418;
          v34 = v30;
          v35 = 2080;
          v36 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
          v37 = 1024;
          v38 = 210;
          v39 = 2112;
          v40 = v17;
          v41 = 2048;
          v42 = v31;
          v43 = 1024;
          v44 = v32;
          v21 = " [%s] %s:%d %@(%p) Failed to restart _client=%d";
          goto LABEL_38;
        }
      }
      goto LABEL_5;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_5;
    v22 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
    v33 = 136315906;
    v34 = v22;
    v35 = 2080;
    v36 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
    v37 = 1024;
    v38 = 210;
    v39 = 1024;
    LODWORD(v40) = v23;
    v21 = " [%s] %s:%d Failed to restart _client=%d";
LABEL_29:
    v24 = v19;
    v25 = 34;
LABEL_39:
    _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v33, v25);
    goto LABEL_5;
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_5;
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
    v33 = 136315906;
    v34 = v18;
    v35 = 2080;
    v36 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
    v37 = 1024;
    v38 = 208;
    v39 = 1024;
    LODWORD(v40) = v20;
    v21 = " [%s] %s:%d Failed to stop _client=%d";
    goto LABEL_29;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
  else
    v16 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v28 = *(_QWORD *)(a1 + 32);
      v29 = *(_QWORD *)(v28 + 184);
      v33 = 136316418;
      v34 = v26;
      v35 = 2080;
      v36 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
      v37 = 1024;
      v38 = 208;
      v39 = 2112;
      v40 = v16;
      v41 = 2048;
      v42 = v28;
      v43 = 1024;
      v44 = v29;
      v21 = " [%s] %s:%d %@(%p) Failed to stop _client=%d";
LABEL_38:
      v24 = v27;
      v25 = 54;
      goto LABEL_39;
    }
  }
LABEL_5:
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 176);
        v33 = 136315906;
        v34 = v6;
        v35 = 2080;
        v36 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
        v37 = 1024;
        v38 = 212;
        v39 = 1024;
        LODWORD(v40) = v8;
        v9 = " [%s] %s:%d _running=%d";
        v10 = v7;
        v11 = 34;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v33, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(unsigned __int8 *)(v14 + 176);
        v33 = 136316418;
        v34 = v12;
        v35 = 2080;
        v36 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
        v37 = 1024;
        v38 = 212;
        v39 = 2112;
        v40 = v5;
        v41 = 2048;
        v42 = v14;
        v43 = 1024;
        v44 = v15;
        v9 = " [%s] %s:%d %@(%p) _running=%d";
        v10 = v13;
        v11 = 54;
        goto LABEL_15;
      }
    }
  }
}

- (void)startClient:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *dispatchQueue;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCSystemAudioCaptureController *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v19 = v6;
        v20 = 2080;
        v21 = "-[VCSystemAudioCaptureController startClient:]";
        v22 = 1024;
        v23 = 222;
        v8 = " [%s] %s:%d ";
        v9 = v7;
        v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSystemAudioCaptureController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v11;
        v20 = 2080;
        v21 = "-[VCSystemAudioCaptureController startClient:]";
        v22 = 1024;
        v23 = 222;
        v24 = 2112;
        v25 = v5;
        v26 = 2048;
        v27 = self;
        v8 = " [%s] %s:%d %@(%p) ";
        v9 = v12;
        v10 = 48;
        goto LABEL_11;
      }
    }
  }
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__VCSystemAudioCaptureController_startClient___block_invoke;
    v17[3] = &unk_1E9E52238;
    v17[4] = self;
    v17[5] = a3;
    dispatch_async(dispatchQueue, v17);
  }
  else if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCaptureController startClient:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCSystemAudioCaptureController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCSystemAudioCaptureController startClient:]";
        v22 = 1024;
        v23 = 225;
        v24 = 2112;
        v25 = v14;
        v26 = 2048;
        v27 = self;
        _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) nil client", buf, 0x30u);
      }
    }
  }
}

uint64_t __46__VCSystemAudioCaptureController_startClient___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  __int128 *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = +[VCSystemAudioCaptureController captureSourceForSystemAudioCaptureControllerConfig:](VCSystemAudioCaptureController, "captureSourceForSystemAudioCaptureControllerConfig:", *(_QWORD *)(a1 + 32) + 200);
  v3 = v2;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 232))
    v4 = (_DWORD)v2 == 5;
  else
    v4 = 0;
  if (v4)
  {
    v21 = xmmword_1D910C090;
    v22 = unk_1D910C0A0;
    *(_QWORD *)&v23 = 32;
    DWORD2(v23) = 960;
    v5 = &v21;
  }
  else
  {
    v5 = (__int128 *)objc_msgSend(*(id *)(a1 + 40), "clientFormat");
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "controllerFormatChanged:", v5);
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 176))
  {
    v12 = CFSTR("Client (%p) can not start system audio capture when already running");
    v13 = 32025;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerCaptureConfig:forSource:", +[VCSystemAudioCaptureController captureServerConfigForAudioConfig:forClient:](VCSystemAudioCaptureController, "captureServerConfigForAudioConfig:forClient:", v6 + 200, *(_QWORD *)(a1 + 40)), v3);
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v7 + 176))
    {
      *(_QWORD *)(v7 + 184) = *(_QWORD *)(a1 + 40);
      v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleAudioSessionMediaServicesWereResetNotification_, *MEMORY[0x1E0C89738], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192));
      v9 = 0;
      v10 = 1;
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStart:error:", v10, v9);
    }
    v12 = CFSTR("Client (%p) failed to start system audio capture");
    v13 = 32005;
  }
  v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v12, *(_QWORD *)(a1 + 40));
  if (v10)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __46__VCSystemAudioCaptureController_startClient___block_invoke_cold_1(v15, (void *)v10, v16);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v19 = *(_QWORD *)(a1 + 32);
          v20 = objc_msgSend((id)v10, "UTF8String");
          *(_DWORD *)buf = 136316418;
          v25 = v17;
          v26 = 2080;
          v27 = "-[VCSystemAudioCaptureController startClient:]_block_invoke";
          v28 = 1024;
          v29 = 263;
          v30 = 2112;
          v31 = v14;
          v32 = 2048;
          v33 = v19;
          v34 = 2080;
          v35 = v20;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) %s", buf, 0x3Au);
        }
      }
    }
    v9 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", v13, 0, v10);
    v10 = 0;
  }
  else
  {
    v9 = 0;
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStart:error:", v10, v9);
}

- (void)stopClient:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *dispatchQueue;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCSystemAudioCaptureController *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v19 = v6;
        v20 = 2080;
        v21 = "-[VCSystemAudioCaptureController stopClient:]";
        v22 = 1024;
        v23 = 271;
        v8 = " [%s] %s:%d ";
        v9 = v7;
        v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSystemAudioCaptureController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v11;
        v20 = 2080;
        v21 = "-[VCSystemAudioCaptureController stopClient:]";
        v22 = 1024;
        v23 = 271;
        v24 = 2112;
        v25 = v5;
        v26 = 2048;
        v27 = self;
        v8 = " [%s] %s:%d %@(%p) ";
        v9 = v12;
        v10 = 48;
        goto LABEL_11;
      }
    }
  }
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__VCSystemAudioCaptureController_stopClient___block_invoke;
    v17[3] = &unk_1E9E52238;
    v17[4] = self;
    v17[5] = a3;
    dispatch_async(dispatchQueue, v17);
  }
  else if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSystemAudioCaptureController stopClient:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCSystemAudioCaptureController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v15;
        v20 = 2080;
        v21 = "-[VCSystemAudioCaptureController stopClient:]";
        v22 = 1024;
        v23 = 274;
        v24 = 2112;
        v25 = v14;
        v26 = 2048;
        v27 = self;
        _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) nil client", buf, 0x30u);
      }
    }
  }
}

uint64_t __45__VCSystemAudioCaptureController_stopClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C89738], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = 0;
    if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterCaptureConfig:forSource:", +[VCSystemAudioCaptureController captureServerConfigForAudioConfig:forClient:](VCSystemAudioCaptureController, "captureServerConfigForAudioConfig:forClient:", *(_QWORD *)(a1 + 32) + 200, *(_QWORD *)(a1 + 40)), +[VCSystemAudioCaptureController captureSourceForSystemAudioCaptureControllerConfig:](VCSystemAudioCaptureController, "captureSourceForSystemAudioCaptureControllerConfig:", *(_QWORD *)(a1 + 32) + 200)) & 1) != 0)
    {
      v3 = 0;
      v4 = 1;
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", v4, v3);
    }
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client (%p) error stopping system audio capture"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client (%p) can not stop system audio capture when not running"), *(_QWORD *)(a1 + 40));
  }
  v3 = (void *)v5;
  if (v5)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __45__VCSystemAudioCaptureController_stopClient___block_invoke_cold_1(v7, v3, v8);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v12 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136316418;
          v14 = v9;
          v15 = 2080;
          v16 = "-[VCSystemAudioCaptureController stopClient:]_block_invoke";
          v17 = 1024;
          v18 = 299;
          v19 = 2112;
          v20 = v6;
          v21 = 2048;
          v22 = v12;
          v23 = 2080;
          v24 = objc_msgSend(v3, "UTF8String");
          _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) %s", buf, 0x3Au);
        }
      }
    }
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32005, 0, v3);
  }
  v4 = 0;
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", v4, v3);
}

- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _BYTE v15[24];
  __int128 v16;
  VCSystemAudioCaptureController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136315650;
        *(_QWORD *)&v15[4] = v8;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[VCSystemAudioCaptureController updateClient:settings:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 307;
        v10 = " [%s] %s:%d not handled";
        v11 = v9;
        v12 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSystemAudioCaptureController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136316162;
        *(_QWORD *)&v15[4] = v13;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[VCSystemAudioCaptureController updateClient:settings:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 307;
        WORD2(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 6) = v7;
        HIWORD(v16) = 2048;
        v17 = self;
        v10 = " [%s] %s:%d %@(%p) not handled";
        v11 = v14;
        v12 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(a3, "setDirection:", a4->var0, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17);
  objc_msgSend(a3, "setSpatialAudioDisabled:", a4->var1);
  objc_msgSend(a3, "setIsVoiceActivityEnabled:", a4->var2);
  objc_msgSend(a3, "setIsMediaPriorityEnabled:", a4->var3);
}

- (BOOL)supportsVoiceActivityDetection
{
  return 0;
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCSystemAudioCaptureController *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v5;
        v14 = 2080;
        v15 = "-[VCSystemAudioCaptureController didUpdateBasebandCodec:]";
        v16 = 1024;
        v17 = 321;
        v7 = " [%s] %s:%d not handled";
        v8 = v6;
        v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCSystemAudioCaptureController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316162;
        v13 = v10;
        v14 = 2080;
        v15 = "-[VCSystemAudioCaptureController didUpdateBasebandCodec:]";
        v16 = 1024;
        v17 = 321;
        v18 = 2112;
        v19 = v4;
        v20 = 2048;
        v21 = self;
        v7 = " [%s] %s:%d %@(%p) not handled";
        v8 = v11;
        v9 = 48;
        goto LABEL_11;
      }
    }
  }
}

- (void)initWithConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate dispatch queue name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCSystemAudioCaptureController initWithConfig:]";
  v6 = 1024;
  v7 = 57;
  v8 = 2112;
  v9 = v1;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Failed to generate dispatch queue. queueName=%@", v3);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "+[VCSystemAudioCaptureController isValidConfiguration:]";
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid tapType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCaptureController isValidConfiguration:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "+[VCSystemAudioCaptureController isValidConfiguration:]";
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10_7(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid tapType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCaptureController isValidConfiguration:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "+[VCSystemAudioCaptureController isValidConfiguration:]";
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid sessionType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCaptureController isValidConfiguration:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "+[VCSystemAudioCaptureController isValidConfiguration:]";
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10_7(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid sessionType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCaptureController isValidConfiguration:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d capture context is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)isValidConfiguration:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d capture context is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startClient:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__VCSystemAudioCaptureController_startClient___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[14];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;

  OUTLINED_FUNCTION_12_4(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v8 = "-[VCSystemAudioCaptureController startClient:]_block_invoke";
  v9 = 1024;
  v10 = 263;
  v11 = v4;
  v12 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d %s", v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)stopClient:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__VCSystemAudioCaptureController_stopClient___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[14];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;

  OUTLINED_FUNCTION_12_4(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v8 = "-[VCSystemAudioCaptureController stopClient:]_block_invoke";
  v9 = 1024;
  v10 = 299;
  v11 = v4;
  v12 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d %s", v7);
  OUTLINED_FUNCTION_3_0();
}

@end
