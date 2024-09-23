@implementation AVCStreamInput

- (AVCStreamInput)initWithDelegate:(id)a3 delegateQueue:(id)a4 format:(opaqueCMFormatDescription *)a5 options:(id)a6 error:(id *)a7
{
  AVCStreamInput *v12;
  int v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t streamInputID;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  NSObject *xpcQueue;
  CMMediaType MediaType;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  char *v29;
  int v30;
  uint64_t v31;
  const __CFString *v32;
  _QWORD v34[6];
  objc_super v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  AVCStreamInput *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  char *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  uint64_t v57;
  char __str[24];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = -2143617020;
  v35.receiver = self;
  v35.super_class = (Class)AVCStreamInput;
  v12 = -[AVCStreamInput init](&v35, sel_init);
  if (!v12)
    goto LABEL_11;
  VRTraceReset();
  v12->_printSampleBufferDetailsEnabled = (int)VRTraceGetErrorLogLevelForModule() > 7;
  v13 = -[AVCStreamInput processFormat:](v12, "processFormat:", a5);
  *((_DWORD *)v37 + 6) = v13;
  if (v13 < 0)
    goto LABEL_11;
  v12->_senderQueueLock._os_unfair_lock_opaque = 0;
  v12->_memoryPoolSize = 0x80000;
  v14 = -[AVCStreamInput processOptions:](v12, "processOptions:", a6);
  *((_DWORD *)v37 + 6) = v14;
  if (v14 < 0)
    goto LABEL_11;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCInputStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamInputID = v12->_streamInputID;
      memset(__str, 170, 20);
      v18 = (void *)MEMORY[0x1E0CB3940];
      AVCStreamInputID_ConvertToCString(streamInputID, __str, 0x14uLL);
      v19 = objc_msgSend(v18, "stringWithUTF8String:", __str);
      *(_DWORD *)buf = 136316162;
      v41 = v15;
      v42 = 2080;
      v43 = "-[AVCStreamInput initWithDelegate:delegateQueue:format:options:error:]";
      v44 = 1024;
      v45 = 162;
      v46 = 2048;
      v47 = v12;
      v48 = 2112;
      v49 = v19;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ AVCInputStream-init (%p) streamInputID=%@", buf, 0x30u);
    }
  }
  v20 = -[AVCStreamInput setupDelegate:delegateQueue:](v12, "setupDelegate:delegateQueue:", a3, a4);
  *((_DWORD *)v37 + 6) = v20;
  if (v20 < 0)
    goto LABEL_11;
  v21 = -[AVCStreamInput setupXPCQueue](v12, "setupXPCQueue");
  *((_DWORD *)v37 + 6) = v21;
  if (v21 < 0)
    goto LABEL_11;
  xpcQueue = v12->_xpcQueue;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __70__AVCStreamInput_initWithDelegate_delegateQueue_format_options_error___block_invoke;
  v34[3] = &unk_1E9E52938;
  v34[4] = v12;
  v34[5] = &v36;
  dispatch_sync(xpcQueue, v34);
  if (!v12->_didInitializeSuccessfully)
  {
LABEL_11:
    MediaType = 0;
  }
  else
  {
    -[AVCStreamInput resetStats](v12, "resetStats");
    MediaType = CMFormatDescriptionGetMediaType(v12->_formatDescription);
    CMFormatDescriptionGetMediaSubType(v12->_formatDescription);
    v12->_requireTileIndexAttachment = (v12->_streamInputID & 0xFFFFFFFFFBFFFFFFLL) == 1650745716;
    kdebug_trace();
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCInputStream-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v12)
      {
        v26 = v12->_streamInputID;
        memset(__str, 170, 20);
        v27 = (void *)MEMORY[0x1E0CB3940];
        AVCStreamInputID_ConvertToCString(v26, __str, 0x14uLL);
        v28 = (const __CFString *)objc_msgSend(v27, "stringWithUTF8String:", __str);
      }
      else
      {
        v28 = CFSTR("nil");
      }
      v29 = FourccToCStr(MediaType);
      v30 = *((_DWORD *)v37 + 6);
      v31 = -[AVCStreamInput formatDescriptionString](v12, "formatDescriptionString");
      *(_DWORD *)buf = 136317186;
      v32 = CFSTR("NO");
      v41 = v24;
      v42 = 2080;
      v43 = "-[AVCStreamInput initWithDelegate:delegateQueue:format:options:error:]";
      v44 = 1024;
      if (v30 >= 0)
        v32 = CFSTR("YES");
      v45 = 186;
      v46 = 2048;
      v47 = v12;
      v48 = 2112;
      v49 = (uint64_t)v28;
      v50 = 2080;
      v51 = v29;
      v52 = 2112;
      v53 = v32;
      v54 = 1024;
      v55 = v30;
      v56 = 2112;
      v57 = v31;
      _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ AVCInputStream-init (%p) streamInputID=%@ mediaType=%s didSucceed=%@ errorCode=%x %@", buf, 0x54u);
    }
  }
  if ((v37[3] & 0x80000000) != 0)
  {

    v12 = 0;
    if (a7)
      *a7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCInputStream"), *((int *)v37 + 6), 0);
  }
  _Block_object_dispose(&v36, 8);
  return v12;
}

uint64_t __70__AVCStreamInput_initWithDelegate_delegateQueue_format_options_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setupXPCConnection");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 0;
  return result;
}

- (id)formatDescriptionString
{
  opaqueCMFormatDescription *formatDescription;
  CMMediaType MediaType;
  FourCharCode MediaSubType;
  void *v6;
  char *v7;
  void *v8;
  __int128 v9;
  const AudioStreamBasicDescription *StreamBasicDescription;
  CMVideoDimensions Dimensions;
  char *v13;
  uint64_t v14;
  char __str[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  formatDescription = self->_formatDescription;
  if (!formatDescription)
    return &stru_1E9E58EE0;
  MediaType = CMFormatDescriptionGetMediaType(formatDescription);
  MediaSubType = CMFormatDescriptionGetMediaSubType(self->_formatDescription);
  v6 = (void *)MEMORY[0x1E0CB37A0];
  v7 = FourccToCStr(MediaType);
  v8 = (void *)objc_msgSend(v6, "stringWithFormat:", CFSTR("mediaType=%s subtype=%s"), v7, FourccToCStr(MediaSubType));
  if (MediaType == 1936684398)
  {
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17 = v9;
    v18 = v9;
    *(_OWORD *)__str = v9;
    v16 = v9;
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(self->_formatDescription);
    v13 = FormatToCStr((uint64_t)StreamBasicDescription, __str, 0x40uLL);
    objc_msgSend(v8, "appendFormat:", CFSTR(" audioStreamBasicDescription=%s"), v13, v14, *(_QWORD *)__str, *(_QWORD *)&__str[8], v16, v17, v18);
  }
  else if (MediaType == 1986618469)
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(self->_formatDescription);
    objc_msgSend(v8, "appendFormat:", CFSTR(" dimensions=%dx%d"), Dimensions, HIDWORD(*(unint64_t *)&Dimensions), *(_QWORD *)__str, *(_QWORD *)&__str[8], v16, v17, v18);
  }
  return v8;
}

- (int)processOptions:(id)a3
{
  id v3;
  void *v5;
  int v6;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
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
  AVCStreamInput *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("options"));
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LODWORD(v3) = -2143617023;
      if ((AVCStreamInput *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCStreamInput processOptions:].cold.2();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v14 = 136316162;
            v15 = v10;
            v16 = 2080;
            v17 = "-[AVCStreamInput processOptions:]";
            v18 = 1024;
            v19 = 222;
            v20 = 2112;
            v21 = v8;
            v22 = 2048;
            v23 = self;
            v12 = "AVCStreamInput [%s] %s:%d %@(%p) Invalid ID";
LABEL_28:
            _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0x30u);
          }
        }
      }
    }
    else
    {
      self->_streamInputID = (int)objc_msgSend(v5, "intValue");
      v3 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("poolSize"));
      if (v3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = objc_msgSend(v3, "intValue");
          LODWORD(v3) = 0;
          self->_memoryPoolSize = v6;
          return (int)v3;
        }
        LODWORD(v3) = -2143617023;
        if ((AVCStreamInput *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCStreamInput processOptions:].cold.1();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v9 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v9 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v14 = 136316162;
              v15 = v13;
              v16 = 2080;
              v17 = "-[AVCStreamInput processOptions:]";
              v18 = 1024;
              v19 = 227;
              v20 = 2112;
              v21 = v9;
              v22 = 2048;
              v23 = self;
              v12 = "AVCStreamInput [%s] %s:%d %@(%p) Invalid sample buffer pool size";
              goto LABEL_28;
            }
          }
        }
      }
    }
  }
  return (int)v3;
}

- (int)processFormat:(opaqueCMFormatDescription *)a3
{
  CFTypeID v5;
  opaqueCMFormatDescription *v6;
  int v7;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  AVCStreamInput *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = CFGetTypeID(a3);
    if (v5 == CMFormatDescriptionGetTypeID())
    {
      v6 = (opaqueCMFormatDescription *)CFRetain(a3);
      v7 = 0;
      self->_formatDescription = v6;
      return v7;
    }
    v7 = -2143617023;
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCStreamInput processFormat:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = v14;
          v17 = 2080;
          v18 = "-[AVCStreamInput processFormat:]";
          v19 = 1024;
          v20 = 239;
          v21 = 2112;
          v22 = v10;
          v23 = 2048;
          v24 = self;
          v13 = "AVCStreamInput [%s] %s:%d %@(%p) Provided format is invalid";
          goto LABEL_25;
        }
      }
    }
  }
  else
  {
    v7 = -2143617023;
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCStreamInput processFormat:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v15 = 136316162;
          v16 = v11;
          v17 = 2080;
          v18 = "-[AVCStreamInput processFormat:]";
          v19 = 1024;
          v20 = 238;
          v21 = 2112;
          v22 = v9;
          v23 = 2048;
          v24 = self;
          v13 = "AVCStreamInput [%s] %s:%d %@(%p) Provided format is NULL";
LABEL_25:
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x30u);
        }
      }
    }
  }
  return v7;
}

- (int)setupDelegate:(id)a3 delegateQueue:(id)a4
{
  OS_dispatch_queue *v5;
  id v7;
  void *v8;
  objc_class *v9;
  const char *v10;
  NSObject *CustomRootQueue;
  int v12;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  AVCStreamInput *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (OS_dispatch_queue *)a4;
    if (a4)
    {
      v7 = a4;
LABEL_5:
      self->_delegateQueue = v5;
      objc_storeWeak(&self->_delegate, a3);
      return 0;
    }
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    v10 = (const char *)objc_msgSend((id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%s.%@.delegate_queue"), "com.apple.AVConference", NSStringFromClass(v9)), "UTF8String");
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v5 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v10, 0, CustomRootQueue);
    if (v5)
      goto LABEL_5;
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      v12 = -2143617022;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[AVCStreamInput setupDelegate:delegateQueue:].cold.2();
          return -2143617022;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      v12 = -2143617022;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v21 = v18;
          v22 = 2080;
          v23 = "-[AVCStreamInput setupDelegate:delegateQueue:]";
          v24 = 1024;
          v25 = 256;
          v26 = 2112;
          v27 = v15;
          v28 = 2048;
          v29 = self;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) Delegate queue is NULL", buf, 0x30u);
          return -2143617022;
        }
      }
    }
  }
  else if ((AVCStreamInput *)objc_opt_class() == self)
  {
    v12 = -2143617023;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamInput setupDelegate:delegateQueue:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    v12 = -2143617023;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = v16;
        v22 = 2080;
        v23 = "-[AVCStreamInput setupDelegate:delegateQueue:]";
        v24 = 1024;
        v25 = 248;
        v26 = 2112;
        v27 = v14;
        v28 = 2048;
        v29 = self;
        _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) No delegate specified", buf, 0x30u);
      }
    }
  }
  return v12;
}

- (int)setupXPCQueue
{
  void *v3;
  objc_class *v4;
  const char *v5;
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v7;
  int v8;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  AVCStreamInput *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%s.%@.connection_queue"), "com.apple.AVConference", NSStringFromClass(v4)), "UTF8String");
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v7 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v5, 0, CustomRootQueue);
  self->_xpcQueue = v7;
  if (v7)
    return 0;
  v8 = -2143617022;
  if ((AVCStreamInput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamInput setupXPCQueue].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v14 = v11;
        v15 = 2080;
        v16 = "-[AVCStreamInput setupXPCQueue]";
        v17 = 1024;
        v18 = 268;
        v19 = 2112;
        v20 = v10;
        v21 = 2048;
        v22 = self;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) Failed to create the XPC connection queue", buf, 0x30u);
      }
    }
  }
  return v8;
}

- (id)newRemoteQueueWithServerPid:(int)a3
{
  uint64_t *p_senderQueue;
  BOOL SenderQueueWithPoolSize;
  opaqueVCRemoteImageQueue *senderQueue;
  __CFAllocator *v7;
  id result;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  __CFAllocator *sampleBufferAllocator;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  AVCStreamInput *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_senderQueue = (uint64_t *)&self->_senderQueue;
  SenderQueueWithPoolSize = VCRemoteImageQueue_CreateSenderQueueWithPoolSize(*(uint64_t *)&a3, &self->_senderQueue);
  senderQueue = self->_senderQueue;
  if (!senderQueue || !SenderQueueWithPoolSize)
  {
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCStreamInput newRemoteQueueWithServerPid:].cold.3();
      }
      goto LABEL_35;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_35;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v18 = 136316162;
    v19 = v12;
    v20 = 2080;
    v21 = "-[AVCStreamInput newRemoteQueueWithServerPid:]";
    v22 = 1024;
    v23 = 276;
    v24 = 2112;
    v25 = v9;
    v26 = 2048;
    v27 = self;
    v14 = "AVCStreamInput [%s] %s:%d %@(%p) RemoteImageQueue could not be made on StreamInput client";
    goto LABEL_39;
  }
  v7 = (__CFAllocator *)VCRemoteImageQueue_SharedMemoryPoolAllocator(senderQueue);
  self->_sampleBufferAllocator = v7;
  if (!v7)
  {
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCStreamInput newRemoteQueueWithServerPid:].cold.1();
      }
      goto LABEL_35;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_35;
    v15 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_35;
    v18 = 136316162;
    v19 = v15;
    v20 = 2080;
    v21 = "-[AVCStreamInput newRemoteQueueWithServerPid:]";
    v22 = 1024;
    v23 = 278;
    v24 = 2112;
    v25 = v10;
    v26 = 2048;
    v27 = self;
    v14 = "AVCStreamInput [%s] %s:%d %@(%p) Could not get the shared pool allocator for the _senderQueue";
LABEL_39:
    _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, 0x30u);
    goto LABEL_35;
  }
  CFRetain(v7);
  result = (id)VCRemoteImageQueue_CreateQueueXPCObject(*p_senderQueue);
  if (result)
    return result;
  if ((AVCStreamInput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamInput newRemoteQueueWithServerPid:].cold.2();
    }
    goto LABEL_35;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v11 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v18 = 136316162;
      v19 = v16;
      v20 = 2080;
      v21 = "-[AVCStreamInput newRemoteQueueWithServerPid:]";
      v22 = 1024;
      v23 = 281;
      v24 = 2112;
      v25 = v11;
      v26 = 2048;
      v27 = self;
      v14 = "AVCStreamInput [%s] %s:%d %@(%p) RemoteImageQueue failed to create sender xpc object";
      goto LABEL_39;
    }
  }
LABEL_35:
  sampleBufferAllocator = self->_sampleBufferAllocator;
  if (sampleBufferAllocator)
  {
    CFRelease(sampleBufferAllocator);
    self->_sampleBufferAllocator = 0;
  }
  VCRemoteImageQueue_Destroy(p_senderQueue);
  return 0;
}

- (void)tearDownRemoteQueue
{
  os_unfair_lock_s *p_senderQueueLock;

  p_senderQueueLock = &self->_senderQueueLock;
  os_unfair_lock_lock(&self->_senderQueueLock);
  if (self->_useFigRemoteQueue)
  {
    self->_useFigRemoteQueue = 0;
    VCRemoteImageQueue_Destroy((uint64_t *)&self->_senderQueue);
  }
  os_unfair_lock_unlock(p_senderQueueLock);
}

- (int)setupXPCConnection
{
  AVConferenceXPCClient *v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  AVCStreamInput *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(AVConferenceXPCClient);
  self->_xpcConnection = v3;
  if (v3)
  {
    -[AVCStreamInput registerBlocksForNotification](self, "registerBlocksForNotification");
    return -[AVCStreamInput initializeServerSideInputStream](self, "initializeServerSideInputStream");
  }
  else
  {
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCStreamInput setupXPCConnection].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v8 = 136316162;
          v9 = v6;
          v10 = 2080;
          v11 = "-[AVCStreamInput setupXPCConnection]";
          v12 = 1024;
          v13 = 303;
          v14 = 2112;
          v15 = v5;
          v16 = 2048;
          v17 = self;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) Failed to allocate the XPC connection", (uint8_t *)&v8, 0x30u);
        }
      }
    }
    return -2143617022;
  }
}

- (void)tearDownConnectionWithTerminateMessage:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[AVCStreamInput deregisterBlocksForNotifications](self, "deregisterBlocksForNotifications");
  if (v3)
    -[AVConferenceXPCClient sendMessageSync:](self->_xpcConnection, "sendMessageSync:", "VCStreamInputTerminate");

  self->_xpcConnection = 0;
  -[AVCStreamInput tearDownRemoteQueue](self, "tearDownRemoteQueue");
}

- (int)resetXPCConnection
{
  -[AVCStreamInput tearDownConnectionWithTerminateMessage:](self, "tearDownConnectionWithTerminateMessage:", 0);
  return -[AVCStreamInput setupXPCConnection](self, "setupXPCConnection");
}

- (void)resetStats
{
  uint64_t v2;
  __int128 v3;
  int64_t v4;

  v2 = MEMORY[0x1E0CA2E18];
  v3 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)(&self->_isStarted + 4) = *MEMORY[0x1E0CA2E18];
  v4 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)&self->_lastHealthPrintTime.flags = v4;
  *(_OWORD *)&self->_payloadStats.sampleBufferCount = v3;
  *(_QWORD *)&self->_payloadStats.lastSampleBufferTime.timescale = v4;
  self->_payloadStats.lastSampleBufferTime.epoch = 0;
  *((_DWORD *)&self->_senderQueueLock + 1) = 0;
  *(_OWORD *)&self->_payloadStats.averageBitrate = v3;
  self->_tileIndexStats[0].lastSampleBufferTime.value = v4;
  *(_QWORD *)&self->_tileIndexStats[0].lastSampleBufferTime.timescale = 0;
  LODWORD(self->_tileIndexStats[1].lastSampleBufferTime.value) = 0;
  *(_QWORD *)&self->_tileIndexStats[1].sampleBufferCount = v4;
  *(_OWORD *)&self->_tileIndexStats[0].lastSampleBufferTime.epoch = v3;
}

- (void)dealloc
{
  NSObject *xpcQueue;
  NSObject *delegateQueue;
  opaqueCMFormatDescription *formatDescription;
  __CFAllocator *sampleBufferAllocator;
  uint64_t v7;
  NSObject *v8;
  objc_class *v9;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  AVCStreamInput *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[AVCStreamInput tearDownConnectionWithTerminateMessage:](self, "tearDownConnectionWithTerminateMessage:", 1);
  xpcQueue = self->_xpcQueue;
  if (xpcQueue)
  {
    dispatch_release(xpcQueue);
    self->_xpcQueue = 0;
  }
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  objc_storeWeak(&self->_delegate, 0);

  formatDescription = self->_formatDescription;
  if (formatDescription)
    CFRelease(formatDescription);
  sampleBufferAllocator = self->_sampleBufferAllocator;
  if (sampleBufferAllocator)
    CFRelease(sampleBufferAllocator);
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_senderQueue);
  kdebug_trace();
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ %@-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316162;
      v12 = v7;
      v13 = 2080;
      v14 = "-[AVCStreamInput dealloc]";
      v15 = 1024;
      v16 = 356;
      v17 = 2112;
      v18 = NSStringFromClass(v9);
      v19 = 2048;
      v20 = self;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ %@-dealloc (%p)", buf, 0x30u);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)AVCStreamInput;
  -[AVCStreamInput dealloc](&v10, sel_dealloc);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)senderQueueLock
{
  os_unfair_lock_lock(&self->_senderQueueLock);
}

- (void)senderQueueUnlock
{
  os_unfair_lock_unlock(&self->_senderQueueLock);
}

- (int)createAndAddRemoteQueueToXPCDictionary:(id)a3
{
  os_unfair_lock_s *p_senderQueueLock;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 useFigRemoteQueue;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  AVCStreamInput *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  p_senderQueueLock = &self->_senderQueueLock;
  os_unfair_lock_lock(&self->_senderQueueLock);
  v6 = -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](self->_xpcConnection, "sendMessageSync:arguments:xpcArguments:", "VCStreamInputGetServerPid", 0, 0);
  if (!v6)
    goto LABEL_7;
  v7 = v6;
  v8 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ERROR"));
  if (v8)
  {
    v24 = v8;
    v12 = objc_msgSend(v8, "code");
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:].cold.2();
      }
      goto LABEL_42;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_42;
    v27 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    v34 = 136316674;
    v35 = v27;
    v36 = 2080;
    v37 = "-[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:]";
    v38 = 1024;
    v39 = 383;
    v40 = 2112;
    v41 = v25;
    v42 = 2048;
    v43 = self;
    v44 = 2080;
    v45 = "VCStreamInputGetServerPid";
    v46 = 2112;
    v47 = v24;
    v29 = "AVCStreamInput [%s] %s:%d %@(%p) Message=%s returned with an error=%@";
    v30 = v28;
    v31 = 68;
LABEL_44:
    _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v34, v31);
    goto LABEL_42;
  }
  v9 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VCStreamInputServerPID"));
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(v9, "intValue"))
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v11 = -[AVCStreamInput newRemoteQueueWithServerPid:](self, "newRemoteQueueWithServerPid:", objc_msgSend(v10, "intValue"));
  if (v11)
  {
    v10 = v11;
    xpc_dictionary_set_value(a3, "VCStreamInputRemoteQueue", v11);
    v12 = 0;
    self->_useFigRemoteQueue = 1;
    goto LABEL_9;
  }
  v12 = -2143617020;
  if ((AVCStreamInput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:].cold.1();
    }
    goto LABEL_42;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v26 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v26 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v34 = 136316162;
      v35 = v32;
      v36 = 2080;
      v37 = "-[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:]";
      v38 = 1024;
      v39 = 387;
      v40 = 2112;
      v41 = v26;
      v42 = 2048;
      v43 = self;
      v29 = "AVCStreamInput [%s] %s:%d %@(%p) Failed to create remote queue";
      v30 = v33;
      v31 = 48;
      goto LABEL_44;
    }
  }
LABEL_42:
  v10 = 0;
LABEL_9:
  os_unfair_lock_unlock(p_senderQueueLock);
  if ((AVCStreamInput *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_20;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    useFigRemoteQueue = self->_useFigRemoteQueue;
    v34 = 136316418;
    v35 = v20;
    v36 = 2080;
    v37 = "-[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:]";
    v38 = 1024;
    v39 = 394;
    v40 = 2112;
    v41 = v13;
    v42 = 2048;
    v43 = self;
    v44 = 1024;
    LODWORD(v45) = useFigRemoteQueue;
    v17 = "AVCStreamInput [%s] %s:%d %@(%p) useFigRemoteQueue=%d";
    v18 = v21;
    v19 = 54;
    goto LABEL_19;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_useFigRemoteQueue;
      v34 = 136315906;
      v35 = v14;
      v36 = 2080;
      v37 = "-[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:]";
      v38 = 1024;
      v39 = 394;
      v40 = 1024;
      LODWORD(v41) = v16;
      v17 = "AVCStreamInput [%s] %s:%d useFigRemoteQueue=%d";
      v18 = v15;
      v19 = 34;
LABEL_19:
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v34, v19);
    }
  }
LABEL_20:
  if (v10)
    CFRelease(v10);
  return v12;
}

- (int)initializeServerSideInputStream
{
  uint64_t v3;
  void *v4;
  const void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  _BYTE v32[24];
  __int128 v33;
  AVCStreamInput *v34;
  _BYTE v35[24];
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if (self->_streamInputID)
  {
    v36 = CFSTR("VCStreamInputID");
    v37[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
  }
  else
  {
    v3 = 0;
  }
  v4 = VCStreamInputUtil_EncodeFormatDescription(self->_formatDescription);
  if (v4)
  {
    v5 = v4;
    v6 = -[AVCStreamInput createAndAddRemoteQueueToXPCDictionary:](self, "createAndAddRemoteQueueToXPCDictionary:", v4);
    if (v6)
    {
      v11 = v6;
      if ((AVCStreamInput *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCStreamInput initializeServerSideInputStream].cold.5();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v14 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v14 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v32 = 136316162;
            *(_QWORD *)&v32[4] = v21;
            *(_WORD *)&v32[12] = 2080;
            *(_QWORD *)&v32[14] = "-[AVCStreamInput initializeServerSideInputStream]";
            *(_WORD *)&v32[22] = 1024;
            LODWORD(v33) = 411;
            WORD2(v33) = 2112;
            *(_QWORD *)((char *)&v33 + 6) = v14;
            HIWORD(v33) = 2048;
            v34 = self;
            v23 = "AVCStreamInput [%s] %s:%d %@(%p) RemoteQueue creation and adding to XPC dictionary failed";
            v24 = v22;
            v25 = 48;
            goto LABEL_67;
          }
        }
      }
    }
    else
    {
      v7 = -[AVConferenceXPCClient sendMessageSync:arguments:xpcArguments:](self->_xpcConnection, "sendMessageSync:arguments:xpcArguments:", "VCStreamInputInitialize", v3, v5);
      if (!v7)
      {
        if ((AVCStreamInput *)objc_opt_class() == self)
        {
          v11 = -2143617023;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCStreamInput initializeServerSideInputStream].cold.2();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v15 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v15 = &stru_1E9E58EE0;
          v11 = -2143617023;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v26 = VRTraceErrorLogLevelToCSTR();
            v27 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v32 = 136316418;
              *(_QWORD *)&v32[4] = v26;
              *(_WORD *)&v32[12] = 2080;
              *(_QWORD *)&v32[14] = "-[AVCStreamInput initializeServerSideInputStream]";
              *(_WORD *)&v32[22] = 1024;
              LODWORD(v33) = 414;
              WORD2(v33) = 2112;
              *(_QWORD *)((char *)&v33 + 6) = v15;
              HIWORD(v33) = 2048;
              v34 = self;
              *(_WORD *)v35 = 2080;
              *(_QWORD *)&v35[2] = "VCStreamInputInitialize";
              _os_log_error_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) message=%s sendMessageSync failed", v32, 0x3Au);
            }
          }
        }
        goto LABEL_65;
      }
      v8 = v7;
      v9 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ERROR"));
      if (!v9)
      {
        if (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VCStreamInputID")))
        {
          v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VCStreamInputID")), "intValue");
          self->_streamInputID = v10;
          AVCStreamInputID_ConvertToCString(v10, self->_streamInputIDString, 0x14uLL);
          if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VCStreamInputDidStart")), "BOOLValue"))-[AVCStreamInput didStart](self, "didStart");
          v11 = 0;
          goto LABEL_12;
        }
        if ((AVCStreamInput *)objc_opt_class() == self)
        {
          v11 = -2143617020;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_65;
          VRTraceErrorLogLevelToCSTR();
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_65;
          -[AVCStreamInput initializeServerSideInputStream].cold.3();
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v18 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v18 = &stru_1E9E58EE0;
          v11 = -2143617020;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_65;
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_65;
          *(_DWORD *)v32 = 136316418;
          *(_QWORD *)&v32[4] = v30;
          *(_WORD *)&v32[12] = 2080;
          *(_QWORD *)&v32[14] = "-[AVCStreamInput initializeServerSideInputStream]";
          *(_WORD *)&v32[22] = 1024;
          LODWORD(v33) = 419;
          WORD2(v33) = 2112;
          *(_QWORD *)((char *)&v33 + 6) = v18;
          HIWORD(v33) = 2048;
          v34 = self;
          *(_WORD *)v35 = 2112;
          *(_QWORD *)&v35[2] = v8;
          _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) No stream input ID provided. nsRet=%@", v32, 0x3Au);
        }
        v11 = -2143617020;
LABEL_65:
        -[AVCStreamInput tearDownRemoteQueue](self, "tearDownRemoteQueue", *(_OWORD *)v32, *(_QWORD *)&v32[16], v33, v34, *(_OWORD *)v35, *(_QWORD *)&v35[16]);
        goto LABEL_12;
      }
      v16 = v9;
      v11 = objc_msgSend(v9, "code");
      if ((AVCStreamInput *)objc_opt_class() != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v17 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v17 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_60;
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_60;
        *(_DWORD *)v32 = 136316674;
        *(_QWORD *)&v32[4] = v28;
        *(_WORD *)&v32[12] = 2080;
        *(_QWORD *)&v32[14] = "-[AVCStreamInput initializeServerSideInputStream]";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 417;
        WORD2(v33) = 2112;
        *(_QWORD *)((char *)&v33 + 6) = v17;
        HIWORD(v33) = 2048;
        v34 = self;
        *(_WORD *)v35 = 2080;
        *(_QWORD *)&v35[2] = "VCStreamInputInitialize";
        *(_WORD *)&v35[10] = 2112;
        *(_QWORD *)&v35[12] = v16;
        v23 = "AVCStreamInput [%s] %s:%d %@(%p) message=%s returned with an error=%@";
        v24 = v29;
        v25 = 68;
LABEL_67:
        _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, v23, v32, v25);
        goto LABEL_60;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCStreamInput initializeServerSideInputStream].cold.4();
      }
    }
LABEL_60:
    if ((v11 & 0x80000000) == 0)
    {
LABEL_12:
      CFRelease(v5);
      return v11;
    }
    goto LABEL_65;
  }
  if ((AVCStreamInput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamInput initializeServerSideInputStream].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v32 = 136316162;
        *(_QWORD *)&v32[4] = v19;
        *(_WORD *)&v32[12] = 2080;
        *(_QWORD *)&v32[14] = "-[AVCStreamInput initializeServerSideInputStream]";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 408;
        WORD2(v33) = 2112;
        *(_QWORD *)((char *)&v33 + 6) = v13;
        HIWORD(v33) = 2048;
        v34 = self;
        _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) Failed to encode the format description", v32, 0x30u);
      }
    }
  }
  -[AVCStreamInput tearDownRemoteQueue](self, "tearDownRemoteQueue");
  return -2143617022;
}

- (void)didServerDie
{
  uint64_t v4;
  uint8_t v5[14];
  const char *v6;

  OUTLINED_FUNCTION_17(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v6 = "-[AVCStreamInput didServerDie]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v4, "AVCStreamInput [%s] %s:%d AVCStreamInputID=%@ server died while initializing the XPC connection. Don't try to reconnect since this instance will dealloc", v5);
  OUTLINED_FUNCTION_19();
}

uint64_t __30__AVCStreamInput_didServerDie__block_invoke(uint64_t a1)
{
  id *v1;
  const __CFString *v2;
  uint64_t v3;
  char IsOSFaultDisabled;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __30__AVCStreamInput_didServerDie__block_invoke_cold_1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        __30__AVCStreamInput_didServerDie__block_invoke_cold_2();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*v1, "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v5 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v6 = *v1;
          v7 = (uint64_t)*v1 + 128;
          v11 = 136316418;
          v12 = v3;
          v13 = 2080;
          v14 = "-[AVCStreamInput didServerDie]_block_invoke";
          v15 = 1024;
          v16 = 505;
          v17 = 2112;
          v18 = v2;
          v19 = 2048;
          v20 = v6;
          v21 = 2080;
          v22 = v7;
          _os_log_error_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) AVCStreamInputID=%s server died, notifying client", (uint8_t *)&v11, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        v8 = *v1;
        v9 = (uint64_t)*v1 + 128;
        v11 = 136316418;
        v12 = v3;
        v13 = 2080;
        v14 = "-[AVCStreamInput didServerDie]_block_invoke";
        v15 = 1024;
        v16 = 505;
        v17 = 2112;
        v18 = v2;
        v19 = 2048;
        v20 = v8;
        v21 = 2080;
        v22 = v9;
        _os_log_fault_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_FAULT, "AVCStreamInput [%s] %s:%d %@(%p) AVCStreamInputID=%s server died, notifying client", (uint8_t *)&v11, 0x3Au);
      }
    }
  }
  objc_msgSend(*v1, "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*v1, "delegate"), "serverDidDie");
  return result;
}

- (void)didStart
{
  NSObject *delegateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__AVCStreamInput_didStart__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __26__AVCStreamInput_didStart__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 64))
  {
    objc_msgSend((id)result, "resetStats");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
    kdebug_trace();
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ %@-didStart");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = (objc_class *)objc_opt_class();
        v6 = NSStringFromClass(v5);
        v7 = *(_QWORD *)(a1 + 32);
        v8 = 136316162;
        v9 = v3;
        v10 = 2080;
        v11 = "-[AVCStreamInput didStart]_block_invoke";
        v12 = 1024;
        v13 = 521;
        v14 = 2112;
        v15 = v6;
        v16 = 2048;
        v17 = v7;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ %@-didStart (%p)", (uint8_t *)&v8, 0x30u);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didStartStreamInput:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

- (void)didStop
{
  NSObject *delegateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __25__AVCStreamInput_didStop__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __25__AVCStreamInput_didStop__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 64))
  {
    v2 = result;
    *(_BYTE *)(v1 + 64) = 0;
    kdebug_trace();
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ %@-didStop");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = (objc_class *)objc_opt_class();
        v6 = NSStringFromClass(v5);
        v7 = *(_QWORD *)(v2 + 32);
        v8 = 136316162;
        v9 = v3;
        v10 = 2080;
        v11 = "-[AVCStreamInput didStop]_block_invoke";
        v12 = 1024;
        v13 = 535;
        v14 = 2112;
        v15 = v6;
        v16 = 2048;
        v17 = v7;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ %@-didStop (%p)", (uint8_t *)&v8, 0x30u);
      }
    }
    objc_msgSend(*(id *)(v2 + 32), "delegate");
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend((id)objc_msgSend(*(id *)(v2 + 32), "delegate"), "didStopStreamInput:", *(_QWORD *)(v2 + 32));
  }
  return result;
}

- (void)didSuspend
{
  NSObject *delegateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__AVCStreamInput_didSuspend__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __28__AVCStreamInput_didSuspend__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ %@-didSuspend");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 136316162;
      v9 = v2;
      v10 = 2080;
      v11 = "-[AVCStreamInput didSuspend]_block_invoke";
      v12 = 1024;
      v13 = 544;
      v14 = 2112;
      v15 = v5;
      v16 = 2048;
      v17 = v6;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ %@-didSuspend (%p)", (uint8_t *)&v8, 0x30u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didSuspendStreamInput:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)didResume
{
  NSObject *delegateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__AVCStreamInput_didResume__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __27__AVCStreamInput_didResume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ %@-didResume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      v6 = *(_QWORD *)(a1 + 32);
      v9 = 136316162;
      v10 = v2;
      v11 = 2080;
      v12 = "-[AVCStreamInput didResume]_block_invoke";
      v13 = 1024;
      v14 = 554;
      v15 = 2112;
      v16 = v5;
      v17 = 2048;
      v18 = v6;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @:@ %@-didResume (%p)", (uint8_t *)&v9, 0x30u);
    }
  }
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v7, "didResumeStreamInput:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)registerService:(char *)a3 weakSelf:(id)a4 block:(id)a5
{
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVCStreamInput_registerService_weakSelf_block___block_invoke;
  v5[3] = &unk_1E9E565C0;
  v5[4] = a4;
  v5[5] = a5;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_xpcConnection, "registerBlockForService:block:queue:", a3, v5, self->_xpcQueue);
}

uint64_t __49__AVCStreamInput_registerService_weakSelf_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

- (void)registerDidServerDieBlock:(id)a3
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__AVCStreamInput_registerDidServerDieBlock___block_invoke;
  v3[3] = &unk_1E9E52730;
  v3[4] = a3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_xpcConnection, "registerBlockForService:block:queue:", "VCStreamInputDidServerDie", v3, self->_xpcQueue);
}

void *__44__AVCStreamInput_registerDidServerDieBlock___block_invoke(uint64_t a1, void *a2)
{
  void *result;

  result = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (result)
  {
    result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
      return (void *)objc_msgSend(result, "didServerDie");
  }
  return result;
}

- (void)registerBlocksForNotification
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  -[AVCStreamInput registerService:weakSelf:block:](self, "registerService:weakSelf:block:", "VCStreamInputDidStart", v3, &__block_literal_global_53);
  -[AVCStreamInput registerService:weakSelf:block:](self, "registerService:weakSelf:block:", "VCStreamInputDidStop", v3, &__block_literal_global_66);
  -[AVCStreamInput registerService:weakSelf:block:](self, "registerService:weakSelf:block:", "VCStreamInputDidSuspend", v3, &__block_literal_global_68);
  -[AVCStreamInput registerService:weakSelf:block:](self, "registerService:weakSelf:block:", "VCStreamInputDidResume", v3, &__block_literal_global_70);
  -[AVCStreamInput registerDidServerDieBlock:](self, "registerDidServerDieBlock:", v3);
}

uint64_t __47__AVCStreamInput_registerBlocksForNotification__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didStart");
}

uint64_t __47__AVCStreamInput_registerBlocksForNotification__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didStop");
}

uint64_t __47__AVCStreamInput_registerBlocksForNotification__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didSuspend");
}

uint64_t __47__AVCStreamInput_registerBlocksForNotification__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didResume");
}

- (void)deregisterBlocksForNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_xpcConnection, "deregisterFromService:", "conferenceDidServerDie");
  -[AVConferenceXPCClient deregisterFromService:](self->_xpcConnection, "deregisterFromService:", "VCStreamInputDidStart");
  -[AVConferenceXPCClient deregisterFromService:](self->_xpcConnection, "deregisterFromService:", "VCStreamInputDidStop");
  -[AVConferenceXPCClient deregisterFromService:](self->_xpcConnection, "deregisterFromService:", "VCStreamInputDidSuspend");
  -[AVConferenceXPCClient deregisterFromService:](self->_xpcConnection, "deregisterFromService:", "VCStreamInputDidResume");
}

- (BOOL)sendSampleBufferOverXPC:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  NSObject *xpcQueue;
  char v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  xpcQueue = self->_xpcQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke;
  v7[3] = &unk_1E9E55810;
  v7[5] = &v8;
  v7[6] = a3;
  v7[4] = self;
  dispatch_sync(xpcQueue, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = VCStreamInputUtil_EncodeSampleBuffer(*(opaqueCMSampleBuffer **)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = *(void **)(v3 + 8);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_73;
    v10[3] = &unk_1E9E52730;
    v10[4] = v3;
    objc_msgSend(v4, "sendMessageAsync:arguments:xpcArguments:reply:queue:replyLogLevel:", "VCStreamInputPushSampleBuffer", 0, v2, v10, 0, 8);
    xpc_release(v2);
    v5 = 1;
  }
  else
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_cold_1();
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
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v9 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          v12 = v7;
          v13 = 2080;
          v14 = "-[AVCStreamInput sendSampleBufferOverXPC:error:]_block_invoke";
          v15 = 1024;
          v16 = 626;
          v17 = 2112;
          v18 = v6;
          v19 = 2048;
          v20 = v9;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) could not create XPC dictionary for AVCStreamInput", buf, 0x30u);
        }
      }
    }
    v5 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
}

void __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_73(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_73_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 32);
          v9 = 136316418;
          v10 = v6;
          v11 = 2080;
          v12 = "-[AVCStreamInput sendSampleBufferOverXPC:error:]_block_invoke";
          v13 = 1024;
          v14 = 633;
          v15 = 2112;
          v16 = v5;
          v17 = 2048;
          v18 = v8;
          v19 = 2112;
          v20 = a3;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) Failed to submit frame. error=%@", (uint8_t *)&v9, 0x3Au);
        }
      }
    }
  }
}

- (BOOL)pushSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  const __CFNumber *v7;
  const __CFNumber *v9;
  const opaqueCMFormatDescription *FormatDescription;
  __int128 v11;
  OpaqueCMBlockBuffer *DataBuffer;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  opaqueCMSampleBuffer *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  opaqueCMSampleBuffer *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  const opaqueCMFormatDescription *v27;
  CMMediaType MediaType;
  BOOL *v29;
  _BOOL4 requireTileIndexAttachment;
  int ErrorLogLevelForModule;
  uint64_t v32;
  NSObject *v33;
  char *v34;
  double v35;
  int v36;
  double v37;
  int epoch_high;
  float v39;
  unsigned int flags;
  const __CFString *v41;
  uint64_t v42;
  NSObject *v43;
  char *v44;
  int v45;
  const char *v46;
  NSObject *v47;
  uint32_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  BOOL v53;
  uint64_t v54;
  NSObject *v55;
  char *v56;
  float v57;
  int v58;
  const __CFString *v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  const char *v63;
  NSObject *v64;
  uint32_t v65;
  uint64_t v66;
  NSObject *v67;
  NSObject *v68;
  opaqueCMSampleBuffer *v69;
  CMTime v71;
  CMTime v72;
  CMTime rhs;
  __int128 valuePtr;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  char v78;
  CMTime buf;
  int v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *streamInputIDString;
  __int16 v85;
  double v86;
  __int16 v87;
  _BYTE v88[20];
  __int16 v89;
  double v90;
  __int16 v91;
  unsigned int v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  if (*(double *)&a3 == 0.0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamInput pushSampleBuffer:error:].cold.1();
    }
    return 0;
  }
  v7 = (const __CFNumber *)CMGetAttachment(a3, CFSTR("tileIndex"), 0);
  if (self->_requireTileIndexAttachment && v7 == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamInput pushSampleBuffer:error:].cold.2();
    }
    return 0;
  }
  v9 = v7;
  if (self->_printSampleBufferDetailsEnabled)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    if (CMFormatDescriptionGetMediaType(FormatDescription) == 1835365473)
    {
      v78 = -86;
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v76 = v11;
      v77 = v11;
      valuePtr = v11;
      v75 = v11;
      DataBuffer = CMSampleBufferGetDataBuffer(a3);
      VideoUtil_BlockBufferToString(DataBuffer, (char *)&valuePtr, 65);
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_26;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      v15 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        *(double *)&v16 = COERCE_DOUBLE(CMBlockBufferGetDataLength(DataBuffer));
        LODWORD(buf.value) = 136316930;
        *(CMTimeValue *)((char *)&buf.value + 4) = v13;
        LOWORD(buf.flags) = 2080;
        *(_QWORD *)((char *)&buf.flags + 2) = "_AVCStreamInput_PrintSampleBufferDetails";
        HIWORD(buf.epoch) = 1024;
        v80 = 98;
        v81 = 2048;
        v82 = self;
        v83 = 2080;
        streamInputIDString = self->_streamInputIDString;
        v85 = 2048;
        v86 = *(double *)&v16;
        v87 = 2080;
        *(_QWORD *)v88 = &valuePtr;
        *(_WORD *)&v88[8] = 2112;
        *(_QWORD *)&v88[10] = a3;
        v17 = "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s length=%zu data=%s sampleBuffer=%@";
        v18 = v14;
        v19 = 78;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&buf, v19);
        goto LABEL_26;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(double *)&v23 = COERCE_DOUBLE(CMBlockBufferGetDataLength(DataBuffer));
        LODWORD(buf.value) = 136316930;
        *(CMTimeValue *)((char *)&buf.value + 4) = v13;
        LOWORD(buf.flags) = 2080;
        *(_QWORD *)((char *)&buf.flags + 2) = "_AVCStreamInput_PrintSampleBufferDetails";
        HIWORD(buf.epoch) = 1024;
        v80 = 98;
        v81 = 2048;
        v82 = self;
        v83 = 2080;
        streamInputIDString = self->_streamInputIDString;
        v85 = 2048;
        v86 = *(double *)&v23;
        v87 = 2080;
        *(_QWORD *)v88 = &valuePtr;
        *(_WORD *)&v88[8] = 2112;
        *(_QWORD *)&v88[10] = a3;
        v24 = "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s length=%zu data=%s sampleBuffer=%@";
        v25 = v14;
        v26 = 78;
LABEL_82:
        _os_log_debug_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEBUG, v24, (uint8_t *)&buf, v26);
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_26;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      v22 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        LODWORD(buf.value) = 136316418;
        *(CMTimeValue *)((char *)&buf.value + 4) = v20;
        LOWORD(buf.flags) = 2080;
        *(_QWORD *)((char *)&buf.flags + 2) = "_AVCStreamInput_PrintSampleBufferDetails";
        HIWORD(buf.epoch) = 1024;
        v80 = 100;
        v81 = 2048;
        v82 = self;
        v83 = 2080;
        streamInputIDString = self->_streamInputIDString;
        v85 = 2112;
        v86 = *(double *)&a3;
        v17 = "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s sampleBuffer=%@";
        v18 = v21;
        v19 = 58;
        goto LABEL_22;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.value) = 136316418;
        *(CMTimeValue *)((char *)&buf.value + 4) = v20;
        LOWORD(buf.flags) = 2080;
        *(_QWORD *)((char *)&buf.flags + 2) = "_AVCStreamInput_PrintSampleBufferDetails";
        HIWORD(buf.epoch) = 1024;
        v80 = 100;
        v81 = 2048;
        v82 = self;
        v83 = 2080;
        streamInputIDString = self->_streamInputIDString;
        v85 = 2112;
        v86 = *(double *)&a3;
        v24 = "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s sampleBuffer=%@";
        v25 = v21;
        v26 = 58;
        goto LABEL_82;
      }
    }
  }
LABEL_26:
  if (!self->_isStarted)
  {
    if ((AVCStreamInput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v49 = VRTraceErrorLogLevelToCSTR();
        v50 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[AVCStreamInput pushSampleBuffer:error:].cold.3(v49, (uint64_t)self, v50);
          if (a4)
          {
LABEL_52:
            v53 = 0;
            *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCInputStream"), -2143617007, 0);
            return v53;
          }
          return 0;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v41 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v41 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v51 = VRTraceErrorLogLevelToCSTR();
        v52 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(double *)&v69 = COERCE_DOUBLE(AVCStreamInputID_ConvertToNSString(self->_streamInputID));
          LODWORD(buf.value) = 136316418;
          *(CMTimeValue *)((char *)&buf.value + 4) = v51;
          LOWORD(buf.flags) = 2080;
          *(_QWORD *)((char *)&buf.flags + 2) = "-[AVCStreamInput pushSampleBuffer:error:]";
          HIWORD(buf.epoch) = 1024;
          v80 = 657;
          v81 = 2112;
          v82 = (void *)v41;
          v83 = 2048;
          streamInputIDString = self;
          v85 = 2112;
          v86 = *(double *)&v69;
          _os_log_error_impl(&dword_1D8A54000, v52, OS_LOG_TYPE_ERROR, "AVCStreamInput [%s] %s:%d %@(%p) streamInputID=%@ Buffer pushed before streamInput was started", (uint8_t *)&buf, 0x3Au);
          if (a4)
            goto LABEL_52;
          return 0;
        }
      }
    }
    if (a4)
      goto LABEL_52;
    return 0;
  }
  v27 = CMSampleBufferGetFormatDescription(a3);
  MediaType = CMFormatDescriptionGetMediaType(v27);
  CMFormatDescriptionGetMediaSubType(v27);
  memset(&v72, 170, sizeof(v72));
  CMSampleBufferGetPresentationTimeStamp(&v72, a3);
  buf = v72;
  CMTimeGetSeconds(&buf);
  kdebug_trace();
  if (v9)
  {
    LODWORD(valuePtr) = 0;
    CFNumberGetValue(v9, kCFNumberIntType, &valuePtr);
    if (valuePtr <= 1)
    {
      buf = v72;
      _AVCStreamInput_ComputeStats((uint64_t)self, a3, MediaType, (__int128 *)&buf.value, (uint64_t)&self->_payloadStats.lastSampleBufferTime.epoch + 32 * valuePtr + 4);
    }
  }
  buf = v72;
  _AVCStreamInput_ComputeStats((uint64_t)self, a3, MediaType, (__int128 *)&buf.value, (uint64_t)(&self->_senderQueueLock + 1));
  v71 = v72;
  v29 = &self->_isStarted + 4;
  if ((self->_lastHealthPrintTime.timescale & 1) == 0
    || (memset(&buf, 170, sizeof(buf)),
        valuePtr = *(_OWORD *)&v72.value,
        *(_QWORD *)&v75 = v72.epoch,
        *(_OWORD *)&rhs.value = *(_OWORD *)v29,
        rhs.epoch = *(_QWORD *)&self->_lastHealthPrintTime.flags,
        CMTimeSubtract(&buf, (CMTime *)&valuePtr, &rhs),
        (double)buf.value / (double)buf.timescale > 5.0))
  {
    if (MediaType == 1835365473)
    {
      requireTileIndexAttachment = self->_requireTileIndexAttachment;
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (requireTileIndexAttachment)
      {
        if (ErrorLogLevelForModule >= 6)
        {
          v32 = VRTraceErrorLogLevelToCSTR();
          v33 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v34 = FourccToCStr(1835365473);
            v35 = (float)(*(float *)&self->_payloadStats.lastSampleBufferTime.epoch / 1000.0);
            v36 = *((_DWORD *)&self->_senderQueueLock + 1);
            v37 = (float)(*(float *)&self->_tileIndexStats[0].lastSampleBufferTime.timescale / 1000.0);
            epoch_high = HIDWORD(self->_payloadStats.lastSampleBufferTime.epoch);
            LODWORD(buf.value) = 136317698;
            v39 = *(float *)&self->_tileIndexStats[1].lastSampleBufferTime.value;
            flags = self->_tileIndexStats[0].lastSampleBufferTime.flags;
            *(CMTimeValue *)((char *)&buf.value + 4) = v32;
            LOWORD(buf.flags) = 2080;
            *(_QWORD *)((char *)&buf.flags + 2) = "_AVCStreamInput_DisplayHealthInfo";
            HIWORD(buf.epoch) = 1024;
            v80 = 450;
            v81 = 2080;
            v82 = self->_streamInputIDString;
            v83 = 2080;
            streamInputIDString = v34;
            v85 = 2048;
            v86 = v35;
            v87 = 1024;
            *(_DWORD *)v88 = v36;
            *(_WORD *)&v88[4] = 2048;
            *(double *)&v88[6] = v37;
            *(_WORD *)&v88[14] = 1024;
            *(_DWORD *)&v88[16] = epoch_high;
            v89 = 2048;
            v90 = (float)(v39 / 1000.0);
            v91 = 1024;
            v92 = flags;
            _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, "AVCStreamInput [%s] %s:%d @=@ Health: AVCStreamInput AVCStreamInputID=%s mediaType=%s averageBitrate=%0.2fkbps sampleBufferCount=%d tileStats=[ [%0.2fkbps, %d], [%0.2fkbps, %d] ]", (uint8_t *)&buf, 0x60u);
          }
        }
        HIDWORD(self->_payloadStats.lastSampleBufferTime.epoch) = 0;
        self->_tileIndexStats[0].lastSampleBufferTime.flags = 0;
        goto LABEL_57;
      }
      if (ErrorLogLevelForModule < 6
        || (v54 = VRTraceErrorLogLevelToCSTR(),
            v55 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_57:
        *(_OWORD *)v29 = *(_OWORD *)&v71.value;
        *(_QWORD *)&self->_lastHealthPrintTime.flags = v71.epoch;
        *((_DWORD *)&self->_senderQueueLock + 1) = 0;
        goto LABEL_58;
      }
      v56 = FourccToCStr(1835365473);
      v57 = *(float *)&self->_payloadStats.lastSampleBufferTime.epoch;
      LODWORD(buf.value) = 136316674;
      v58 = *((_DWORD *)&self->_senderQueueLock + 1);
      *(CMTimeValue *)((char *)&buf.value + 4) = v54;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "_AVCStreamInput_DisplayHealthInfo";
      HIWORD(buf.epoch) = 1024;
      v80 = 454;
      v81 = 2080;
      v82 = self->_streamInputIDString;
      v83 = 2080;
      streamInputIDString = v56;
      v85 = 2048;
      v86 = (float)(v57 / 1000.0);
      v87 = 1024;
      *(_DWORD *)v88 = v58;
      v46 = "AVCStreamInput [%s] %s:%d @=@ Health: AVCStreamInput AVCStreamInputID=%s mediaType=%s averageBitrate=%0.2fkb"
            "ps sampleBufferCount=%d";
      v47 = v55;
      v48 = 64;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_57;
      v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_57;
      v44 = FourccToCStr(MediaType);
      v45 = *((_DWORD *)&self->_senderQueueLock + 1);
      LODWORD(buf.value) = 136316418;
      *(CMTimeValue *)((char *)&buf.value + 4) = v42;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "_AVCStreamInput_DisplayHealthInfo";
      HIWORD(buf.epoch) = 1024;
      v80 = 457;
      v81 = 2080;
      v82 = self->_streamInputIDString;
      v83 = 2080;
      streamInputIDString = v44;
      v85 = 1024;
      LODWORD(v86) = v45;
      v46 = "AVCStreamInput [%s] %s:%d @=@ Health: AVCStreamInput AVCStreamInputID=%s mediaType=%s sampleBufferCount=%d";
      v47 = v43;
      v48 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v47, OS_LOG_TYPE_DEFAULT, v46, (uint8_t *)&buf, v48);
    goto LABEL_57;
  }
LABEL_58:
  os_unfair_lock_lock(&self->_senderQueueLock);
  if (self->_useFigRemoteQueue)
    v53 = VCRemoteImageQueue_EnqueueFrame((uint64_t)self->_senderQueue, (unint64_t)a3) == 0;
  else
    v53 = -[AVCStreamInput sendSampleBufferOverXPC:error:](self, "sendSampleBufferOverXPC:error:", a3, a4);
  os_unfair_lock_unlock(&self->_senderQueueLock);
  if ((AVCStreamInput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v60 = VRTraceErrorLogLevelToCSTR();
      v61 = *MEMORY[0x1E0CF2758];
      v62 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 136315906;
          *(CMTimeValue *)((char *)&buf.value + 4) = v60;
          LOWORD(buf.flags) = 2080;
          *(_QWORD *)((char *)&buf.flags + 2) = "-[AVCStreamInput pushSampleBuffer:error:]";
          HIWORD(buf.epoch) = 1024;
          v80 = 700;
          v81 = 2112;
          v82 = a3;
          v63 = "AVCStreamInput [%s] %s:%d Pushing sampleBuffer=%@";
          v64 = v61;
          v65 = 38;
LABEL_73:
          _os_log_impl(&dword_1D8A54000, v64, OS_LOG_TYPE_DEFAULT, v63, (uint8_t *)&buf, v65);
        }
      }
      else if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        -[AVCStreamInput pushSampleBuffer:error:].cold.4();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v59 = (const __CFString *)-[AVCStreamInput performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v59 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v66 = VRTraceErrorLogLevelToCSTR();
      v67 = *MEMORY[0x1E0CF2758];
      v68 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 136316418;
          *(CMTimeValue *)((char *)&buf.value + 4) = v66;
          LOWORD(buf.flags) = 2080;
          *(_QWORD *)((char *)&buf.flags + 2) = "-[AVCStreamInput pushSampleBuffer:error:]";
          HIWORD(buf.epoch) = 1024;
          v80 = 700;
          v81 = 2112;
          v82 = (void *)v59;
          v83 = 2048;
          streamInputIDString = self;
          v85 = 2112;
          v86 = *(double *)&a3;
          v63 = "AVCStreamInput [%s] %s:%d %@(%p) Pushing sampleBuffer=%@";
          v64 = v67;
          v65 = 58;
          goto LABEL_73;
        }
      }
      else if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.value) = 136316418;
        *(CMTimeValue *)((char *)&buf.value + 4) = v66;
        LOWORD(buf.flags) = 2080;
        *(_QWORD *)((char *)&buf.flags + 2) = "-[AVCStreamInput pushSampleBuffer:error:]";
        HIWORD(buf.epoch) = 1024;
        v80 = 700;
        v81 = 2112;
        v82 = (void *)v59;
        v83 = 2048;
        streamInputIDString = self;
        v85 = 2112;
        v86 = *(double *)&a3;
        _os_log_debug_impl(&dword_1D8A54000, v67, OS_LOG_TYPE_DEBUG, "AVCStreamInput [%s] %s:%d %@(%p) Pushing sampleBuffer=%@", (uint8_t *)&buf, 0x3Au);
      }
    }
  }
  return v53;
}

- (id)description
{
  id result;
  void *v4;
  objc_class *v5;

  result = self->_description;
  if (!result)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    result = (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@(%p) streamInputID=%ld"), NSStringFromClass(v5), self, self->_streamInputID);
    self->_description = (NSString *)result;
  }
  return result;
}

- (int64_t)streamInputID
{
  return self->_streamInputID;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (__CFAllocator)sampleBufferAllocator
{
  return self->_sampleBufferAllocator;
}

- (void)processOptions:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d Invalid sample buffer pool size", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processOptions:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d Invalid ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processFormat:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d Provided format is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processFormat:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d Provided format is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupDelegate:delegateQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d No delegate specified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupDelegate:delegateQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d Delegate queue is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupXPCQueue
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d Failed to create the XPC connection queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newRemoteQueueWithServerPid:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d Could not get the shared pool allocator for the _senderQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newRemoteQueueWithServerPid:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d RemoteImageQueue failed to create sender xpc object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newRemoteQueueWithServerPid:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d RemoteImageQueue could not be made on StreamInput client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupXPCConnection
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d Failed to allocate the XPC connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAndAddRemoteQueueToXPCDictionary:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d Failed to create remote queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAndAddRemoteQueueToXPCDictionary:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15_6();
  OUTLINED_FUNCTION_6_1(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d Message=%s returned with an error=%@");
  OUTLINED_FUNCTION_19();
}

- (void)initializeServerSideInputStream
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d RemoteQueue creation and adding to XPC dictionary failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __30__AVCStreamInput_didServerDie__block_invoke_cold_1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_11_10();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "AVCStreamInput [%s] %s:%d AVCStreamInputID=%s server died, notifying client", (uint8_t *)v1);
  OUTLINED_FUNCTION_3();
}

void __30__AVCStreamInput_didServerDie__block_invoke_cold_2()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_11_10();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, "AVCStreamInput [%s] %s:%d AVCStreamInputID=%s server died, notifying client", (uint8_t *)v1, 0x26u);
  OUTLINED_FUNCTION_3();
}

void __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d could not create XPC dictionary for AVCStreamInput", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__AVCStreamInput_sendSampleBufferOverXPC_error___block_invoke_73_cold_1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[AVCStreamInput sendSampleBufferOverXPC:error:]_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "AVCStreamInput [%s] %s:%d Failed to submit frame. error=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)pushSampleBuffer:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;
  int v4;
  const void *v5;
  const char *v6;

  v2 = 136316162;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_8_8();
  OUTLINED_FUNCTION_8_16();
  OUTLINED_FUNCTION_6_1(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s sampleBuffer is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)pushSampleBuffer:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;
  int v4;
  const void *v5;
  const char *v6;

  v2 = 136316162;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_8_8();
  OUTLINED_FUNCTION_8_16();
  OUTLINED_FUNCTION_6_1(&dword_1D8A54000, v0, v1, "AVCStreamInput [%s] %s:%d streamInput=%p streamInputID=%s missing tile index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)pushSampleBuffer:(NSObject *)a3 error:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[14];
  const char *v6;

  OUTLINED_FUNCTION_17(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v6 = "-[AVCStreamInput pushSampleBuffer:error:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v4, "AVCStreamInput [%s] %s:%d streamInputID=%@ Buffer pushed before streamInput was started", v5);
  OUTLINED_FUNCTION_19();
}

- (void)pushSampleBuffer:error:.cold.4()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[AVCStreamInput pushSampleBuffer:error:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, "AVCStreamInput [%s] %s:%d Pushing sampleBuffer=%@", v1, 0x26u);
  OUTLINED_FUNCTION_3();
}

@end
