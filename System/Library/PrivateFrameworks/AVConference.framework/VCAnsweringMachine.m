@implementation VCAnsweringMachine

- (BOOL)setUpConfigurationIndependentInternalState
{
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v4;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  VCAnsweringMachine *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  self->_uuid = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v4 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.VideoConference.VCAnsweringMachine.dispatchQueue", 0, CustomRootQueue);
  self->_dispatchQueue = v4;
  if (!v4)
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAnsweringMachine setUpConfigurationIndependentInternalState].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v9 = 136316162;
          v10 = v7;
          v11 = 2080;
          v12 = "-[VCAnsweringMachine setUpConfigurationIndependentInternalState]";
          v13 = 1024;
          v14 = 199;
          v15 = 2112;
          v16 = v6;
          v17 = 2048;
          v18 = self;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the dispatch queue", (uint8_t *)&v9, 0x30u);
        }
      }
    }
  }
  return v4 != 0;
}

- (BOOL)setUpInternalStateWithConfiguration:(id)a3
{
  uint64_t ID;
  _BOOL4 v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCAnsweringMachine *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  self->_configuration = (AVCAnsweringMachineConfiguration *)a3;
  ID = VCUniqueIDGenerator_GenerateID();
  v5 = -[VCAnsweringMachine setupReportingAgentWithCallID:](self, "setupReportingAgentWithCallID:", ID);
  if (v5)
  {
    self->_deviceRole = -[VCAnsweringMachine deviceRoleForCallSource:](self, "deviceRoleForCallSource:", -[AVCAnsweringMachineConfiguration source](self->_configuration, "source"));
    -[VCAnsweringMachine setupInternalFormat](self, "setupInternalFormat");
    if (-[VCAnsweringMachine setupRealtimeContextWithToken:](self, "setupRealtimeContextWithToken:", ID))
    {
      if (-[VCAnsweringMachine configureAudioIO](self, "configureAudioIO"))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      if ((VCAnsweringMachine *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v5)
            return v5;
          -[VCAnsweringMachine setUpInternalStateWithConfiguration:].cold.1();
        }
        goto LABEL_27;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        v13 = 136316162;
        v14 = v11;
        v15 = 2080;
        v16 = "-[VCAnsweringMachine setUpInternalStateWithConfiguration:]";
        v17 = 1024;
        v18 = 219;
        v19 = 2112;
        v20 = v7;
        v21 = 2048;
        v22 = self;
        v10 = " [%s] %s:%d %@(%p) Failed to configure AudioIO";
LABEL_26:
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 0x30u);
      }
    }
    else
    {
      if ((VCAnsweringMachine *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v5)
            return v5;
          -[VCAnsweringMachine setUpInternalStateWithConfiguration:].cold.2();
        }
        goto LABEL_27;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        v13 = 136316162;
        v14 = v8;
        v15 = 2080;
        v16 = "-[VCAnsweringMachine setUpInternalStateWithConfiguration:]";
        v17 = 1024;
        v18 = 216;
        v19 = 2112;
        v20 = v6;
        v21 = 2048;
        v22 = self;
        v10 = " [%s] %s:%d %@(%p) Failed to setup the realtime context";
        goto LABEL_26;
      }
    }
LABEL_27:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (VCAnsweringMachine)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  VCAnsweringMachine *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  VCAnsweringMachine *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  VCAnsweringMachine *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAnsweringMachine-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v34 = v9;
      v35 = 2080;
      v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      v37 = 1024;
      v38 = 226;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAnsweringMachine-init ", buf, 0x1Cu);
    }
  }
  if (!a3)
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.1();
      }
      goto LABEL_55;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_55;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_DWORD *)buf = 136316162;
    v34 = v19;
    v35 = 2080;
    v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
    v37 = 1024;
    v38 = 229;
    v39 = 2112;
    v40 = (void *)v16;
    v41 = 2048;
    v42 = self;
    v21 = " [%s] %s:%d %@(%p) Invalid configuration";
LABEL_50:
    _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x30u);
    goto LABEL_55;
  }
  if (!a4)
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.2();
      }
      goto LABEL_55;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_55;
    v22 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    *(_DWORD *)buf = 136316162;
    v34 = v22;
    v35 = 2080;
    v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
    v37 = 1024;
    v38 = 230;
    v39 = 2112;
    v40 = (void *)v17;
    v41 = 2048;
    v42 = self;
    v21 = " [%s] %s:%d %@(%p) The delegate is nil";
    goto LABEL_50;
  }
  if (!a5)
  {
    if ((VCAnsweringMachine *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_55;
      v23 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_55;
      *(_DWORD *)buf = 136316162;
      v34 = v23;
      v35 = 2080;
      v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      v37 = 1024;
      v38 = 231;
      v39 = 2112;
      v40 = (void *)v18;
      v41 = 2048;
      v42 = self;
      v21 = " [%s] %s:%d %@(%p) The delegate queue is nil";
      goto LABEL_50;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.3();
    }
LABEL_55:
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_64;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      *(_DWORD *)buf = 136316162;
      v34 = v25;
      v35 = 2080;
      v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      v37 = 1024;
      v38 = 246;
      v39 = 2112;
      v40 = a3;
      v41 = 2048;
      v42 = self;
      v27 = " [%s] %s:%d VCAnsweringMachine-init FAILED with configuration=%@, instance=%p";
      v28 = v26;
      v29 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_64;
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_64;
      *(_DWORD *)buf = 136316674;
      v34 = v30;
      v35 = 2080;
      v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      v37 = 1024;
      v38 = 246;
      v39 = 2112;
      v40 = (void *)v24;
      v41 = 2048;
      v42 = self;
      v43 = 2112;
      v44 = a3;
      v45 = 2048;
      v46 = self;
      v27 = " [%s] %s:%d %@(%p) VCAnsweringMachine-init FAILED with configuration=%@, instance=%p";
      v28 = v31;
      v29 = 68;
    }
    _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
LABEL_64:

    return 0;
  }
  v32.receiver = self;
  v32.super_class = (Class)VCAnsweringMachine;
  v11 = -[VCMediaDevice init](&v32, sel_init);
  if (!v11)
  {
    if (objc_opt_class())
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(0, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.5();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.4();
    }
    self = 0;
    goto LABEL_55;
  }
  self = v11;
  if (!-[VCAnsweringMachine setUpConfigurationIndependentInternalState](v11, "setUpConfigurationIndependentInternalState")|| !-[VCAnsweringMachine setUpInternalStateWithConfiguration:](self, "setUpInternalStateWithConfiguration:", a3))
  {
    goto LABEL_55;
  }
  dispatch_retain((dispatch_object_t)a5);
  self->_delegateQueue = (OS_dispatch_queue *)a5;
  self->_delegate = (VCAnsweringMachineDelegate *)a4;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAnsweringMachine-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      *(_DWORD *)buf = 136316162;
      v34 = v12;
      v35 = 2080;
      v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      v37 = 1024;
      v38 = 243;
      v39 = 2048;
      v40 = self;
      v41 = 2080;
      v42 = (VCAnsweringMachine *)v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAnsweringMachine-init (%p) Succeeded with configuration=%s", buf, 0x30u);
    }
  }
  return self;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *delegateQueue;
  VCAnsweringMachineDelegate *delegate;
  NSObject *dispatchQueue;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  VCAnsweringMachine *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCAnsweringMachine-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v3;
      v11 = 2080;
      v12 = "-[VCAnsweringMachine dealloc]";
      v13 = 1024;
      v14 = 254;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAnsweringMachine-dealloc (%p)", buf, 0x26u);
    }
  }
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  delegate = self->_delegate;
  if (delegate)
  {
    CFRelease(delegate);
    self->_delegate = 0;
  }
  -[VCAnsweringMachine cleanupRealtimeContext](self, "cleanupRealtimeContext");

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v8.receiver = self;
  v8.super_class = (Class)VCAnsweringMachine;
  -[VCObject dealloc](&v8, sel_dealloc);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__VCAnsweringMachine_invalidate__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(dispatchQueue, v3);
}

uint64_t __32__VCAnsweringMachine_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 393))
  {
    v1 = result;
    v3.receiver = *(id *)(result + 32);
    v3.super_class = (Class)VCAnsweringMachine;
    objc_msgSendSuper2(&v3, sel_stop);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 232), "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 256), "setMediaRecorderDelegate:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 256), "invalidate");
    dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(v1 + 32) + 192), &__block_literal_global_27);
    v2 = *(_QWORD *)(v1 + 32);
    if (*(_QWORD *)(v2 + 192))
    {
      dispatch_release(*(dispatch_object_t *)(v2 + 192));
      *(_QWORD *)(*(_QWORD *)(v1 + 32) + 192) = 0;
      v2 = *(_QWORD *)(v1 + 32);
    }
    if (*(_QWORD *)(v2 + 184))
    {
      CFRelease(*(CFTypeRef *)(v2 + 184));
      *(_QWORD *)(*(_QWORD *)(v1 + 32) + 184) = 0;
      v2 = *(_QWORD *)(v1 + 32);
    }
    objc_msgSend((id)v2, "reportingAgent");
    result = VCReporting_finalizeAggregation();
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 393) = 1;
  }
  return result;
}

- (id)start
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__VCAnsweringMachine_start__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
  return 0;
}

void __27__VCAnsweringMachine_start__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  const __CFString *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[6];
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[393])
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __27__VCAnsweringMachine_start__block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v9 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          v13 = v7;
          v14 = 2080;
          v15 = "-[VCAnsweringMachine start]_block_invoke";
          v16 = 1024;
          v17 = 287;
          v18 = 2112;
          v19 = v3;
          v20 = 2048;
          v21 = v9;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Start called after invalidate!", buf, 0x30u);
        }
      }
    }
  }
  else
  {
    v11.receiver = v2;
    v11.super_class = (Class)VCAnsweringMachine;
    v4 = objc_msgSendSuper2(&v11, sel_start);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 192);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__VCAnsweringMachine_start__block_invoke_12;
    v10[3] = &unk_1E9E52238;
    v10[4] = v5;
    v10[5] = v4;
    dispatch_async(v6, v10);
  }
}

uint64_t __27__VCAnsweringMachine_start__block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "answeringMachine:didStart:error:");
}

- (id)stop
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __26__VCAnsweringMachine_stop__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
  return 0;
}

void __26__VCAnsweringMachine_stop__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  const __CFString *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[6];
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 392) = 0;
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[393])
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __26__VCAnsweringMachine_stop__block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v9 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          v13 = v7;
          v14 = 2080;
          v15 = "-[VCAnsweringMachine stop]_block_invoke";
          v16 = 1024;
          v17 = 302;
          v18 = 2112;
          v19 = v3;
          v20 = 2048;
          v21 = v9;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Stop called after invalidate!", buf, 0x30u);
        }
      }
    }
  }
  else
  {
    v11.receiver = v2;
    v11.super_class = (Class)VCAnsweringMachine;
    v4 = objc_msgSendSuper2(&v11, sel_stop);
    if (v4 || !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 392))
    {
      reportingGenericEvent();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(NSObject **)(v5 + 192);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __26__VCAnsweringMachine_stop__block_invoke_13;
      v10[3] = &unk_1E9E52238;
      v10[4] = v5;
      v10[5] = v4;
      dispatch_async(v6, v10);
    }
  }
}

uint64_t __26__VCAnsweringMachine_stop__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "answeringMachine:didStop:recordingURL:error:");
}

- (void)setUpRealtimeDefaults
{
  char v3;
  tagVCAnsweringMachineRealtimeContext *p_realtimeContext;
  char v5;

  if (VCDefaults_GetBoolValueForKey(CFSTR("answeringMachineShouldCaptionImmediately"), 0))
    v3 = 2;
  else
    v3 = 0;
  p_realtimeContext = &self->_realtimeContext;
  p_realtimeContext->sourceCommonContext.flags |= v3;
  if (VCDefaults_GetBoolValueForKey(CFSTR("answeringMachineShouldRecordImmediately"), 0))
    v5 = 4;
  else
    v5 = 0;
  p_realtimeContext->sourceCommonContext.flags |= v5;
}

- (id)onStart
{
  id v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  VCAnsweringMachine *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[VCAnsweringMachine setUpRealtimeDefaults](self, "setUpRealtimeDefaults");
  reportingGenericEvent();
  if (self->_realtimeContext.mediaRecorder
    && !-[AVCAnsweringMachineConfiguration announcementAsset](self->_configuration, "announcementAsset"))
  {
    self->_realtimeContext.sourceCommonContext.flags |= 1u;
  }
  -[VCAnsweringMachine setupPeriodicReporting](self, "setupPeriodicReporting");
  -[VCAnsweringMachine registerForThermalNotifications](self, "registerForThermalNotifications");
  v3 = -[VCAudioIO start](self->_audioIO, "start");
  if (v3)
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAnsweringMachine onStart].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v8 = 136316418;
          v9 = v5;
          v10 = 2080;
          v11 = "-[VCAnsweringMachine onStart]";
          v12 = 1024;
          v13 = 339;
          v14 = 2112;
          v15 = v4;
          v16 = 2048;
          v17 = self;
          v18 = 2112;
          v19 = v3;
          _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) AudioIO start failed. error=%@", (uint8_t *)&v8, 0x3Au);
        }
      }
    }
    -[VCAnsweringMachine cleanupPeriodicReporting](self, "cleanupPeriodicReporting");
    -[VCAnsweringMachine unregisterForThermalNotifications](self, "unregisterForThermalNotifications");
  }
  return v3;
}

- (id)onStop
{
  id v3;
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
  VCAnsweringMachine *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[VCAudioIO stop](self->_audioIO, "stop");
  if (v3)
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAnsweringMachine onStop].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v8 = 136316418;
          v9 = v6;
          v10 = 2080;
          v11 = "-[VCAnsweringMachine onStop]";
          v12 = 1024;
          v13 = 348;
          v14 = 2112;
          v15 = v5;
          v16 = 2048;
          v17 = self;
          v18 = 2112;
          v19 = v3;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) AudioIO stop failed. error=%@", (uint8_t *)&v8, 0x3Au);
        }
      }
    }
  }
  else
  {
    if (self->_realtimeContext.mediaRecorder)
    {
      self->_stopIsAsync = 1;
      -[VCAnsweringMachine stopMediaRecording](self, "stopMediaRecording");
    }
    -[VCAnsweringMachine cleanupPeriodicReporting](self, "cleanupPeriodicReporting");
    -[VCAnsweringMachine unregisterForThermalNotifications](self, "unregisterForThermalNotifications");
  }
  return v3;
}

- (BOOL)autoRunOnStart
{
  return 1;
}

- (void)setupPeriodicReporting
{
  if (-[VCObject reportingAgent](self, "reportingAgent"))
  {
    reportingRegisterPeriodicTaskWeak();
    reportingStartTimer();
  }
}

double __44__VCAnsweringMachine_setupPeriodicReporting__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  uint64_t v5;
  NSObject *v6;
  double v7;
  double v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(float *)(a2 + 248);
      v8 = *(float *)(a2 + 224);
      v9 = 136316418;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCAnsweringMachine setupPeriodicReporting]_block_invoke";
      v13 = 1024;
      v14 = 375;
      v15 = 2048;
      v16 = a2;
      v17 = 2048;
      v18 = v7;
      v19 = 2048;
      v20 = v8;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: AnsweringMachine [%p] averageSinkOutputPower=%f averageSourceOutputPower=%f", (uint8_t *)&v9, 0x3Au);
    }
  }
  return result;
}

- (void)cleanupPeriodicReporting
{
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingUnregisterPeriodicTask();
  reportingStopTimer();
}

- (__CFDictionary)reportingInitialConfiguration
{
  _QWORD v4[6];
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("AMCS");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[AVCAnsweringMachineConfiguration source](self->_configuration, "source"));
  v4[1] = CFSTR("AMCMR");
  v5[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVCAnsweringMachineConfiguration isMessageRecordingEnabled](self->_configuration, "isMessageRecordingEnabled"));
  v4[2] = CFSTR("AMCMC");
  v5[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVCAnsweringMachineConfiguration isMessageCaptioningEnabled](self->_configuration, "isMessageCaptioningEnabled"));
  v4[3] = CFSTR("AMCMP");
  v5[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AVCAnsweringMachineConfiguration isMessagePlaybackEnabled](self->_configuration, "isMessagePlaybackEnabled"));
  v4[4] = CFSTR("AMCA");
  v5[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[AVCAnsweringMachineConfiguration announcementAsset](self->_configuration, "announcementAsset") != 0);
  v4[5] = CFSTR("AMCAD");
  v5[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AVCAnsweringMachineConfiguration announcementAssetMilliSecondDelay](self->_configuration, "announcementAssetMilliSecondDelay"));
  return (__CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 6);
}

- (BOOL)setupReportingAgentWithCallID:(unsigned int)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  const void *Agent;
  uint8_t buf[4];
  uint64_t v16;
  __int128 v17;
  _BYTE v18[108];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((VCAnsweringMachine *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136316162;
    v16 = v11;
    LOWORD(v17) = 2080;
    *(_QWORD *)((char *)&v17 + 2) = "-[VCAnsweringMachine setupReportingAgentWithCallID:]";
    WORD5(v17) = 1024;
    HIDWORD(v17) = 399;
    *(_WORD *)v18 = 2112;
    *(_QWORD *)&v18[2] = v5;
    *(_WORD *)&v18[10] = 2048;
    *(_QWORD *)&v18[12] = self;
    v8 = " [%s] %s:%d %@(%p) Register Reporting Agent";
    v9 = v12;
    v10 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = v6;
      LOWORD(v17) = 2080;
      *(_QWORD *)((char *)&v17 + 2) = "-[VCAnsweringMachine setupReportingAgentWithCallID:]";
      WORD5(v17) = 1024;
      HIDWORD(v17) = 399;
      v8 = " [%s] %s:%d Register Reporting Agent";
      v9 = v7;
      v10 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
LABEL_12:
  *(_DWORD *)buf = a3;
  *(_QWORD *)&v17 = 0;
  v16 = 0;
  *((_QWORD *)&v17 + 1) = 0xC00000000;
  memset(v18, 0, sizeof(v18));
  Agent = (const void *)reportingCreateAgent();
  if (Agent)
  {
    -[VCObject setReportingAgent:](self, "setReportingAgent:", Agent);
    CFRelease(Agent);
    -[VCObject reportingAgent](self, "reportingAgent");
    self->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    -[VCObject reportingAgent](self, "reportingAgent");
    -[VCAnsweringMachine clientSpecificUserInfo](self, "clientSpecificUserInfo");
    reportingSetUserInfo();
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingRecordingAndTranscriptionServiceUsage();
    -[VCAnsweringMachine reportingInitialConfiguration](self, "reportingInitialConfiguration");
    reportingGenericEvent();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAnsweringMachine setupReportingAgentWithCallID:].cold.1();
  }
  return Agent != 0;
}

void __52__VCAnsweringMachine_setupReportingAgentWithCallID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "strong");
    v3 = objc_opt_class();
    if (v3 == objc_msgSend(*(id *)(a1 + 32), "strong"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __52__VCAnsweringMachine_setupReportingAgentWithCallID___block_invoke_cold_1();
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "strong");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v7 = objc_msgSend(*(id *)(a1 + 32), "strong");
          v8 = 136316162;
          v9 = v5;
          v10 = 2080;
          v11 = "-[VCAnsweringMachine setupReportingAgentWithCallID:]_block_invoke";
          v12 = 1024;
          v13 = 413;
          v14 = 2112;
          v15 = v4;
          v16 = 2048;
          v17 = v7;
          _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Reporting not available (no backends)", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
}

- (__CFDictionary)clientSpecificUserInfo
{
  NSString *uuid;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  uuid = self->_uuid;
  v4 = CFSTR("AMUUID");
  v5[0] = uuid;
  return (__CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
}

- (void)handleThermalPressureNotification:(id)a3
{
  uint64_t v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("VCVideoCaptureServer_NotificationKeyThermalPressureLevel")), "intValue");
  v4 = CFSTR("Thermal");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  reportingGenericEvent();
}

- (void)registerForThermalNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_handleThermalPressureNotification_, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
  self->_registeredForThermalNotifications = 1;
}

- (void)unregisterForThermalNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_registeredForThermalNotifications)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
    self->_registeredForThermalNotifications = 0;
  }
}

- (void)setupInternalFormat
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  if (self)
  {
    -[VCAnsweringMachine defaultAudioFormat](self, "defaultAudioFormat");
  }
  else
  {
    v5 = 0;
    v3 = 0u;
    v4 = 0u;
  }
  *(_OWORD *)&self->_internalFormat.format.mSampleRate = v3;
  *(_OWORD *)&self->_internalFormat.format.mBytesPerPacket = v4;
  *(_QWORD *)&self->_internalFormat.format.mBitsPerChannel = v5;
  self->_internalFormat.samplesPerFrame = 480;
}

- (BOOL)setupRealtimeContextWithToken:(int64_t)a3
{
  _BOOL4 v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCAnsweringMachine *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[AVCAnsweringMachineConfiguration isMessageCaptioningEnabled](self->_configuration, "isMessageCaptioningEnabled")|| -[AVCAnsweringMachineConfiguration isMessageRecordingEnabled](self->_configuration, "isMessageRecordingEnabled"))
  {
    self->_realtimeContext.audioToken = a3;
  }
  if (-[AVCAnsweringMachineConfiguration isMessageCaptioningEnabled](self->_configuration, "isMessageCaptioningEnabled")&& !-[VCAnsweringMachine setupCaptionsCoordinator](self, "setupCaptionsCoordinator"))
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        -[VCAnsweringMachine setupRealtimeContextWithToken:].cold.3();
      }
      goto LABEL_41;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v5)
        return v5;
      v15 = 136316162;
      v16 = v13;
      v17 = 2080;
      v18 = "-[VCAnsweringMachine setupRealtimeContextWithToken:]";
      v19 = 1024;
      v20 = 483;
      v21 = 2112;
      v22 = v8;
      v23 = 2048;
      v24 = self;
      v11 = " [%s] %s:%d %@(%p) Failed to setup the captions coordinator";
LABEL_40:
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x30u);
    }
  }
  else if (-[VCAnsweringMachine setupMediaRecorder](self, "setupMediaRecorder"))
  {
    if (-[VCAnsweringMachine setUpAnnouncementAssetInjection](self, "setUpAnnouncementAssetInjection"))
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        -[VCAnsweringMachine setupRealtimeContextWithToken:].cold.1();
      }
      goto LABEL_41;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v5)
        return v5;
      v15 = 136316162;
      v16 = v12;
      v17 = 2080;
      v18 = "-[VCAnsweringMachine setupRealtimeContextWithToken:]";
      v19 = 1024;
      v20 = 489;
      v21 = 2112;
      v22 = v7;
      v23 = 2048;
      v24 = self;
      v11 = " [%s] %s:%d %@(%p) Failed to setup the announcementAssetInjection";
      goto LABEL_40;
    }
  }
  else
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        -[VCAnsweringMachine setupRealtimeContextWithToken:].cold.2();
      }
      goto LABEL_41;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v5)
        return v5;
      v15 = 136316162;
      v16 = v9;
      v17 = 2080;
      v18 = "-[VCAnsweringMachine setupRealtimeContextWithToken:]";
      v19 = 1024;
      v20 = 486;
      v21 = 2112;
      v22 = v6;
      v23 = 2048;
      v24 = self;
      v11 = " [%s] %s:%d %@(%p) Failed to setup the media recorder";
      goto LABEL_40;
    }
  }
LABEL_41:
  LOBYTE(v5) = 0;
  return v5;
}

- (void)cleanupRealtimeContext
{
  -[VCAnsweringMachine cleanupCaptionsCoordinator](self, "cleanupCaptionsCoordinator");
  -[VCAnsweringMachine cleanupMediaRecorder](self, "cleanupMediaRecorder");
  -[VCAnsweringMachine cleanupAnnouncementAssetInjection](self, "cleanupAnnouncementAssetInjection");
}

- (int)deviceRoleForCallSource:(unsigned __int8)a3
{
  if (a3 > 5u)
    return 4;
  else
    return dword_1D910B950[(char)a3];
}

- (AudioStreamBasicDescription)defaultAudioFormat
{
  AudioStreamBasicDescription *result;

  *(_QWORD *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  Format_Float((uint64_t)retstr, 1, 24000);
  return result;
}

- (tagVCAudioIOConfiguration)defaultAudioIOConfiguration
{
  tagVCAudioIOConfiguration *result;
  double mSampleRate;
  void (*v7)(uint64_t, uint64_t);

  retstr->var0 = VCUniqueIDGenerator_GenerateID();
  *(_QWORD *)&retstr->var1 = 0x100000000;
  retstr->var3 = -[VCAnsweringMachine deviceRoleForCallSource:](self, "deviceRoleForCallSource:", -[AVCAnsweringMachineConfiguration source](self->_configuration, "source"));
  retstr->var4 = 0;
  *(_WORD *)&retstr->var5 = 3;
  retstr->var7 = self;
  result = (tagVCAudioIOConfiguration *)-[AVCAnsweringMachineConfiguration clientPid](self->_configuration, "clientPid");
  mSampleRate = self->_internalFormat.format.mSampleRate;
  retstr->var8 = (int)result;
  retstr->var9 = mSampleRate;
  retstr->var10 = self->_internalFormat.samplesPerFrame;
  retstr->var11 = 0;
  retstr->var12 = 0;
  retstr->var13 = self->_internalFormat.format.mChannelsPerFrame;
  retstr->var15 = 0;
  retstr->var16 = 0;
  retstr->var14 = 0;
  *(_WORD *)&retstr->var17 = 0;
  if (self->_realtimeContext.announcementAssetInjector)
    v7 = _VCAnsweringMachine_PullAudioSamples;
  else
    v7 = 0;
  retstr->var19.delegate = 0;
  retstr->var19.clientCallback = v7;
  retstr->var19.captionsToken = 0;
  retstr->var19.captionsCoordinator = 0;
  retstr->var19.clientContext = self;
  retstr->var19.captionsUseSecondaryThread = 0;
  retstr->var19.injector = 0;
  retstr->var20.delegate = 0;
  retstr->var20.clientCallback = _VCAnsweringMachine_PushAudioSamples;
  retstr->var20.clientContext = self;
  retstr->var20.captionsToken = 0;
  retstr->var20.captionsCoordinator = 0;
  retstr->var20.captionsUseSecondaryThread = 0;
  retstr->var20.injector = 0;
  retstr->var21 = 0;
  *(_WORD *)&retstr->var22 = 0;
  return result;
}

- (BOOL)configureAudioIO
{
  __int128 v3;
  VCAudioIO *v4;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[8];
  UInt32 v24[4];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  VCAnsweringMachine *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21 = v3;
  v22 = v3;
  v19 = v3;
  v20 = v3;
  v17 = v3;
  v18 = v3;
  v15 = v3;
  v16 = v3;
  v13 = v3;
  v14 = v3;
  v11 = v3;
  v12 = v3;
  v9 = v3;
  v10 = v3;
  if (self)
  {
    -[VCAnsweringMachine defaultAudioIOConfiguration](self, "defaultAudioIOConfiguration", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
  }
  v4 = -[VCAudioIO initWithConfiguration:]([VCAudioIO alloc], "initWithConfiguration:", &v9);
  self->_audioIO = v4;
  if (v4)
  {
    v24[0] = 0;
    memset(v23, 0, sizeof(v23));
    AUIOGetAUNumber(v24);
    -[VCAudioIO setFarEndVersionInfo:](self->_audioIO, "setFarEndVersionInfo:", v23);
  }
  else if ((VCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAnsweringMachine configureAudioIO].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v26 = v7;
        v27 = 2080;
        v28 = "-[VCAnsweringMachine configureAudioIO]";
        v29 = 1024;
        v30 = 552;
        v31 = 2112;
        v32 = v6;
        v33 = 2048;
        v34 = self;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to init AudioIO", buf, 0x30u);
      }
    }
  }
  return v4 != 0;
}

- (int64_t)messageAudioToken
{
  return self->_realtimeContext.audioToken;
}

- (id)newInjectorConfigurationForAnnouncementAsset:(id)a3
{
  VCCannedAudioInjectorConfig *v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  _OWORD v10[2];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCAnsweringMachine *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(VCCannedAudioInjectorConfig);
  if (v5)
  {
    -[VCCannedAudioInjectorConfig setPath:](v5, "setPath:", objc_msgSend(a3, "absoluteString"));
    -[VCCannedAudioInjectorConfig setFromBeginning:](v5, "setFromBeginning:", 1);
    if (self)
    {
      -[VCAnsweringMachine defaultAudioFormat](self, "defaultAudioFormat");
    }
    else
    {
      v14 = 0;
      v12 = 0u;
      v13 = 0u;
    }
    v10[0] = v12;
    v10[1] = v13;
    v11 = v14;
    -[VCCannedAudioInjectorConfig setAudioFormat:](v5, "setAudioFormat:", v10);
    -[VCCannedAudioInjectorConfig setLoopCount:](v5, "setLoopCount:", 1);
    -[VCCannedAudioInjectorConfig setForceVoiceActive:](v5, "setForceVoiceActive:", 1);
    -[VCCannedAudioInjectorConfig setReportingAgent:](v5, "setReportingAgent:", self->super.super._reportingAgent);
  }
  else if ((VCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAnsweringMachine newInjectorConfigurationForAnnouncementAsset:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v8;
        v17 = 2080;
        v18 = "-[VCAnsweringMachine newInjectorConfigurationForAnnouncementAsset:]";
        v19 = 1024;
        v20 = 569;
        v21 = 2112;
        v22 = v7;
        v23 = 2048;
        v24 = self;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate audio injector configuration", buf, 0x30u);
      }
    }
  }
  return v5;
}

- (BOOL)setUpAnnouncementAssetInjection
{
  NSURL *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  VCAnsweringMachine *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[AVCAnsweringMachineConfiguration announcementAsset](self->_configuration, "announcementAsset");
  if (!v3)
    goto LABEL_4;
  v4 = -[VCAnsweringMachine newInjectorConfigurationForAnnouncementAsset:](self, "newInjectorConfigurationForAnnouncementAsset:", v3);
  if (v4)
  {
    v5 = v4;
    self->_realtimeContext.blocksToDelay = vcvtpd_u64_f64((double)-[AVCAnsweringMachineConfiguration announcementAssetMilliSecondDelay](self->_configuration, "announcementAssetMilliSecondDelay")/ 1000.0* 50.0);
    self->_realtimeContext.announcementAssetInjector = -[VCCannedAudioInjector initWithConfig:]([VCCannedAudioInjector alloc], "initWithConfig:", v5);

    if (self->_realtimeContext.announcementAssetInjector)
    {
LABEL_4:
      LOBYTE(v4) = 1;
      return (char)v4;
    }
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(v4) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)v4)
          return (char)v4;
        -[VCAnsweringMachine setUpAnnouncementAssetInjection].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        LODWORD(v4) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)v4)
          return (char)v4;
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCAnsweringMachine setUpAnnouncementAssetInjection]";
        v14 = 1024;
        v15 = 593;
        v16 = 2112;
        v17 = v6;
        v18 = 2048;
        v19 = self;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate audio injector", (uint8_t *)&v10, 0x30u);
      }
    }
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)cleanupAnnouncementAssetInjection
{

  self->_realtimeContext.announcementAssetInjector = 0;
}

- (BOOL)setupCaptionsCoordinator
{
  VCAudioCaptionsCoordinator *v3;
  __int128 v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  _BYTE v18[48];
  unint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  VCAnsweringMachine *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[AVCAnsweringMachineConfiguration isMessageCaptioningEnabled](self->_configuration, "isMessageCaptioningEnabled"))
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136315650;
      v21 = v6;
      v22 = 2080;
      v23 = "-[VCAnsweringMachine setupCaptionsCoordinator]";
      v24 = 1024;
      v25 = 632;
      v8 = " [%s] %s:%d Captions disabled";
      v9 = v7;
      v10 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316162;
      v21 = v11;
      v22 = 2080;
      v23 = "-[VCAnsweringMachine setupCaptionsCoordinator]";
      v24 = 1024;
      v25 = 632;
      v26 = 2112;
      v27 = v5;
      v28 = 2048;
      v29 = self;
      v8 = " [%s] %s:%d %@(%p) Captions disabled";
      v9 = v12;
      v10 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_15:
    LOBYTE(v13) = 1;
    return v13;
  }
  v3 = -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]([VCAudioCaptionsCoordinator alloc], "initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:", 1, 0, CFSTR("callscreeningcaptions"), -[VCObject reportingAgent](self, "reportingAgent"));
  self->_realtimeContext.captionsCoordinator = v3;
  if (v3)
  {
    memset(&v18[16], 170, 32);
    *(_OWORD *)v18 = xmmword_1D910B918;
    v4 = *(_OWORD *)&self->_internalFormat.format.mSampleRate;
    *(_OWORD *)&v18[24] = *(_OWORD *)&self->_internalFormat.format.mBytesPerPacket;
    *(_QWORD *)v18 = self->_realtimeContext.audioToken;
    *(_QWORD *)&v18[40] = *(_QWORD *)&self->_internalFormat.format.mBitsPerChannel;
    v19 = 0xAAAAAAAAAAAAAA00;
    *(_OWORD *)&v18[8] = v4;
    -[VCAudioCaptionsCoordinator registerStreamWithConfig:](v3, "registerStreamWithConfig:", v18);
    goto LABEL_15;
  }
  if ((VCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v13)
        return v13;
      -[VCAnsweringMachine setupCaptionsCoordinator].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v13)
        return v13;
      *(_DWORD *)buf = 136316162;
      v21 = v15;
      v22 = 2080;
      v23 = "-[VCAnsweringMachine setupCaptionsCoordinator]";
      v24 = 1024;
      v25 = 636;
      v26 = 2112;
      v27 = v14;
      v28 = 2048;
      v29 = self;
      _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create captions coordinator", buf, 0x30u);
    }
  }
  LOBYTE(v13) = 0;
  return v13;
}

- (void)cleanupCaptionsCoordinator
{
  tagVCAnsweringMachineRealtimeContext *p_realtimeContext;

  p_realtimeContext = &self->_realtimeContext;

  p_realtimeContext->captionsCoordinator = 0;
}

- (BOOL)setupMediaRecorder
{
  NSString *v3;
  tagVCAnsweringMachineRealtimeContext *p_realtimeContext;
  NSString *v5;
  VCMediaRecorder *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  VCMediaRecorder *mediaRecorder;
  uint64_t v19;
  NSObject *v20;
  VCMediaRecorder *v21;
  _BOOL4 v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  VCAnsweringMachine *v36;
  __int16 v37;
  VCMediaRecorder *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!-[AVCAnsweringMachineConfiguration isMessageRecordingEnabled](self->_configuration, "isMessageRecordingEnabled")
    || !+[VCHardwareSettings isMediaRecordingSupported](VCHardwareSettings, "isMediaRecordingSupported"))
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_27;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v27 = 136315650;
      v28 = v9;
      v29 = 2080;
      v30 = "-[VCAnsweringMachine setupMediaRecorder]";
      v31 = 1024;
      v32 = 662;
      v11 = " [%s] %s:%d Message recording disabled";
      v12 = v10;
      v13 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_27;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v27 = 136316162;
      v28 = v14;
      v29 = 2080;
      v30 = "-[VCAnsweringMachine setupMediaRecorder]";
      v31 = 1024;
      v32 = 662;
      v33 = 2112;
      v34 = v8;
      v35 = 2048;
      v36 = self;
      v11 = " [%s] %s:%d %@(%p) Message recording disabled";
      v12 = v15;
      v13 = 48;
    }
    goto LABEL_26;
  }
  v3 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  p_realtimeContext = &self->_realtimeContext;
  self->_realtimeContext.mediaRecorderRequesterID = v3;
  if (v3)
  {
    v5 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    self->_realtimeContext.mediaRecorderTransactionID = v5;
    if (v5)
    {
      v6 = -[VCMediaRecorder initWithStreamToken:delegate:reportingAgent:]([VCMediaRecorder alloc], "initWithStreamToken:delegate:reportingAgent:", LODWORD(self->_realtimeContext.audioToken), self, -[VCObject reportingAgent](self, "reportingAgent"));
      self->_realtimeContext.mediaRecorder = v6;
      if (v6)
      {
        -[VCMediaRecorder setCapabilities:](v6, "setCapabilities:", 2);
        -[VCMediaRecorder setMediaRecorderDelegate:](self->_realtimeContext.mediaRecorder, "setMediaRecorderDelegate:", self);
        -[VCMediaRecorder registerClient](self->_realtimeContext.mediaRecorder, "registerClient");
        if ((VCAnsweringMachine *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_27;
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          mediaRecorder = p_realtimeContext->mediaRecorder;
          v27 = 136315906;
          v28 = v16;
          v29 = 2080;
          v30 = "-[VCAnsweringMachine setupMediaRecorder]";
          v31 = 1024;
          v32 = 676;
          v33 = 2112;
          v34 = (const __CFString *)mediaRecorder;
          v11 = " [%s] %s:%d Successfully created mediaRecorder=%@";
          v12 = v17;
          v13 = 38;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v7 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v7 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_27;
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_27;
          v21 = self->_realtimeContext.mediaRecorder;
          v27 = 136316418;
          v28 = v19;
          v29 = 2080;
          v30 = "-[VCAnsweringMachine setupMediaRecorder]";
          v31 = 1024;
          v32 = 676;
          v33 = 2112;
          v34 = v7;
          v35 = 2048;
          v36 = self;
          v37 = 2112;
          v38 = v21;
          v11 = " [%s] %s:%d %@(%p) Successfully created mediaRecorder=%@";
          v12 = v20;
          v13 = 58;
        }
LABEL_26:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v27, v13);
LABEL_27:
        LOBYTE(v22) = 1;
        return v22;
      }
      if ((VCAnsweringMachine *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v22)
            return v22;
          -[VCAnsweringMachine setupMediaRecorder].cold.3();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v23 = (const __CFString *)-[VCAnsweringMachine performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v23 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E0CF2758];
          v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v22)
            return v22;
          v27 = 136316162;
          v28 = v24;
          v29 = 2080;
          v30 = "-[VCAnsweringMachine setupMediaRecorder]";
          v31 = 1024;
          v32 = 671;
          v33 = 2112;
          v34 = v23;
          v35 = 2048;
          v36 = self;
          _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create the media recorder", (uint8_t *)&v27, 0x30u);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v22)
        return v22;
      -[VCAnsweringMachine setupMediaRecorder].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v22)
      return v22;
    -[VCAnsweringMachine setupMediaRecorder].cold.1();
  }
  LOBYTE(v22) = 0;
  return v22;
}

- (void)cleanupMediaRecorder
{
  tagVCAnsweringMachineRealtimeContext *p_realtimeContext;

  p_realtimeContext = &self->_realtimeContext;

  p_realtimeContext->mediaRecorderRequesterID = 0;
  p_realtimeContext->mediaRecorderTransactionID = 0;

  p_realtimeContext->mediaRecorder = 0;
}

- (void)stopMediaRecording
{
  tagVCAnsweringMachineRealtimeContext *p_realtimeContext;
  uint64_t v3;
  _QWORD v4[2];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  p_realtimeContext = &self->_realtimeContext;
  v4[0] = CFSTR("vcMomentsTransactionID");
  v4[1] = CFSTR("vcMomentsInitiatorID");
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_realtimeContext.sinkCommonContext.latestTimestamp, CFSTR("vcMomentsTransactionID"), CFSTR("vcMomentsInitiatorID"), CFSTR("vcMomentsRequestMode"), CFSTR("vcMomentsRequestState"), CFSTR("vcMomentsMediaType"), CFSTR("vcMomentsRequestTimestamp"), vextq_s8(*(int8x16_t *)&self->_realtimeContext.mediaRecorderRequesterID, *(int8x16_t *)&self->_realtimeContext.mediaRecorderRequesterID, 8uLL), &unk_1E9EF49D0, &unk_1E9EF49E8, &unk_1E9EF4A00);
  v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v5, v4, 6);
  reportingGenericEvent();
  -[VCMediaRecorder processRequest:](p_realtimeContext->mediaRecorder, "processRequest:", v3);
  VCMediaRecorder_ClearHistoryBuffer((uint64_t)p_realtimeContext->mediaRecorder);
  VCMediaRecorder_StopProcessingAllRequests((uint64_t)p_realtimeContext->mediaRecorder);
  p_realtimeContext->sinkCommonContext.flags &= ~0x20u;
}

- (void)streamToken:(int64_t)a3 didEndProcessingRequest:(id)a4 urlContext:(const tagVCMediaRecorderDelegateURLContext *)a5 error:(id)a6
{
  id var1;
  NSObject *dispatchQueue;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  var1 = a5->var1;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__VCAnsweringMachine_streamToken_didEndProcessingRequest_urlContext_error___block_invoke;
  v8[3] = &unk_1E9E527D0;
  v8[4] = self;
  v8[5] = a6;
  v8[6] = var1;
  dispatch_async(dispatchQueue, v8);
}

void __75__VCAnsweringMachine_streamToken_didEndProcessingRequest_urlContext_error___block_invoke(uint64_t a1)
{
  __int128 v2;
  NSObject *v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 393))
  {
    reportingGenericEvent();
    v2 = *(_OWORD *)(a1 + 32);
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 192);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __75__VCAnsweringMachine_streamToken_didEndProcessingRequest_urlContext_error___block_invoke_2;
    v4[3] = &unk_1E9E527D0;
    v5 = v2;
    v6 = *(_QWORD *)(a1 + 48);
    dispatch_async(v3, v4);
  }
}

uint64_t __75__VCAnsweringMachine_streamToken_didEndProcessingRequest_urlContext_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "answeringMachine:didStop:recordingURL:error:");
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
  VCTerminateProcess((uint64_t)a3, a4, (uint64_t)a5);
}

- (AVCAnsweringMachineConfiguration)configuration
{
  return self->_configuration;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSURL)recordingURL
{
  return self->_recordingURL;
}

void ___VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  BOOL v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD v25[7];
  char v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BYTE v34[18];
  __int16 v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(unsigned __int8 *)(a1 + 48);
        v6 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316162;
        v28 = v3;
        v29 = 2080;
        v30 = "_VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke";
        v31 = 1024;
        v32 = 602;
        v33 = 1024;
        *(_DWORD *)v34 = v5;
        *(_WORD *)&v34[4] = 2112;
        *(_QWORD *)&v34[6] = v6;
        v7 = " [%s] %s:%d didFinishAnnouncement=%{BOOL}d, error=%@";
        v8 = v4;
        v9 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
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
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(unsigned __int8 *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316674;
        v28 = v10;
        v29 = 2080;
        v30 = "_VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke";
        v31 = 1024;
        v32 = 602;
        v33 = 2112;
        *(_QWORD *)v34 = v2;
        *(_WORD *)&v34[8] = 2048;
        *(_QWORD *)&v34[10] = v13;
        v35 = 1024;
        v36 = v12;
        v37 = 2112;
        v38 = v14;
        v7 = " [%s] %s:%d %@(%p) didFinishAnnouncement=%{BOOL}d, error=%@";
        v8 = v11;
        v9 = 64;
        goto LABEL_11;
      }
    }
  }
  v15 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v15 + 393))
  {
    v16 = *(NSObject **)(v15 + 192);
    v17 = *(_QWORD *)(v15 + 184);
    if (v17)
      v18 = v16 == 0;
    else
      v18 = 1;
    if (v18)
    {
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            ___VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke_cold_1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v19 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        else
          v19 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v24 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 136316162;
            v28 = v22;
            v29 = 2080;
            v30 = "_VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke";
            v31 = 1024;
            v32 = 611;
            v33 = 2112;
            *(_QWORD *)v34 = v19;
            *(_WORD *)&v34[8] = 2048;
            *(_QWORD *)&v34[10] = v24;
            _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) delegate or delegateQueue invalid, NOT sending didFinishAnnouncement notice to client", buf, 0x30u);
          }
        }
      }
    }
    else
    {
      v20 = *(_QWORD *)(a1 + 40);
      reportingGenericEvent();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = ___VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke_214;
      v25[3] = &unk_1E9E53608;
      v21 = *(_QWORD *)(a1 + 32);
      v25[4] = v17;
      v25[5] = v21;
      v26 = *(_BYTE *)(a1 + 48);
      v25[6] = v20;
      dispatch_async(v16, v25);
    }
  }
}

uint64_t ___VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke_214(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "answeringMachine:didFinishAnnouncement:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t ___VCAnsweringMachine_StartMediaRecording_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 393))
  {
    v1 = result;
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(result + 56), CFSTR("vcMomentsTransactionID"), CFSTR("vcMomentsInitiatorID"), CFSTR("vcMomentsRequestMode"), CFSTR("vcMomentsRequestState"), CFSTR("vcMomentsMediaType"), CFSTR("vcMomentsRequestTimestamp"), *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), &unk_1E9EF49D0, &unk_1E9EF49D0, &unk_1E9EF4A00);
    v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 6);
    reportingGenericEvent();
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 256), "processRequest:", v2);
  }
  return result;
}

- (void)setUpConfigurationIndependentInternalState
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the dispatch queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpInternalStateWithConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to configure AudioIO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpInternalStateWithConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the realtime context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.1()
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

- (void)initWithConfiguration:delegate:delegateQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d The delegate is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d The delegate queue is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d super init Failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.5()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  const char *v4;
  __int16 v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = v0;
  v4 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
  v5 = 1024;
  OUTLINED_FUNCTION_10_2();
  v6 = 2048;
  v7 = 0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) super init Failed", v2, 0x30u);
}

void __27__VCAnsweringMachine_start__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Start called after invalidate!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __26__VCAnsweringMachine_stop__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stop called after invalidate!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)onStart
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AudioIO start failed. error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)onStop
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AudioIO stop failed. error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setupReportingAgentWithCallID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create reportingAgent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__VCAnsweringMachine_setupReportingAgentWithCallID___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Reporting not available (no backends)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupRealtimeContextWithToken:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the announcementAssetInjection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupRealtimeContextWithToken:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the media recorder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupRealtimeContextWithToken:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the captions coordinator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureAudioIO
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init AudioIO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newInjectorConfigurationForAnnouncementAsset:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate audio injector configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpAnnouncementAssetInjection
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate audio injector", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupCaptionsCoordinator
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create captions coordinator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupMediaRecorder
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the media recorder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d delegate or delegateQueue invalid, NOT sending didFinishAnnouncement notice to client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
