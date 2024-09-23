@implementation AVCSession

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
  NSObject *delegateNotificationQueue;
  NSObject *stateQueue;
  uint64_t v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  AVCSession *v23;
  __int16 v24;
  AVCSession *v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v17 = v4;
        v18 = 2080;
        v19 = "-[AVCSession dealloc]";
        v20 = 1024;
        v21 = 79;
        v22 = 2112;
        v23 = -[AVCSession description](self, "description");
        v6 = " [%s] %s:%d %@";
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
      v3 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v17 = v9;
        v18 = 2080;
        v19 = "-[AVCSession dealloc]";
        v20 = 1024;
        v21 = 79;
        v22 = 2112;
        v23 = (AVCSession *)v3;
        v24 = 2048;
        v25 = self;
        v26 = 2112;
        v27 = -[AVCSession description](self, "description");
        v6 = " [%s] %s:%d %@(%p) %@";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }
  -[AVCSession setCapabilities:](self, "setCapabilities:", 0);
  -[AVCSession deregisterFromNotifications](self, "deregisterFromNotifications");
  -[AVCSessionParticipant setSharedXPCConnection:](self->_localParticipant, "setSharedXPCConnection:", 0);
  -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcSessionTerminate");
  objc_storeWeak(&self->_delegate, 0);

  delegateNotificationQueue = self->_delegateNotificationQueue;
  if (delegateNotificationQueue)
    dispatch_release(delegateNotificationQueue);
  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);

  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = v13;
      v18 = 2080;
      v19 = "-[AVCSession dealloc]";
      v20 = 1024;
      v21 = 100;
      v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-dealloc (%p)", buf, 0x26u);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)AVCSession;
  -[AVCSession dealloc](&v15, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: transportToken[%@] configuration[%@]"), NSStringFromClass(v4), self->_transportToken, self->_configuration);
}

- (id)dispatchedConfiguration
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  return (id)-[AVCSessionConfiguration copy](self->_configuration, "copy");
}

- (AVCSessionConfiguration)configuration
{
  NSObject *stateQueue;
  AVCSessionConfiguration *v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__39;
  v10 = __Block_byref_object_dispose__39;
  v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__AVCSession_configuration__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = (AVCSessionConfiguration *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__AVCSession_configuration__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dispatchedConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)remoteParticipants
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_remoteParticipants, "allValues");
}

- (void)setAudioMuted:(BOOL)a3
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
  _BYTE v13[24];
  __int128 v14;
  AVCSession *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setAudioMuted:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 128;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        v8 = " [%s] %s:%d Session change to muted[%d]";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setAudioMuted:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 128;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        v8 = " [%s] %s:%d %@(%p) Session change to muted[%d]";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setAudioMuted:](self->_localParticipant, "setAudioMuted:", v3, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16, v17);
}

- (void)setVolume:(float)a3
{
  const __CFString *v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  _BYTE v14[24];
  __int128 v15;
  AVCSession *v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 136315906;
        *(_QWORD *)&v14[4] = v7;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[AVCSession setVolume:]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 133;
        WORD2(v15) = 2048;
        *(double *)((char *)&v15 + 6) = a3;
        v9 = " [%s] %s:%d Session change to volume[%f]";
        v10 = v8;
        v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v14, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 136316418;
        *(_QWORD *)&v14[4] = v12;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[AVCSession setVolume:]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 133;
        WORD2(v15) = 2112;
        *(_QWORD *)((char *)&v15 + 6) = v5;
        HIWORD(v15) = 2048;
        v16 = self;
        LOWORD(v17) = 2048;
        *(double *)((char *)&v17 + 2) = a3;
        v9 = " [%s] %s:%d %@(%p) Session change to volume[%f]";
        v10 = v13;
        v11 = 58;
        goto LABEL_11;
      }
    }
  }
  *(float *)&v6 = a3;
  -[AVCSessionParticipant setVolume:](self->_localParticipant, "setVolume:", v6, *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, v17);
}

- (void)setOneToOneEnabled:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *stateQueue;
  _QWORD v14[5];
  BOOL v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  AVCSession *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v17 = v6;
        v18 = 2080;
        v19 = "-[AVCSession setOneToOneEnabled:]";
        v20 = 1024;
        v21 = 138;
        v22 = 1024;
        LODWORD(v23) = v3;
        v8 = " [%s] %s:%d Session change to oneToOneEnabled[%d]";
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
      v5 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v17 = v11;
        v18 = 2080;
        v19 = "-[AVCSession setOneToOneEnabled:]";
        v20 = 1024;
        v21 = 138;
        v22 = 2112;
        v23 = v5;
        v24 = 2048;
        v25 = self;
        v26 = 1024;
        v27 = v3;
        v8 = " [%s] %s:%d %@(%p) Session change to oneToOneEnabled[%d]";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  stateQueue = self->_stateQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __33__AVCSession_setOneToOneEnabled___block_invoke;
  v14[3] = &unk_1E9E521E8;
  v14[4] = self;
  v15 = v3;
  dispatch_async(stateQueue, v14);
}

void __33__AVCSession_setOneToOneEnabled___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  _QWORD v29[5];
  char v30;
  const __CFString *v31;
  uint64_t v32;
  uint8_t buf[4];
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
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isOneToOneModeEnabled");
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 32);
  if (v3 == v2)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_19;
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v10 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v34 = v8;
      v35 = 2080;
      v36 = "-[AVCSession setOneToOneEnabled:]_block_invoke";
      v37 = 1024;
      v38 = 141;
      v39 = 1024;
      LODWORD(v40) = v10;
      v11 = " [%s] %s:%d Session is already configure with oneToOneMode Enabled[%d]";
      v12 = v9;
      v13 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_19;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      v34 = v20;
      v35 = 2080;
      v36 = "-[AVCSession setOneToOneEnabled:]_block_invoke";
      v37 = 1024;
      v38 = 141;
      v39 = 2112;
      v40 = v6;
      v41 = 2048;
      v42 = v22;
      v43 = 1024;
      v44 = v23;
      v11 = " [%s] %s:%d %@(%p) Session is already configure with oneToOneMode Enabled[%d]";
      v12 = v21;
      v13 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_19:
    v24 = objc_msgSend(*(id *)(a1 + 32), "delegateNotificationQueue");
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __33__AVCSession_setOneToOneEnabled___block_invoke_12;
    v29[3] = &unk_1E9E521E8;
    v29[4] = *(_QWORD *)(a1 + 32);
    v30 = *(_BYTE *)(a1 + 40);
    dispatch_async(v24, v29);
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_25;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v16 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v34 = v14;
    v35 = 2080;
    v36 = "-[AVCSession setOneToOneEnabled:]_block_invoke_2";
    v37 = 1024;
    v38 = 149;
    v39 = 1024;
    LODWORD(v40) = v16;
    v17 = " [%s] %s:%d oneToOneModeEnabled[%d]";
    v18 = v15;
    v19 = 34;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_25;
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    v27 = *(_QWORD *)(a1 + 32);
    v28 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 136316418;
    v34 = v25;
    v35 = 2080;
    v36 = "-[AVCSession setOneToOneEnabled:]_block_invoke";
    v37 = 1024;
    v38 = 149;
    v39 = 2112;
    v40 = v7;
    v41 = 2048;
    v42 = v27;
    v43 = 1024;
    v44 = v28;
    v17 = " [%s] %s:%d %@(%p) oneToOneModeEnabled[%d]";
    v18 = v26;
    v19 = 54;
  }
  _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_25:
  v31 = CFSTR("vcSessionOneOnOneModeEnabled");
  v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionSetOneToOneEnabled", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
}

uint64_t __33__AVCSession_setOneToOneEnabled___block_invoke_12(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:oneToOneEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
  return result;
}

- (void)updateOneToOneModeEnabled:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AVCSession_updateOneToOneModeEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __40__AVCSession_updateOneToOneModeEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setOneToOneModeEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setAudioEnabled:(BOOL)a3
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
  _BYTE v13[24];
  __int128 v14;
  AVCSession *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setAudioEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 162;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        v8 = " [%s] %s:%d Session change to audio enabled[%d]";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setAudioEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 162;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        v8 = " [%s] %s:%d %@(%p) Session change to audio enabled[%d]";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setAudioEnabled:](self->_localParticipant, "setAudioEnabled:", v3, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16, v17);
}

- (void)setVideoEnabled:(BOOL)a3
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
  _BYTE v13[24];
  __int128 v14;
  AVCSession *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setVideoEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 167;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        v8 = " [%s] %s:%d Session change to video enabled[%d]";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setVideoEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 167;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        v8 = " [%s] %s:%d %@(%p) Session change to video enabled[%d]";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setVideoEnabled:](self->_localParticipant, "setVideoEnabled:", v3, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16, v17);
}

- (void)setScreenEnabled:(BOOL)a3
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
  _BYTE v13[24];
  __int128 v14;
  AVCSession *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setScreenEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 172;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        v8 = " [%s] %s:%d Session change to screen enabled[%d]";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setScreenEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 172;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        v8 = " [%s] %s:%d %@(%p) Session change to screen enabled[%d]";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setScreenEnabled:](self->_localParticipant, "setScreenEnabled:", v3, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16, v17);
}

- (void)setAudioPaused:(BOOL)a3
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
  _BYTE v13[24];
  __int128 v14;
  AVCSession *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setAudioPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 177;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        v8 = " [%s] %s:%d Session change to audio paused[%d]";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setAudioPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 177;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        v8 = " [%s] %s:%d %@(%p) Session change to audio paused[%d]";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setAudioPaused:](self->_localParticipant, "setAudioPaused:", v3, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16, v17);
}

- (void)setVideoPaused:(BOOL)a3
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
  _BYTE v13[24];
  __int128 v14;
  AVCSession *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setVideoPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 182;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        v8 = " [%s] %s:%d Session change to video paused[%d]";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[AVCSession setVideoPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 182;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        v8 = " [%s] %s:%d %@(%p) Session change to video paused[%d]";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setVideoPaused:](self->_localParticipant, "setVideoPaused:", v3, *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16, v17);
}

- (NSString)uuid
{
  return -[AVCSessionParticipant uuid](self->_localParticipant, "uuid");
}

- (NSData)negotiationData
{
  NSData *result;

  result = self->_cachedNegotiationData;
  if (!result)
  {
    result = (NSData *)-[AVCSession negotiationDataForProtocolVersion:](self, "negotiationDataForProtocolVersion:", 0);
    self->_cachedNegotiationData = result;
  }
  return result;
}

+ (int)mediaNegotiatorVersionWithNegotiationProtocolVersion:(unsigned int)a3
{
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("forceMediaNegotiatorVersion"), -1);
  if (v4 > 1)
  {
    if (a3 == 1)
      v7 = 1;
    else
      v7 = -1;
    if (a3)
      return v7;
    else
      return 0;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "+[AVCSession mediaNegotiatorVersionWithNegotiationProtocolVersion:]";
      v13 = 1024;
      v14 = 200;
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing mediaNegotiatorVersion=%d", (uint8_t *)&v9, 0x22u);
    }
  }
  return v4;
}

- (id)negotiationDataForProtocolVersion:(unsigned int)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = +[AVCSession mediaNegotiatorVersionWithNegotiationProtocolVersion:](AVCSession, "mediaNegotiatorVersionWithNegotiationProtocolVersion:");
  if ((_DWORD)v5 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCSession negotiationDataForProtocolVersion:].cold.1();
    }
    return 0;
  }
  else
  {
    v6 = +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:](VCSessionParticipant, "participantDataWithMediaNegotiatorVersion:participantData:", v5, -[AVCSessionParticipant negotiationData](self->_localParticipant, "negotiationData"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315906;
        v11 = v7;
        v12 = 2080;
        v13 = "-[AVCSession negotiationDataForProtocolVersion:]";
        v14 = 1024;
        v15 = 222;
        v16 = 1024;
        v17 = a3;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiation blob requested with protocol version=%d", (uint8_t *)&v10, 0x22u);
      }
    }
  }
  return v6;
}

- (id)negotiationDataForLoopbackParticipant
{
  id v2;
  void *v3;

  v2 = +[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", -[AVCSession negotiationDataForProtocolVersion:](self, "negotiationDataForProtocolVersion:", 1));
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v2);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), CFSTR("vcSessionParticipantKeyUUID"));
  return +[VCSessionParticipant participantDataWithParticipantInfo:](VCSessionParticipant, "participantDataWithParticipantInfo:", v3);
}

- (BOOL)isAudioPaused
{
  return -[AVCSessionParticipant isAudioPaused](self->_localParticipant, "isAudioPaused");
}

- (BOOL)isVideoPaused
{
  return -[AVCSessionParticipant isVideoPaused](self->_localParticipant, "isVideoPaused");
}

- (BOOL)isAudioEnabled
{
  return -[AVCSessionParticipant isAudioEnabled](self->_localParticipant, "isAudioEnabled");
}

- (BOOL)isVideoEnabled
{
  return -[AVCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled");
}

- (BOOL)isScreenEnabled
{
  return -[AVCSessionParticipant isScreenEnabled](self->_localParticipant, "isScreenEnabled");
}

- (BOOL)isAudioMuted
{
  if (VCFeatureFlagManager_SessionBasedMutingEnabled())
    return +[AVAudioClient isMicrophoneMuted](AVAudioClient, "isMicrophoneMuted");
  else
    return -[AVCSessionParticipant isAudioMuted](self->_localParticipant, "isAudioMuted");
}

- (float)volume
{
  float result;

  -[AVCSessionParticipant volume](self->_localParticipant, "volume");
  return result;
}

- (BOOL)isOneToOneEnabled
{
  NSObject *stateQueue;
  char v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -86;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AVCSession_isOneToOneEnabled__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__AVCSession_isOneToOneEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isOneToOneModeEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (AVCSessionDelegate)delegate
{
  return (AVCSessionDelegate *)objc_loadWeak(&self->_delegate);
}

- (tagAVCSessionPresentationInfo)presentationInfo
{
  NSObject *stateQueue;
  uint64_t *v5;
  CGSize v6;
  tagAVCSessionPresentationInfo *result;
  _QWORD block[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x5010000000;
  v12 = "";
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__AVCSession_presentationInfo__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v9;
  dispatch_sync(stateQueue, block);
  v5 = v10;
  v6 = (CGSize)*((_OWORD *)v10 + 3);
  retstr->var0.origin = (CGPoint)*((_OWORD *)v10 + 2);
  retstr->var0.size = v6;
  *(_OWORD *)&retstr->var1 = *((_OWORD *)v5 + 4);
  _Block_object_dispose(&v9, 8);
  return result;
}

__n128 __30__AVCSession_presentationInfo__block_invoke(uint64_t a1)
{
  void *v2;
  _OWORD *v3;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __n128 v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (v2)
  {
    objc_msgSend(v2, "avcSessionPresentationInfo");
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
  }
  v3 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
  result = v7;
  v3[2] = v5;
  v3[3] = v6;
  v3[4] = v7;
  return result;
}

- (void)setPresentationInfo:(tagAVCSessionPresentationInfo *)a3
{
  uint64_t v5;
  NSObject *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unsigned int var1;
  unsigned int var2;
  int var3;
  unsigned int *p_var2;
  CGSize *p_size;
  CGFloat *p_height;
  unsigned __int8 *p_var3;
  CGSize size;
  NSObject *stateQueue;
  __int128 v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  unsigned int v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  CGFloat v31;
  uint64_t v32;
  double v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  int v37;
  _QWORD block[5];
  CGPoint origin;
  CGSize v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  CGFloat v49;
  __int16 v50;
  AVCSession *v51;
  __int16 v52;
  CGFloat v53;
  __int16 v54;
  CGFloat v55;
  __int16 v56;
  unsigned int v57;
  __int16 v58;
  unsigned int v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      x = a3->var0.origin.x;
      y = a3->var0.origin.y;
      width = a3->var0.size.width;
      height = a3->var0.size.height;
      var1 = a3->var1;
      var2 = a3->var2;
      var3 = a3->var3;
      *(_DWORD *)buf = 136317442;
      v43 = v5;
      v44 = 2080;
      v45 = "-[AVCSession setPresentationInfo:]";
      v46 = 1024;
      v47 = 292;
      v48 = 2048;
      v49 = x;
      v50 = 2048;
      v51 = *(AVCSession **)&y;
      v52 = 2048;
      v53 = width;
      v54 = 2048;
      v55 = height;
      v56 = 1024;
      v57 = var1;
      v58 = 1024;
      v59 = var2;
      v60 = 1024;
      v61 = var3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] Receivieng presentation info: rect=[%f, %f, %f, %f] didplayID=%u layout=%d state=%u", buf, 0x56u);
    }
  }
  p_var2 = &a3->var2;
  if (!a3->var2)
  {
    p_size = &a3->var0.size;
    if (a3->var0.size.width <= 0.0)
    {
      if ((AVCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCSession setPresentationInfo:].cold.1();
        }
        return;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        *(double *)&v22 = COERCE_DOUBLE(-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix));
      else
        *(double *)&v22 = COERCE_DOUBLE(&stru_1E9E58EE0);
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v31 = p_size->width;
      *(_DWORD *)buf = 136316418;
      v43 = v29;
      v44 = 2080;
      v45 = "-[AVCSession setPresentationInfo:]";
      v46 = 1024;
      v47 = 294;
      v48 = 2112;
      v49 = *(double *)&v22;
      v50 = 2048;
      v51 = self;
      v52 = 2048;
      v53 = v31;
      v28 = " [%s] %s:%d %@(%p) Invalid display width=%f";
    }
    else
    {
      p_height = &a3->var0.size.height;
      if (a3->var0.size.height > 0.0)
      {
        p_var3 = &a3->var3;
        if (a3->var3 < 4u)
        {
          block[1] = 3221225472;
          size = a3->var0.size;
          origin = a3->var0.origin;
          stateQueue = self->_stateQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[2] = __34__AVCSession_setPresentationInfo___block_invoke;
          block[3] = &unk_1E9E56780;
          block[4] = self;
          v20 = *(_OWORD *)&a3->var1;
          v40 = size;
          v41 = v20;
          dispatch_async(stateQueue, block);
          return;
        }
        if ((AVCSession *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCSession setPresentationInfo:].cold.3();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            *(double *)&v24 = COERCE_DOUBLE(-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix));
          else
            *(double *)&v24 = COERCE_DOUBLE(&stru_1E9E58EE0);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v36 = VRTraceErrorLogLevelToCSTR();
            v26 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v37 = *p_var3;
              *(_DWORD *)buf = 136316418;
              v43 = v36;
              v44 = 2080;
              v45 = "-[AVCSession setPresentationInfo:]";
              v46 = 1024;
              v47 = 296;
              v48 = 2112;
              v49 = *(double *)&v24;
              v50 = 2048;
              v51 = self;
              v52 = 1024;
              LODWORD(v53) = v37;
              v28 = " [%s] %s:%d %@(%p) Invalid state=%u";
              goto LABEL_51;
            }
          }
        }
        return;
      }
      if ((AVCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCSession setPresentationInfo:].cold.2();
        }
        return;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        *(double *)&v23 = COERCE_DOUBLE(-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix));
      else
        *(double *)&v23 = COERCE_DOUBLE(&stru_1E9E58EE0);
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v32 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      v33 = *p_height;
      *(_DWORD *)buf = 136316418;
      v43 = v32;
      v44 = 2080;
      v45 = "-[AVCSession setPresentationInfo:]";
      v46 = 1024;
      v47 = 295;
      v48 = 2112;
      v49 = *(double *)&v23;
      v50 = 2048;
      v51 = self;
      v52 = 2048;
      v53 = v33;
      v28 = " [%s] %s:%d %@(%p) Invalid display height=%f";
    }
    v34 = v30;
    v35 = 58;
LABEL_52:
    _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, v28, buf, v35);
    return;
  }
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCSession setPresentationInfo:].cold.4();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      *(double *)&v21 = COERCE_DOUBLE(-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix));
    else
      *(double *)&v21 = COERCE_DOUBLE(&stru_1E9E58EE0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v27 = *p_var2;
        *(_DWORD *)buf = 136316418;
        v43 = v25;
        v44 = 2080;
        v45 = "-[AVCSession setPresentationInfo:]";
        v46 = 1024;
        v47 = 293;
        v48 = 2112;
        v49 = *(double *)&v21;
        v50 = 2048;
        v51 = self;
        v52 = 1024;
        LODWORD(v53) = v27;
        v28 = " [%s] %s:%d %@(%p) Invalid layout=%u";
LABEL_51:
        v34 = v26;
        v35 = 54;
        goto LABEL_52;
      }
    }
  }
}

void __34__AVCSession_setPresentationInfo___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _OWORD v7[3];
  __int128 __s1;
  __int128 v9;
  __int128 v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  __s1 = xmmword_1D9110C30;
  v9 = unk_1D9110C40;
  v10 = xmmword_1D9110C50;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (v2)
  {
    objc_msgSend(v2, "avcSessionPresentationInfo");
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    __s1 = 0u;
  }
  if (memcmp(&__s1, (const void *)(a1 + 40), 0x30uLL))
  {
    v3 = *(_OWORD *)(a1 + 56);
    v7[0] = *(_OWORD *)(a1 + 40);
    v7[1] = v3;
    v7[2] = *(_OWORD *)(a1 + 72);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setAvcSessionPresentationInfo:", v7);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "description");
        *(_DWORD *)buf = 136315906;
        v12 = v4;
        v13 = 2080;
        v14 = "-[AVCSession setPresentationInfo:]_block_invoke";
        v15 = 1024;
        v16 = 306;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] Presentation info updated: %@", buf, 0x26u);
      }
    }
  }
}

- (id)initPrivateWithTransportToken:(id)a3 configuration:(id)a4 negotiationData:(id)a5 delegate:(id)a6 queue:(id)a7
{
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  AVCSession *v21;
  NSObject *CustomRootQueue;
  void *v23;
  AVCSessionConfiguration *configuration;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  AVCSessionParticipant *v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  AVCSessionParticipant *localParticipant;
  OS_dispatch_queue *stateQueue;
  VCXPCClientShared *connection;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  uint64_t v40;
  NSObject *v41;
  AVCSessionParticipant *v42;
  OS_dispatch_queue *v43;
  VCXPCClientShared *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  uint32_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  objc_super v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  id v72;
  __int16 v73;
  AVCSession *v74;
  __int16 v75;
  id v76;
  __int16 v77;
  OS_dispatch_queue *v78;
  __int16 v79;
  VCXPCClientShared *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  VRTraceReset();
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v66 = v14;
        v67 = 2080;
        v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
        v69 = 1024;
        v70 = 318;
        v71 = 2112;
        v72 = a3;
        v16 = " [%s] %s:%d transportToken[%@]";
        v17 = v15;
        v18 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v66 = v19;
        v67 = 2080;
        v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
        v69 = 1024;
        v70 = 318;
        v71 = 2112;
        v72 = (id)v13;
        v73 = 2048;
        v74 = self;
        v75 = 2112;
        v76 = a3;
        v16 = " [%s] %s:%d %@(%p) transportToken[%@]";
        v17 = v20;
        v18 = 58;
        goto LABEL_11;
      }
    }
  }
  v64.receiver = self;
  v64.super_class = (Class)AVCSession;
  v21 = -[AVCSession init](&v64, sel_init);
  if (!v21)
    return v21;
  if (VCDefaults_GetBoolValueForKey(CFSTR("forceLoopback"), 0))
    a3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), CFSTR("loopback:"), arc4random());
  if (a3)
  {
    if (a4
      && objc_msgSend(a4, "parentNWActivity")
      && (objc_msgSend(a4, "parentNWActivity"), (nw_activity_is_activated() & 1) == 0))
    {
      if ((AVCSession *)objc_opt_class() == v21)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:].cold.4();
        }
        goto LABEL_82;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v52 = (const __CFString *)-[AVCSession performSelector:](v21, "performSelector:", sel_logPrefix);
      else
        v52 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v61 = VRTraceErrorLogLevelToCSTR();
        v54 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v66 = v61;
          v67 = 2080;
          v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
          v69 = 1024;
          v70 = 328;
          v71 = 2112;
          v72 = (id)v52;
          v73 = 2048;
          v74 = v21;
          v55 = " [%s] %s:%d %@(%p) Non-nil parentNWActivity is unactivated!";
          goto LABEL_80;
        }
      }
    }
    else
    {
      v21->_transportToken = (NSString *)a3;
      v21->_configuration = (AVCSessionConfiguration *)a4;
      v21->_connection = objc_alloc_init(VCXPCClientShared);
      v21->_remoteParticipants = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v21->_participantsToAdd = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      v21->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCSession.stateQueue", 0, CustomRootQueue);
      v21->_presentationInfo = objc_alloc_init(VCSessionPresentationInfo);
      v21->_cachedNegotiationData = (NSData *)a5;
      objc_storeWeak(&v21->_delegate, a6);
      -[AVCSession setupNotificationQueue:](v21, "setupNotificationQueue:", a7);
      -[AVCSession registerBlocksForNotifications](v21, "registerBlocksForNotifications");
      v23 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v23, "setObject:forKeyedSubscript:", a3, CFSTR("vcSessionIDSDestination"));
      configuration = v21->_configuration;
      if (configuration)
        objc_msgSend(v23, "setObject:forKeyedSubscript:", -[AVCSessionConfiguration dictionary](configuration, "dictionary"), CFSTR("vcSessionConfiguration"));
      if (a5)
        objc_msgSend(v23, "setObject:forKeyedSubscript:", a5, CFSTR("vcSessionParticipantData"));
      v25 = -[AVConferenceXPCClient sendMessageSync:arguments:](v21->_connection, "sendMessageSync:arguments:", "vcSessionInitialize", v23);
      v26 = (void *)objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded"));
      v21->_uuid = (NSString *)(id)objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("vcSessionUUID"));
      if ((objc_msgSend(v26, "BOOLValue") & 1) != 0)
      {
        v27 = objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantData"));
        v28 = -[AVConferenceXPCClient newNSDictionaryFromNSDictionary:](v21->_connection, "newNSDictionaryFromNSDictionary:", objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("vcSessionParameterStreamTokens")));
        if (v28)
        {
          v29 = v28;
          v30 = -[AVCSessionParticipant initWithParticipantID:data:delegate:queue:]([AVCSessionParticipant alloc], "initWithParticipantID:data:delegate:queue:", 0, v27, v21, 0);
          v21->_localParticipant = v30;
          -[AVCSessionParticipant setStateQueue:](v30, "setStateQueue:", v21->_stateQueue);
          -[AVCSessionParticipant setStreamTokens:](v21->_localParticipant, "setStreamTokens:", v29);
          if ((AVCSession *)objc_opt_class() == v21)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() <= 6
              || (v32 = VRTraceErrorLogLevelToCSTR(),
                  v33 = *MEMORY[0x1E0CF2758],
                  !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
            {
LABEL_36:
              v21->_sessionToken = objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("vcSessionToken")), "integerValue");
              v21->_capabilities = (NSDictionary *)(id)objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("vcSessionCapabilities"));
              MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-init");
              if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
              {
                v45 = VRTraceErrorLogLevelToCSTR();
                v46 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  v47 = -[AVCSessionParticipant uuid](v21->_localParticipant, "uuid");
                  *(_DWORD *)buf = 136316418;
                  v66 = v45;
                  v67 = 2080;
                  v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
                  v69 = 1024;
                  v70 = 377;
                  v71 = 2048;
                  v72 = v21;
                  v73 = 2112;
                  v74 = (AVCSession *)v47;
                  v75 = 2112;
                  v76 = a3;
                  _os_log_impl(&dword_1D8A54000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-init (%p) localParticipantID=%@, transportToken=%@", buf, 0x3Au);
                }
              }
              return v21;
            }
            localParticipant = v21->_localParticipant;
            stateQueue = v21->_stateQueue;
            connection = v21->_connection;
            *(_DWORD *)buf = 136316418;
            v66 = v32;
            v67 = 2080;
            v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
            v69 = 1024;
            v70 = 366;
            v71 = 2048;
            v72 = localParticipant;
            v73 = 2048;
            v74 = (AVCSession *)stateQueue;
            v75 = 2048;
            v76 = connection;
            v37 = " [%s] %s:%d localParticipant [%p] has been created and stateQueue [%p] and shared xpc connection [%p] have been set";
            v38 = v33;
            v39 = 58;
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v31 = (const __CFString *)-[AVCSession performSelector:](v21, "performSelector:", sel_logPrefix);
            else
              v31 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 7)
              goto LABEL_36;
            v40 = VRTraceErrorLogLevelToCSTR();
            v41 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              goto LABEL_36;
            v42 = v21->_localParticipant;
            v43 = v21->_stateQueue;
            v44 = v21->_connection;
            *(_DWORD *)buf = 136316930;
            v66 = v40;
            v67 = 2080;
            v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
            v69 = 1024;
            v70 = 366;
            v71 = 2112;
            v72 = (id)v31;
            v73 = 2048;
            v74 = v21;
            v75 = 2048;
            v76 = v42;
            v77 = 2048;
            v78 = v43;
            v79 = 2048;
            v80 = v44;
            v37 = " [%s] %s:%d %@(%p) localParticipant [%p] has been created and stateQueue [%p] and shared xpc connectio"
                  "n [%p] have been set";
            v38 = v41;
            v39 = 78;
          }
          _os_log_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
          goto LABEL_36;
        }
        if ((AVCSession *)objc_opt_class() == v21)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:].cold.2();
          }
          goto LABEL_82;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v51 = (const __CFString *)-[AVCSession performSelector:](v21, "performSelector:", sel_logPrefix);
        else
          v51 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v60 = VRTraceErrorLogLevelToCSTR();
          v54 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v66 = v60;
            v67 = 2080;
            v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
            v69 = 1024;
            v70 = 360;
            v71 = 2112;
            v72 = (id)v51;
            v73 = 2048;
            v74 = v21;
            v55 = " [%s] %s:%d %@(%p) Failed to retrieve stream token mapping";
            goto LABEL_80;
          }
        }
      }
      else
      {
        if ((AVCSession *)objc_opt_class() == v21)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:].cold.3();
          }
          goto LABEL_82;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v50 = (const __CFString *)-[AVCSession performSelector:](v21, "performSelector:", sel_logPrefix);
        else
          v50 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v56 = VRTraceErrorLogLevelToCSTR();
          v57 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v66 = v56;
            v67 = 2080;
            v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
            v69 = 1024;
            v70 = 356;
            v71 = 2112;
            v72 = (id)v50;
            v73 = 2048;
            v74 = v21;
            v75 = 2112;
            v76 = a3;
            v55 = " [%s] %s:%d %@(%p) failed transportToken[%@]";
            v58 = v57;
            v59 = 58;
LABEL_81:
            _os_log_error_impl(&dword_1D8A54000, v58, OS_LOG_TYPE_ERROR, v55, buf, v59);
          }
        }
      }
    }
  }
  else
  {
    if ((AVCSession *)objc_opt_class() == v21)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:].cold.1();
      }
      goto LABEL_82;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v49 = (const __CFString *)-[AVCSession performSelector:](v21, "performSelector:", sel_logPrefix);
    else
      v49 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v53 = VRTraceErrorLogLevelToCSTR();
      v54 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v66 = v53;
        v67 = 2080;
        v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
        v69 = 1024;
        v70 = 325;
        v71 = 2112;
        v72 = (id)v49;
        v73 = 2048;
        v74 = v21;
        v55 = " [%s] %s:%d %@(%p) Transport token is nil";
LABEL_80:
        v58 = v54;
        v59 = 48;
        goto LABEL_81;
      }
    }
  }
LABEL_82:

  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v62 = VRTraceErrorLogLevelToCSTR();
    v63 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v66 = v62;
      v67 = 2080;
      v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
      v69 = 1024;
      v70 = 375;
      v71 = 2048;
      v72 = 0;
      _os_log_impl(&dword_1D8A54000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-init (%p)", buf, 0x26u);
    }
  }
  return 0;
}

- (void)setMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
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
  AVCSession *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136316162;
        *(_QWORD *)&v15[4] = v8;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[AVCSession setMediaState:forMediaType:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 386;
        WORD2(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 6) = v4;
        WORD5(v16) = 1024;
        HIDWORD(v16) = v5;
        v10 = " [%s] %s:%d Session change to media type=%d state=%d";
        v11 = v9;
        v12 = 40;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v15 = 136316674;
        *(_QWORD *)&v15[4] = v13;
        *(_WORD *)&v15[12] = 2080;
        *(_QWORD *)&v15[14] = "-[AVCSession setMediaState:forMediaType:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 386;
        WORD2(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 6) = v7;
        HIWORD(v16) = 2048;
        v17 = self;
        LOWORD(v18) = 1024;
        *(_DWORD *)((char *)&v18 + 2) = v4;
        HIWORD(v18) = 1024;
        LODWORD(v19) = v5;
        v10 = " [%s] %s:%d %@(%p) Session change to media type=%d state=%d";
        v11 = v14;
        v12 = 60;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setMediaState:forMediaType:](self->_localParticipant, "setMediaState:forMediaType:", v5, v4, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18, v19);
}

- (unsigned)mediaStateForMediaType:(unsigned int)a3
{
  return -[AVCSessionParticipant mediaStateForMediaType:](self->_localParticipant, "mediaStateForMediaType:", *(_QWORD *)&a3);
}

- (int64_t)streamTokenForStreamGroupID:(unsigned int)a3
{
  return -[AVCSessionParticipant streamTokenForStreamGroupID:](self->_localParticipant, "streamTokenForStreamGroupID:", *(_QWORD *)&a3);
}

- (AVCSession)initWithTransportToken:(id)a3 configuration:(id)a4 delegate:(id)a5 queue:(id)a6
{
  return (AVCSession *)-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:](self, "initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:", a3, a4, 0, a5, a6);
}

- (void)addParticipant:(id)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  AVCSession *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v17[0] = a3;
    -[AVCSession addParticipants:](self, "addParticipants:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1));
  }
  else if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCSession addParticipant:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v7 = 136316162;
        v8 = v5;
        v9 = 2080;
        v10 = "-[AVCSession addParticipant:]";
        v11 = 1024;
        v12 = 416;
        v13 = 2112;
        v14 = v4;
        v15 = 2048;
        v16 = self;
        _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to add nil participant", (uint8_t *)&v7, 0x30u);
      }
    }
  }
}

- (void)addParticipants:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__AVCSession_addParticipants___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __30__AVCSession_addParticipants___block_invoke(uint64_t a1)
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
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  unint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  int *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(const __CFString **)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v41 = v3;
        v42 = 2080;
        v43 = "-[AVCSession addParticipants:]_block_invoke";
        v44 = 1024;
        v45 = 442;
        v46 = 2112;
        v47 = v5;
        v6 = " [%s] %s:%d participants[%@]";
        v7 = v4;
        v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
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
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v41 = v9;
        v42 = 2080;
        v43 = "-[AVCSession addParticipants:]_block_invoke";
        v44 = 1024;
        v45 = 442;
        v46 = 2112;
        v47 = v2;
        v48 = 2048;
        v49 = v11;
        v50 = 2112;
        v51 = v12;
        v6 = " [%s] %s:%d %@(%p) participants[%@]";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v14 = *(void **)(a1 + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
  v17 = 0x1E0C99000uLL;
  if (v15)
  {
    v18 = v15;
    v19 = &dword_1D8A54000;
    v32 = *(_QWORD *)v37;
    *(_QWORD *)&v16 = 136316162;
    v30 = v16;
    do
    {
      v20 = 0;
      v31 = v18;
      do
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v20);
        MEMORY[0x1DF087EB8](v19, "@:@ AVCSession-addParticipants");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v24 = v19;
            v25 = v17;
            v26 = v14;
            v27 = v13;
            v28 = *(const __CFString **)(a1 + 32);
            v29 = objc_msgSend(v21, "description");
            *(_DWORD *)buf = v30;
            v41 = v22;
            v42 = 2080;
            v43 = "-[AVCSession addParticipants:]_block_invoke";
            v44 = 1024;
            v45 = 446;
            v46 = 2048;
            v47 = v28;
            v13 = v27;
            v14 = v26;
            v17 = v25;
            v19 = v24;
            v18 = v31;
            v48 = 2112;
            v49 = v29;
            _os_log_impl(v19, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-addParticipants (%p) %@", buf, 0x30u);
          }
        }
        objc_msgSend(v21, "setStateQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), v30);
        if (objc_msgSend(*(id *)(a1 + 32), "validateParticipantToAdd:", v21))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v21, objc_msgSend(v21, "uuid"));
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(v17 + 3456), "dictionaryWithDictionary:", objc_msgSend(v21, "config")));
        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    }
    while (v18);
  }
  if (objc_msgSend(v13, "count"))
  {
    v33 = CFSTR("vcSessionParticipantConfigs");
    v34 = v13;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionAddParticipants", objc_msgSend(*(id *)(v17 + 3456), "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
  }

}

- (BOOL)validateParticipantToAdd:(id)a3
{
  BOOL v5;
  id v6;
  NSObject *delegateNotificationQueue;
  _QWORD block[8];

  block[7] = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipants, "objectForKeyedSubscript:", objc_msgSend(a3, "uuid"))&& !-[NSMutableDictionary objectForKeyedSubscript:](self->_participantsToAdd, "objectForKeyedSubscript:", objc_msgSend(a3, "uuid")))
  {
    return 1;
  }
  v5 = 1;
  v6 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCSession.m", 476), 0);
  if (v6)
  {
    delegateNotificationQueue = self->_delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__AVCSession_validateParticipantToAdd___block_invoke;
    block[3] = &unk_1E9E527D0;
    block[4] = self;
    block[5] = a3;
    block[6] = v6;
    dispatch_async(delegateNotificationQueue, block);
    return 0;
  }
  return v5;
}

uint64_t __39__AVCSession_validateParticipantToAdd___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:addParticipant:didSucceed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (BOOL)validateParticipantToRemove:(id)a3
{
  uint64_t v5;
  NSObject *delegateNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipants, "objectForKeyedSubscript:", objc_msgSend(a3, "uuid"));
  if (!v5)
  {
    delegateNotificationQueue = self->_delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__AVCSession_validateParticipantToRemove___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(delegateNotificationQueue, block);
  }
  return v5 != 0;
}

uint64_t __42__AVCSession_validateParticipantToRemove___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:removeParticipant:didSucceed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCSession.m", 491), 0));
}

- (void)removeParticipant:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  -[AVCSession removeParticipants:](self, "removeParticipants:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1));
}

- (void)removeParticipants:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AVCSession_removeParticipants___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __33__AVCSession_removeParticipants___block_invoke(uint64_t a1)
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
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  __int128 v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(const __CFString **)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v36 = v3;
        v37 = 2080;
        v38 = "-[AVCSession removeParticipants:]_block_invoke";
        v39 = 1024;
        v40 = 505;
        v41 = 2112;
        v42 = v5;
        v6 = " [%s] %s:%d participantIDs[%@]";
        v7 = v4;
        v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
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
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v36 = v9;
        v37 = 2080;
        v38 = "-[AVCSession removeParticipants:]_block_invoke";
        v39 = 1024;
        v40 = 505;
        v41 = 2112;
        v42 = v2;
        v43 = 2048;
        v44 = v11;
        v45 = 2112;
        v46 = v12;
        v6 = " [%s] %s:%d %@(%p) participantIDs[%@]";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = *(void **)(a1 + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v15)
  {
    v17 = v15;
    v27 = *(_QWORD *)v32;
    *(_QWORD *)&v16 = 136316162;
    v25 = v16;
    v26 = v14;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-removeParticipants");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v22 = v13;
            v23 = *(const __CFString **)(a1 + 32);
            v24 = objc_msgSend(v19, "description");
            *(_DWORD *)buf = v25;
            v36 = v20;
            v37 = 2080;
            v38 = "-[AVCSession removeParticipants:]_block_invoke";
            v39 = 1024;
            v40 = 510;
            v41 = 2048;
            v42 = v23;
            v13 = v22;
            v14 = v26;
            v43 = 2112;
            v44 = v24;
            _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-removeParticipants (%p) %@", buf, 0x30u);
          }
        }
        if (objc_msgSend(*(id *)(a1 + 32), "validateParticipantToRemove:", v19, v25, v26))
        {
          objc_msgSend(v13, "addObject:", objc_msgSend(v19, "uuid"));
          objc_msgSend(v19, "setStateQueue:", 0);
        }
      }
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    }
    while (v17);
  }
  if (objc_msgSend(v13, "count"))
  {
    v28 = CFSTR("vcSessionParticipantIDs");
    v29 = v13;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionRemoveParticipants", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  }

}

- (void)start
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __19__AVCSession_start__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __19__AVCSession_start__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  _BYTE v19[24];
  __int128 v20;
  _BYTE v21[10];
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  uint64_t v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() != *(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v19 = 136316162;
    *(_QWORD *)&v19[4] = v8;
    *(_WORD *)&v19[12] = 2080;
    *(_QWORD *)&v19[14] = "-[AVCSession start]_block_invoke";
    *(_WORD *)&v19[22] = 1024;
    LODWORD(v20) = 533;
    WORD2(v20) = 2112;
    *(_QWORD *)((char *)&v20 + 6) = v2;
    HIWORD(v20) = 2048;
    *(_QWORD *)v21 = v10;
    v5 = " [%s] %s:%d %@(%p) ";
    v6 = v9;
    v7 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 136315650;
      *(_QWORD *)&v19[4] = v3;
      *(_WORD *)&v19[12] = 2080;
      *(_QWORD *)&v19[14] = "-[AVCSession start]_block_invoke";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 533;
      v5 = " [%s] %s:%d ";
      v6 = v4;
      v7 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v5, v19, v7);
    }
  }
LABEL_12:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setSharedXPCConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, *(_QWORD *)v21);
  v32 = CFSTR("vcSessionLocalParticipantConfig");
  v33[0] = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "config");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionStart", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1));
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dispatchedMediaStateForMediaType:", 0);
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dispatchedMediaStateForMediaType:", 1);
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dispatchedMediaStateForMediaType:", 2);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = objc_msgSend(*(id *)(v16 + 24), "isAudioMuted");
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)v19 = 136317698;
      *(_QWORD *)&v19[4] = v14;
      *(_WORD *)&v19[12] = 2080;
      *(_QWORD *)&v19[14] = "-[AVCSession start]_block_invoke";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 540;
      WORD2(v20) = 2048;
      *(_QWORD *)((char *)&v20 + 6) = v16;
      HIWORD(v20) = 1024;
      *(_DWORD *)v21 = v11 != 0;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v11 == 2;
      v22 = 1024;
      v23 = v17;
      v24 = 1024;
      v25 = v12 != 0;
      v26 = 1024;
      v27 = v12 == 2;
      v28 = 1024;
      v29 = v13 != 0;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-start (%p) audioEnabled=%d, audioPaused=%d, audioMuted=%d, videoEnabled=%d, videoPaused=%d, screenEnabled=%d, configuration=%@", v19, 0x54u);
    }
  }
}

- (void)stop
{
  -[AVCSession stopWithError:](self, "stopWithError:", 0);
}

- (void)stopWithError:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__AVCSession_stopWithError___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __28__AVCSession_stopWithError___block_invoke(uint64_t a1)
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[3];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v5 = *(const __CFString **)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v24 = v3;
    v25 = 2080;
    v26 = "-[AVCSession stopWithError:]_block_invoke";
    v27 = 1024;
    v28 = 550;
    v29 = 2112;
    v30 = v5;
    v6 = " [%s] %s:%d stopError:%@";
    v7 = v4;
    v8 = 38;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
  else
    v2 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      v24 = v9;
      v25 = 2080;
      v26 = "-[AVCSession stopWithError:]_block_invoke";
      v27 = 1024;
      v28 = 550;
      v29 = 2112;
      v30 = v2;
      v31 = 2048;
      v32 = v11;
      v33 = 2112;
      v34 = v12;
      v6 = " [%s] %s:%d %@(%p) stopError:%@";
      v7 = v10;
      v8 = 58;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  v13 = *(void **)(a1 + 40);
  if (v13)
  {
    v21[0] = CFSTR("ERROR_DOMAIN");
    v22[0] = objc_msgSend(v13, "domain");
    v21[1] = CFSTR("ERROR_CODE");
    v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    v21[2] = CFSTR("ERROR_USERINFO");
    v22[2] = objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v19 = CFSTR("vcSessionError");
    v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionStop", v14);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(const __CFString **)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v24 = v15;
      v25 = 2080;
      v26 = "-[AVCSession stopWithError:]_block_invoke";
      v27 = 1024;
      v28 = 559;
      v29 = 2048;
      v30 = v17;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-stop (%p) error=%@", buf, 0x30u);
    }
  }
}

- (void)updateConfiguration:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AVCSession_updateConfiguration___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __34__AVCSession_updateConfiguration___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[24];
  __int128 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() != *(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v16 = 136316162;
    *(_QWORD *)&v16[4] = v8;
    *(_WORD *)&v16[12] = 2080;
    *(_QWORD *)&v16[14] = "-[AVCSession updateConfiguration:]_block_invoke";
    *(_WORD *)&v16[22] = 1024;
    LODWORD(v17) = 565;
    WORD2(v17) = 2112;
    *(_QWORD *)((char *)&v17 + 6) = v2;
    HIWORD(v17) = 2048;
    v18 = v10;
    v5 = " [%s] %s:%d %@(%p) ";
    v6 = v9;
    v7 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v16 = 136315650;
      *(_QWORD *)&v16[4] = v3;
      *(_WORD *)&v16[12] = 2080;
      *(_QWORD *)&v16[14] = "-[AVCSession updateConfiguration:]_block_invoke";
      *(_WORD *)&v16[22] = 1024;
      LODWORD(v17) = 565;
      v5 = " [%s] %s:%d ";
      v6 = v4;
      v7 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v5, v16, v7);
    }
  }
LABEL_12:
  v21 = CFSTR("vcSessionConfiguration");
  v22[0] = objc_msgSend(*(id *)(a1 + 40), "dictionary", *(_OWORD *)v16, *(_QWORD *)&v16[16], v17, v18);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionUpdateConfiguration", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-updateConfiguration");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(v13 + 32);
      *(_DWORD *)v16 = 136316418;
      *(_QWORD *)&v16[4] = v11;
      *(_WORD *)&v16[12] = 2080;
      *(_QWORD *)&v16[14] = "-[AVCSession updateConfiguration:]_block_invoke";
      *(_WORD *)&v16[22] = 1024;
      LODWORD(v17) = 569;
      WORD2(v17) = 2048;
      *(_QWORD *)((char *)&v17 + 6) = v13;
      HIWORD(v17) = 2112;
      v18 = v15;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-updateConfiguration (%p) currentConfiguration=%@, newConfiguration=%@", v16, 0x3Au);
    }
  }
}

- (void)beginParticipantConfiguration
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__AVCSession_beginParticipantConfiguration__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __43__AVCSession_beginParticipantConfiguration__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _BYTE v19[128];
  __int128 v20;
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
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120);
        *(_DWORD *)buf = 136315906;
        v25 = v3;
        v26 = 2080;
        v27 = "-[AVCSession beginParticipantConfiguration]_block_invoke";
        v28 = 1024;
        v29 = 575;
        v30 = 1024;
        LODWORD(v31) = v5;
        v6 = " [%s] %s:%d _activeConfigurationCount=%d";
        v7 = v4;
        v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
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
        v12 = *(_DWORD *)(v11 + 120);
        *(_DWORD *)buf = 136316418;
        v25 = v9;
        v26 = 2080;
        v27 = "-[AVCSession beginParticipantConfiguration]_block_invoke";
        v28 = 1024;
        v29 = 575;
        v30 = 2112;
        v31 = v2;
        v32 = 2048;
        v33 = v11;
        v34 = 1024;
        v35 = v12;
        v6 = " [%s] %s:%d %@(%p) _activeConfigurationCount=%d";
        v7 = v10;
        v8 = 54;
        goto LABEL_11;
      }
    }
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v13 + 120))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = (void *)objc_msgSend(*(id *)(v13 + 8), "allValues");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "setConfigurationInProgress:", 1);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      }
      while (v16);
    }
  }
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 120);
}

- (void)appendConfigurationToXPCArguments:(id)a3
{
  id v5;

  if (-[VCSessionPresentationInfo hasPendingChanges](self->_presentationInfo, "hasPendingChanges"))
  {
    v5 = -[VCSessionPresentationInfo serialize](self->_presentationInfo, "serialize");
    if (v5)
      objc_msgSend(a3, "setObject:forKeyedSubscript:", v5, CFSTR("vcSessionPresentationInfo"));
  }
}

- (void)endParticipantConfiguration
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__AVCSession_endParticipantConfiguration__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __41__AVCSession_endParticipantConfiguration__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120);
        *(_DWORD *)buf = 136315906;
        v30 = v3;
        v31 = 2080;
        v32 = "-[AVCSession endParticipantConfiguration]_block_invoke";
        v33 = 1024;
        v34 = 598;
        v35 = 1024;
        LODWORD(v36) = v5;
        v6 = " [%s] %s:%d _activeConfigurationCount=%d";
        v7 = v4;
        v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
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
        v12 = *(_DWORD *)(v11 + 120);
        *(_DWORD *)buf = 136316418;
        v30 = v9;
        v31 = 2080;
        v32 = "-[AVCSession endParticipantConfiguration]_block_invoke";
        v33 = 1024;
        v34 = 598;
        v35 = 2112;
        v36 = v2;
        v37 = 2048;
        v38 = v11;
        v39 = 1024;
        v40 = v12;
        v6 = " [%s] %s:%d %@(%p) _activeConfigurationCount=%d";
        v7 = v10;
        v8 = 54;
        goto LABEL_11;
      }
    }
  }
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(_DWORD *)(v13 + 120);
  v15 = __OFSUB__(v14, 1);
  v16 = v14 - 1;
  if (v16 < 0 == v15)
  {
    *(_DWORD *)(v13 + 120) = v16;
    if (!v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "validateParticipantConfiguration");
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"));
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v18 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "appendConfigurationToXPCConfiguration:", v17);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
        }
        while (v20);
      }
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (objc_msgSend(v17, "count"))
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, CFSTR("vcSessionParameterParticipantConfiguration"));

      objc_msgSend(*(id *)(a1 + 32), "appendConfigurationToXPCArguments:", v23);
      if (objc_msgSend(v23, "count"))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionUpdateParticipantConfiguration", v23);

    }
  }
}

- (void)validateParticipantConfiguration
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Multiple participants are configured with the same prominence indices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (id)configurationWithSessionMode:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 2)
    v3 = 1;
  else
    v3 = 2 * (a3 == 0);
  return +[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:](VCSessionMediaStreamPresenceConfigurationProvider, "publicSessionConfigurationForType:", v3);
}

- (void)didAddParticipantHandlerWithResult:(id)a3
{
  int v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  char v23;
  id v24;
  char v25;
  NSObject *delegateNotificationQueue;
  _QWORD v27[7];
  char v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[18];
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded")), "BOOLValue");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"));
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v30 = v8;
        v31 = 2080;
        v32 = "-[AVCSession didAddParticipantHandlerWithResult:]";
        v33 = 1024;
        v34 = 662;
        v35 = 1024;
        *(_DWORD *)v36 = v5;
        *(_WORD *)&v36[4] = 2112;
        *(_QWORD *)&v36[6] = v6;
        v10 = " [%s] %s:%d received callback for addParticipantDidSucceed %d, participantID %@";
        v11 = v9;
        v12 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v30 = v13;
        v31 = 2080;
        v32 = "-[AVCSession didAddParticipantHandlerWithResult:]";
        v33 = 1024;
        v34 = 662;
        v35 = 2112;
        *(_QWORD *)v36 = v7;
        *(_WORD *)&v36[8] = 2048;
        *(_QWORD *)&v36[10] = self;
        v37 = 1024;
        v38 = v5;
        v39 = 2112;
        v40 = v6;
        v10 = " [%s] %s:%d %@(%p) received callback for addParticipantDidSucceed %d, participantID %@";
        v11 = v14;
        v12 = 64;
        goto LABEL_11;
      }
    }
  }
  if (!v6)
  {
    v23 = 0;
    v16 = 0;
    v21 = 32016;
    v22 = CFSTR("ParticipantID is nil");
    if ((v5 & 1) != 0)
      goto LABEL_19;
    goto LABEL_21;
  }
  v15 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_participantsToAdd, "objectForKeyedSubscript:", v6);
  v16 = v15;
  if ((v5 & 1) != 0)
  {
    if (v15)
    {
      v17 = -[AVConferenceXPCClient newNSDictionaryFromNSDictionary:](self->_connection, "newNSDictionaryFromNSDictionary:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParameterStreamTokens")));
      if (v17)
      {
        v18 = v17;
        v19 = -[AVConferenceXPCClient newNSDictionaryFromNSDictionary:](self->_connection, "newNSDictionaryFromNSDictionary:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionSpatialSourceIDs")));
        if (v19)
        {
          v20 = v19;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipants, "setObject:forKeyedSubscript:", v16, v6);
          objc_msgSend(v16, "setSharedXPCConnection:", self->_connection);
          objc_msgSend(v16, "setStreamTokens:", v18);
          objc_msgSend(v16, "setVideoToken:", objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E9EF7340), "unsignedIntValue"));
          objc_msgSend(v16, "setScreenToken:", objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E9EF7358), "unsignedIntValue"));
          objc_msgSend(v16, "setMediaTypeToSpatialSourceIDMap:", v20);
          v21 = 0;
          v22 = 0;
          v23 = 1;
          goto LABEL_18;
        }
        v23 = 0;
        v22 = CFSTR("Spatial source ID map is nil");
      }
      else
      {
        v23 = 0;
        v22 = CFSTR("streamTokens is nil");
      }
      v21 = 32016;
    }
    else
    {
      v23 = 0;
      v22 = CFSTR("Participant is nil");
      v21 = 32026;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCSession didAddParticipantHandlerWithResult:].cold.1();
    }
    v21 = 0;
    v22 = 0;
    v23 = 0;
  }
LABEL_18:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_participantsToAdd, "setObject:forKeyedSubscript:", 0, v6);
  if ((v5 & 1) != 0)
  {
LABEL_19:
    v24 = 0;
    goto LABEL_22;
  }
LABEL_21:
  v24 = -[AVCSession newNSErrorWithErrorDictionary:](self, "newNSErrorWithErrorDictionary:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionError")));
LABEL_22:
  if (v24)
    v25 = 1;
  else
    v25 = v23;
  if ((v25 & 1) == 0)
  {
    v24 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", v21, 0, v22);
    LOBYTE(v5) = 0;
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __49__AVCSession_didAddParticipantHandlerWithResult___block_invoke;
  v27[3] = &unk_1E9E53608;
  v27[4] = self;
  v27[5] = v16;
  v28 = v5;
  v27[6] = v24;
  dispatch_async(delegateNotificationQueue, v27);

}

uint64_t __49__AVCSession_didAddParticipantHandlerWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-didAddParticipant");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = objc_msgSend(*(id *)(a1 + 40), "uuid");
      v6 = *(unsigned __int8 *)(a1 + 56);
      v7 = *(_QWORD *)(a1 + 48);
      v9 = 136316674;
      v10 = v2;
      v11 = 2080;
      v12 = "-[AVCSession didAddParticipantHandlerWithResult:]_block_invoke";
      v13 = 1024;
      v14 = 693;
      v15 = 2048;
      v16 = v4;
      v17 = 2112;
      v18 = v5;
      v19 = 1024;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-didAddParticipant (%p) uuid=%@, didSucceed=%d, error=%@", (uint8_t *)&v9, 0x40u);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:addParticipant:didSucceed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (id)newNSErrorWithErrorDictionary:(id)a3
{
  if (a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
  else
    return 0;
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
  v15[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke;
  v15[3] = &unk_1E9E52730;
  v15[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionDidStart", v15, self->_stateQueue);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_113;
  v14[3] = &unk_1E9E52730;
  v14[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionDidStop", v14, self->_stateQueue);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_122;
  v13[3] = &unk_1E9E52730;
  v13[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionServerDidDisconnect", v13, self->_stateQueue);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_125;
  v12[3] = &unk_1E9E52730;
  v12[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionAddParticipantDidSuceed", v12, self->_stateQueue);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_2;
  v11[3] = &unk_1E9E52730;
  v11[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionRemoveParticipantDidSucceed", v11, self->_stateQueue);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_129;
  v10[3] = &unk_1E9E52730;
  v10[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionDidUpdateConfiguration", v10, self->_stateQueue);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_132;
  v9[3] = &unk_1E9E52730;
  v9[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionDidDetectError", v9, self->_stateQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_2_135;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionUplinkRateAdaptationInfoDidChange", v8, self->_stateQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_2_142;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionDownlinkRateAdaptationInfoDidChange", v7, self->_stateQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_2_147;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionShouldReconnect", v6, self->_stateQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_152;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcSessionSetOneToOneEnabledDidChange", v5, self->_stateQueue);
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      if (objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136315650;
        v20 = v8;
        v21 = 2080;
        v22 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 719;
        v10 = " [%s] %s:%d received callback for didStart";
        v11 = v9;
        v12 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316162;
        v20 = v13;
        v21 = 2080;
        v22 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        v23 = 1024;
        v24 = 719;
        v25 = 2112;
        v26 = v7;
        v27 = 2048;
        v28 = v6;
        v10 = " [%s] %s:%d %@(%p) received callback for didStart";
        v11 = v14;
        v12 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_15:
      v15 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionStarted"));
      v16 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError")));
      v17 = objc_msgSend(v6, "delegateNotificationQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_110;
      block[3] = &unk_1E9E527D0;
      block[4] = v6;
      block[5] = v15;
      block[6] = v16;
      dispatch_async(v17, block);

    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_110(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-didStart");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = objc_msgSend(*(id *)(a1 + 40), "intValue");
      v6 = *(_QWORD *)(a1 + 48);
      v8 = 136316418;
      v9 = v2;
      v10 = 2080;
      v11 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      v12 = 1024;
      v13 = 724;
      v14 = 2048;
      v15 = v4;
      v16 = 1024;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-didStart (%p) didSucceed=%d, error=%@", (uint8_t *)&v8, 0x36u);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didStart:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), *(_QWORD *)(a1 + 48));
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_113(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      if (objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136315650;
        v19 = v8;
        v20 = 2080;
        v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        v22 = 1024;
        v23 = 740;
        v10 = " [%s] %s:%d received callback for didStop";
        v11 = v9;
        v12 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316162;
        v19 = v13;
        v20 = 2080;
        v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        v22 = 1024;
        v23 = 740;
        v24 = 2112;
        v25 = v7;
        v26 = 2048;
        v27 = v6;
        v10 = " [%s] %s:%d %@(%p) received callback for didStop";
        v11 = v14;
        v12 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_15:
      v15 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError")));
      v16 = objc_msgSend(v6, "delegateNotificationQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_114;
      block[3] = &unk_1E9E527D0;
      block[4] = v6;
      block[5] = v15;
      block[6] = a2;
      dispatch_async(v16, block);

    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_114(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-didStop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v9 = 136316162;
      v10 = v2;
      v11 = 2080;
      v12 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      v13 = 1024;
      v14 = 744;
      v15 = 2048;
      v16 = v4;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-didStop (%p) error=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  v6 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("vcSessionDidStopMetadata"));
  if (v6)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didStopWithError:metadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didStopWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_122(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSObject *v18;
  _QWORD block[5];
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v3 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v3)
    return;
  v4 = (void *)v3;
  if (objc_opt_class() == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_14;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_DWORD *)buf = 136315650;
    v26 = v6;
    v27 = 2080;
    v28 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
    v29 = 1024;
    v30 = 765;
    v8 = " [%s] %s:%d received callback for serverDidDisconnect";
    v9 = v7;
    v10 = 28;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_14;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_DWORD *)buf = 136316162;
    v26 = v11;
    v27 = 2080;
    v28 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
    v29 = 1024;
    v30 = 765;
    v31 = 2112;
    v32 = v5;
    v33 = 2048;
    v34 = v4;
    v8 = " [%s] %s:%d %@(%p) received callback for serverDidDisconnect";
    v9 = v12;
    v10 = 48;
  }
  _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_14:
  objc_msgSend((id)objc_msgSend(v4, "localParticipant"), "setSharedXPCConnection:", 0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = (void *)objc_msgSend(v4, "remoteParticipantsMap");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "remoteParticipantsMap"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)), "setSharedXPCConnection:", 0);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v15);
  }
  v18 = objc_msgSend(v4, "delegateNotificationQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_123;
  block[3] = &unk_1E9E521C0;
  block[4] = v4;
  dispatch_async(v18, block);
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_123(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-serverDidDisconnect");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 136315906;
      v7 = v2;
      v8 = 2080;
      v9 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      v10 = 1024;
      v11 = 773;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-serverDidDisconnect (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "sessionServerDidDisconnect:", *(_QWORD *)(a1 + 32));
}

id *__44__AVCSession_registerBlocksForNotifications__block_invoke_125(id *result, void *a2, uint64_t a3)
{
  id *v4;

  if (!a3)
  {
    v4 = result;
    result = (id *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
    if (!result)
    {
      result = (id *)objc_msgSend(v4[4], "strong");
      if (result)
        return (id *)objc_msgSend(result, "didAddParticipantHandlerWithResult:", a2);
    }
  }
  return result;
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  _QWORD block[9];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3)
    return;
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v5)
    return;
  v6 = (void *)v5;
  if (objc_opt_class() != v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136316162;
    v22 = v13;
    v23 = 2080;
    v24 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
    v25 = 1024;
    v26 = 799;
    v27 = 2112;
    v28 = v7;
    v29 = 2048;
    v30 = v6;
    v10 = " [%s] %s:%d %@(%p) received callback for removeParticipantDidSucceed";
    v11 = v14;
    v12 = 48;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v22 = v8;
      v23 = 2080;
      v24 = "-[AVCSession registerBlocksForNotifications]_block_invoke_2";
      v25 = 1024;
      v26 = 799;
      v10 = " [%s] %s:%d received callback for removeParticipantDidSucceed";
      v11 = v9;
      v12 = 28;
LABEL_14:
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
LABEL_15:
  v15 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded"));
  v16 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantID"));
  v17 = (id)objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMap"), "objectForKeyedSubscript:", v16);
  objc_msgSend(v17, "setSharedXPCConnection:", 0);
  if (v15)
    objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMap"), "setObject:forKeyedSubscript:", 0, v16);
  v18 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError")));
  v19 = objc_msgSend(v6, "delegateNotificationQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_127;
  block[3] = &unk_1E9E54D48;
  block[4] = v6;
  block[5] = v17;
  block[6] = v15;
  block[7] = v18;
  block[8] = 0;
  dispatch_async(v19, block);

}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_127(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-didRemoveParticipant");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = objc_msgSend(*(id *)(a1 + 40), "uuid");
      v6 = objc_msgSend(*(id *)(a1 + 48), "intValue");
      v7 = *(_QWORD *)(a1 + 56);
      v8 = 136316674;
      v9 = v2;
      v10 = 2080;
      v11 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      v12 = 1024;
      v13 = 811;
      v14 = 2048;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      v18 = 1024;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-didRemoveParticipant (%p) uuid=%@, didSucceed=%d, error=%@", (uint8_t *)&v8, 0x40u);
    }
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:removeParticipant:didSucceed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "BOOLValue"), *(_QWORD *)(a1 + 64));

}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_129(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[6];
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3)
    return;
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v5)
    return;
  v6 = (void *)v5;
  v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded")), "BOOLValue");
  if ((void *)objc_opt_class() == v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136316162;
    v23 = v9;
    v24 = 2080;
    v25 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
    v26 = 1024;
    v27 = 829;
    v28 = 2112;
    v29 = objc_msgSend(v6, "uuid");
    v30 = 1024;
    LODWORD(v31) = v7;
    v11 = " [%s] %s:%d Session[%@] received callback for didUpdateConfig didSucceed=%{BOOL}d";
    v12 = v10;
    v13 = 44;
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
  else
    v8 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v23 = v14;
      v24 = 2080;
      v25 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      v26 = 1024;
      v27 = 829;
      v28 = 2112;
      v29 = (uint64_t)v8;
      v30 = 2048;
      v31 = v6;
      v32 = 2112;
      v33 = objc_msgSend(v6, "uuid");
      v34 = 1024;
      v35 = v7;
      v11 = " [%s] %s:%d %@(%p) Session[%@] received callback for didUpdateConfig didSucceed=%{BOOL}d";
      v12 = v15;
      v13 = 64;
LABEL_14:
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
LABEL_15:
  if (v7)
  {
    v16 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionConfiguration"));
    if (v16)
    {
      v17 = v16;
      v18 = (void *)objc_msgSend(v6, "dispatchedConfiguration");
      objc_msgSend(v18, "setUpWithDictionary:", v17);
      objc_msgSend(v6, "setConfiguration:", v18);
    }
  }
  v19 = objc_msgSend(v6, "delegateNotificationQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_130;
  block[3] = &unk_1E9E52210;
  v21 = v7;
  block[4] = v6;
  block[5] = 0;
  dispatch_async(v19, block);
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_130(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "configuration");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCSession-didUpdateConfiguration");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 136316674;
      v10 = v3;
      v11 = 2080;
      v12 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      v13 = 1024;
      v14 = 841;
      v15 = 2048;
      v16 = v6;
      v17 = 2112;
      v18 = v2;
      v19 = 1024;
      v20 = v5;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-didUpdateConfiguration (%p) configuration=%@, didSucceed=%{BOOL}d, error=%@", (uint8_t *)&v9, 0x40u);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didUpdate:configuration:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), v2, *(_QWORD *)(a1 + 40));
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_132(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
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
  void *v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = v5;
      v7 = (__CFString *)objc_msgSend(v5, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError")));
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136315906;
        v19 = v9;
        v20 = 2080;
        v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        v22 = 1024;
        v23 = 856;
        v24 = 2112;
        v25 = v7;
        v11 = " [%s] %s:%d received callback for didDetectError:%@";
        v12 = v10;
        v13 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316418;
        v19 = v14;
        v20 = 2080;
        v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        v22 = 1024;
        v23 = 856;
        v24 = 2112;
        v25 = v8;
        v26 = 2048;
        v27 = v6;
        v28 = 2112;
        v29 = v7;
        v11 = " [%s] %s:%d %@(%p) received callback for didDetectError:%@";
        v12 = v15;
        v13 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      v16 = objc_msgSend(v6, "delegateNotificationQueue");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_133;
      v17[3] = &unk_1E9E52238;
      v17[4] = v6;
      v17[5] = 0;
      dispatch_async(v16, v17);

    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_133(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didDetectError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_2_135(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterRateAdaptationInfo"));
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136315906;
        v19 = v9;
        v20 = 2080;
        v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke_2";
        v22 = 1024;
        v23 = 872;
        v24 = 2112;
        v25 = v7;
        v11 = " [%s] %s:%d received callback for didChangeUplinkRateAdaptationInfo:%@";
        v12 = v10;
        v13 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316418;
        v19 = v14;
        v20 = 2080;
        v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        v22 = 1024;
        v23 = 872;
        v24 = 2112;
        v25 = (uint64_t)v8;
        v26 = 2048;
        v27 = v6;
        v28 = 2112;
        v29 = v7;
        v11 = " [%s] %s:%d %@(%p) received callback for didChangeUplinkRateAdaptationInfo:%@";
        v12 = v15;
        v13 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      v16 = objc_msgSend(v6, "delegateNotificationQueue");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_138;
      v17[3] = &unk_1E9E52238;
      v17[4] = v6;
      v17[5] = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_138(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:uplinkRateAdaptationInfoDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_2_142(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[6];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionParameterRateAdaptationInfo"));
      if ((void *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136315906;
        v19 = v9;
        v20 = 2080;
        v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke_2";
        v22 = 1024;
        v23 = 889;
        v24 = 2112;
        v25 = v7;
        v11 = " [%s] %s:%d received callback for didChangeDownlinkRateAdaptationInfo:%@";
        v12 = v10;
        v13 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316418;
        v19 = v14;
        v20 = 2080;
        v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        v22 = 1024;
        v23 = 889;
        v24 = 2112;
        v25 = (uint64_t)v8;
        v26 = 2048;
        v27 = v6;
        v28 = 2112;
        v29 = v7;
        v11 = " [%s] %s:%d %@(%p) received callback for didChangeDownlinkRateAdaptationInfo:%@";
        v12 = v15;
        v13 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      v16 = objc_msgSend(v6, "delegateNotificationQueue");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_143;
      v17[3] = &unk_1E9E52238;
      v17[4] = v6;
      v17[5] = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_143(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:downlinkRateAdaptationInfoDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_2_147(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a3 && !objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      v5 = (void *)v4;
      if (objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136315650;
        v17 = v7;
        v18 = 2080;
        v19 = "-[AVCSession registerBlocksForNotifications]_block_invoke_2";
        v20 = 1024;
        v21 = 905;
        v9 = " [%s] %s:%d received callback for shouldReconnect";
        v10 = v8;
        v11 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
        else
          v6 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136316162;
        v17 = v12;
        v18 = 2080;
        v19 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        v20 = 1024;
        v21 = 905;
        v22 = 2112;
        v23 = v6;
        v24 = 2048;
        v25 = v5;
        v9 = " [%s] %s:%d %@(%p) received callback for shouldReconnect";
        v10 = v13;
        v11 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_15:
      v14 = objc_msgSend(v5, "delegateNotificationQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_148;
      block[3] = &unk_1E9E521C0;
      block[4] = v5;
      dispatch_async(v14, block);
    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_148(uint64_t a1)
{
  uint64_t result;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _BYTE v12[24];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14), "sessionShouldReconnect:", *(_QWORD *)(a1 + 32));
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14), "sessionShouldReconnect:", *(_QWORD *)(a1 + 32));
      *(_DWORD *)v12 = 136315650;
      *(_QWORD *)&v12[4] = v4;
      *(_WORD *)&v12[12] = 2080;
      *(_QWORD *)&v12[14] = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 908;
      v6 = " [%s] %s:%d Calling sessionShouldReconnect on the delegate";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14), "sessionShouldReconnect:", *(_QWORD *)(a1 + 32));
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14), "sessionShouldReconnect:", *(_QWORD *)(a1 + 32));
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v12 = 136316162;
      *(_QWORD *)&v12[4] = v9;
      *(_WORD *)&v12[12] = 2080;
      *(_QWORD *)&v12[14] = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 908;
      WORD2(v13) = 2112;
      *(_QWORD *)((char *)&v13 + 6) = v3;
      HIWORD(v13) = 2048;
      v14 = v11;
      v6 = " [%s] %s:%d %@(%p) Calling sessionShouldReconnect on the delegate";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v12, v8);
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14), "sessionShouldReconnect:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_152(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[6];
  char v20;
  char v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  _BYTE v31[10];
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3)
    return;
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v5 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v5)
    return;
  v6 = (void *)v5;
  v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionOneOnOneModeEnabled")), "BOOLValue");
  v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionSucceeded")), "BOOLValue");
  if ((void *)objc_opt_class() != v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)objc_msgSend(v6, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_15;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136316930;
    v23 = v15;
    v24 = 2080;
    v25 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
    v26 = 1024;
    v27 = 925;
    v28 = 2112;
    v29 = (uint64_t)v9;
    v30 = 2048;
    *(_QWORD *)v31 = v6;
    *(_WORD *)&v31[8] = 2112;
    v32 = objc_msgSend(v6, "uuid");
    v33 = 1024;
    v34 = v7;
    v35 = 1024;
    v36 = v8;
    v12 = " [%s] %s:%d %@(%p) Session[%@] received callback for oneToOneModeEnabled[%d] did succeed[%d]";
    v13 = v16;
    v14 = 70;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v23 = v10;
      v24 = 2080;
      v25 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      v26 = 1024;
      v27 = 925;
      v28 = 2112;
      v29 = objc_msgSend(v6, "uuid");
      v30 = 1024;
      *(_DWORD *)v31 = v7;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v8;
      v12 = " [%s] %s:%d Session[%@] received callback for oneToOneModeEnabled[%d] did succeed[%d]";
      v13 = v11;
      v14 = 50;
LABEL_14:
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
LABEL_15:
  if (v8)
    objc_msgSend(v6, "updateOneToOneModeEnabled:", v7);
  v17 = (void *)objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcSessionError")));
  v18 = objc_msgSend(v6, "delegateNotificationQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_153;
  block[3] = &unk_1E9E54C98;
  v20 = v7;
  v21 = v8;
  block[4] = v6;
  block[5] = v17;
  dispatch_async(v18, block);

}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_153(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:oneToOneEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)deregisterFromNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionDidStart");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionDidStop");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionServerDidDisconnect");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionAddParticipantDidSuceed");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionRemoveParticipantDidSucceed");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionDidUpdateConfiguration");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionDidDetectError");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionUplinkRateAdaptationInfoDidChange");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionDownlinkRateAdaptationInfoDidChange");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionShouldReconnect");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcSessionSetOneToOneEnabledDidChange");
}

- (void)setupNotificationQueue:(id)a3
{
  NSObject *CustomRootQueue;

  if (a3)
  {
    self->_delegateNotificationQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
  }
  else
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    self->_delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCSession.notificationQueue", 0, CustomRootQueue);
  }
}

- (void)participant:(id)a3 frequencyLevelsDidChange:(id)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AVCSession_participant_frequencyLevelsDidChange___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __51__AVCSession_participant_frequencyLevelsDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:frequencyLevelsDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)participant:(id)a3 audioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  NSString *uuid;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *v19;
  NSObject *delegateNotificationQueue;
  _QWORD block[6];
  BOOL v22;
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  _BYTE v33[10];
  NSString *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v7 = a5;
  v8 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136316418;
        v25 = v11;
        v26 = 2080;
        v27 = "-[AVCSession participant:audioEnabled:didSucceed:error:]";
        v28 = 1024;
        v29 = 977;
        v30 = 2112;
        v31 = (const __CFString *)uuid;
        v32 = 1024;
        *(_DWORD *)v33 = v8;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v7;
        v14 = " [%s] %s:%d AVCSession[%@] received callback for audio enabled[%d] did succeed[%d]";
        v15 = v12;
        v16 = 50;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_uuid;
        *(_DWORD *)buf = 136316930;
        v25 = v17;
        v26 = 2080;
        v27 = "-[AVCSession participant:audioEnabled:didSucceed:error:]";
        v28 = 1024;
        v29 = 977;
        v30 = 2112;
        v31 = v10;
        v32 = 2048;
        *(_QWORD *)v33 = self;
        *(_WORD *)&v33[8] = 2112;
        v34 = v19;
        v35 = 1024;
        v36 = v8;
        v37 = 1024;
        v38 = v7;
        v14 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback for audio enabled[%d] did succeed[%d]";
        v15 = v18;
        v16 = 70;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVCSession_participant_audioEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E54C98;
  v22 = v8;
  v23 = v7;
  block[4] = self;
  block[5] = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __56__AVCSession_participant_audioEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:audioEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)participant:(id)a3 videoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  NSString *uuid;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *v19;
  NSObject *delegateNotificationQueue;
  _QWORD block[6];
  BOOL v22;
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  _BYTE v33[10];
  NSString *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v7 = a5;
  v8 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136316418;
        v25 = v11;
        v26 = 2080;
        v27 = "-[AVCSession participant:videoEnabled:didSucceed:error:]";
        v28 = 1024;
        v29 = 986;
        v30 = 2112;
        v31 = (const __CFString *)uuid;
        v32 = 1024;
        *(_DWORD *)v33 = v8;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v7;
        v14 = " [%s] %s:%d AVCSession[%@] received callback for video enabled[%d] did succeed[%d]";
        v15 = v12;
        v16 = 50;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_uuid;
        *(_DWORD *)buf = 136316930;
        v25 = v17;
        v26 = 2080;
        v27 = "-[AVCSession participant:videoEnabled:didSucceed:error:]";
        v28 = 1024;
        v29 = 986;
        v30 = 2112;
        v31 = v10;
        v32 = 2048;
        *(_QWORD *)v33 = self;
        *(_WORD *)&v33[8] = 2112;
        v34 = v19;
        v35 = 1024;
        v36 = v8;
        v37 = 1024;
        v38 = v7;
        v14 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback for video enabled[%d] did succeed[%d]";
        v15 = v18;
        v16 = 70;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVCSession_participant_videoEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E54C98;
  v22 = v8;
  v23 = v7;
  block[4] = self;
  block[5] = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __56__AVCSession_participant_videoEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:videoEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)participant:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  NSString *uuid;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *v19;
  NSObject *delegateNotificationQueue;
  _QWORD block[6];
  BOOL v22;
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  _BYTE v33[10];
  NSString *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v7 = a5;
  v8 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136316418;
        v25 = v11;
        v26 = 2080;
        v27 = "-[AVCSession participant:screenEnabled:didSucceed:error:]";
        v28 = 1024;
        v29 = 995;
        v30 = 2112;
        v31 = (const __CFString *)uuid;
        v32 = 1024;
        *(_DWORD *)v33 = v8;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v7;
        v14 = " [%s] %s:%d AVCSession[%@] received callback for screen enabled[%d] did succeed[%d]";
        v15 = v12;
        v16 = 50;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_uuid;
        *(_DWORD *)buf = 136316930;
        v25 = v17;
        v26 = 2080;
        v27 = "-[AVCSession participant:screenEnabled:didSucceed:error:]";
        v28 = 1024;
        v29 = 995;
        v30 = 2112;
        v31 = v10;
        v32 = 2048;
        *(_QWORD *)v33 = self;
        *(_WORD *)&v33[8] = 2112;
        v34 = v19;
        v35 = 1024;
        v36 = v8;
        v37 = 1024;
        v38 = v7;
        v14 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback for screen enabled[%d] did succeed[%d]";
        v15 = v18;
        v16 = 70;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVCSession_participant_screenEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E54C98;
  v22 = v8;
  v23 = v7;
  block[4] = self;
  block[5] = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __57__AVCSession_participant_screenEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:screenEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)participant:(id)a3 audioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  NSString *uuid;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *v19;
  NSObject *delegateNotificationQueue;
  _QWORD block[6];
  BOOL v22;
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  _BYTE v33[10];
  NSString *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v7 = a5;
  v8 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136316418;
        v25 = v11;
        v26 = 2080;
        v27 = "-[AVCSession participant:audioPaused:didSucceed:error:]";
        v28 = 1024;
        v29 = 1004;
        v30 = 2112;
        v31 = (const __CFString *)uuid;
        v32 = 1024;
        *(_DWORD *)v33 = v8;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v7;
        v14 = " [%s] %s:%d AVCSession[%@] received callback for audio paused[%d] did succeed[%d]";
        v15 = v12;
        v16 = 50;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_uuid;
        *(_DWORD *)buf = 136316930;
        v25 = v17;
        v26 = 2080;
        v27 = "-[AVCSession participant:audioPaused:didSucceed:error:]";
        v28 = 1024;
        v29 = 1004;
        v30 = 2112;
        v31 = v10;
        v32 = 2048;
        *(_QWORD *)v33 = self;
        *(_WORD *)&v33[8] = 2112;
        v34 = v19;
        v35 = 1024;
        v36 = v8;
        v37 = 1024;
        v38 = v7;
        v14 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback for audio paused[%d] did succeed[%d]";
        v15 = v18;
        v16 = 70;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AVCSession_participant_audioPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E54C98;
  v22 = v8;
  v23 = v7;
  block[4] = self;
  block[5] = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __55__AVCSession_participant_audioPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:audioPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)participant:(id)a3 videoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  NSString *uuid;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSString *v19;
  NSObject *delegateNotificationQueue;
  _QWORD block[6];
  BOOL v22;
  BOOL v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  _BYTE v33[10];
  NSString *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v7 = a5;
  v8 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136316418;
        v25 = v11;
        v26 = 2080;
        v27 = "-[AVCSession participant:videoPaused:didSucceed:error:]";
        v28 = 1024;
        v29 = 1013;
        v30 = 2112;
        v31 = (const __CFString *)uuid;
        v32 = 1024;
        *(_DWORD *)v33 = v8;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v7;
        v14 = " [%s] %s:%d AVCSession[%@] received callback for video paused[%d] did succeed[%d]";
        v15 = v12;
        v16 = 50;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_uuid;
        *(_DWORD *)buf = 136316930;
        v25 = v17;
        v26 = 2080;
        v27 = "-[AVCSession participant:videoPaused:didSucceed:error:]";
        v28 = 1024;
        v29 = 1013;
        v30 = 2112;
        v31 = v10;
        v32 = 2048;
        *(_QWORD *)v33 = self;
        *(_WORD *)&v33[8] = 2112;
        v34 = v19;
        v35 = 1024;
        v36 = v8;
        v37 = 1024;
        v38 = v7;
        v14 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback for video paused[%d] did succeed[%d]";
        v15 = v18;
        v16 = 70;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__AVCSession_participant_videoPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E54C98;
  v22 = v8;
  v23 = v7;
  block[4] = self;
  block[5] = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __55__AVCSession_participant_videoPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:videoPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)participant:(id)a3 mediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  NSString *uuid;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  NSString *v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  NSObject *delegateNotificationQueue;
  _QWORD v29[6];
  int v30;
  int v31;
  BOOL v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  AVCSession *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v51 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        v16 = VCSessionMediaType_FromAVCSessionMediaType(v9);
        v17 = VCSessionMediaType_Name(v16);
        v18 = VCSessionMediaState_FromAVCSessionMediaState(v10);
        *(_DWORD *)buf = 136316674;
        v34 = v13;
        v35 = 2080;
        v36 = "-[AVCSession participant:mediaStateDidChange:forMediaType:didSucceed:error:]";
        v37 = 1024;
        v38 = 1022;
        v39 = 2112;
        v40 = (const __CFString *)uuid;
        v41 = 2112;
        v42 = (AVCSession *)v17;
        v43 = 2112;
        v44 = VCSessionMediaState_Name(v18);
        v45 = 1024;
        LODWORD(v46) = v8;
        v19 = " [%s] %s:%d AVCSession=%@ received mediaStateDidChange callback for mediaType=%@ mediaState=%@ did succeed[%d]";
        v20 = v14;
        v21 = 64;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_uuid;
        v25 = VCSessionMediaType_FromAVCSessionMediaType(v9);
        v26 = VCSessionMediaType_Name(v25);
        v27 = VCSessionMediaState_FromAVCSessionMediaState(v10);
        *(_DWORD *)buf = 136317186;
        v34 = v22;
        v35 = 2080;
        v36 = "-[AVCSession participant:mediaStateDidChange:forMediaType:didSucceed:error:]";
        v37 = 1024;
        v38 = 1022;
        v39 = 2112;
        v40 = v12;
        v41 = 2048;
        v42 = self;
        v43 = 2112;
        v44 = (__CFString *)v24;
        v45 = 2112;
        v46 = v26;
        v47 = 2112;
        v48 = VCSessionMediaState_Name(v27);
        v49 = 1024;
        v50 = v8;
        v19 = " [%s] %s:%d %@(%p) AVCSession=%@ received mediaStateDidChange callback for mediaType=%@ mediaState=%@ did succeed[%d]";
        v20 = v23;
        v21 = 84;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __76__AVCSession_participant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke;
  v29[3] = &unk_1E9E55690;
  v30 = v10;
  v31 = v9;
  v32 = v8;
  v29[4] = self;
  v29[5] = a7;
  dispatch_async(delegateNotificationQueue, v29);
}

uint64_t __76__AVCSession_participant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v2, "session:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)participant:(id)a3 mediaPrioritiesDidChange:(id)a4
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  NSString *uuid;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  NSObject *delegateNotificationQueue;
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
  AVCSession *v27;
  __int16 v28;
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136315906;
        v19 = v7;
        v20 = 2080;
        v21 = "-[AVCSession participant:mediaPrioritiesDidChange:]";
        v22 = 1024;
        v23 = 1032;
        v24 = 2112;
        v25 = (const __CFString *)uuid;
        v10 = " [%s] %s:%d AVCSession[%@] received callback.";
        v11 = v8;
        v12 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[AVCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->_uuid;
        *(_DWORD *)buf = 136316418;
        v19 = v13;
        v20 = 2080;
        v21 = "-[AVCSession participant:mediaPrioritiesDidChange:]";
        v22 = 1024;
        v23 = 1032;
        v24 = 2112;
        v25 = v6;
        v26 = 2048;
        v27 = self;
        v28 = 2112;
        v29 = v15;
        v10 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback.";
        v11 = v14;
        v12 = 58;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__AVCSession_participant_mediaPrioritiesDidChange___block_invoke;
  v17[3] = &unk_1E9E52238;
  v17[4] = self;
  v17[5] = a4;
  dispatch_async(delegateNotificationQueue, v17);
}

uint64_t __51__AVCSession_participant_mediaPrioritiesDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:mediaPrioritiesDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)participant:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5
{
  NSObject *delegateNotificationQueue;
  _QWORD block[5];
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AVCSession_participant_mixingDidStartForMediaType_mixingMediaType___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  v7 = a4;
  v8 = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __69__AVCSession_participant_mixingDidStartForMediaType_mixingMediaType___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:mixingDidStartForMediaType:mixingMediaType:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
  return result;
}

- (void)participant:(id)a3 mixingDidStopForMediaType:(unsigned int)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD block[5];
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AVCSession_participant_mixingDidStopForMediaType___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v6 = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __52__AVCSession_participant_mixingDidStopForMediaType___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:mixingDidStopForMediaType:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
  return result;
}

- (void)participant:(id)a3 didReact:(id)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AVCSession_participant_didReact___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __35__AVCSession_participant_didReact___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didReact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)participantDidStopReacting:(id)a3
{
  NSObject *delegateNotificationQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__AVCSession_participantDidStopReacting___block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(delegateNotificationQueue, v4);
}

uint64_t __41__AVCSession_participantDidStopReacting___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "sessionDidStopReacting:", *(_QWORD *)(a1 + 32));
  return result;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)delegateNotificationQueue
{
  return self->_delegateNotificationQueue;
}

- (NSMutableDictionary)remoteParticipantsMap
{
  return self->_remoteParticipants;
}

- (NSData)frequencyLevels
{
  return self->_frequencyLevels;
}

- (NSMutableDictionary)participantsToAdd
{
  return self->_participantsToAdd;
}

- (AVCSessionParticipant)localParticipant
{
  return self->_localParticipant;
}

- (VCXPCClientShared)xpcConnection
{
  return self->_connection;
}

- (int64_t)sessionToken
{
  return self->_sessionToken;
}

- (NSDictionary)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)negotiationDataForProtocolVersion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCSession negotiationDataForProtocolVersion:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unknown protocol version=%d", v2, *(const char **)v3, (unint64_t)"-[AVCSession negotiationDataForProtocolVersion:]" >> 16, 218);
  OUTLINED_FUNCTION_3();
}

- (void)setPresentationInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  double v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid display width=%f", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setPresentationInfo:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  double v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid display height=%f", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setPresentationInfo:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid state=%u", v2, v3, v4, 296);
  OUTLINED_FUNCTION_3();
}

- (void)setPresentationInfo:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid layout=%u", v2, v3, v4, 293);
  OUTLINED_FUNCTION_3();
}

- (void)initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Transport token is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve stream token mapping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d failed transportToken[%@]");
  OUTLINED_FUNCTION_3();
}

- (void)initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Non-nil parentNWActivity is unactivated!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addParticipant:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to add nil participant", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didAddParticipantHandlerWithResult:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add the participant", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
