@implementation AVCRemoteVideoClient

- (AVCRemoteVideoClient)initWithStreamToken:(int64_t)a3 delegate:(id)a4
{
  AVCRemoteVideoClient *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *CustomRootQueue;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  AVCRemoteVideoClient *v26;
  __int16 v27;
  int64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)AVCRemoteVideoClient;
  v6 = -[AVCRemoteVideoClient init](&v18, sel_init);
  if (v6)
  {
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCRemoteVideoClient-init");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v20 = v7;
        v21 = 2080;
        v22 = "-[AVCRemoteVideoClient initWithStreamToken:delegate:]";
        v23 = 1024;
        v24 = 146;
        v25 = 2048;
        v26 = v6;
        v27 = 2048;
        v28 = a3;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCRemoteVideoClient-init (%p) streamToken=%ld", buf, 0x30u);
      }
    }
    VRTraceReset();
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v6->_avcRemoteVideoQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.remotevideo", 0, CustomRootQueue);
    v6->_activeVideoMode = 0;
    v6->_streamToken = a3;
    v6->_transformForRemoteVideoOrientationEnabled = 1;
    v10 = -[VCDefaults shouldDisplayVideoInfoLayer](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "shouldDisplayVideoInfoLayer");
    v6->_shouldDisplayVideoInfoLayer = v10;
    if (v10 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v20 = v11;
        v21 = 2080;
        v22 = "-[AVCRemoteVideoClient initWithStreamToken:delegate:]";
        v23 = 1024;
        v24 = 156;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Video info layer is enabled.", buf, 0x1Cu);
      }
    }
    v6->_connection = objc_alloc_init(AVConferenceXPCClient);
    objc_storeWeak(&v6->_delegate, a4);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a3);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v13, CFSTR("conferenceCallID"), 0);
    v15 = -[AVConferenceXPCClient sendMessageSync:arguments:](v6->_connection, "sendMessageSync:arguments:", "vcRemoteVideoInitializeRemoteVideoForStreamToken", v14);
    if (v15)
    {
      v16 = objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("vcRemoteVideoSlotsForModes"));
      if (v16)
      {
        v6->_slotsForModes = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v16);
        -[AVCRemoteVideoClient registerBlocksForNotifications](v6, "registerBlocksForNotifications");
        -[AVConferenceXPCClient sendMessageAsync:arguments:](v6->_connection, "sendMessageAsync:arguments:", "vcRemoteVideoGetCachedNotifications", v14);

        return v6;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient initWithStreamToken:delegate:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCRemoteVideoClient initWithStreamToken:delegate:].cold.1();
    }

    return 0;
  }
  return v6;
}

- (void)cleanupVideoLayerForAllModes
{
  -[AVCRemoteVideoClient setVideoLayer:forMode:](self, "setVideoLayer:forMode:", 0, 0);
  -[AVCRemoteVideoClient setVideoLayer:forMode:](self, "setVideoLayer:forMode:", 0, 1);
  -[AVCRemoteVideoClient setVideoLayer:forMode:](self, "setVideoLayer:forMode:", 0, 2);
}

- (void)dealloc
{
  NSObject *avcRemoteVideoQueue;
  uint64_t v4;
  NSObject *v5;
  int64_t streamToken;
  _BOOL4 layerHostMode;
  int activeVideoMode;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVCRemoteVideoClient *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_delegate, 0);
  if (self->_layerHostMode)
  {
    -[AVCRemoteVideoClient cleanupLayerHost](self, "cleanupLayerHost");
    -[AVCRemoteVideoClient setRootLayer:](self, "setRootLayer:", 0);
  }
  -[AVCRemoteVideoClient cleanupVideoLayerForAllModes](self, "cleanupVideoLayerForAllModes");
  -[AVCRemoteVideoClient terminateConnection](self, "terminateConnection");

  avcRemoteVideoQueue = self->_avcRemoteVideoQueue;
  if (avcRemoteVideoQueue)
  {
    dispatch_release(avcRemoteVideoQueue);
    self->_avcRemoteVideoQueue = 0;
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCRemoteVideoClient-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      layerHostMode = self->_layerHostMode;
      activeVideoMode = self->_activeVideoMode;
      *(_DWORD *)buf = 136316674;
      v11 = v4;
      v12 = 2080;
      v13 = "-[AVCRemoteVideoClient dealloc]";
      v14 = 1024;
      v15 = 242;
      v16 = 2048;
      v17 = self;
      v18 = 1024;
      v19 = streamToken;
      v20 = 1024;
      v21 = layerHostMode;
      v22 = 1024;
      v23 = activeVideoMode;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCRemoteVideoClient-dealloc (%p) streamToken=%u layerHostMode=%d activeVideoMode=%d", buf, 0x38u);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)AVCRemoteVideoClient;
  -[AVCRemoteVideoClient dealloc](&v9, sel_dealloc);
}

- (AVCRemoteVideoClientDelegate)delegate
{
  return (AVCRemoteVideoClientDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setVideoLayer:(id)a3 forMode:(int)a4
{
  uint64_t v4;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  CALayer *screenLayer;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136316162;
      v19 = v7;
      v20 = 2080;
      v21 = "-[AVCRemoteVideoClient setVideoLayer:forMode:]";
      v22 = 1024;
      v23 = 251;
      v24 = 2112;
      v25 = a3;
      v26 = 1024;
      v27 = v4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoLayer=%@, mode=%d", (uint8_t *)&v18, 0x2Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v11 = "<nil>";
      v18 = 136316162;
      v19 = v9;
      v20 = 2080;
      v21 = "-[AVCRemoteVideoClient setVideoLayer:forMode:]";
      v22 = 1024;
      v23 = 252;
      v24 = 2080;
      v25 = (id)v11;
      v26 = 1024;
      v27 = v4;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: setVideoLayer %s for mode %d", (uint8_t *)&v18, 0x2Cu);
    }
  }
  -[AVCRemoteVideoClient cleanupSubLayerForMode:](self, "cleanupSubLayerForMode:", v4);
  if ((_DWORD)v4 == 2)
  {
    screenLayer = self->_screenLayer;
    self->_screenLayer = (CALayer *)a3;
  }
  else if ((_DWORD)v4 == 1)
  {
    screenLayer = self->_secondaryCameraLayer;
    self->_secondaryCameraLayer = (CALayer *)a3;
  }
  else if ((_DWORD)v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCRemoteVideoClient setVideoLayer:forMode:].cold.2();
    }
    screenLayer = 0;
  }
  else
  {
    screenLayer = self->_primaryCameraLayer;
    self->_primaryCameraLayer = (CALayer *)a3;
  }

  if (a3)
  {
    v13 = -[NSDictionary objectForKeyedSubscript:](self->_slotsForModes, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4), "stringValue"));
    if (v13)
    {
      v14 = v13;
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      -[AVCRemoteVideoClient insertSubLayerInLayer:videoMode:videoSlot:](self, "insertSubLayerInLayer:videoMode:videoSlot:", a3, v4, v14);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_msgSend(v14, "unsignedLongValue");
          v18 = 136316418;
          v19 = v15;
          v20 = 2080;
          v21 = "-[AVCRemoteVideoClient setVideoLayer:forMode:]";
          v22 = 1024;
          v23 = 281;
          v24 = 2048;
          v25 = a3;
          v26 = 1024;
          v27 = v4;
          v28 = 2048;
          v29 = v17;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: connect layer %p mode=%d with  <--> slot %lu", (uint8_t *)&v18, 0x36u);
        }
      }
      -[AVCRemoteVideoClient setActiveVideoLayerForMode:](self, "setActiveVideoLayerForMode:", self->_activeVideoMode);
      -[AVCRemoteVideoClient insertInfoSubLayerIntoLayer:videoMode:](self, "insertInfoSubLayerIntoLayer:videoMode:", a3, v4);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCRemoteVideoClient setVideoLayer:forMode:].cold.1();
    }
  }
}

- (id)slotForMode:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCRemoteVideoClient slotForMode:]";
      v15 = 1024;
      v16 = 308;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%d", (uint8_t *)&v11, 0x22u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315906;
      v12 = v7;
      v13 = 2080;
      v14 = "-[AVCRemoteVideoClient slotForMode:]";
      v15 = 1024;
      v16 = 309;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: slotForMode %d", (uint8_t *)&v11, 0x22u);
    }
  }
  v9 = -[NSDictionary objectForKeyedSubscript:](self->_slotsForModes, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3), "stringValue"));
  if (!v9 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCRemoteVideoClient slotForMode:].cold.1();
  }
  return v9;
}

- (void)setRootLayer:(id)a3
{

  self->_primaryCameraLayer = (CALayer *)a3;
}

- (void)setLayerHostBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  AVCRemoteVideoClient *v20;
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_caLayerHost)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    if (!CGRectIsNull(a3))
    {
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      if (!CGRectIsEmpty(v22))
      {
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        if (!CGRectEqualToRect(v23, *MEMORY[0x1E0C9D648]))
        {
          -[VCCALayerHost setFrame:](self->_caLayerHost, "setFrame:", x, y, width, height);
          -[VCCALayerHost setPosition:](self->_caLayerHost, "setPosition:", width * 0.5, height * 0.5);
        }
      }
    }
  }
  else if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCRemoteVideoClient setLayerHostBounds:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v11 = 136316162;
        v12 = v9;
        v13 = 2080;
        v14 = "-[AVCRemoteVideoClient setLayerHostBounds:]";
        v15 = 1024;
        v16 = 324;
        v17 = 2112;
        v18 = v8;
        v19 = 2048;
        v20 = self;
        _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid CALayerHost instance", (uint8_t *)&v11, 0x30u);
      }
    }
  }
}

- (BOOL)createCALayerHostForRootLayer:(id)a3 withContextId:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v7;
  void *v8;
  VCCALayerHost *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  BOOL v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  __int16 v37;
  AVCRemoteVideoClient *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a3 || (v5 = *(_QWORD *)&a4, !a4))
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:].cold.1();
      }
      goto LABEL_43;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_43;
    v23 = VRTraceErrorLogLevelToCSTR();
    v24 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 136316162;
    v30 = v23;
    v31 = 2080;
    v32 = "-[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]";
    v33 = 1024;
    v34 = 337;
    v35 = 2112;
    v36 = (id)v20;
    v37 = 2048;
    v38 = self;
    v25 = " [%s] %s:%d %@(%p) Invalid rootLayer or contextId";
    goto LABEL_50;
  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AVCRemoteVideoCALayerHost%p"), self);
  if (!v7)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:].cold.2();
      }
      goto LABEL_43;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v26 = VRTraceErrorLogLevelToCSTR(),
          v24 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_43:
      v8 = 0;
LABEL_44:
      v18 = 0;
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136316162;
    v30 = v26;
    v31 = 2080;
    v32 = "-[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]";
    v33 = 1024;
    v34 = 339;
    v35 = 2112;
    v36 = (id)v21;
    v37 = 2048;
    v38 = self;
    v25 = " [%s] %s:%d %@(%p) Failed to allocate layer host name";
LABEL_50:
    _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x30u);
    goto LABEL_43;
  }
  v8 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v9 = -[VCCALayerHost initWithRemoteVideoClient:]([VCCALayerHost alloc], "initWithRemoteVideoClient:", self);
  self->_caLayerHost = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v22 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v30 = v27;
          v31 = 2080;
          v32 = "-[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]";
          v33 = 1024;
          v34 = 348;
          v35 = 2112;
          v36 = (id)v22;
          v37 = 2048;
          v38 = self;
          _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate CALayerHost", buf, 0x30u);
        }
      }
    }
    goto LABEL_44;
  }
  -[CALayerHost setContextId:](v9, "setContextId:", v5);
  objc_msgSend(a3, "bounds");
  -[AVCRemoteVideoClient setLayerHostBounds:](self, "setLayerHostBounds:");
  -[VCCALayerHost setName:](self->_caLayerHost, "setName:", v8);
  -[CALayerHost setPreservesFlip:](self->_caLayerHost, "setPreservesFlip:", 1);
  -[VCCALayerHost setGeometryFlipped:](self->_caLayerHost, "setGeometryFlipped:", 1);
  -[VCCALayerHost setAllowsHitTesting:](self->_caLayerHost, "setAllowsHitTesting:", 0);
  objc_msgSend(a3, "addSublayer:", self->_caLayerHost);
  objc_msgSend(a3, "setMasksToBounds:", 1);
  objc_msgSend(a3, "setContinuousCorners:", 1);
  objc_msgSend(a3, "setAllowsHitTesting:", 0);
  objc_msgSend(a3, "setName:", CFSTR("RemoteParticipantVideoLayerScreen"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
  if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_16;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136316162;
    v30 = v11;
    v31 = 2080;
    v32 = "-[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]";
    v33 = 1024;
    v34 = 365;
    v35 = 2048;
    v36 = a3;
    v37 = 1024;
    LODWORD(v38) = v5;
    v13 = " [%s] %s:%d AVCRemoteVideoClient: connect layer=%p with  <--> contextId=%u";
    v14 = v12;
    v15 = 44;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_16;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136316674;
    v30 = v16;
    v31 = 2080;
    v32 = "-[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:]";
    v33 = 1024;
    v34 = 365;
    v35 = 2112;
    v36 = (id)v10;
    v37 = 2048;
    v38 = self;
    v39 = 2048;
    v40 = a3;
    v41 = 1024;
    v42 = v5;
    v13 = " [%s] %s:%d %@(%p) AVCRemoteVideoClient: connect layer=%p with  <--> contextId=%u";
    v14 = v17;
    v15 = 64;
  }
  _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_16:
  v18 = 1;
LABEL_17:

  return v18;
}

- (id)newXPCObjectForFenceHandle:(id *)a3
{
  void *v5;
  id result;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  VCCALayerHost *caLayerHost;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  VCCALayerHost *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  AVCRemoteVideoClient *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  VCCALayerHost *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_5;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CD2778], "newFenceFromDefaultServer");
  *a3 = v5;
  if (v5)
  {
    if ((objc_msgSend((id)-[VCCALayerHost context](self->_caLayerHost, "context"), "addFence:", *a3) & 1) != 0)
    {
      result = (id)objc_msgSend(*a3, "createXPCRepresentation");
      if (result)
        return result;
      goto LABEL_5;
    }
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_5;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v11 = (const __CFString *)*a3;
      caLayerHost = self->_caLayerHost;
      v22 = 136316418;
      v23 = v9;
      v24 = 2080;
      v25 = "-[AVCRemoteVideoClient newXPCObjectForFenceHandle:]";
      v26 = 1024;
      v27 = 381;
      v28 = 2048;
      v29 = v11;
      v30 = 2048;
      v31 = (AVCRemoteVideoClient *)caLayerHost;
      v32 = 2048;
      v33 = -[VCCALayerHost context](caLayerHost, "context");
      v13 = " [%s] %s:%d Failed to add fence=%p for root layer=%p with context=%p";
      v14 = v10;
      v15 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_5;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v20 = *a3;
      v21 = self->_caLayerHost;
      v22 = 136316930;
      v23 = v18;
      v24 = 2080;
      v25 = "-[AVCRemoteVideoClient newXPCObjectForFenceHandle:]";
      v26 = 1024;
      v27 = 381;
      v28 = 2112;
      v29 = v8;
      v30 = 2048;
      v31 = self;
      v32 = 2048;
      v33 = (uint64_t)v20;
      v34 = 2048;
      v35 = v21;
      v36 = 2048;
      v37 = -[VCCALayerHost context](v21, "context");
      v13 = " [%s] %s:%d %@(%p) Failed to add fence=%p for root layer=%p with context=%p";
      v14 = v19;
      v15 = 78;
    }
    goto LABEL_28;
  }
  if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCRemoteVideoClient newXPCObjectForFenceHandle:].cold.1();
    }
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v22 = 136316162;
      v23 = v16;
      v24 = 2080;
      v25 = "-[AVCRemoteVideoClient newXPCObjectForFenceHandle:]";
      v26 = 1024;
      v27 = 378;
      v28 = 2112;
      v29 = v7;
      v30 = 2048;
      v31 = self;
      v13 = " [%s] %s:%d %@(%p) Failed to create new fence";
      v14 = v17;
      v15 = 48;
LABEL_28:
      _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v22, v15);
    }
  }
LABEL_5:
  result = *a3;
  if (*a3)
  {
    objc_msgSend(result, "invalidate");

    result = 0;
    *a3 = 0;
  }
  return result;
}

- (void)setRemoteVideoLayerBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  NSString *v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  NSString *p_isa;
  __int16 v55;
  AVCRemoteVideoClient *v56;
  __int16 v57;
  NSString *v58;
  uint64_t v59;
  NSRect v60;
  NSRect v61;
  NSRect v62;
  NSRect v63;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v59 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v60.origin.x = x;
        v60.origin.y = y;
        v60.size.width = width;
        v60.size.height = height;
        *(_DWORD *)buf = 136315906;
        v48 = v9;
        v49 = 2080;
        v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
        v51 = 1024;
        v52 = 400;
        v53 = 2112;
        p_isa = NSStringFromRect(v60);
        v11 = " [%s] %s:%d bounds=%@";
        v12 = v10;
        v13 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v61.origin.x = x;
        v61.origin.y = y;
        v61.size.width = width;
        v61.size.height = height;
        *(_DWORD *)buf = 136316418;
        v48 = v14;
        v49 = 2080;
        v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
        v51 = 1024;
        v52 = 400;
        v53 = 2112;
        p_isa = &v8->isa;
        v55 = 2048;
        v56 = self;
        v57 = 2112;
        v58 = NSStringFromRect(v61);
        v11 = " [%s] %s:%d %@(%p) bounds=%@";
        v12 = v15;
        v13 = 58;
        goto LABEL_11;
      }
    }
  }
  if (!VideoUtil_LayerBoundsAreValid(x, y, width, height))
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setRemoteVideoLayerBounds:].cold.5(x, y, width, height, v31, v32);
      }
      goto LABEL_67;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_67;
    v33 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    v35 = NSStringFromRect(v63);
    *(_DWORD *)buf = 136316418;
    v48 = v33;
    v49 = 2080;
    v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
    v51 = 1024;
    v52 = 401;
    v53 = 2112;
    p_isa = &v25->isa;
    v55 = 2048;
    v56 = self;
    v57 = 2112;
    v58 = v35;
    v36 = " [%s] %s:%d %@(%p) Failed due to invalid root layer bounds=%@";
    v37 = v34;
    v38 = 58;
LABEL_75:
    _os_log_error_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
    goto LABEL_67;
  }
  if (!self->_caLayerHost)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setRemoteVideoLayerBounds:].cold.1();
      }
      goto LABEL_67;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_67;
    v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 136316162;
    v48 = v39;
    v49 = 2080;
    v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
    v51 = 1024;
    v52 = 402;
    v53 = 2112;
    p_isa = &v26->isa;
    v55 = 2048;
    v56 = self;
    v36 = " [%s] %s:%d %@(%p) CALayerHost invalid";
LABEL_74:
    v37 = v40;
    v38 = 48;
    goto LABEL_75;
  }
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v16 = NSStringFromRect(v62);
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", self->_streamToken);
  if (!v17)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setRemoteVideoLayerBounds:].cold.2();
      }
      goto LABEL_67;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v41 = VRTraceErrorLogLevelToCSTR(),
          v40 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_67:
      v21 = 0;
      v18 = 0;
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136316162;
    v48 = v41;
    v49 = 2080;
    v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
    v51 = 1024;
    v52 = 408;
    v53 = 2112;
    p_isa = &v27->isa;
    v55 = 2048;
    v56 = self;
    v36 = " [%s] %s:%d %@(%p) Failed to allocate stream token number";
    goto LABEL_74;
  }
  v18 = (void *)v17;
  v45[0] = CFSTR("conferenceCallID");
  v45[1] = CFSTR("conferenceVisualRectangle");
  v46[0] = v17;
  v46[1] = v16;
  v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v20 = -[AVCRemoteVideoClient newXPCObjectForFenceHandle:](self, "newXPCObjectForFenceHandle:", &v44);
  if (v20)
  {
    v21 = v20;
    v22 = -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](self->_connection, "sendMessageSync:arguments:xpcArguments:", "vcRemoteVideoSetLayerBoundsForStreamToken", v19, v20);
    if (!v22
      || (v23 = v22, objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ERROR")))
      || objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    {
      if ((AVCRemoteVideoClient *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCRemoteVideoClient setRemoteVideoLayerBounds:].cold.4();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v24 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v24 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v48 = v29;
            v49 = 2080;
            v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
            v51 = 1024;
            v52 = 420;
            v53 = 2112;
            p_isa = &v24->isa;
            v55 = 2048;
            v56 = self;
            _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Set layer bounds xpc call failed", buf, 0x30u);
          }
        }
      }
    }
  }
  else
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setRemoteVideoLayerBounds:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v28 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v42 = VRTraceErrorLogLevelToCSTR();
        v43 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v48 = v42;
          v49 = 2080;
          v50 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
          v51 = 1024;
          v52 = 416;
          v53 = 2112;
          p_isa = &v28->isa;
          v55 = 2048;
          v56 = self;
          _os_log_error_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create XPC representation for fence", buf, 0x30u);
        }
      }
    }
    v21 = 0;
  }
LABEL_19:
  if (v44)
  {
    objc_msgSend(v44, "invalidate");

    v44 = 0;
  }

}

- (void)setTransformForRemoteVideoOrientationEnabled:(BOOL)a3
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
  uint64_t v13;
  id v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  AVCRemoteVideoClient *v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v22 = v6;
        v23 = 2080;
        v24 = "-[AVCRemoteVideoClient setTransformForRemoteVideoOrientationEnabled:]";
        v25 = 1024;
        v26 = 437;
        v27 = 1024;
        LODWORD(v28) = v3;
        v8 = " [%s] %s:%d transformForRemoteVideoOrientationEnabled=%d";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v22 = v11;
        v23 = 2080;
        v24 = "-[AVCRemoteVideoClient setTransformForRemoteVideoOrientationEnabled:]";
        v25 = 1024;
        v26 = 437;
        v27 = 2112;
        v28 = v5;
        v29 = 2048;
        v30 = self;
        v31 = 1024;
        v32 = v3;
        v8 = " [%s] %s:%d %@(%p) transformForRemoteVideoOrientationEnabled=%d";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  self->_transformForRemoteVideoOrientationEnabled = v3;
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_streamToken, CFSTR("conferenceCallID"));
  v19[1] = CFSTR("conferenceTransformForRemoteVideoOrientationEnabled");
  v20[0] = v13;
  v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v14 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcRemoteVideoSetTransformForRemoteVideoOrientationEnabled", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
  if (!v14
    || (v15 = v14, objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ERROR")))
    || objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setTransformForRemoteVideoOrientationEnabled:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v22 = v17;
          v23 = 2080;
          v24 = "-[AVCRemoteVideoClient setTransformForRemoteVideoOrientationEnabled:]";
          v25 = 1024;
          v26 = 448;
          v27 = 2112;
          v28 = v16;
          v29 = 2048;
          v30 = self;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Set transformForRemoteVideoOrientationEnabled xpc call failed", buf, 0x30u);
        }
      }
    }
  }
}

- (BOOL)setVideoLayerHost:(id)a3 forMode:(int)a4
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *v22;
  BOOL v23;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  id v57;
  __int16 v58;
  AVCRemoteVideoClient *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  NSString *v63;
  uint64_t v64;
  NSRect v65;
  NSRect v66;
  NSRect v67;

  v64 = *MEMORY[0x1E0C80C00];
  if ((AVCRemoteVideoClient *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a3, "bounds");
        *(_DWORD *)buf = 136316162;
        v51 = v7;
        v52 = 2080;
        v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
        v54 = 1024;
        v55 = 465;
        v56 = 2112;
        v57 = a3;
        v58 = 2112;
        v59 = (AVCRemoteVideoClient *)NSStringFromRect(v65);
        v9 = " [%s] %s:%d rootLayer=%@ bounds=%@";
        v10 = v8;
        v11 = 48;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a3, "bounds");
        *(_DWORD *)buf = 136316674;
        v51 = v12;
        v52 = 2080;
        v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
        v54 = 1024;
        v55 = 465;
        v56 = 2112;
        v57 = (id)v6;
        v58 = 2048;
        v59 = self;
        v60 = 2112;
        v61 = a3;
        v62 = 2112;
        v63 = NSStringFromRect(v66);
        v9 = " [%s] %s:%d %@(%p) rootLayer=%@ bounds=%@";
        v10 = v13;
        v11 = 68;
        goto LABEL_11;
      }
    }
  }
  if (!a3)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.1();
      }
      goto LABEL_74;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_74;
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    *(_DWORD *)buf = 136316162;
    v51 = v34;
    v52 = 2080;
    v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    v54 = 1024;
    v55 = 466;
    v56 = 2112;
    v57 = (id)v25;
    v58 = 2048;
    v59 = self;
    v36 = " [%s] %s:%d %@(%p) Invalid rootLayer parameter";
    goto LABEL_93;
  }
  if (self->_caLayerHost)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.7();
      }
      goto LABEL_74;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_74;
    v37 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    *(_DWORD *)buf = 136316162;
    v51 = v37;
    v52 = 2080;
    v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    v54 = 1024;
    v55 = 467;
    v56 = 2112;
    v57 = (id)v26;
    v58 = 2048;
    v59 = self;
    v36 = " [%s] %s:%d %@(%p) CALayerHost exist already, reconfigure not supported currently";
    goto LABEL_93;
  }
  self->_layerHostMode = 1;
  objc_msgSend(a3, "bounds");
  v14 = NSStringFromRect(v67);
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", self->_streamToken);
  if (!v15)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.2();
      }
      goto LABEL_74;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v38 = VRTraceErrorLogLevelToCSTR(),
          v35 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_74:
      v18 = 0;
      v16 = 0;
      goto LABEL_91;
    }
    *(_DWORD *)buf = 136316162;
    v51 = v38;
    v52 = 2080;
    v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    v54 = 1024;
    v55 = 473;
    v56 = 2112;
    v57 = (id)v27;
    v58 = 2048;
    v59 = self;
    v36 = " [%s] %s:%d %@(%p) Failed to allocate stream token number";
LABEL_93:
    _os_log_error_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_ERROR, v36, buf, 0x30u);
    goto LABEL_74;
  }
  v16 = (void *)v15;
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v15, CFSTR("conferenceCallID"), v14, CFSTR("conferenceVisualRectangle"), 0);
  if (!v17)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v28 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v39 = VRTraceErrorLogLevelToCSTR();
        v40 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v51 = v39;
          v52 = 2080;
          v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
          v54 = 1024;
          v55 = 475;
          v56 = 2112;
          v57 = (id)v28;
          v58 = 2048;
          v59 = self;
          _os_log_error_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate args dictionary", buf, 0x30u);
        }
      }
    }
    v18 = 0;
    goto LABEL_91;
  }
  v18 = (void *)v17;
  v19 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcRemoteVideoGetContextIdForStreamToken", v17);
  if (!v19)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.4(v32, v16, v33);
      }
      goto LABEL_91;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v29 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_91;
    v41 = VRTraceErrorLogLevelToCSTR();
    v42 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_91;
    v43 = objc_msgSend(v16, "unsignedIntValue");
    *(_DWORD *)buf = 136316418;
    v51 = v41;
    v52 = 2080;
    v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    v54 = 1024;
    v55 = 477;
    v56 = 2112;
    v57 = (id)v29;
    v58 = 2048;
    v59 = self;
    v60 = 1024;
    LODWORD(v61) = v43;
    v44 = " [%s] %s:%d %@(%p) GetContextIdForStreamToken=%u failed";
    v45 = v42;
    v46 = 54;
LABEL_96:
    _os_log_error_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_ERROR, v44, buf, v46);
    goto LABEL_91;
  }
  v20 = objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("vcRemoteVideoSlotsForModes"));
  if (!v20)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.5();
      }
      goto LABEL_91;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v30 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_91;
    v47 = VRTraceErrorLogLevelToCSTR();
    v48 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_91;
    *(_DWORD *)buf = 136316162;
    v51 = v47;
    v52 = 2080;
    v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    v54 = 1024;
    v55 = 479;
    v56 = 2112;
    v57 = (id)v30;
    v58 = 2048;
    v59 = self;
    v44 = " [%s] %s:%d %@(%p) Invalid contextIdForModes dictionary returned";
LABEL_95:
    v45 = v48;
    v46 = 48;
    goto LABEL_96;
  }
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v20);
  if (!v21)
  {
    if ((AVCRemoteVideoClient *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCRemoteVideoClient setVideoLayerHost:forMode:].cold.6();
      }
      goto LABEL_91;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = (const __CFString *)-[AVCRemoteVideoClient performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v31 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v49 = VRTraceErrorLogLevelToCSTR(),
          v48 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_91:
      v23 = 0;
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136316162;
    v51 = v49;
    v52 = 2080;
    v53 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
    v54 = 1024;
    v55 = 481;
    v56 = 2112;
    v57 = (id)v31;
    v58 = 2048;
    v59 = self;
    v44 = " [%s] %s:%d %@(%p) Failed to allocate slotsForModes dictionary";
    goto LABEL_95;
  }
  v22 = (NSDictionary *)v21;

  self->_slotsForModes = v22;
  v23 = -[AVCRemoteVideoClient createCALayerHostForRootLayer:withContextId:](self, "createCALayerHostForRootLayer:withContextId:", a3, objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", objc_msgSend(&unk_1E9EF6FF8, "stringValue")), "unsignedIntValue"));
  -[AVCRemoteVideoClient setRootLayer:](self, "setRootLayer:", a3);
LABEL_20:

  return v23;
}

- (void)insertSubLayerInLayer:(id)a3 videoMode:(int)a4 videoSlot:(id)a5
{
  uint64_t v6;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id *v20;
  CGAffineTransform m;
  CATransform3D v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 && a5)
  {
    v6 = *(_QWORD *)&a4;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AVCRemoteVideoSubLayer%p(%d)"), self, *(_QWORD *)&a4);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = (void *)objc_msgSend(a3, "sublayers");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
LABEL_5:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
        if ((objc_msgSend((id)objc_msgSend(v15, "name"), "isEqualToString:", v9) & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
          if (v12)
            goto LABEL_5;
          goto LABEL_13;
        }
      }
      if (v15)
        goto LABEL_14;
    }
LABEL_13:
    v15 = (void *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    objc_msgSend(a3, "addSublayer:", v15);
LABEL_14:
    objc_msgSend(a3, "bounds");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v15, "setBounds:", 0.0, 0.0, v18, v16);
    objc_msgSend(v15, "setPosition:", v17 * 0.5, v19 * 0.5);
    CGAffineTransformMakeRotation(&m, 1.57079633);
    CATransform3DMakeAffineTransform(&v22, &m);
    objc_msgSend(v15, "setTransform:", &v22);
    objc_msgSend(v15, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
    objc_msgSend(v15, "setName:", v9);
    objc_msgSend(v15, "setContents:", objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", objc_msgSend(a5, "intValue")));
    objc_msgSend(v15, "setMasksToBounds:", 1);
    v20 = -[AVCRemoteVideoClient subLayerRefForMode:](self, "subLayerRefForMode:", v6);
    if (v20)
      *v20 = v15;

  }
}

- (id)subLayerRefForMode:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2:
      return (id *)&self->_screenSubLayer;
    case 1:
      return (id *)&self->_secondaryCameraSubLayer;
    case 0:
      return (id *)&self->_primaryCameraSubLayer;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCRemoteVideoClient subLayerRefForMode:]";
      v11 = 1024;
      v12 = 634;
      v13 = 1024;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid video mode:%d", (uint8_t *)&v7, 0x22u);
    }
  }
  return 0;
}

- (id)subLayerForMode:(int)a3
{
  id result;

  result = -[AVCRemoteVideoClient subLayerRefForMode:](self, "subLayerRefForMode:", *(_QWORD *)&a3);
  if (result)
    return *(id *)result;
  return result;
}

- (void)setActiveVideoLayerForMode:(int)a3
{
  _QWORD block[5];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AVCRemoteVideoClient_setActiveVideoLayerForMode___block_invoke;
  block[3] = &unk_1E9E52300;
  v4 = a3;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __51__AVCRemoteVideoClient_setActiveVideoLayerForMode___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  NSObject *v8;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v3 = a1 + 40;
  v2 = *(_DWORD *)(a1 + 40);
  switch(v2)
  {
    case 2:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setAllowsDisplayCompositing:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAllowsDisplayCompositing:", 0);
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
LABEL_8:
      objc_msgSend(v5, "setAllowsDisplayCompositing:", 0);
      return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    case 1:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAllowsDisplayCompositing:", 1);
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      goto LABEL_7;
    case 0:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setAllowsDisplayCompositing:", 1);
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
LABEL_7:
      objc_msgSend(v4, "setAllowsDisplayCompositing:", 0);
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
      goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __51__AVCRemoteVideoClient_setActiveVideoLayerForMode___block_invoke_cold_1(v7, v3, v8);
  }
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)cleanupSubLayerForMode:(int)a3
{
  id *v4;
  id *v5;

  v4 = -[AVCRemoteVideoClient subLayerRefForMode:](self, "subLayerRefForMode:", *(_QWORD *)&a3);
  if (v4)
  {
    v5 = v4;
    if (*v4)
    {
      if (-[AVCRemoteVideoClient shouldDisplayVideoInfoLayer](self, "shouldDisplayVideoInfoLayer"))
        objc_msgSend((id)objc_msgSend(*v5, "superlayer"), "removeObserver:forKeyPath:", self, CFSTR("bounds"));
      objc_msgSend(*v5, "setContents:", 0);
      objc_msgSend(*v5, "removeFromSuperlayer");

      *v5 = 0;
    }
  }
}

- (void)cleanupLayerHost
{
  VCCALayerHost *caLayerHost;

  caLayerHost = self->_caLayerHost;
  if (caLayerHost)
  {
    -[VCCALayerHost removeFromSuperlayer](caLayerHost, "removeFromSuperlayer");

    self->_caLayerHost = 0;
  }
}

- (void)terminateConnection
{
  -[AVCRemoteVideoClient deregisterBlocksForNotifications](self, "deregisterBlocksForNotifications");
  -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcRemoteVideoTerminate");

  self->_connection = 0;
}

- (void)setActiveVideoModeFromRemoteVideoAttribute:(id)a3
{
  int v5;
  int v6;

  if ((objc_msgSend(a3, "videoSourceScreen") & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    v6 = objc_msgSend(a3, "camera");
    if (v6 == 1)
      v5 = 1;
    else
      v5 = -1;
    if (!v6)
      v5 = 0;
  }
  self->_activeVideoMode = v5;
}

- (void)registerBlocksForNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke;
  v15[3] = &unk_1E9E52730;
  v15[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "conferenceDidServerDie", v15, self->_avcRemoteVideoQueue);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_59;
  v14[3] = &unk_1E9E52730;
  v14[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcRemoteVideoDidReceiveRemoteFrame", v14, self->_avcRemoteVideoQueue);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_63;
  v13[3] = &unk_1E9E52730;
  v13[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcRemoteVideoDidRemoteScreenAttributesChange", v13, self->_avcRemoteVideoQueue);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_70;
  v12[3] = &unk_1E9E52730;
  v12[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcRemoteVideoDidRemoteAttributesChange", v12, self->_avcRemoteVideoQueue);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_76;
  v11[3] = &unk_1E9E52730;
  v11[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcRemoteVideoDidRemoteVideoPause", v11, self->_avcRemoteVideoQueue);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_82;
  v10[3] = &unk_1E9E52730;
  v10[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcRemoteVideoDidRemoteMediaStall", v10, self->_avcRemoteVideoQueue);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_88;
  v9[3] = &unk_1E9E52730;
  v9[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcRemoteVideoDidVideoDegrade", v9, self->_avcRemoteVideoQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_94;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcRemoteVideoDidNetworkDegrade", v8, self->_avcRemoteVideoQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_102;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcRemoteVideoDidVideoSuspend", v7, self->_avcRemoteVideoQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_108;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcRemoteVideoDidReleaseRemoteVideoQueue", v6, self->_avcRemoteVideoQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_112;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcRemoteVideoDidConnectionChange", v5, self->_avcRemoteVideoQueue);
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int ErrorLogLevelForModule;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_cold_2();
      }
      objc_msgSend(v3, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(v3, "delegate"), "remoteVideoServerDidDie:", v3);
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_cold_1();
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_59(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "setHasReceivedFirstFrame:", 1);
        objc_msgSend(v5, "checkpointDidReceiveFirstFrame");
        objc_msgSend((id)objc_msgSend(v5, "delegate"), "remoteVideoClientDidReceiveFirstFrame:", v5);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315650;
        v9 = v6;
        v10 = 2080;
        v11 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        v12 = 1024;
        v13 = 753;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_63(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  VideoAttributes *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _WORD v21[17];

  *(_QWORD *)&v21[13] = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceRemoteScreenAttributes")));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136316162;
          v15 = v8;
          v16 = 2080;
          v17 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          v18 = 1024;
          v19 = 776;
          v20 = 1024;
          *(_DWORD *)v21 = objc_msgSend(v6, "streamToken");
          v21[2] = 2048;
          *(_QWORD *)&v21[3] = objc_msgSend(v6, "delegate");
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: remoteScreenAttributesDidChange for streamToken=%u, delegate=%p", (uint8_t *)&v14, 0x2Cu);
        }
      }
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v14 = 136315906;
            v15 = v10;
            v16 = 2080;
            v17 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
            v18 = 1024;
            v19 = 778;
            v20 = 2112;
            *(_QWORD *)v21 = v7;
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remoteScreenAttributesDidChange:%@", (uint8_t *)&v14, 0x26u);
          }
        }
        objc_msgSend(v6, "setRemoteScreenAttributes:", v7);
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:remoteScreenAttributesDidChange:", v6, v7);
      }

    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315650;
        v15 = v12;
        v16 = 2080;
        v17 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        v18 = 1024;
        v19 = 770;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v14, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_70(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  unsigned int *v6;
  VideoAttributes *v7;
  uint64_t v8;
  NSObject *v9;
  CMTime v10;
  CMTime buf;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (unsigned int *)v5;
      v7 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceRemoteVideoAttributes")));
      objc_msgSend(v6, "setActiveVideoModeFromRemoteVideoAttribute:", v7);
      objc_msgSend(v6, "setActiveVideoLayerForMode:", v6[22]);
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "setRemoteVideoAttributes:", v7);
        objc_msgSend(v6, "checkpointVideoAttributesDidChange");
        if (v7)
          -[VideoAttributes framePresentationTime](v7, "framePresentationTime");
        else
          memset(&v10, 0, sizeof(v10));
        buf = v10;
        CMTimeGetSeconds(&buf);
        -[VideoAttributes contentsRect](v7, "contentsRect");
        -[VideoAttributes contentsRect](v7, "contentsRect");
        -[VideoAttributes scaleFactor](v7, "scaleFactor");
        kdebug_trace();
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:remoteVideoAttributesDidChange:", v6, v7);
      }

    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 136315650;
        *(CMTimeValue *)((char *)&buf.value + 4) = v8;
        LOWORD(buf.flags) = 2080;
        *(_QWORD *)((char *)&buf.flags + 2) = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        HIWORD(buf.epoch) = 1024;
        v12 = 791;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&buf, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_76(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceVideoPause"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136316162;
          v13 = v8;
          v14 = 2080;
          v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          v16 = 1024;
          v17 = 819;
          v18 = 1024;
          v19 = objc_msgSend(v7, "BOOLValue");
          v20 = 1024;
          v21 = objc_msgSend(v6, "streamToken");
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: remoteVideoDidPause=%d for streamToken=%u", (uint8_t *)&v12, 0x28u);
        }
      }
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "setIsVideoPaused:", objc_msgSend(v7, "BOOLValue"));
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:remoteVideoDidPause:", v6, objc_msgSend(v6, "isVideoPaused"));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v10;
        v14 = 2080;
        v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        v16 = 1024;
        v17 = 814;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_82(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceIsRemoteMediaStalled"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136316162;
          v13 = v8;
          v14 = 2080;
          v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          v16 = 1024;
          v17 = 837;
          v18 = 1024;
          v19 = objc_msgSend(v7, "BOOLValue");
          v20 = 1024;
          v21 = objc_msgSend(v6, "streamToken");
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: remoteMediaDidStall=%d for streamToken=%u", (uint8_t *)&v12, 0x28u);
        }
      }
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "setIsMediaStalled:", objc_msgSend(v7, "BOOLValue"));
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:remoteMediaDidStall:", v6, objc_msgSend(v6, "isMediaStalled"));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v10;
        v14 = 2080;
        v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        v16 = 1024;
        v17 = 832;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_88(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceIsVideoDegraded"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136316162;
          v13 = v8;
          v14 = 2080;
          v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          v16 = 1024;
          v17 = 855;
          v18 = 1024;
          v19 = objc_msgSend(v7, "BOOLValue");
          v20 = 1024;
          v21 = objc_msgSend(v6, "streamToken");
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: videoDidDegrade=%d for streamToken=%u", (uint8_t *)&v12, 0x28u);
        }
      }
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "setIsVideoDegraded:", objc_msgSend(v7, "BOOLValue"));
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:videoDidDegrade:", v6, objc_msgSend(v6, "isVideoDegraded"));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v10;
        v14 = 2080;
        v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        v16 = 1024;
        v17 = 851;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_94(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceIsNetworkDegraded"));
      v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceIsNetworkDegradedLocal"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v16 = v9;
          v17 = 2080;
          v18 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          v19 = 1024;
          v20 = 874;
          v21 = 1024;
          v22 = objc_msgSend(v7, "BOOLValue");
          v23 = 1024;
          v24 = objc_msgSend(v8, "BOOLValue");
          v25 = 1024;
          v26 = objc_msgSend(v6, "streamToken");
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: networkDidDegrade=%d isNetworkDegradedLocal=%d for streamToken=%u", buf, 0x2Eu);
        }
      }
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "setIsNetworkDegraded:", objc_msgSend(v7, "BOOLValue"));
        objc_msgSend(v6, "setIsNetworkDegradedLocal:", objc_msgSend(v8, "BOOLValue"));
        v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "isNetworkDegradedLocal", CFSTR("isLocalConnectionUnstable")));
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:networkQualityDidDegrade:info:", v6, objc_msgSend(v6, "isNetworkDegraded"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = v11;
        v17 = 2080;
        v18 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        v19 = 1024;
        v20 = 869;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", buf, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_102(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceIsVideoSuspended"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136316162;
          v13 = v8;
          v14 = 2080;
          v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          v16 = 1024;
          v17 = 894;
          v18 = 1024;
          v19 = objc_msgSend(v7, "BOOLValue");
          v20 = 1024;
          v21 = objc_msgSend(v6, "streamToken");
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: videoDidSuspend=%d for streamToken=%u", (uint8_t *)&v12, 0x28u);
        }
      }
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "setIsVideoSuspended:", objc_msgSend(v7, "BOOLValue"));
        objc_msgSend((id)objc_msgSend(v6, "delegate"), "remoteVideoClient:videoDidSuspend:", v6, objc_msgSend(v6, "isVideoSuspended"));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v10;
        v14 = 2080;
        v15 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        v16 = 1024;
        v17 = 890;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_108(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v4)
    {
      if (ErrorLogLevelForModule >= 6)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315906;
          v11 = v6;
          v12 = 2080;
          v13 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
          v14 = 1024;
          v15 = 911;
          v16 = 1024;
          v17 = objc_msgSend(v4, "streamToken");
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient callback: remoteVideoClientDidReceiveLastFrame for streamToken=%u.", (uint8_t *)&v10, 0x22u);
        }
      }
      objc_msgSend(v4, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "setHasReceivedLastFrame:", 1);
        objc_msgSend((id)objc_msgSend(v4, "delegate"), "remoteVideoClientDidReceiveLastFrame:", v4);
      }
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315650;
        v11 = v8;
        v12 = 2080;
        v13 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        v14 = 1024;
        v15 = 908;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_112(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceConnectionTypeLocal"));
      v8 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceConnectionTypeRemote"));
      if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
        objc_msgSend(v6, "updateConnectionInfoWithLocalInterfaceType:remoteInterfaceType:", v7, v8);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v9;
        v13 = 2080;
        v14 = "-[AVCRemoteVideoClient registerBlocksForNotifications]_block_invoke";
        v15 = 1024;
        v16 = 925;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCRemoteVideoClient: strongSelf == nil", (uint8_t *)&v11, 0x1Cu);
      }
    }
  }
}

- (void)deregisterBlocksForNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "conferenceDidServerDie");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcRemoteVideoDidReceiveRemoteFrame");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcRemoteVideoDidRemoteScreenAttributesChange");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcRemoteVideoDidRemoteAttributesChange");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcRemoteVideoDidRemoteVideoPause");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcRemoteVideoDidRemoteMediaStall");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcRemoteVideoDidReleaseRemoteVideoQueue");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcRemoteVideoDidVideoDegrade");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcRemoteVideoDidConnectionChange");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcRemoteVideoDidVideoSuspend");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcRemoteVideoDidNetworkDegrade");
}

- (void)checkpointDidReceiveFirstFrame
{
  uint64_t v3;
  NSObject *v4;
  int64_t streamToken;
  id delegate;
  int activeVideoMode;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVCRemoteVideoClient *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCRemoteVideoClient-didReceiveFirstFrame");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      delegate = self->_delegate;
      streamToken = self->_streamToken;
      activeVideoMode = self->_activeVideoMode;
      v8 = 136316674;
      v9 = v3;
      v10 = 2080;
      v11 = "-[AVCRemoteVideoClient checkpointDidReceiveFirstFrame]";
      v12 = 1024;
      v13 = 955;
      v14 = 2048;
      v15 = self;
      v16 = 1024;
      v17 = streamToken;
      v18 = 2048;
      v19 = delegate;
      v20 = 1024;
      v21 = activeVideoMode;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCRemoteVideoClient-didReceiveFirstFrame (%p) streamToken=%u, delegate=%p, activeVideoMode=%d", (uint8_t *)&v8, 0x3Cu);
    }
  }
}

- (void)checkpointVideoAttributesDidChange
{
  uint64_t v3;
  NSObject *v4;
  VideoAttributes *remoteVideoAttributes;
  int64_t streamToken;
  id delegate;
  int activeVideoMode;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  AVCRemoteVideoClient *v16;
  __int16 v17;
  VideoAttributes *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCRemoteVideoClient-remoteVideoAttributesDidChange");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      remoteVideoAttributes = self->_remoteVideoAttributes;
      delegate = self->_delegate;
      streamToken = self->_streamToken;
      activeVideoMode = self->_activeVideoMode;
      v9 = 136316930;
      v10 = v3;
      v11 = 2080;
      v12 = "-[AVCRemoteVideoClient checkpointVideoAttributesDidChange]";
      v13 = 1024;
      v14 = 959;
      v15 = 2048;
      v16 = self;
      v17 = 2112;
      v18 = remoteVideoAttributes;
      v19 = 1024;
      v20 = streamToken;
      v21 = 2048;
      v22 = delegate;
      v23 = 1024;
      v24 = activeVideoMode;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCRemoteVideoClient-remoteVideoAttributesDidChange (%p) attributes=%@, streamToken=%u, delegate=%p, activeVideoMode=%d", (uint8_t *)&v9, 0x46u);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _BOOL4 v8;
  double x;
  double y;
  double width;
  double height;
  CGRect v13;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("bounds"), a4, a5, a6))
  {
    v8 = -[AVCRemoteVideoClient shouldDisplayVideoInfoLayer](self, "shouldDisplayVideoInfoLayer");
    if (a4)
    {
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a4, "bounds");
          x = v13.origin.x;
          y = v13.origin.y;
          width = v13.size.width;
          height = v13.size.height;
          if (CGRectIsNull(v13))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[AVCRemoteVideoClient observeValueForKeyPath:ofObject:change:context:].cold.1();
            }
          }
          else
          {
            -[AVCRemoteVideoClient adjustInfoSubLayerBounds:forSuperLayer:](self, "adjustInfoSubLayerBounds:forSuperLayer:", -[AVCRemoteVideoClient subLayerForMode:](self, "subLayerForMode:", 0), x, y, width, height);
            -[AVCRemoteVideoClient adjustInfoSubLayerBounds:forSuperLayer:](self, "adjustInfoSubLayerBounds:forSuperLayer:", -[AVCRemoteVideoClient subLayerForMode:](self, "subLayerForMode:", 1), x, y, width, height);
            -[AVCRemoteVideoClient adjustInfoSubLayerBounds:forSuperLayer:](self, "adjustInfoSubLayerBounds:forSuperLayer:", -[AVCRemoteVideoClient subLayerForMode:](self, "subLayerForMode:", 2), x, y, width, height);
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCRemoteVideoClient observeValueForKeyPath:ofObject:change:context:].cold.2();
        }
      }
    }
  }
}

- (void)adjustInfoSubLayerBounds:(CGRect)a3 forSuperLayer:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  height = a3.size.height;
  width = a3.size.width;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = -[AVCRemoteVideoClient findInfoSubLayerFromLayer:](self, "findInfoSubLayerFromLayer:", a4, a3.origin.x, a3.origin.y);
  if (v6)
  {
    v7 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      v10 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 136316162;
          v12 = v8;
          v13 = 2080;
          v14 = "-[AVCRemoteVideoClient adjustInfoSubLayerBounds:forSuperLayer:]";
          v15 = 1024;
          v16 = 988;
          v17 = 2048;
          v18 = width;
          v19 = 2048;
          v20 = height;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting bounds %f x %f", (uint8_t *)&v11, 0x30u);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = 136316162;
        v12 = v8;
        v13 = 2080;
        v14 = "-[AVCRemoteVideoClient adjustInfoSubLayerBounds:forSuperLayer:]";
        v15 = 1024;
        v16 = 988;
        v17 = 2048;
        v18 = width;
        v19 = 2048;
        v20 = height;
        _os_log_debug_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Setting bounds %f x %f", (uint8_t *)&v11, 0x30u);
      }
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, width, height * 0.5);
    objc_msgSend(v7, "setPosition:", height * 0.25, width * 0.5);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)insertInfoSubLayerIntoLayer:(id)a3 videoMode:(int)a4
{
  uint64_t v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  CGColorSpace *DeviceRGB;
  CGColor *v14;
  CGAffineTransform m;
  CATransform3D v16;
  CGFloat components[2];
  __int128 v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  if (-[AVCRemoteVideoClient shouldDisplayVideoInfoLayer](self, "shouldDisplayVideoInfoLayer"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AVCRemoteVideoInfoLayer%p(%d)"), self, v4);
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 1, 0);
    objc_msgSend(a3, "bounds");
    v9 = v8;
    v11 = v10;
    v12 = (id)objc_msgSend(MEMORY[0x1E0CD28A0], "layer");
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    objc_msgSend(v12, "setFontSize:", 14.0);
    objc_msgSend(v12, "setWrapped:", 1);
    *(_OWORD *)components = xmmword_1D9110408;
    v18 = unk_1D9110418;
    v14 = CGColorCreate(DeviceRGB, components);
    objc_msgSend(v12, "setForegroundColor:", v14);
    objc_msgSend(v12, "setBounds:", 0.0, 0.0, v9, v11 * 0.5);
    objc_msgSend(v12, "setPosition:", v11 * 0.25, v9 * 0.5);
    objc_msgSend(v12, "setString:", -[AVCRemoteVideoClient connectionTypeString](self, "connectionTypeString"));
    objc_msgSend(v12, "setAlignmentMode:", *MEMORY[0x1E0CD28F0]);
    CGAffineTransformMakeRotation(&m, -1.57079633);
    CATransform3DMakeAffineTransform(&v16, &m);
    objc_msgSend(v12, "setTransform:", &v16);
    objc_msgSend(v12, "setName:", v7);
    objc_msgSend(-[AVCRemoteVideoClient subLayerForMode:](self, "subLayerForMode:", v4), "addSublayer:", v12);

    CGColorRelease(v14);
    CGColorSpaceRelease(DeviceRGB);
  }
}

- (void)updateConnectionInfoWithLocalInterfaceType:(id)a3 remoteInterfaceType:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AVCRemoteVideoClient setActiveVideoLayerForMode:](self, "setActiveVideoLayerForMode:", self->_activeVideoMode);
  if (-[AVCRemoteVideoClient shouldDisplayVideoInfoLayer](self, "shouldDisplayVideoInfoLayer"))
  {
    -[AVCRemoteVideoClient setConnectionTypeString:](self, "setConnectionTypeString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("L:%@ -- R:%@"), a3, a4));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (-[AVCRemoteVideoClient connectionTypeString](self, "connectionTypeString"))
          v9 = -[NSString UTF8String](-[NSString description](-[AVCRemoteVideoClient connectionTypeString](self, "connectionTypeString"), "description"), "UTF8String");
        else
          v9 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v11 = v7;
        v12 = 2080;
        v13 = "-[AVCRemoteVideoClient updateConnectionInfoWithLocalInterfaceType:remoteInterfaceType:]";
        v14 = 1024;
        v15 = 1030;
        v16 = 2080;
        v17 = v9;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connection changed to: %s", buf, 0x26u);
      }
    }
    -[AVCRemoteVideoClient drawText:inSubLayer:](self, "drawText:inSubLayer:", -[AVCRemoteVideoClient connectionTypeString](self, "connectionTypeString"), -[AVCRemoteVideoClient subLayerForMode:](self, "subLayerForMode:", 0));
    -[AVCRemoteVideoClient drawText:inSubLayer:](self, "drawText:inSubLayer:", -[AVCRemoteVideoClient connectionTypeString](self, "connectionTypeString"), -[AVCRemoteVideoClient subLayerForMode:](self, "subLayerForMode:", 1));
    -[AVCRemoteVideoClient drawText:inSubLayer:](self, "drawText:inSubLayer:", -[AVCRemoteVideoClient connectionTypeString](self, "connectionTypeString"), -[AVCRemoteVideoClient subLayerForMode:](self, "subLayerForMode:", 2));
  }
}

- (void)drawText:(id)a3 inSubLayer:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v5 = -[AVCRemoteVideoClient findInfoSubLayerFromLayer:](self, "findInfoSubLayerFromLayer:", a4);
    if (v5)
    {
      v6 = v5;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        v9 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = 136315650;
            v11 = v7;
            v12 = 2080;
            v13 = "-[AVCRemoteVideoClient drawText:inSubLayer:]";
            v14 = 1024;
            v15 = 1050;
            _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting textLayer", (uint8_t *)&v10, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          -[AVCRemoteVideoClient drawText:inSubLayer:].cold.1();
        }
      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(v6, "setString:", a3);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
}

- (id)findInfoSubLayerFromLayer:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_msgSend(a3, "sublayers");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v12;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v6)
      objc_enumerationMutation(v3);
    v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
    if ((objc_msgSend((id)objc_msgSend(v8, "name"), "containsString:", CFSTR("AVCRemoteVideoInfoLayer")) & 1) != 0)
      return v8;
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      if (v5)
        goto LABEL_3;
      return 0;
    }
  }
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (BOOL)hasReceivedFirstFrame
{
  return self->_hasReceivedFirstFrame;
}

- (void)setHasReceivedFirstFrame:(BOOL)a3
{
  self->_hasReceivedFirstFrame = a3;
}

- (BOOL)hasReceivedLastFrame
{
  return self->_hasReceivedLastFrame;
}

- (void)setHasReceivedLastFrame:(BOOL)a3
{
  self->_hasReceivedLastFrame = a3;
}

- (BOOL)isVideoDegraded
{
  return self->_isVideoDegraded;
}

- (void)setIsVideoDegraded:(BOOL)a3
{
  self->_isVideoDegraded = a3;
}

- (BOOL)isVideoSuspended
{
  return self->_isVideoSuspended;
}

- (void)setIsVideoSuspended:(BOOL)a3
{
  self->_isVideoSuspended = a3;
}

- (BOOL)isMediaStalled
{
  return self->_isMediaStalled;
}

- (void)setIsMediaStalled:(BOOL)a3
{
  self->_isMediaStalled = a3;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (void)setIsVideoPaused:(BOOL)a3
{
  self->_isVideoPaused = a3;
}

- (VideoAttributes)remoteScreenAttributes
{
  return self->_remoteScreenAttributes;
}

- (void)setRemoteScreenAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (VideoAttributes)remoteVideoAttributes
{
  return self->_remoteVideoAttributes;
}

- (void)setRemoteVideoAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (BOOL)shouldDisplayVideoInfoLayer
{
  return self->_shouldDisplayVideoInfoLayer;
}

- (void)setShouldDisplayVideoInfoLayer:(BOOL)a3
{
  self->_shouldDisplayVideoInfoLayer = a3;
}

- (NSString)connectionTypeString
{
  return self->_connectionTypeString;
}

- (void)setConnectionTypeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isNetworkDegraded
{
  return self->_isNetworkDegraded;
}

- (void)setIsNetworkDegraded:(BOOL)a3
{
  self->_isNetworkDegraded = a3;
}

- (BOOL)isNetworkDegradedLocal
{
  return self->_isNetworkDegradedLocal;
}

- (void)setIsNetworkDegradedLocal:(BOOL)a3
{
  self->_isNetworkDegradedLocal = a3;
}

- (BOOL)isTransformForRemoteVideoOrientationEnabled
{
  return self->_transformForRemoteVideoOrientationEnabled;
}

- (void)initWithStreamToken:delegate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCRemoteVideoClient initWithStreamToken:delegate:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d ERROR queue for streamToken=%u doesn't exist", v2, *(const char **)v3, (unint64_t)"-[AVCRemoteVideoClient initWithStreamToken:delegate:]" >> 16, 180);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamToken:delegate:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d ERROR slotsForModes dictionary missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoLayer:forMode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCRemoteVideoClient setVideoLayer:forMode:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d ERROR no valid slot for mode=%d", v2, *(const char **)v3, (unint64_t)"-[AVCRemoteVideoClient setVideoLayer:forMode:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoLayer:forMode:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCRemoteVideoClient setVideoLayer:forMode:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCRemoteVideoClient: ERROR invalid videoMode in setVideoLayer:forMode:%d", v2, *(const char **)v3, (unint64_t)"-[AVCRemoteVideoClient setVideoLayer:forMode:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)slotForMode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCRemoteVideoClient slotForMode:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d ERROR no valid slot for mode=%d", v2, *(const char **)v3, (unint64_t)"-[AVCRemoteVideoClient slotForMode:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setLayerHostBounds:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid CALayerHost instance", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createCALayerHostForRootLayer:withContextId:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid rootLayer or contextId", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createCALayerHostForRootLayer:withContextId:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate layer host name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createCALayerHostForRootLayer:withContextId:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate CALayerHost", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newXPCObjectForFenceHandle:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create new fence", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setRemoteVideoLayerBounds:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CALayerHost invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setRemoteVideoLayerBounds:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream token number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setRemoteVideoLayerBounds:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create XPC representation for fence", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setRemoteVideoLayerBounds:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Set layer bounds xpc call failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setRemoteVideoLayerBounds:(double)a3 .cold.5(double a1, double a2, double a3, double a4, uint64_t a5, NSObject *a6)
{
  uint64_t v7;
  uint8_t v8[14];
  const char *v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  NSStringFromRect(*(NSRect *)&a1);
  OUTLINED_FUNCTION_12_0();
  v9 = "-[AVCRemoteVideoClient setRemoteVideoLayerBounds:]";
  OUTLINED_FUNCTION_4();
  v10 = 401;
  v11 = 2112;
  v12 = v7;
  _os_log_error_impl(&dword_1D8A54000, a6, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed due to invalid root layer bounds=%@", v8, 0x26u);
  OUTLINED_FUNCTION_3_0();
}

- (void)setTransformForRemoteVideoOrientationEnabled:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Set transformForRemoteVideoOrientationEnabled xpc call failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoLayerHost:forMode:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid rootLayer parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoLayerHost:forMode:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream token number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoLayerHost:forMode:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate args dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoLayerHost:(NSObject *)a3 forMode:.cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v4;
  int v5;
  uint8_t v6[14];
  const char *v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "unsignedIntValue");
  OUTLINED_FUNCTION_12_0();
  v7 = "-[AVCRemoteVideoClient setVideoLayerHost:forMode:]";
  OUTLINED_FUNCTION_4();
  v8 = 477;
  v9 = v4;
  v10 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d GetContextIdForStreamToken=%u failed", v6, 0x22u);
  OUTLINED_FUNCTION_3_0();
}

- (void)setVideoLayerHost:forMode:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid contextIdForModes dictionary returned", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoLayerHost:forMode:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate slotsForModes dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoLayerHost:forMode:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CALayerHost exist already, reconfigure not supported currently", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__AVCRemoteVideoClient_setActiveVideoLayerForMode___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[AVCRemoteVideoClient setActiveVideoLayerForMode:]_block_invoke";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d AVCRemoteVideoClient: invalide videoMode=%d when setActiveVideoLayerForMode", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[AVCRemoteVideoClient setActiveVideoLayerForMode:]_block_invoke" >> 16, 665);
  OUTLINED_FUNCTION_3();
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCRemoteVideoClient: server died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__AVCRemoteVideoClient_registerBlocksForNotifications__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCRemoteVideoClient: serverd died, notifying client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Bounds are NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Object is not a CA Layer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)drawText:inSubLayer:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 1050;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Setting textLayer", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

@end
