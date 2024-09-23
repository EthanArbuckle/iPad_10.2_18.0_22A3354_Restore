@implementation AVCStreamOutput

- (AVCStreamOutput)initWithStreamToken:(int64_t)a3 delegate:(id)a4 queue:(id)a5 error:(id *)a6
{
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  objc_super v20;
  int v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  AVCStreamOutput *v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCStreamOutput-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a6)
        v13 = (const __CFString *)*a6;
      else
        v13 = CFSTR("nil");
      *(_DWORD *)buf = 136316930;
      v23 = v11;
      v24 = 2080;
      v25 = "-[AVCStreamOutput initWithStreamToken:delegate:queue:error:]";
      v26 = 1024;
      v27 = 122;
      v28 = 2048;
      v29 = self;
      v30 = 2048;
      v31 = a3;
      v32 = 2112;
      v33 = a4;
      v34 = 2112;
      v35 = a5;
      v36 = 2112;
      v37 = v13;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d @:@ AVCStreamOutput-init (%p) streamToken=%ld, delegate=%@, queue=%@, error=%@", buf, 0x4Eu);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)AVCStreamOutput;
  v14 = -[AVCStreamOutput init](&v20, sel_init);
  if (!v14)
    goto LABEL_15;
  VRTraceReset();
  if ((objc_msgSend(v14, "validateAccess") & 1) != 0)
  {
    v14[120] = (int)VRTraceGetErrorLogLevelForModule() > 7;
    *((_QWORD *)v14 + 4) = a3;
    objc_storeWeak((id *)v14 + 3, a4);
    v14[40] = 1;
    *((_DWORD *)v14 + 12) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processIdentifier");
    v21 = objc_msgSend(v14, "createReceiverQueue");
    if (v21)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCStreamOutput initWithStreamToken:delegate:queue:error:].cold.3();
      }
    }
    else
    {
      objc_msgSend(v14, "setupDelegateQueue:", a5);
      if (-[VCStreamOutputManager sourceExistsForStreamToken:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "sourceExistsForStreamToken:", *((_QWORD *)v14 + 4)))
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v14, CFSTR("vcStreamOutputInProcessDelegate"), *((_QWORD *)v14 + 20), CFSTR("vcStreamOutputInProcessDelegateQueue"), 0);
        *((_QWORD *)v14 + 14) = -[VCStreamOutputManager allocStreamOutputWithStreamToken:clientPid:options:errorCode:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "allocStreamOutputWithStreamToken:clientPid:options:errorCode:", *((_QWORD *)v14 + 4), getpid(), v15, &v21);

        if (*((_QWORD *)v14 + 14))
        {
          objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "notifyCachedStateForStreamToken:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
LABEL_14:
          v16 = MEMORY[0x1E0CA2E18];
          v17 = *MEMORY[0x1E0CA2E18];
          *((_OWORD *)v14 + 5) = *MEMORY[0x1E0CA2E18];
          v18 = *(_QWORD *)(v16 + 16);
          *((_QWORD *)v14 + 12) = v18;
          *(_OWORD *)(v14 + 56) = v17;
          *((_QWORD *)v14 + 9) = v18;
          kdebug_trace();
          *((_QWORD *)v14 + 17) = (id)objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v14);
          goto LABEL_15;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCStreamOutput initWithStreamToken:delegate:queue:error:].cold.1();
        }
      }
      else
      {
        v21 = objc_msgSend(v14, "setupXPCConnection");
        if (!v21)
          goto LABEL_14;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCStreamOutput initWithStreamToken:delegate:queue:error:].cold.2();
        }
      }
    }
LABEL_15:
    if (!v21)
      return (AVCStreamOutput *)v14;
    goto LABEL_16;
  }
  v21 = -7;
LABEL_16:

  v14 = 0;
  if (a6)
    *a6 = +[AVCStreamOutput errorWithStreamOutputError:](AVCStreamOutput, "errorWithStreamOutputError:", v21);
  return (AVCStreamOutput *)v14;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *delegateQueue;
  __CFDictionary *attachments;
  NSObject *internalReceiverQueue;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  AVCStreamOutput *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCStreamOutput-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v3;
      v11 = 2080;
      v12 = "-[AVCStreamOutput dealloc]";
      v13 = 1024;
      v14 = 174;
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d @:@ AVCStreamOutput-dealloc (%p)", buf, 0x26u);
    }
  }
  -[VCStreamOutput invalidate](self->_vcStreamOutput, "invalidate");
  -[VCStreamOutputManager cleanupStreamOutput:](+[VCStreamOutputManager sharedInstance](VCStreamOutputManager, "sharedInstance"), "cleanupStreamOutput:", self->_vcStreamOutput);

  self->_weakSelf = 0;
  objc_storeWeak(&self->_delegate, 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  -[AVCStreamOutput terminateConnection](self, "terminateConnection");
  if (self->_receiverQueue)
    VCRemoteImageQueue_Destroy((uint64_t *)&self->_receiverQueue);
  attachments = self->_attachments;
  if (attachments)
    CFRelease(attachments);
  internalReceiverQueue = self->_internalReceiverQueue;
  if (internalReceiverQueue)
  {
    dispatch_release(internalReceiverQueue);
    self->_internalReceiverQueue = 0;
  }
  kdebug_trace();
  v8.receiver = self;
  v8.super_class = (Class)AVCStreamOutput;
  -[AVCStreamOutput dealloc](&v8, sel_dealloc);
}

- (BOOL)validateAccessWithProcessName:(id)a3 accessControlPlist:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char **v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  AVCStreamOutput *v35;
  __int16 v36;
  const __CFString *v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
LABEL_35:
    LOBYTE(v6) = 0;
    return v6;
  }
  v5 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", kAVCStreamOutputProcessAllowEntry);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((AVCStreamOutput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(v6) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)v6)
          return v6;
        -[AVCStreamOutput validateAccessWithProcessName:accessControlPlist:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = (const __CFString *)-[AVCStreamOutput performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v21 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        LODWORD(v6) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)v6)
          return v6;
        *(_DWORD *)buf = 136316162;
        v27 = v22;
        v28 = 2080;
        v29 = "-[AVCStreamOutput validateAccessWithProcessName:accessControlPlist:]";
        v30 = 1024;
        v31 = 195;
        v32 = 2112;
        v33 = v21;
        v34 = 2048;
        v35 = self;
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, "AVCStreamOutput [%s] %s:%d %@(%p) Failed to retrieve the allow process name list", buf, 0x30u);
      }
    }
    goto LABEL_35;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (!v6)
    return v6;
  v7 = v6;
  v8 = &selRef_load;
  v9 = *(_QWORD *)v40;
  do
  {
    v10 = 0;
    v11 = v8[73];
    do
    {
      if (*(_QWORD *)v40 != v9)
        objc_enumerationMutation(v5);
      v12 = *(const __CFString **)(*((_QWORD *)&v39 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(a3, "isEqualToString:", v12) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
      }
      else if ((AVCStreamOutput *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v27 = v19;
            v28 = 2080;
            v29 = "-[AVCStreamOutput validateAccessWithProcessName:accessControlPlist:]";
            v30 = 1024;
            v31 = 199;
            v32 = 2112;
            v33 = v12;
            v16 = v20;
            v17 = "AVCStreamOutput [%s] %s:%d Unexpected type process name entry=%@. Skipping ...";
            v18 = 38;
            goto LABEL_22;
          }
        }
      }
      else
      {
        v13 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v13 = (const __CFString *)-[AVCStreamOutput performSelector:](self, "performSelector:", v11);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v27 = v14;
            v28 = 2080;
            v29 = "-[AVCStreamOutput validateAccessWithProcessName:accessControlPlist:]";
            v30 = 1024;
            v31 = 199;
            v32 = 2112;
            v33 = v13;
            v34 = 2048;
            v35 = self;
            v36 = 2112;
            v37 = v12;
            v16 = v15;
            v17 = "AVCStreamOutput [%s] %s:%d %@(%p) Unexpected type process name entry=%@. Skipping ...";
            v18 = 58;
LABEL_22:
            _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v17, buf, v18);
          }
        }
      }
      ++v10;
    }
    while (v7 != v10);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    v7 = v6;
    v8 = &selRef_load;
  }
  while (v6);
  return v6;
}

- (BOOL)validateAccess
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  AVCStreamOutput *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
  if (!v3)
  {
    if ((AVCStreamOutput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCStreamOutput validateAccess].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[AVCStreamOutput performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v23 = v16;
          v24 = 2080;
          v25 = "-[AVCStreamOutput validateAccess]";
          v26 = 1024;
          v27 = 214;
          v28 = 2112;
          v29 = (uint64_t)v15;
          v30 = 2048;
          v31 = self;
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, "AVCStreamOutput [%s] %s:%d %@(%p) Failed to get the current process name", buf, 0x30u);
        }
      }
    }
LABEL_28:
    if ((AVCStreamOutput *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v14)
          return v14;
        -[AVCStreamOutput validateAccess].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)-[AVCStreamOutput performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v14)
          return v14;
        *(_DWORD *)buf = 136316418;
        v23 = v19;
        v24 = 2080;
        v25 = "-[AVCStreamOutput validateAccess]";
        v26 = 1024;
        v27 = 231;
        v28 = 2112;
        v29 = (uint64_t)v18;
        v30 = 2048;
        v31 = self;
        v32 = 2112;
        v33 = v3;
        _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, "AVCStreamOutput [%s] %s:%d %@(%p) Access denied for process=%@", buf, 0x3Au);
      }
    }
    LOBYTE(v14) = 0;
    return v14;
  }
  v4 = objc_msgSend(MEMORY[0x1E0CB34D0], "plistForClass:withPath:defaultOverride:", objc_opt_class(), kAVCStreamOutputAccessControlPlist, CFSTR("streamOutputAccessControlPlist"));
  if (v4)
    v5 = -[AVCStreamOutput validateAccessWithProcessName:accessControlPlist:](self, "validateAccessWithProcessName:accessControlPlist:", v3, v4);
  else
    v5 = VRTraceIsInternalOSInstalled() ^ 1;
  if (!VCDefaults_GetBoolValueForKey((const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("allowStreamOutput"), v3), v5))goto LABEL_28;
  if ((AVCStreamOutput *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_17;
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136315906;
    v23 = v7;
    v24 = 2080;
    v25 = "-[AVCStreamOutput validateAccess]";
    v26 = 1024;
    v27 = 229;
    v28 = 2112;
    v29 = v3;
    v9 = "AVCStreamOutput [%s] %s:%d Access granted for process=%@";
    v10 = v8;
    v11 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[AVCStreamOutput performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_17;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136316418;
    v23 = v12;
    v24 = 2080;
    v25 = "-[AVCStreamOutput validateAccess]";
    v26 = 1024;
    v27 = 229;
    v28 = 2112;
    v29 = (uint64_t)v6;
    v30 = 2048;
    v31 = self;
    v32 = 2112;
    v33 = v3;
    v9 = "AVCStreamOutput [%s] %s:%d %@(%p) Access granted for process=%@";
    v10 = v13;
    v11 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_17:
  LOBYTE(v14) = 1;
  return v14;
}

- (void)setupDelegateQueue:(id)internalReceiverQueue
{
  if (!internalReceiverQueue)
    internalReceiverQueue = self->_internalReceiverQueue;
  self->_delegateQueue = (OS_dispatch_queue *)internalReceiverQueue;
  dispatch_retain((dispatch_object_t)internalReceiverQueue);
}

- (int)createReceiverQueue
{
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v4;

  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
  v4 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.avconference.StreamOutput.internalReceiverQueue", 0, CustomRootQueue);
  self->_internalReceiverQueue = v4;
  if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCStreamOutput createReceiverQueue].cold.1();
  }
  if (self->_internalReceiverQueue)
    return 0;
  else
    return -3;
}

- (int)setupXPCConnection
{
  AVConferenceXPCClient *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(AVConferenceXPCClient);
  self->_connection = v3;
  if (v3)
  {
    v10 = CFSTR("conferenceCallID");
    v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_streamToken);
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "streamOutputInitialize", v4);
    if (!v5
      || (v6 = v5, objc_msgSend(v5, "count") == 1) && objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ERROR")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCStreamOutput setupXPCConnection].cold.2();
      }
      return -6;
    }
    else
    {
      v7 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS"));
      if (v7)
      {
        v8 = -[AVCStreamOutput setupRemoteQueueWithSenderQueue:](self, "setupRemoteQueueWithSenderQueue:", v7);
        if (v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCStreamOutput setupXPCConnection].cold.4();
          }
        }
        else
        {
          -[AVCStreamOutput registerBlocksForNotification](self, "registerBlocksForNotification");
          -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "streamOutputCachedNotifications", v4);
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCStreamOutput setupXPCConnection].cold.3();
        }
        return -1;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamOutput setupXPCConnection].cold.1();
    }
    return -5;
  }
  return v8;
}

- (void)remoteQueueOperationHandlerWithError:(int)a3 operation:(FigRemoteOperation *)a4
{
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamOutput remoteQueueOperationHandlerWithError:operation:].cold.1();
    }
  }
  else if (a4->var0 == 1)
  {
    -[AVCStreamOutput didUpdateAttachments:](self, "didUpdateAttachments:", a4->var4.var4.var0);
  }
  else if (a4->var0 == 3)
  {
    -[AVCStreamOutput didReceiveSampleBuffer:](self, "didReceiveSampleBuffer:", a4->var4.var4.var0);
  }
}

- (int)setupRemoteQueueWithSenderQueue:(id)a3
{
  uint64_t v5;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__AVCStreamOutput_setupRemoteQueueWithSenderQueue___block_invoke;
  v7[3] = &unk_1E9E53A60;
  v7[4] = v5;
  VCRemoteImageQueue_CreateReceiverQueue((uint64_t)a3, (uint64_t)v7, (uint64_t)self->_internalReceiverQueue, &self->_receiverQueue);
  if (self->_receiverQueue)
    return 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCStreamOutput setupRemoteQueueWithSenderQueue:].cold.1();
  }
  return -2;
}

uint64_t __51__AVCStreamOutput_setupRemoteQueueWithSenderQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "remoteQueueOperationHandlerWithError:operation:", a2, a3);
}

- (AVCStreamOutputDelegate)delegate
{
  return (AVCStreamOutputDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setSynchronizationTimeOffset:(float)a3
{
  NSObject *internalReceiverQueue;
  _QWORD block[5];
  float v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  internalReceiverQueue = self->_internalReceiverQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVCStreamOutput_setSynchronizationTimeOffset___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(internalReceiverQueue, block);
}

void __48__AVCStreamOutput_setSynchronizationTimeOffset___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  float v6;
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
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__AVCStreamOutput_setSynchronizationTimeOffset___block_invoke_cold_1();
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
        v7 = *(_QWORD *)(a1 + 32);
        v8 = 136316162;
        v9 = v3;
        v10 = 2080;
        v11 = "-[AVCStreamOutput setSynchronizationTimeOffset:]_block_invoke";
        v12 = 1024;
        v13 = 318;
        v14 = 2112;
        v15 = v2;
        v16 = 2048;
        v17 = v7;
        _os_log_error_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_ERROR, "AVCStreamOutput [%s] %s:%d %@(%p) Support for the synchronizationTimeOffset property was discontinued", (uint8_t *)&v8, 0x30u);
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(float *)(a1 + 40);
  if (*(float *)(v5 + 52) != v6)
    *(float *)(v5 + 52) = v6;
}

- (void)didPause:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  int64_t streamToken;
  NSObject *delegateQueue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316162;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCStreamOutput didPause:]";
      v15 = 1024;
      v16 = 362;
      v17 = 1024;
      v18 = v3;
      v19 = 1024;
      v20 = streamToken;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput callback: didPause=%d for streamToken=%u", buf, 0x28u);
    }
  }
  kdebug_trace();
  self->_isPaused = v3;
  -[AVCStreamOutput delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __28__AVCStreamOutput_didPause___block_invoke;
    v9[3] = &unk_1E9E521E8;
    v9[4] = self;
    v10 = v3;
    dispatch_async(delegateQueue, v9);
  }
}

uint64_t __28__AVCStreamOutput_didPause___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "streamOutput:didPause:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)didStall:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  int64_t streamToken;
  NSObject *delegateQueue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316162;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCStreamOutput didStall:]";
      v15 = 1024;
      v16 = 373;
      v17 = 1024;
      v18 = v3;
      v19 = 1024;
      v20 = streamToken;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput callback: didStall=%d for streamToken=%u", buf, 0x28u);
    }
  }
  kdebug_trace();
  self->_isStalled = v3;
  -[AVCStreamOutput delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __28__AVCStreamOutput_didStall___block_invoke;
    v9[3] = &unk_1E9E521E8;
    v9[4] = self;
    v10 = v3;
    dispatch_async(delegateQueue, v9);
  }
}

uint64_t __28__AVCStreamOutput_didStall___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "streamOutput:didStall:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)didDegrade:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  int64_t streamToken;
  NSObject *delegateQueue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316162;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCStreamOutput didDegrade:]";
      v15 = 1024;
      v16 = 384;
      v17 = 1024;
      v18 = v3;
      v19 = 1024;
      v20 = streamToken;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput callback: didDegrade=%d for streamToken=%u", buf, 0x28u);
    }
  }
  kdebug_trace();
  self->_isDegraded = v3;
  -[AVCStreamOutput delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__AVCStreamOutput_didDegrade___block_invoke;
    v9[3] = &unk_1E9E521E8;
    v9[4] = self;
    v10 = v3;
    dispatch_async(delegateQueue, v9);
  }
}

uint64_t __30__AVCStreamOutput_didDegrade___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "streamOutput:didDegrade:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)didSuspend:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  int64_t streamToken;
  NSObject *delegateQueue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316162;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCStreamOutput didSuspend:]";
      v15 = 1024;
      v16 = 395;
      v17 = 1024;
      v18 = v3;
      v19 = 1024;
      v20 = streamToken;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput callback: didSuspend=%d for streamToken=%u", buf, 0x28u);
    }
  }
  kdebug_trace();
  self->_isSuspended = v3;
  -[AVCStreamOutput delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__AVCStreamOutput_didSuspend___block_invoke;
    v9[3] = &unk_1E9E521E8;
    v9[4] = self;
    v10 = v3;
    dispatch_async(delegateQueue, v9);
  }
}

uint64_t __30__AVCStreamOutput_didSuspend___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "streamOutput:didSuspend:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)didInvalidate
{
  uint64_t v3;
  NSObject *v4;
  int64_t streamToken;
  uint64_t v6;
  NSObject *delegateQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136315906;
      v10 = v3;
      v11 = 2080;
      v12 = "-[AVCStreamOutput didInvalidate]";
      v13 = 1024;
      v14 = 406;
      v15 = 1024;
      v16 = streamToken;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput callback: didInvalidate for streamToken=%u.", buf, 0x22u);
    }
  }
  self->_isValid = 0;
  v6 = -[VCWeakObjectHolder strong](self->_weakSelf, "strong");
  if (v6)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__AVCStreamOutput_didInvalidate__block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = v6;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __32__AVCStreamOutput_didInvalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "streamOutputDidBecomeInvalid:", *(_QWORD *)(a1 + 32));
}

- (void)didUpdateAttachments:(__CFDictionary *)a3
{
  __CFDictionary *attachments;
  __CFDictionary *v6;

  attachments = self->_attachments;
  if (attachments)
    CFRelease(attachments);
  if (a3)
    v6 = (__CFDictionary *)CFRetain(a3);
  else
    v6 = 0;
  self->_attachments = v6;
}

- (void)didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  int64_t streamToken;
  const opaqueCMFormatDescription *FormatDescription;
  __int128 v7;
  OpaqueCMBlockBuffer *DataBuffer;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  size_t DataLength;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  size_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  __CFDictionary *attachments;
  NSObject *delegateQueue;
  _QWORD v28[6];
  CMTime v29;
  CMTime v30;
  CMTime time;
  int v32;
  __int16 v33;
  AVCStreamOutput *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  opaqueCMSampleBuffer *v38;
  __int16 v39;
  _OWORD *v40;
  __int16 v41;
  opaqueCMSampleBuffer *v42;
  _OWORD v43[4];
  char v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    memset(&v30, 170, sizeof(v30));
    CMSampleBufferGetPresentationTimeStamp(&v30, a3);
    time = v30;
    CMTimeGetSeconds(&time);
    kdebug_trace();
    if (!self->_printSampleBufferDetailsEnabled)
      goto LABEL_19;
    streamToken = self->_streamToken;
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    if (CMFormatDescriptionGetMediaType(FormatDescription) == 1835365473)
    {
      v44 = -86;
      *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43[2] = v7;
      v43[3] = v7;
      v43[0] = v7;
      v43[1] = v7;
      DataBuffer = CMSampleBufferGetDataBuffer(a3);
      VideoUtil_BlockBufferToString(DataBuffer, (char *)v43, 65);
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_19;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          DataLength = CMBlockBufferGetDataLength(DataBuffer);
          LODWORD(time.value) = 136316930;
          *(CMTimeValue *)((char *)&time.value + 4) = v9;
          LOWORD(time.flags) = 2080;
          *(_QWORD *)((char *)&time.flags + 2) = "_AVCStreamOutput_PrintSampleBufferDetails";
          HIWORD(time.epoch) = 1024;
          v32 = 82;
          v33 = 2048;
          v34 = self;
          v35 = 1024;
          v36 = streamToken;
          v37 = 2048;
          v38 = (opaqueCMSampleBuffer *)DataLength;
          v39 = 2080;
          v40 = v43;
          v41 = 2112;
          v42 = a3;
          v13 = "AVCStreamOutput [%s] %s:%d streamOutput=%p streamToken=%u length=%zu data=%s sampleBuffer=%@";
          v14 = v10;
          v15 = 74;
LABEL_15:
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&time, v15);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        goto LABEL_19;
      v22 = CMBlockBufferGetDataLength(DataBuffer);
      LODWORD(time.value) = 136316930;
      *(CMTimeValue *)((char *)&time.value + 4) = v9;
      LOWORD(time.flags) = 2080;
      *(_QWORD *)((char *)&time.flags + 2) = "_AVCStreamOutput_PrintSampleBufferDetails";
      HIWORD(time.epoch) = 1024;
      v32 = 82;
      v33 = 2048;
      v34 = self;
      v35 = 1024;
      v36 = streamToken;
      v37 = 2048;
      v38 = (opaqueCMSampleBuffer *)v22;
      v39 = 2080;
      v40 = v43;
      v41 = 2112;
      v42 = a3;
      v23 = "AVCStreamOutput [%s] %s:%d streamOutput=%p streamToken=%u length=%zu data=%s sampleBuffer=%@";
      v24 = v10;
      v25 = 74;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_19;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      v21 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(time.value) = 136316418;
          *(CMTimeValue *)((char *)&time.value + 4) = v19;
          LOWORD(time.flags) = 2080;
          *(_QWORD *)((char *)&time.flags + 2) = "_AVCStreamOutput_PrintSampleBufferDetails";
          HIWORD(time.epoch) = 1024;
          v32 = 84;
          v33 = 2048;
          v34 = self;
          v35 = 1024;
          v36 = streamToken;
          v37 = 2112;
          v38 = a3;
          v13 = "AVCStreamOutput [%s] %s:%d streamOutput=%p streamToken=%u sampleBuffer=%@";
          v14 = v20;
          v15 = 54;
          goto LABEL_15;
        }
LABEL_19:
        attachments = self->_attachments;
        if (attachments)
          CMSetAttachments(a3, attachments, 1u);
        CFRetain(a3);
        delegateQueue = self->_delegateQueue;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __42__AVCStreamOutput_didReceiveSampleBuffer___block_invoke;
        v28[3] = &unk_1E9E56898;
        v28[4] = self;
        v28[5] = a3;
        v29 = v30;
        dispatch_async(delegateQueue, v28);
        return;
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        goto LABEL_19;
      LODWORD(time.value) = 136316418;
      *(CMTimeValue *)((char *)&time.value + 4) = v19;
      LOWORD(time.flags) = 2080;
      *(_QWORD *)((char *)&time.flags + 2) = "_AVCStreamOutput_PrintSampleBufferDetails";
      HIWORD(time.epoch) = 1024;
      v32 = 84;
      v33 = 2048;
      v34 = self;
      v35 = 1024;
      v36 = streamToken;
      v37 = 2112;
      v38 = a3;
      v23 = "AVCStreamOutput [%s] %s:%d streamOutput=%p streamToken=%u sampleBuffer=%@";
      v24 = v20;
      v25 = 54;
    }
    _os_log_debug_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&time, v25);
    goto LABEL_19;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_streamToken;
      LODWORD(time.value) = 136316162;
      *(CMTimeValue *)((char *)&time.value + 4) = v16;
      LOWORD(time.flags) = 2080;
      *(_QWORD *)((char *)&time.flags + 2) = "-[AVCStreamOutput didReceiveSampleBuffer:]";
      HIWORD(time.epoch) = 1024;
      v32 = 424;
      v33 = 2048;
      v34 = self;
      v35 = 1024;
      v36 = v18;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d streamOutput=%p streamToken=%u Received NULL sample buffer", (uint8_t *)&time, 0x2Cu);
    }
  }
}

void __42__AVCStreamOutput_didReceiveSampleBuffer___block_invoke(uint64_t a1)
{
  const opaqueCMFormatDescription *FormatDescription;
  CMMediaType MediaType;
  opaqueCMSampleBuffer *v4;
  uint64_t v5;
  __int128 *v6;
  _OWORD *v7;
  OpaqueCMBlockBuffer *DataBuffer;
  float v9;
  float v10;
  uint64_t v11;
  _OWORD *v12;
  __int128 v13;
  int ErrorLogLevelForModule;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  char *v18;
  float v19;
  int v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  char *v27;
  int v28;
  const void *v29;
  CMTime v30;
  __int128 v31;
  uint64_t v32;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  char *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  FormatDescription = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(a1 + 40));
  MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(opaqueCMSampleBuffer **)(a1 + 40);
  v6 = (__int128 *)(a1 + 48);
  *(_OWORD *)&v30.value = *(_OWORD *)(a1 + 48);
  v30.epoch = *(_QWORD *)(a1 + 64);
  ++*(_DWORD *)(v5 + 104);
  if (MediaType == 1835365473)
  {
    v7 = (_OWORD *)(v5 + 80);
    if ((*(_BYTE *)(v5 + 92) & 1) != 0)
    {
      DataBuffer = CMSampleBufferGetDataBuffer(v4);
      memset(&time, 170, sizeof(time));
      lhs = v30;
      *(_OWORD *)&rhs.value = *v7;
      rhs.epoch = *(_QWORD *)(v5 + 96);
      CMTimeSubtract(&time, &lhs, &rhs);
      v9 = (double)time.value / (double)time.timescale;
      v10 = (double)CMBlockBufferGetDataLength(DataBuffer) * 8.0 / v9;
      VCUtil_ExponentialMovingAverage((float *)(v5 + 108), v10, 10.0);
    }
    *v7 = *(_OWORD *)&v30.value;
    *(_QWORD *)(v5 + 96) = v30.epoch;
  }
  v11 = *(_QWORD *)(a1 + 32);
  v31 = *v6;
  v32 = *(_QWORD *)(a1 + 64);
  v12 = (_OWORD *)(v11 + 56);
  if ((*(_BYTE *)(v11 + 68) & 1) == 0)
  {
    v13 = *v6;
    *(_QWORD *)(v11 + 72) = *(_QWORD *)(a1 + 64);
    *v12 = v13;
    goto LABEL_17;
  }
  memset(&lhs, 170, sizeof(lhs));
  *(_OWORD *)&time.value = *v6;
  time.epoch = *(_QWORD *)(a1 + 64);
  *(_OWORD *)&rhs.value = *v12;
  rhs.epoch = *(_QWORD *)(v11 + 72);
  CMTimeSubtract(&lhs, &time, &rhs);
  if ((double)lhs.value / (double)lhs.timescale > 5.0)
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (MediaType == 1835365473)
    {
      if (ErrorLogLevelForModule < 6)
        goto LABEL_16;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v17 = *(_QWORD *)(v11 + 32);
      v18 = FourccToCStr(1835365473);
      v19 = *(float *)(v11 + 108);
      LODWORD(time.value) = 136316674;
      v20 = *(_DWORD *)(v11 + 104);
      *(CMTimeValue *)((char *)&time.value + 4) = v15;
      LOWORD(time.flags) = 2080;
      *(_QWORD *)((char *)&time.flags + 2) = "_AVCStreamOutput_DisplayHealthInfo";
      HIWORD(time.epoch) = 1024;
      v36 = 334;
      v37 = 1024;
      v38 = v17;
      v39 = 2080;
      v40 = v18;
      v41 = 2048;
      v42 = (float)(v19 / 1000.0);
      v43 = 1024;
      v44 = v20;
      v21 = "AVCStreamOutput [%s] %s:%d @=@ Health: AVCStreamOutput StreamToken=%u mediaType=%s estimatedDataRate=%0.2fkb"
            "ps sampleBufferCount=%d";
      v22 = v16;
      v23 = 60;
    }
    else
    {
      if (ErrorLogLevelForModule < 6)
        goto LABEL_16;
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v26 = *(_QWORD *)(v11 + 32);
      v27 = FourccToCStr(MediaType);
      v28 = *(_DWORD *)(v11 + 104);
      LODWORD(time.value) = 136316418;
      *(CMTimeValue *)((char *)&time.value + 4) = v24;
      LOWORD(time.flags) = 2080;
      *(_QWORD *)((char *)&time.flags + 2) = "_AVCStreamOutput_DisplayHealthInfo";
      HIWORD(time.epoch) = 1024;
      v36 = 336;
      v37 = 1024;
      v38 = v26;
      v39 = 2080;
      v40 = v27;
      v41 = 1024;
      LODWORD(v42) = v28;
      v21 = "AVCStreamOutput [%s] %s:%d @=@ Health: AVCStreamOutput StreamToken=%u mediaType=%s sampleBufferCount=%d";
      v22 = v25;
      v23 = 50;
    }
    _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&time, v23);
LABEL_16:
    *v12 = v31;
    *(_QWORD *)(v11 + 72) = v32;
    *(_DWORD *)(v11 + 104) = 0;
  }
LABEL_17:
  *(_OWORD *)&time.value = *v6;
  time.epoch = *(_QWORD *)(a1 + 64);
  CMTimeGetSeconds(&time);
  kdebug_trace();
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "streamOutput:didReceiveSampleBuffer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v29 = *(const void **)(a1 + 40);
  if (v29)
    CFRelease(v29);
}

- (int)processID
{
  return self->_processID;
}

- (void)serviceHandlerDidDieWithArguments:(id)a3 error:(id)a4
{
  NSObject *delegateQueue;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCStreamOutput serviceHandlerDidDieWithArguments:error:].cold.1();
  }
  delegateQueue = self->_delegateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__AVCStreamOutput_serviceHandlerDidDieWithArguments_error___block_invoke;
  v6[3] = &unk_1E9E521C0;
  v6[4] = self;
  dispatch_async(delegateQueue, v6);
}

uint64_t __59__AVCStreamOutput_serviceHandlerDidDieWithArguments_error___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "streamOutputServerDidDie:", *(_QWORD *)(a1 + 32));
}

- (void)serviceHandlerDidPauseWithArguments:(id)a3 error:(id)a4
{
  -[AVCStreamOutput didPause:](self, "didPause:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceVideoPause"), a4), "BOOLValue"));
}

- (void)serviceHandlerDidStallWithArguments:(id)a3 error:(id)a4
{
  -[AVCStreamOutput didStall:](self, "didStall:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceIsRemoteMediaStalled"), a4), "BOOLValue"));
}

- (void)serviceHandlerDidDegradeWithArguments:(id)a3 error:(id)a4
{
  -[AVCStreamOutput didDegrade:](self, "didDegrade:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceIsVideoDegraded"), a4), "BOOLValue"));
}

- (void)serviceHandlerDidSuspendWithArguments:(id)a3 error:(id)a4
{
  -[AVCStreamOutput didSuspend:](self, "didSuspend:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("conferenceIsVideoSuspended"), a4), "BOOLValue"));
}

- (void)serviceHandlerDidReceiveFrameWithArguments:(id)a3 error:(id)a4
{
  CMSampleBufferRef v5;
  CMSampleBufferRef v6;

  if (a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamOutput serviceHandlerDidReceiveFrameWithArguments:error:].cold.2();
    }
  }
  else
  {
    v5 = VCStreamInputUtil_DecodeSampleBuffer((void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS")));
    if (v5)
    {
      v6 = v5;
      -[AVCStreamOutput didReceiveSampleBuffer:](self, "didReceiveSampleBuffer:", v5);
      CFRelease(v6);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCStreamOutput serviceHandlerDidReceiveFrameWithArguments:error:].cold.1();
    }
  }
}

- (void)registerBlocksForNotification
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke;
  v10[3] = &unk_1E9E52730;
  v10[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "conferenceDidServerDie", v10, self->_internalReceiverQueue);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_58;
  v9[3] = &unk_1E9E52730;
  v9[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "streamOutputDidRemoteVideoPause", v9, self->_internalReceiverQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_60;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "streamOutputDidRemoteMediaStall", v8, self->_internalReceiverQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_62;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "streamOutputDidVideoDegrade", v7, self->_internalReceiverQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_64;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "streamOutputDidVideoSuspend", v6, self->_internalReceiverQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_66;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "streamOutputDidReleaseRemoteVideoQueue", v5, self->_internalReceiverQueue);
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v6)
    {
      objc_msgSend(v6, "serviceHandlerDidDieWithArguments:error:", a2, a3);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_cold_1();
    }
  }
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_58(uint64_t a1, void *a2, uint64_t a3)
{
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
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      objc_msgSend(v5, "serviceHandlerDidPauseWithArguments:error:", a2, 0);
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
        v11 = "-[AVCStreamOutput registerBlocksForNotification]_block_invoke";
        v12 = 1024;
        v13 = 522;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_60(uint64_t a1, void *a2, uint64_t a3)
{
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
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      objc_msgSend(v5, "serviceHandlerDidStallWithArguments:error:", a2, 0);
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
        v11 = "-[AVCStreamOutput registerBlocksForNotification]_block_invoke";
        v12 = 1024;
        v13 = 534;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_62(uint64_t a1, void *a2, uint64_t a3)
{
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
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      objc_msgSend(v5, "serviceHandlerDidDegradeWithArguments:error:", a2, 0);
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
        v11 = "-[AVCStreamOutput registerBlocksForNotification]_block_invoke";
        v12 = 1024;
        v13 = 546;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_64(uint64_t a1, void *a2, uint64_t a3)
{
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
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      objc_msgSend(v5, "serviceHandlerDidSuspendWithArguments:error:", a2, 0);
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
        v11 = "-[AVCStreamOutput registerBlocksForNotification]_block_invoke";
        v12 = 1024;
        v13 = 558;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_66(uint64_t a1, void *a2, uint64_t a3)
{
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
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      objc_msgSend(v5, "serviceHandlerDidReleaseOutputQueueWithArguments:error:", a2, 0);
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
        v11 = "-[AVCStreamOutput registerBlocksForNotification]_block_invoke";
        v12 = 1024;
        v13 = 570;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: strongSelf == nil", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

- (void)deregisterBlocksForNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "conferenceDidServerDie");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "streamOutputDidReleaseRemoteVideoQueue");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "streamOutputDidVideoSuspend");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "streamOutputDidVideoDegrade");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "streamOutputDidRemoteMediaStall");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "streamOutputDidRemoteVideoPause");
}

- (void)terminateConnection
{
  if (self->_connection)
  {
    -[AVCStreamOutput deregisterBlocksForNotifications](self, "deregisterBlocksForNotifications");
    dispatch_sync((dispatch_queue_t)self->_internalReceiverQueue, &__block_literal_global_58);
    -[AVConferenceXPCClient sendMessageAsync:](self->_connection, "sendMessageAsync:", "streamOutputTerminate");

    self->_connection = 0;
  }
}

+ (id)errorWithStreamOutputError:(int64_t)a3
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((unint64_t)a3 < 0xFFFFFFFFFFFFFFF9)
  {
    v6 = 0;
    v5 = 32000;
  }
  else
  {
    v4 = 8 * a3 + 56;
    v5 = *(_QWORD *)((char *)&unk_1D910DB58 + v4);
    v6 = *(uint64_t *)((char *)off_1E9E568B8 + v4);
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", v5, a3, v6);
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (void)setIsDegraded:(BOOL)a3
{
  self->_isDegraded = a3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void)setIsSuspended:(BOOL)a3
{
  self->_isSuspended = a3;
}

- (BOOL)isStalled
{
  return self->_isStalled;
}

- (void)setIsStalled:(BOOL)a3
{
  self->_isStalled = a3;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (float)synchronizationTimeOffset
{
  return self->_synchronizationTimeOffset;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (OS_dispatch_queue)internalReceiverQueue
{
  return self->_internalReceiverQueue;
}

- (void)setInternalReceiverQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (void)initWithStreamToken:delegate:queue:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[AVCStreamOutput initWithStreamToken:delegate:queue:error:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to allocate the VCStreamOutput for streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[AVCStreamOutput initWithStreamToken:delegate:queue:error:]" >> 16, 145);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamToken:delegate:queue:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to setup the XPC connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamToken:delegate:queue:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to allocate receiver queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateAccessWithProcessName:accessControlPlist:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to retrieve the allow process name list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)validateAccess
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to get the current process name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createReceiverQueue
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Error creating internal Queue", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Failed to setup the remote queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)remoteQueueOperationHandlerWithError:operation:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Error received from the remote Queue %d", v2, v3, v4, 288);
  OUTLINED_FUNCTION_3();
}

- (void)setupRemoteQueueWithSenderQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Error making the receiver queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__AVCStreamOutput_setSynchronizationTimeOffset___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Support for the synchronizationTimeOffset property was discontinued", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerDidDieWithArguments:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: serverd died, notifying client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerDidReceiveFrameWithArguments:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d Could not decode SampleBuffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)serviceHandlerDidReceiveFrameWithArguments:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d XPC connection error=%@");
  OUTLINED_FUNCTION_3();
}

void __48__AVCStreamOutput_registerBlocksForNotification__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCStreamOutput [%s] %s:%d AVCStreamOutput: server died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
