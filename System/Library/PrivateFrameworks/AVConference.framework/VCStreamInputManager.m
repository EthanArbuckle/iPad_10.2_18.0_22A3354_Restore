@implementation VCStreamInputManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_40);
  return (id)_vcStreamInputManager;
}

VCStreamInputManager *__38__VCStreamInputManager_sharedInstance__block_invoke()
{
  VCStreamInputManager *result;

  result = objc_alloc_init(VCStreamInputManager);
  _vcStreamInputManager = (uint64_t)result;
  return result;
}

- (VCStreamInputManager)init
{
  VCStreamInputManager *v2;
  void *v3;
  objc_class *v4;
  const char *v5;
  NSObject *CustomRootQueue;
  dispatch_queue_t v7;
  void *v8;
  objc_class *v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  NSMutableDictionary *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VCStreamInputManager;
  v2 = -[VCObject init](&v15, sel_init);
  if (!v2)
  {
LABEL_14:

    return 0;
  }
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.connectionQueue"), CFSTR("com.apple.VideoConference"), NSStringFromClass(v4)), "UTF8String");
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v7 = dispatch_queue_create_with_target_V2(v5, 0, CustomRootQueue);
  v2->_xpcQueue = (OS_dispatch_queue *)v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInputManager init].cold.1();
    }
    goto LABEL_14;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  v10 = (const char *)objc_msgSend((id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%@.streamInputQueue"), CFSTR("com.apple.VideoConference"), NSStringFromClass(v9)), "UTF8String");
  v11 = VCDispatchQueue_GetCustomRootQueue(37);
  v12 = dispatch_queue_create_with_target_V2(v10, 0, v11);
  v2->_streamInputQueue = (OS_dispatch_queue *)v12;
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInputManager init].cold.2();
    }
    goto LABEL_14;
  }
  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v2->_streamInputs = v13;
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInputManager init].cold.3();
    }
    goto LABEL_14;
  }
  return v2;
}

- (VCStreamInputManager)allocWithZone:(_NSZone *)a3
{
  return (VCStreamInputManager *)_vcStreamInputManager;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCStreamInputManager deregisterBlocksForService](self, "deregisterBlocksForService");
  dispatch_release((dispatch_object_t)self->_xpcQueue);
  dispatch_release((dispatch_object_t)self->_streamInputQueue);

  v3.receiver = self;
  v3.super_class = (Class)VCStreamInputManager;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (id)newStreamInputID
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = 0;
  v15 = *MEMORY[0x1E0C80C00];
  do
  {
    do
    {

      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", arc4random_uniform(0x7FFFFFFFu));
    }
    while (!objc_msgSend(v3, "integerValue"));
  }
  while (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputs, "objectForKeyedSubscript:", v3));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCStreamInputManager newStreamInputID]";
      v11 = 1024;
      v12 = 118;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamInputID=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  return v3;
}

- (BOOL)initializeStreamInputWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5
{
  id v9;
  void *v10;
  const opaqueCMFormatDescription *v11;
  xpc_object_t value;
  CMMediaType MediaType;
  uint64_t v14;
  NSObject *v15;
  VCStreamInputAudio *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  NSObject *v25;
  const opaqueCMFormatDescription *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  const opaqueCMFormatDescription *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  NSObject *v36;
  id *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("VCStreamInputID"));
  -[VCObject lock](self, "lock");
  *a4 = 0;
  v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS"));
  v11 = VCStreamInputUtil_DecodeFormatDescription(v10);
  if (!v11)
  {
    v17 = -2143682558;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:].cold.1();
      v16 = 0;
      goto LABEL_23;
    }
LABEL_36:
    v16 = 0;
    goto LABEL_23;
  }
  value = xpc_dictionary_get_value(v10, "VCStreamInputRemoteQueue");
  if (!v9)
    v9 = -[VCStreamInputManager newStreamInputID](self, "newStreamInputID");
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputs, "objectForKeyedSubscript:", v9))
  {
    v17 = -2143682519;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        -[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:].cold.4();
        v16 = 0;
        v17 = -2143682519;
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_23;
    }
    goto LABEL_36;
  }
  v37 = a5;
  MediaType = CMFormatDescriptionGetMediaType(v11);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v39 = v14;
      v40 = 2080;
      v41 = "-[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:]";
      v42 = 1024;
      v43 = 147;
      v44 = 2112;
      v45 = AVCStreamInputID_ConvertToNSString(objc_msgSend(v9, "integerValue"));
      v46 = 2080;
      v47 = FourccToCStr(MediaType);
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamInputID=%@ mediaType=%s", buf, 0x30u);
    }
  }
  if (MediaType != 1986618469)
  {
    if (MediaType == 1936684398)
    {
      v16 = -[VCStreamInputAudio initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]([VCStreamInputAudio alloc], "initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:", v9, v11, self, self->_streamInputQueue, value);
      if (!v16)
      {
        v17 = -2143682558;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v35 = VRTraceErrorLogLevelToCSTR();
          v36 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:].cold.3(v35, v9, v36);
        }
        goto LABEL_21;
      }
LABEL_16:
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v16, CFSTR("CONTEXT"), v9, CFSTR("VCStreamInputID"), 0);
      if (v20)
      {
        v21 = (void *)v20;
        v22 = -[VCStreamInput isStarted](v16, "isStarted");
        objc_msgSend(v21, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22), CFSTR("VCStreamInputDidStart"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamInputs, "setObject:forKeyedSubscript:", v16, v9);
        *a4 = v21;
        -[VCObject unlock](self, "unlock");
        v23 = 1;
        goto LABEL_26;
      }
      v17 = -2143682558;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v32 = v11;
          v33 = AVCStreamInputID_ConvertToNSString(objc_msgSend(v9, "integerValue"));
          v34 = FourccToCStr(MediaType);
          *(_DWORD *)buf = 136316162;
          v39 = v30;
          v40 = 2080;
          v41 = "-[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:]";
          v42 = 1024;
          v43 = 161;
          v44 = 2112;
          v45 = v33;
          v11 = v32;
          v46 = 2080;
          v47 = v34;
          _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate the return dictionary for streamInputID=%@ mediaType=%s", buf, 0x30u);
        }
      }
      goto LABEL_22;
    }
    if (MediaType != 1835365473)
    {
      v17 = -2143682558;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v27 = v11;
          v28 = AVCStreamInputID_ConvertToNSString(objc_msgSend(v9, "integerValue"));
          v29 = FourccToCStr(MediaType);
          *(_DWORD *)buf = 136316162;
          v39 = v24;
          v40 = 2080;
          v41 = "-[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:]";
          v42 = 1024;
          v43 = 157;
          v44 = 2112;
          v45 = v28;
          v11 = v27;
          v46 = 2080;
          v47 = v29;
          _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unsupported streamInputID=%@ mediaType=%s", buf, 0x30u);
        }
      }
      goto LABEL_21;
    }
  }
  v16 = -[VCStreamInputVideo initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]([VCStreamInputVideo alloc], "initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:", v9, v11, self, self->_streamInputQueue, value);
  if (v16)
    goto LABEL_16;
  v17 = -2143682558;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:].cold.2(v18, v9, v19);
  }
LABEL_21:
  v16 = 0;
LABEL_22:
  a5 = v37;
LABEL_23:
  -[VCObject unlock](self, "unlock");
  if (a5)
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCStreamInputManager"), v17, 0);
  -[VCStreamInput invalidate](v16, "invalidate");
  v23 = 0;
LABEL_26:

  if (v11)
    CFRelease(v11);
  return v23;
}

- (BOOL)getServerPidWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  *a4 = 0;
  if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("enableFigRemoteQueueForAVCStreamInputOutput"), 1))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", getpid());
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("VCStreamInputServerPID"));
        *a4 = v7;
        v10 = 1;
        v7 = 0;
        goto LABEL_5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          -[VCStreamInputManager getServerPidWithXPCArguments:result:error:].cold.2();
          if (a5)
            goto LABEL_17;
          goto LABEL_19;
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        -[VCStreamInputManager getServerPidWithXPCArguments:result:error:].cold.1();
        if (a5)
        {
LABEL_17:
          v10 = 0;
          v9 = 0;
          *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCStreamInputManager"), -2143682558, 0);
          goto LABEL_5;
        }
LABEL_19:
        v10 = 0;
        v9 = 0;
        goto LABEL_5;
      }
    }
    if (a5)
      goto LABEL_17;
    goto LABEL_19;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamInputManager getServerPidWithXPCArguments:result:error:].cold.3();
  }
  v7 = 0;
  v9 = 0;
  v10 = 1;
LABEL_5:

  return v10;
}

- (BOOL)terminateStreamInputWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5
{
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  int ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  id v14;
  BOOL result;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  *a4 = 0;
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_18;
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    -[VCStreamInputManager terminateStreamInputWithXPCArguments:result:error:].cold.1();
    if (!a5)
      return 0;
LABEL_19:
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCStreamInputManager"), -2143682559, 0);
    result = 0;
    *a5 = v16;
    return result;
  }
  v9 = (void *)v8;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((isKindOfClass & 1) == 0)
  {
    if (ErrorLogLevelForModule < 3)
      goto LABEL_18;
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    -[VCStreamInputManager terminateStreamInputWithXPCArguments:result:error:].cold.3();
    if (!a5)
      return 0;
    goto LABEL_19;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = v12;
      v19 = 2080;
      v20 = "-[VCStreamInputManager terminateStreamInputWithXPCArguments:result:error:]";
      v21 = 1024;
      v22 = 223;
      v23 = 2112;
      v24 = AVCStreamInputID_ConvertToNSString(objc_msgSend((id)objc_msgSend(v9, "streamInputID"), "integerValue"));
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Terminate streamInputID=%@", buf, 0x26u);
    }
  }
  objc_msgSend(v9, "invalidate");
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputs, "objectForKeyedSubscript:", objc_msgSend(v9, "streamInputID")))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamInputs, "setObject:forKeyedSubscript:", 0, objc_msgSend(v9, "streamInputID"));
    v14 = objc_alloc(MEMORY[0x1E0C99D80]);
    *a4 = (id)objc_msgSend(v14, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      -[VCStreamInputManager terminateStreamInputWithXPCArguments:result:error:].cold.2();
      if (a5)
        goto LABEL_19;
      return 0;
    }
  }
LABEL_18:
  if (a5)
    goto LABEL_19;
  return 0;
}

- (BOOL)clientProcessDiedWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5
{
  void *v9;
  uint64_t v10;
  int ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  *a4 = 0;
  v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 1;
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v10)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInputManager clientProcessDiedWithXPCArguments:result:error:].cold.1();
    }
    return 1;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136316162;
      v16 = v12;
      v17 = 2080;
      v18 = "-[VCStreamInputManager clientProcessDiedWithXPCArguments:result:error:]";
      v19 = 1024;
      v20 = 249;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = AVCStreamInputID_ConvertToNSString(objc_msgSend((id)objc_msgSend(v9, "streamInputID"), "integerValue"));
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client process with pid=%@ died. Cleaning up streamInputID=%@", (uint8_t *)&v15, 0x30u);
    }
  }
  return -[VCStreamInputManager terminateStreamInputWithXPCArguments:result:error:](self, "terminateStreamInputWithXPCArguments:result:error:", a3, a4, a5);
}

- (BOOL)pushSampleBufferWithXPCArguments:(id)a3 result:(id *)a4 error:(id *)a5
{
  opaqueCMSampleBuffer *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  CMTime v10;
  CMTime time;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = VCStreamInputUtil_DecodeSampleBuffer((void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS"), a4, a5));
  if (v6)
  {
    v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (v7)
    {
      v8 = (void (**)(_QWORD, _QWORD))v7;
      memset(&v10, 170, sizeof(v10));
      CMSampleBufferGetPresentationTimeStamp(&v10, v6);
      objc_msgSend((id)objc_msgSend(v8, "streamInputID"), "unsignedIntValue");
      time = v10;
      CMTimeGetSeconds(&time);
      kdebug_trace();
      ((void (**)(_QWORD, opaqueCMSampleBuffer *))v8)[22](v8, v6);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInputManager pushSampleBufferWithXPCArguments:result:error:].cold.1();
    }
    CFRelease(v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCStreamInputManager pushSampleBufferWithXPCArguments:result:error:].cold.2();
  }
  return v6 != 0;
}

- (void)registerService:(char *)a3 weakSelf:(id)a4 block:(id)a5
{
  -[VCStreamInputManager registerService:weakSelf:eventLogLevel:block:](self, "registerService:weakSelf:eventLogLevel:block:", a3, a4, 7, a5);
}

- (void)registerService:(char *)a3 weakSelf:(id)a4 eventLogLevel:(int)a5 block:(id)a6
{
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__VCStreamInputManager_registerService_weakSelf_eventLogLevel_block___block_invoke;
  v6[3] = &unk_1E9E537D0;
  v6[4] = a4;
  v6[5] = a6;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:eventLogLevel:", a3, v6, self->_xpcQueue, *(_QWORD *)&a5);
}

uint64_t __69__VCStreamInputManager_registerService_weakSelf_eventLogLevel_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  result = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (result)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return 0;
  }
  return result;
}

- (void)registerDidClientDieBlock:(id)a3
{
  uint64_t v3;

  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E0C809B0], 3221225472, __50__VCStreamInputManager_registerDidClientDieBlock___block_invoke, &unk_1E9E53848, a3, *MEMORY[0x1E0C80C00]), "registerBlockForService:block:queue:", "VCStreamInputDidClientDie", &v3, self->_xpcQueue);
}

uint64_t __50__VCStreamInputManager_registerDidClientDieBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v7[0] = 0;
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      objc_msgSend(v4, "clientProcessDiedWithXPCArguments:result:error:", a2, v7, 0);
      v5 = (void *)v7[0];
    }
    else
    {
      v5 = 0;
    }

  }
  return 0;
}

- (void)registerBlocksForService
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  -[VCStreamInputManager registerService:weakSelf:block:](self, "registerService:weakSelf:block:", "VCStreamInputInitialize", v3, &__block_literal_global_44);
  -[VCStreamInputManager registerService:weakSelf:block:](self, "registerService:weakSelf:block:", "VCStreamInputGetServerPid", v3, &__block_literal_global_46);
  -[VCStreamInputManager registerService:weakSelf:block:](self, "registerService:weakSelf:block:", "VCStreamInputTerminate", v3, &__block_literal_global_48);
  -[VCStreamInputManager registerService:weakSelf:eventLogLevel:block:](self, "registerService:weakSelf:eventLogLevel:block:", "VCStreamInputPushSampleBuffer", v3, 8, &__block_literal_global_50);
  -[VCStreamInputManager registerDidClientDieBlock:](self, "registerDidClientDieBlock:", v3);
}

uint64_t __48__VCStreamInputManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "initializeStreamInputWithXPCArguments:result:error:");
}

uint64_t __48__VCStreamInputManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "getServerPidWithXPCArguments:result:error:");
}

uint64_t __48__VCStreamInputManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "terminateStreamInputWithXPCArguments:result:error:");
}

uint64_t __48__VCStreamInputManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pushSampleBufferWithXPCArguments:result:error:");
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "VCStreamInputInitialize");
}

- (id)streamInputWithID:(int64_t)a3
{
  NSObject *xpcQueue;
  void *v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  v12 = 0;
  xpcQueue = self->_xpcQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__VCStreamInputManager_streamInputWithID___block_invoke;
  v6[3] = &unk_1E9E52378;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  dispatch_sync(xpcQueue, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __42__VCStreamInputManager_streamInputWithID___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 184), "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]));
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
  return result;
}

- (void)didStartStreamInput:(id)a3
{
  NSObject *xpcQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  xpcQueue = self->_xpcQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__VCStreamInputManager_didStartStreamInput___block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = a3;
  dispatch_async(xpcQueue, v4);
}

uint64_t __44__VCStreamInputManager_didStartStreamInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "VCStreamInputDidStart", 0, *(_QWORD *)(a1 + 32));
}

- (void)didStopStreamInput:(id)a3
{
  NSObject *xpcQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  xpcQueue = self->_xpcQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__VCStreamInputManager_didStopStreamInput___block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = a3;
  dispatch_async(xpcQueue, v4);
}

uint64_t __43__VCStreamInputManager_didStopStreamInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "VCStreamInputDidStop", 0, *(_QWORD *)(a1 + 32));
}

- (void)didSuspendStreamInput:(id)a3
{
  NSObject *xpcQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  xpcQueue = self->_xpcQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__VCStreamInputManager_didSuspendStreamInput___block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = a3;
  dispatch_async(xpcQueue, v4);
}

uint64_t __46__VCStreamInputManager_didSuspendStreamInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "VCStreamInputDidSuspend", 0, *(_QWORD *)(a1 + 32));
}

- (void)didResumeStreamInput:(id)a3
{
  NSObject *xpcQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  xpcQueue = self->_xpcQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__VCStreamInputManager_didResumeStreamInput___block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = a3;
  dispatch_async(xpcQueue, v4);
}

uint64_t __45__VCStreamInputManager_didResumeStreamInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "VCStreamInputDidResume", 0, *(_QWORD *)(a1 + 32));
}

- (void)init
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream inputs dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeStreamInputWithXPCArguments:result:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create format description from XPC arguments", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeStreamInputWithXPCArguments:(uint64_t)a1 result:(void *)a2 error:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[14];
  const char *v7;

  v4 = OUTLINED_FUNCTION_8_14(a2, *MEMORY[0x1E0C80C00]);
  AVCStreamInputID_ConvertToNSString(v4);
  OUTLINED_FUNCTION_12_0();
  v7 = "-[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v5, " [%s] %s:%d Failed to create the video stream input for streamInputID=%@", v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initializeStreamInputWithXPCArguments:(uint64_t)a1 result:(void *)a2 error:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[14];
  const char *v7;

  v4 = OUTLINED_FUNCTION_8_14(a2, *MEMORY[0x1E0C80C00]);
  AVCStreamInputID_ConvertToNSString(v4);
  OUTLINED_FUNCTION_12_0();
  v7 = "-[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v5, " [%s] %s:%d Failed to create the audio stream input for streamInputID=%@", v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initializeStreamInputWithXPCArguments:result:error:.cold.4()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCStreamInputManager initializeStreamInputWithXPCArguments:result:error:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Stream input ID %@ already exists!", v1);
  OUTLINED_FUNCTION_3();
}

- (void)getServerPidWithXPCArguments:result:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the result dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getServerPidWithXPCArguments:result:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate NSNumber for pid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getServerPidWithXPCArguments:result:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d kVCDefaultEnableFigRemoteQueueForAVCStreamInputOutput disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)terminateStreamInputWithXPCArguments:result:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Terminate request received with nil context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)terminateStreamInputWithXPCArguments:result:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Terminate request received with invalid context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)terminateStreamInputWithXPCArguments:result:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Terminate request received with invalid context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)clientProcessDiedWithXPCArguments:result:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Client process ID argument is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pushSampleBufferWithXPCArguments:result:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil VCInputStream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pushSampleBufferWithXPCArguments:result:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d received NULL CMSampleBuffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
