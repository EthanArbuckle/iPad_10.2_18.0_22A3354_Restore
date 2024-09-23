@implementation VCAudioHALPluginDevice

- (VCAudioHALPluginDevice)initWithConfig:(tagVCAudioHALPluginConfiguration *)a3
{
  const __CFString *v5;
  id v6;
  VCAudioHALPluginDevice *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  const char *v15;
  dispatch_queue_t v16;
  VCAudioHALPluginStream *v17;
  VCAudioHALPluginMockAudioInject *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  mach_timebase_info info;
  objc_super v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  VCAudioHALPluginDevice *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (a3 && -[VCAudioHALPluginRemoteDeviceInfo deviceUID](a3->remoteDeviceInfo, "deviceUID"))
    v5 = -[VCAudioHALPluginRemoteDeviceInfo deviceUID](a3->remoteDeviceInfo, "deviceUID");
  else
    v5 = CFSTR("CC4B9AAD-7DF1-4EEA-8E0A-EB7CEE94C512");
  v6 = +[VCAudioHALPluginDevice sharedAudioServerDriverPlugin](VCAudioHALPluginDevice, "sharedAudioServerDriverPlugin");
  v33.receiver = self;
  v33.super_class = (Class)VCAudioHALPluginDevice;
  v7 = -[ASDAudioDevice initWithDeviceUID:withPlugin:](&v33, sel_initWithDeviceUID_withPlugin_, v5, v6);
  if (!v7)
    goto LABEL_65;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginDevice-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v36 = v8;
      v37 = 2080;
      v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
      v39 = 1024;
      v40 = 68;
      v41 = 2048;
      v42 = v7;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginDevice-init (%p)", buf, 0x26u);
    }
  }
  if (!a3)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginDevice initWithConfig:].cold.1();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](v7, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_65;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_65;
    *(_DWORD *)buf = 136316162;
    v36 = v24;
    v37 = 2080;
    v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
    v39 = 1024;
    v40 = 69;
    v41 = 2112;
    v42 = (void *)v20;
    v43 = 2048;
    v44 = v7;
    v26 = " [%s] %s:%d %@(%p) invalid config";
    goto LABEL_64;
  }
  if (!v6)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginDevice initWithConfig:].cold.2();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](v7, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_65;
    v27 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_65;
    *(_DWORD *)buf = 136316162;
    v36 = v27;
    v37 = 2080;
    v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
    v39 = 1024;
    v40 = 70;
    v41 = 2112;
    v42 = (void *)v21;
    v43 = 2048;
    v44 = v7;
    v26 = " [%s] %s:%d %@(%p) nil plugin";
LABEL_64:
    _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x30u);
    goto LABEL_65;
  }
  -[ASDAudioDevice setManufacturerName:](v7, "setManufacturerName:", CFSTR("Apple Inc."));
  -[ASDAudioDevice setCanBeDefaultDevice:](v7, "setCanBeDefaultDevice:", 1);
  -[ASDAudioDevice setCanBeDefaultSystemDevice:](v7, "setCanBeDefaultSystemDevice:", 1);
  -[ASDAudioDevice setCanChangeDeviceName:](v7, "setCanChangeDeviceName:", 0);
  v34 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->sinkFormat.format.mSampleRate);
  -[ASDAudioDevice setSamplingRates:](v7, "setSamplingRates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1));
  -[ASDAudioDevice setSamplingRate:](v7, "setSamplingRate:", a3->sinkFormat.format.mSampleRate);
  -[ASDAudioDevice setInputSafetyOffset:](v7, "setInputSafetyOffset:", 0);
  -[ASDAudioDevice setOutputSafetyOffset:](v7, "setOutputSafetyOffset:", 0);
  -[ASDAudioDevice setTransportType:](v7, "setTransportType:", 1668506482);
  v7->_samplesPerFrame = a3->sinkFormat.samplesPerFrame;
  -[ASDAudioDevice setTimestampPeriod:](v7, "setTimestampPeriod:", (a3->sinkFormat.format.mSampleRate * 0.26));
  -[VCAudioHALPluginDevice configureRemoteDeviceInfo:](v7, "configureRemoteDeviceInfo:", a3->remoteDeviceInfo);
  info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info(&info);
  LODWORD(v10) = info.denom;
  LODWORD(v11) = info.numer;
  v7->_clockFrequency = (double)v10 / (double)v11 * 1000000000.0;
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = objc_msgSend(v6, "bundleID");
  v14 = (objc_class *)objc_opt_class();
  v15 = (const char *)objc_msgSend((id)objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.%@.%@"), v13, NSStringFromClass(v14), v5), "UTF8String");
  v16 = dispatch_queue_create(v15, 0);
  v7->_timeQueue = (OS_dispatch_queue *)v16;
  if (!v16)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginDevice initWithConfig:].cold.3();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](v7, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v36 = v29;
        v37 = 2080;
        v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
        v39 = 1024;
        v40 = 92;
        v41 = 2112;
        v42 = (void *)v22;
        v43 = 2048;
        v44 = v7;
        v26 = " [%s] %s:%d %@(%p) could not create dispatch queue";
        goto LABEL_64;
      }
    }
    goto LABEL_65;
  }
  v17 = -[VCAudioHALPluginStream initWithDirection:plugin:withConfig:]([VCAudioHALPluginStream alloc], "initWithDirection:plugin:withConfig:", 1869968496, v6, a3);
  v7->_outputStream = v17;
  if (!v17)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginDevice initWithConfig:].cold.4();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](v7, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v36 = v30;
        v37 = 2080;
        v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
        v39 = 1024;
        v40 = 94;
        v41 = 2112;
        v42 = (void *)v23;
        v43 = 2048;
        v44 = v7;
        v26 = " [%s] %s:%d %@(%p) could not allocate stream";
        goto LABEL_64;
      }
    }
    goto LABEL_65;
  }
  -[ASDStream setStreamName:](v17, "setStreamName:", CFSTR("AVConference Output Stream"));
  -[ASDAudioDevice addOutputStream:](v7, "addOutputStream:", v7->_outputStream);
  v18 = -[VCAudioHALPluginMockAudioInject initWithConfig:]([VCAudioHALPluginMockAudioInject alloc], "initWithConfig:", a3);
  v7->_mockAudioInject = v18;
  if (!v18)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginDevice initWithConfig:].cold.5();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](v7, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v36 = v28;
        v37 = 2080;
        v38 = "-[VCAudioHALPluginDevice initWithConfig:]";
        v39 = 1024;
        v40 = 98;
        v41 = 2112;
        v42 = (void *)v19;
        v43 = 2048;
        v44 = v7;
        v26 = " [%s] %s:%d %@(%p) could not allocate mock audio inject";
        goto LABEL_64;
      }
    }
LABEL_65:

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *timeQueue;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCAudioHALPluginDevice *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginDevice-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCAudioHALPluginDevice dealloc]";
      v11 = 1024;
      v12 = 110;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginDevice-dealloc (%p)", buf, 0x26u);
    }
  }
  timeQueue = self->_timeQueue;
  if (timeQueue)
  {
    dispatch_release(timeQueue);
    self->_timeQueue = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)VCAudioHALPluginDevice;
  -[ASDAudioDevice dealloc](&v6, sel_dealloc);
}

- (void)configureRemoteDeviceInfo:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  uint64_t v25;
  NSString *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  VCAudioHALPluginDevice *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  NSString *v40;
  __int16 v41;
  NSString *v42;
  __int16 v43;
  NSString *v44;
  __int16 v45;
  NSString *v46;
  __int16 v47;
  NSString *v48;
  __int16 v49;
  NSString *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[ASDAudioDevice setDeviceName:](self, "setDeviceName:", objc_msgSend(a3, "deviceName"));
    -[ASDAudioDevice setModelUID:](self, "setModelUID:", objc_msgSend(a3, "modelUID"));
  }
  else
  {
    -[ASDAudioDevice setDeviceName:](self, "setDeviceName:", CFSTR("AVConference Audio Device"));
  }
  -[ASDAudioDevice setModelName:](self, "setModelName:", -[ASDAudioDevice deviceUID](self, "deviceUID"));
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = -[ASDAudioDevice deviceName](self, "deviceName");
        v9 = -[ASDAudioDevice deviceUID](self, "deviceUID");
        v10 = -[ASDAudioDevice modelUID](self, "modelUID");
        v11 = -[ASDAudioDevice manufacturerName](self, "manufacturerName");
        v12 = -[ASDAudioDevice modelName](self, "modelName");
        v13 = -[ASDAudioDevice configurationBundleID](self, "configurationBundleID");
        -[ASDAudioDevice samplingRate](self, "samplingRate");
        *(_DWORD *)buf = 136317698;
        v28 = v6;
        v29 = 2080;
        v30 = "-[VCAudioHALPluginDevice configureRemoteDeviceInfo:]";
        v31 = 1024;
        v32 = 129;
        v33 = 2048;
        v34 = a3;
        v35 = 2112;
        v36 = (VCAudioHALPluginDevice *)v8;
        v37 = 2112;
        v38 = v9;
        v39 = 2112;
        v40 = v10;
        v41 = 2112;
        v42 = v11;
        v43 = 2112;
        v44 = v12;
        v45 = 2112;
        v46 = v13;
        v47 = 2048;
        v48 = v14;
        v15 = " [%s] %s:%d remoteDeviceInfo=%p deviceName=%@ deviceUID=%@ modelUID=%@ manufacturerName=%@ modelName=%@ co"
              "nfigurationBundleID=%@ samplingRate=%f";
        v16 = v7;
        v17 = 108;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v26 = -[ASDAudioDevice deviceName](self, "deviceName");
        v20 = -[ASDAudioDevice deviceUID](self, "deviceUID");
        v21 = -[ASDAudioDevice modelUID](self, "modelUID");
        v22 = -[ASDAudioDevice manufacturerName](self, "manufacturerName");
        v23 = -[ASDAudioDevice modelName](self, "modelName");
        v24 = -[ASDAudioDevice configurationBundleID](self, "configurationBundleID");
        -[ASDAudioDevice samplingRate](self, "samplingRate");
        *(_DWORD *)buf = 136318210;
        v28 = v18;
        v29 = 2080;
        v30 = "-[VCAudioHALPluginDevice configureRemoteDeviceInfo:]";
        v31 = 1024;
        v32 = 129;
        v33 = 2112;
        v34 = (id)v5;
        v35 = 2048;
        v36 = self;
        v37 = 2048;
        v38 = a3;
        v39 = 2112;
        v40 = v26;
        v41 = 2112;
        v42 = v20;
        v43 = 2112;
        v44 = v21;
        v45 = 2112;
        v46 = v22;
        v47 = 2112;
        v48 = v23;
        v49 = 2112;
        v50 = v24;
        v51 = 2048;
        v52 = v25;
        v15 = " [%s] %s:%d %@(%p) remoteDeviceInfo=%p deviceName=%@ deviceUID=%@ modelUID=%@ manufacturerName=%@ modelNam"
              "e=%@ configurationBundleID=%@ samplingRate=%f";
        v16 = v19;
        v17 = 128;
        goto LABEL_14;
      }
    }
  }
}

- (void)invalidate
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
  VCAudioHALPluginDevice *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginDevice-invalidate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCAudioHALPluginDevice invalidate]";
      v9 = 1024;
      v10 = 133;
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginDevice-invalidate (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
  -[ASDAudioDevice removeOutputStream:](self, "removeOutputStream:", self->_outputStream);
  -[VCAudioHALPluginStream invalidate](self->_outputStream, "invalidate");
}

- (BOOL)start
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  VCAudioHALPluginDevice *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136315650;
        v21 = v4;
        v22 = 2080;
        v23 = "-[VCAudioHALPluginDevice start]";
        v24 = 1024;
        v25 = 139;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v20, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136316162;
        v21 = v9;
        v22 = 2080;
        v23 = "-[VCAudioHALPluginDevice start]";
        v24 = 1024;
        v25 = 139;
        v26 = 2112;
        v27 = v3;
        v28 = 2048;
        v29 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  if (self->_isRunning)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginDevice start].cold.2();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    v20 = 136316162;
    v21 = v16;
    v22 = 2080;
    v23 = "-[VCAudioHALPluginDevice start]";
    v24 = 1024;
    v25 = 142;
    v26 = 2112;
    v27 = v14;
    v28 = 2048;
    v29 = self;
    v18 = " [%s] %s:%d %@(%p) audio server driver already running";
    goto LABEL_37;
  }
  v11 = +[VCAudioHALPluginDevice sharedAudioServerDriverPlugin](VCAudioHALPluginDevice, "sharedAudioServerDriverPlugin");
  if (!v11)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginDevice start].cold.1();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v19 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    v20 = 136316162;
    v21 = v19;
    v22 = 2080;
    v23 = "-[VCAudioHALPluginDevice start]";
    v24 = 1024;
    v25 = 144;
    v26 = 2112;
    v27 = v15;
    v28 = 2048;
    v29 = self;
    v18 = " [%s] %s:%d %@(%p) audio server driver plug in does not exist";
LABEL_37:
    _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v20, 0x30u);
    return 0;
  }
  objc_msgSend(v11, "addAudioDevice:", self);
  v12 = 1;
  self->_isRunning = 1;
  -[VCAudioHALPluginMockAudioInject start](self->_mockAudioInject, "start");
  return v12;
}

- (BOOL)stop
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  _BYTE v25[24];
  __int128 v26;
  VCAudioHALPluginDevice *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v25 = 136315650;
        *(_QWORD *)&v25[4] = v4;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCAudioHALPluginDevice stop]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 154;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v25, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v25 = 136316162;
        *(_QWORD *)&v25[4] = v9;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCAudioHALPluginDevice stop]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 154;
        WORD2(v26) = 2112;
        *(_QWORD *)((char *)&v26 + 6) = v3;
        HIWORD(v26) = 2048;
        v27 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  if (!self->_isRunning)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      {
LABEL_37:
        v12 = 0;
        goto LABEL_15;
      }
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      v12 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)v25 = 136315650;
      *(_QWORD *)&v25[4] = v16;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCAudioHALPluginDevice stop]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 157;
      v18 = " [%s] %s:%d audio server driver not running";
      v19 = v17;
      v20 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_37;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      v12 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)v25 = 136316162;
      *(_QWORD *)&v25[4] = v21;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCAudioHALPluginDevice stop]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 157;
      WORD2(v26) = 2112;
      *(_QWORD *)((char *)&v26 + 6) = v14;
      HIWORD(v26) = 2048;
      v27 = self;
      v18 = " [%s] %s:%d %@(%p) audio server driver not running";
      v19 = v22;
      v20 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, v25, v20);
    goto LABEL_37;
  }
  v11 = +[VCAudioHALPluginDevice sharedAudioServerDriverPlugin](VCAudioHALPluginDevice, "sharedAudioServerDriverPlugin");
  if (!v11)
  {
    if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioHALPluginDevice stop].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v25 = 136316162;
          *(_QWORD *)&v25[4] = v23;
          *(_WORD *)&v25[12] = 2080;
          *(_QWORD *)&v25[14] = "-[VCAudioHALPluginDevice stop]";
          *(_WORD *)&v25[22] = 1024;
          LODWORD(v26) = 159;
          WORD2(v26) = 2112;
          *(_QWORD *)((char *)&v26 + 6) = v15;
          HIWORD(v26) = 2048;
          v27 = self;
          _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) audio server driver plug in does not exist", v25, 0x30u);
        }
      }
    }
    goto LABEL_37;
  }
  objc_msgSend(v11, "removeAudioDevice:", self);
  self->_isRunning = 0;
  v12 = 1;
LABEL_15:
  -[VCAudioHALPluginMockAudioInject stop](self->_mockAudioInject, "stop", *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27);
  return v12;
}

+ (id)sharedAudioServerDriverPlugin
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = a1;
  if (+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]::onceToken != -1)
    dispatch_once(&+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]::onceToken, v3);
  return (id)+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]::_sharedAsdPlugIn;
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  const __CFString *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
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
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CFEFA0]);
  +[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]::_sharedAsdPlugIn = (uint64_t)v2;
  if (!v2)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_1();
      }
      goto LABEL_35;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_35;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136316162;
    v20 = v8;
    v21 = 2080;
    v22 = "+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]_block_invoke";
    v23 = 1024;
    v24 = 179;
    v25 = 2112;
    v26 = v4;
    v27 = 2048;
    v28 = v10;
    v11 = " [%s] %s:%d %@(%p) can not create audio server driver plug in";
LABEL_31:
    v14 = v9;
    v15 = 48;
    goto LABEL_37;
  }
  if (!objc_msgSend(v2, "driverRef"))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_2();
      }
      goto LABEL_35;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_35;
    v12 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136316162;
    v20 = v12;
    v21 = 2080;
    v22 = "+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]_block_invoke";
    v23 = 1024;
    v24 = 181;
    v25 = 2112;
    v26 = v5;
    v27 = 2048;
    v28 = v13;
    v11 = " [%s] %s:%d %@(%p) no driver reference for audio server driver plug in";
    goto LABEL_31;
  }
  v3 = AudioServerPlugInRegisterRemote();
  if (v3)
  {
    v6 = v3;
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_3();
      }
      goto LABEL_35;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v16 = VRTraceErrorLogLevelToCSTR(),
          v17 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_35:

      +[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]::_sharedAsdPlugIn = 0;
      return;
    }
    v18 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136316418;
    v20 = v16;
    v21 = 2080;
    v22 = "+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]_block_invoke";
    v23 = 1024;
    v24 = 183;
    v25 = 2112;
    v26 = v7;
    v27 = 2048;
    v28 = v18;
    v29 = 1024;
    v30 = v6;
    v11 = " [%s] %s:%d %@(%p) not able to register audio server driver plug in with error: %i";
    v14 = v17;
    v15 = 54;
LABEL_37:
    _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, v11, buf, v15);
    goto LABEL_35;
  }
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_2(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_2_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = 136316162;
        v7 = v3;
        v8 = 2080;
        v9 = "+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]_block_invoke";
        v10 = 1024;
        v11 = 175;
        v12 = 2112;
        v13 = v2;
        v14 = 2048;
        v15 = v5;
        _os_log_error_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) audio server driver plugin interrupted", (uint8_t *)&v6, 0x30u);
      }
    }
  }
}

- (int)performStartIO
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSObject *timeQueue;
  _QWORD block[5];
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  VCAudioHALPluginDevice *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginDevice-performStartIO");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v11 = v3;
      v12 = 2080;
      v13 = "-[VCAudioHALPluginDevice performStartIO]";
      v14 = 1024;
      v15 = 195;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginDevice-performStartIO (%p)", buf, 0x26u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)VCAudioHALPluginDevice;
  v5 = -[ASDAudioDevice performStartIO](&v9, sel_performStartIO);
  if (!v5)
  {
    timeQueue = self->_timeQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__VCAudioHALPluginDevice_performStartIO__block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = self;
    dispatch_async(timeQueue, block);
  }
  return v5;
}

uint64_t __40__VCAudioHALPluginDevice_performStartIO__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initialZeroTimestamp");
}

- (int)performStopIO
{
  uint64_t v3;
  NSObject *v4;
  NSObject *timeQueue;
  objc_super v7;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  VCAudioHALPluginDevice *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAudioHALPluginDevice-performStopIO");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v3;
      v11 = 2080;
      v12 = "-[VCAudioHALPluginDevice performStopIO]";
      v13 = 1024;
      v14 = 207;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAudioHALPluginDevice-performStopIO (%p)", buf, 0x26u);
    }
  }
  timeQueue = self->_timeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCAudioHALPluginDevice_performStopIO__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(timeQueue, block);
  v7.receiver = self;
  v7.super_class = (Class)VCAudioHALPluginDevice;
  return -[ASDAudioDevice performStopIO](&v7, sel_performStopIO);
}

double __39__VCAudioHALPluginDevice_performStopIO__block_invoke(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 552);
  return VCAudioHALPluginTimestamp::reset((VCAudioHALPluginTimestamp *)(*(_QWORD *)(a1 + 32) + 488));
}

- (id)getZeroTimestampBlock
{
  VCAudioHALPluginTimestamp *p_timestamp;
  id result;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  p_timestamp = &self->_timestamp;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__VCAudioHALPluginDevice_getZeroTimestampBlock__block_invoke;
  v5[3] = &__block_descriptor_40_e20_i36__0_d8_Q16_Q24I32l;
  v5[4] = p_timestamp;
  result = (id)objc_msgSend(v5, "copy");
  self->_zeroTimestampBlock = result;
  return result;
}

uint64_t __47__VCAudioHALPluginDevice_getZeroTimestampBlock__block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3, unint64_t *a4)
{
  unint64_t v7;
  __n128 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9.n128_u64[0] = -1;
  v9.n128_u64[1] = 0xAAAAAAAAAAAAAAAALL;
  v10 = 0xAAAAAAAAAAAAAAAALL;
  VCAudioHALPluginTimestamp::read(*(VCAudioHALPluginTimestamp **)(a1 + 32), &v9);
  *a2 = v9.n128_u64[0];
  v7 = v10;
  *a3 = v9.n128_u64[1];
  *a4 = v7;
  return 0;
}

- (id)willDoReadInputBlock
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  id result;
  _QWORD v13[4];
  BOOL v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCAudioHALPluginDevice *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = v4;
        v17 = 2080;
        v18 = "-[VCAudioHALPluginDevice willDoReadInputBlock]";
        v19 = 1024;
        v20 = 230;
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
      v3 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v9;
        v17 = 2080;
        v18 = "-[VCAudioHALPluginDevice willDoReadInputBlock]";
        v19 = 1024;
        v20 = 230;
        v21 = 2112;
        v22 = v3;
        v23 = 2048;
        v24 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  v11 = -[ASDAudioDevice hasInput](self, "hasInput");

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__VCAudioHALPluginDevice_willDoReadInputBlock__block_invoke;
  v13[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  v14 = v11;
  result = (id)objc_msgSend(v13, "copy");
  self->_willDoReadInputBlock = result;
  return result;
}

uint64_t __46__VCAudioHALPluginDevice_willDoReadInputBlock__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
{
  uint64_t result;

  result = 1970171760;
  if (a3)
  {
    if (a4)
    {
      result = 0;
      *a3 = *(_BYTE *)(a1 + 32);
      *a4 = 1;
    }
  }
  return result;
}

- (id)willDoWriteMixBlock
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  id result;
  _QWORD v13[4];
  BOOL v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCAudioHALPluginDevice *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = v4;
        v17 = 2080;
        v18 = "-[VCAudioHALPluginDevice willDoWriteMixBlock]";
        v19 = 1024;
        v20 = 247;
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
      v3 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v9;
        v17 = 2080;
        v18 = "-[VCAudioHALPluginDevice willDoWriteMixBlock]";
        v19 = 1024;
        v20 = 247;
        v21 = 2112;
        v22 = v3;
        v23 = 2048;
        v24 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  v11 = -[ASDAudioDevice hasOutput](self, "hasOutput");

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__VCAudioHALPluginDevice_willDoWriteMixBlock__block_invoke;
  v13[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  v14 = v11;
  result = (id)objc_msgSend(v13, "copy");
  self->_willDoWriteMixBlock = result;
  return result;
}

uint64_t __45__VCAudioHALPluginDevice_willDoWriteMixBlock__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, _BYTE *a4)
{
  uint64_t result;

  result = 1970171760;
  if (a3)
  {
    if (a4)
    {
      result = 0;
      *a3 = *(_BYTE *)(a1 + 32);
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)changeSamplingRate:(double)a3
{
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__VCAudioHALPluginDevice_changeSamplingRate___block_invoke;
  v4[3] = &unk_1E9E52960;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  -[ASDAudioDevice requestConfigurationChange:](self, "requestConfigurationChange:", v4);
  return 1;
}

void __45__VCAudioHALPluginDevice_changeSamplingRate___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
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
  objc_msgSend(*(id *)(a1 + 32), "setSamplingRate:", *(double *)(a1 + 40));
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(const __CFString **)(a1 + 40);
        v13 = 136315906;
        v14 = v3;
        v15 = 2080;
        v16 = "-[VCAudioHALPluginDevice changeSamplingRate:]_block_invoke";
        v17 = 1024;
        v18 = 266;
        v19 = 2048;
        v20 = v5;
        v6 = " [%s] %s:%d newRate=%f";
        v7 = v4;
        v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 136316418;
        v14 = v9;
        v15 = 2080;
        v16 = "-[VCAudioHALPluginDevice changeSamplingRate:]_block_invoke";
        v17 = 1024;
        v18 = 266;
        v19 = 2112;
        v20 = v2;
        v21 = 2048;
        v22 = v11;
        v23 = 2048;
        v24 = v12;
        v6 = " [%s] %s:%d %@(%p) newRate=%f";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)initialZeroTimestamp
{
  uint64_t v3;
  unint64_t currentSeed;
  double v5;
  double clockFrequency;
  double v7;
  dispatch_time_t v8;
  uint64_t v9;
  NSObject *timeQueue;
  _QWORD block[5];
  tagVCAudioHALPluginTimestampInfo v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = mach_absolute_time();
  currentSeed = self->_currentSeed;
  v12.sampleTime = 0.0;
  v12.hostTime = v3;
  v12.seed = currentSeed;
  *(_QWORD *)&v5 = VCAudioHALPluginTimestamp::write(&self->_timestamp, &v12).n128_u64[0];
  clockFrequency = self->_clockFrequency;
  -[ASDAudioDevice samplingRate](self, "samplingRate", v5);
  v8 = v3 + (unint64_t)(clockFrequency / v7 * (double)-[ASDAudioDevice timestampPeriod](self, "timestampPeriod"));
  v9 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  timeQueue = self->_timeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCAudioHALPluginDevice_initialZeroTimestamp__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = v9;
  dispatch_after(v8, timeQueue, block);
}

_QWORD *__46__VCAudioHALPluginDevice_initialZeroTimestamp__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (result)
    return (_QWORD *)objc_msgSend(result, "updateZeroTimestamp:", result[69]);
  return result;
}

- (void)updateZeroTimestamp:(unint64_t)a3
{
  VCAudioHALPluginTimestamp *p_timestamp;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double clockFrequency;
  double v11;
  double v12;
  unsigned int v13;
  unint64_t currentSeed;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  NSObject *timeQueue;
  _QWORD block[6];
  tagVCAudioHALPluginTimestampInfo v23;
  __n128 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_currentSeed == a3)
  {
    v24.n128_u64[0] = -1;
    v24.n128_u64[1] = 0xAAAAAAAAAAAAAAAALL;
    v25 = 0xAAAAAAAAAAAAAAAALL;
    p_timestamp = &self->_timestamp;
    *(_QWORD *)&v6 = VCAudioHALPluginTimestamp::read(&self->_timestamp, &v24).n128_u64[0];
    v7 = v24.n128_f64[0];
    v8 = v7 + (double)-[ASDAudioDevice timestampPeriod](self, "timestampPeriod", v6);
    v9 = v24.n128_u64[1];
    clockFrequency = self->_clockFrequency;
    -[ASDAudioDevice samplingRate](self, "samplingRate");
    v12 = clockFrequency / v11;
    v13 = -[ASDAudioDevice timestampPeriod](self, "timestampPeriod");
    currentSeed = self->_currentSeed;
    v15 = v9 + (unint64_t)(v12 * (double)v13);
    v23.sampleTime = v8;
    v23.hostTime = v15;
    v23.seed = currentSeed;
    *(_QWORD *)&v16 = VCAudioHALPluginTimestamp::write(p_timestamp, &v23).n128_u64[0];
    v17 = self->_clockFrequency;
    -[ASDAudioDevice samplingRate](self, "samplingRate", v16);
    v19 = v17 / v18 * (double)-[ASDAudioDevice timestampPeriod](self, "timestampPeriod") + (double)v15;
    v20 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    timeQueue = self->_timeQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__VCAudioHALPluginDevice_updateZeroTimestamp___block_invoke;
    block[3] = &unk_1E9E52960;
    block[4] = v20;
    block[5] = a3;
    dispatch_after((unint64_t)v19, timeQueue, block);
  }
}

void *__46__VCAudioHALPluginDevice_updateZeroTimestamp___block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (result)
    return (void *)objc_msgSend(result, "updateZeroTimestamp:", *(_QWORD *)(a1 + 40));
  return result;
}

- (unsigned)calculateIOBufferFrameSize:(unsigned int)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int samplesPerFrame;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BYTE v23[10];
  VCAudioHALPluginDevice *v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((VCAudioHALPluginDevice *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        samplesPerFrame = self->_samplesPerFrame;
        v16 = 136316162;
        v17 = v6;
        v18 = 2080;
        v19 = "-[VCAudioHALPluginDevice calculateIOBufferFrameSize:]";
        v20 = 1024;
        v21 = 327;
        v22 = 1024;
        *(_DWORD *)v23 = a3;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = samplesPerFrame;
        v9 = " [%s] %s:%d requestedSize=%d configuring for samplesPerFrame=%d";
        v10 = v7;
        v11 = 40;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioHALPluginDevice performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = self->_samplesPerFrame;
        v16 = 136316674;
        v17 = v12;
        v18 = 2080;
        v19 = "-[VCAudioHALPluginDevice calculateIOBufferFrameSize:]";
        v20 = 1024;
        v21 = 327;
        v22 = 2112;
        *(_QWORD *)v23 = v5;
        *(_WORD *)&v23[8] = 2048;
        v24 = self;
        v25 = 1024;
        v26 = a3;
        v27 = 1024;
        v28 = v14;
        v9 = " [%s] %s:%d %@(%p) requestedSize=%d configuring for samplesPerFrame=%d";
        v10 = v13;
        v11 = 60;
        goto LABEL_11;
      }
    }
  }
  return self->_samplesPerFrame;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL result;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCAudioHALPluginDevice;
  result = -[ASDAudioDevice getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v14, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_, a3, *(_QWORD *)&a4, a5, a6, a7, *(_QWORD *)&a8);
  if (a3 && a6 && a7 && a3->mSelector == 1667658618)
  {
    *(_DWORD *)a7 = -[VCAudioHALPluginDevice calculateIOBufferFrameSize:](self, "calculateIOBufferFrameSize:", *(unsigned int *)a5);
    *a6 = 4;
    return 1;
  }
  return result;
}

+ (id)sharedAudioHALPluginNullDevice
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("startAudioHALPluginNullDevice"), 0))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__VCAudioHALPluginDevice_sharedAudioHALPluginNullDevice__block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = a1;
    if (+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::onceToken != -1)
      dispatch_once(&+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::onceToken, block);
    if (!+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::_sharedPlugInNullDevice)
    {
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v4 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v4 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v5 = VRTraceErrorLogLevelToCSTR();
          v6 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v9 = v5;
            v10 = 2080;
            v11 = "+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]";
            v12 = 1024;
            v13 = 365;
            v14 = 2112;
            v15 = v4;
            v16 = 2048;
            v17 = a1;
            _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) audio server driver plug in null device does not exist", buf, 0x30u);
          }
        }
      }
    }
  }
  return (id)+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::_sharedPlugInNullDevice;
}

void __56__VCAudioHALPluginDevice_sharedAudioHALPluginNullDevice__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  Format_Float((uint64_t)&v19, 2, 48000);
  v12 = v19;
  v13 = v20;
  v14 = v21;
  v15 = 0xAAAAAAAA000001E0;
  v2 = *(_QWORD *)(a1 + 32);
  v17 = 0;
  v18 = 0;
  v16 = v2;
  +[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::_sharedPlugInNullDevice = -[VCAudioHALPluginDevice initWithConfig:]([VCAudioHALPluginDevice alloc], "initWithConfig:", &v12);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v23 = v4;
        v24 = 2080;
        v25 = "+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]_block_invoke";
        v26 = 1024;
        v27 = 363;
        v28 = 2048;
        v29 = +[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::_sharedPlugInNullDevice;
        v6 = " [%s] %s:%d created audio server driver plug in null device=%p";
        v7 = v5;
        v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix, v12, v13, v14, v15, v16, v17, v18);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136316418;
        v23 = v9;
        v24 = 2080;
        v25 = "+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]_block_invoke";
        v26 = 1024;
        v27 = 363;
        v28 = 2112;
        v29 = (uint64_t)v3;
        v30 = 2048;
        v31 = v11;
        v32 = 2048;
        v33 = +[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice]::_sharedPlugInNullDevice;
        v6 = " [%s] %s:%d %@(%p) created audio server driver plug in null device=%p";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void).cxx_destruct
{
  VCAudioHALPluginTimestamp *p_timestamp;
  tagVCAudioHALPluginTimestampInfo *begin;

  p_timestamp = &self->_timestamp;
  begin = self->_timestamp.timestamps.__begin_;
  if (begin)
  {
    p_timestamp->timestamps.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  VCAudioHALPluginTimestamp *p_timestamp;

  p_timestamp = &self->_timestamp;
  self->_timestamp.numberOfSlots = 4;
  std::vector<tagVCAudioHALPluginTimestampInfo>::vector(&self->_timestamp.timestamps.__begin_, 4uLL, (__int128 *)&self->_timestamp.initLocklessTimestampInfo);
  *(_OWORD *)&p_timestamp->timestampIndex.__a_.__a_value = 0u;
  *(_OWORD *)&p_timestamp->initLocklessTimestampInfo.hostTime = 0u;
  return self;
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d invalid config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil plugin", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not create dispatch queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not allocate mock audio inject", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d audio server driver already running", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d audio server driver plug in does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d can not create audio server driver plug in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d no driver reference for audio server driver plug in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_cold_3()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "+[VCAudioHALPluginDevice sharedAudioServerDriverPlugin]_block_invoke";
  v6 = 1024;
  v7 = 183;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d not able to register audio server driver plug in with error: %i", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

void __55__VCAudioHALPluginDevice_sharedAudioServerDriverPlugin__block_invoke_2_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d audio server driver plugin interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)sharedAudioHALPluginNullDevice
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d audio server driver plug in null device does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
