@implementation VCMediaDevice

- (VCMediaDevice)init
{
  VCMediaDevice *v2;
  objc_class *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaDevice;
  v2 = -[VCObject init](&v5, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    -[VCObject setLogPrefix:](v2, "setLogPrefix:", NSStringFromClass(v3));
    v2->_state = 0;
  }
  return v2;
}

- (id)start
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  id v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  NSString *p_isa;
  __int16 v24;
  VCMediaDevice *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ %@-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = v3;
      v18 = 2080;
      v19 = "-[VCMediaDevice start]";
      v20 = 1024;
      v21 = 49;
      v22 = 2112;
      p_isa = -[VCObject logPrefix](self, "logPrefix");
      v24 = 2048;
      v25 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ %@-start (%p)", buf, 0x30u);
    }
  }
  -[VCObject lock](self, "lock");
  if (-[VCMediaDevice canEnterState:](self, "canEnterState:", 1))
  {
    v5 = -[VCMediaDevice onStart](self, "onStart");
    if (v5)
    {
      v6 = v5;
      if ((VCMediaDevice *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaDevice start].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)-[VCMediaDevice performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v17 = v12;
            v18 = 2080;
            v19 = "-[VCMediaDevice start]";
            v20 = 1024;
            v21 = 63;
            v22 = 2112;
            p_isa = &v7->isa;
            v24 = 2048;
            v25 = self;
            v26 = 2112;
            v27 = v6;
            _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to start, error=%@", buf, 0x3Au);
          }
        }
      }
    }
    else
    {
      self->_state = 1;
      if (-[VCMediaDevice autoRunOnStart](self, "autoRunOnStart"))
        v6 = -[VCMediaDevice runInternal](self, "runInternal");
      else
        v6 = 0;
    }
    -[VCObject unlock](self, "unlock");
  }
  else
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaDevice start].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCMediaDevice performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v15 = -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state);
          *(_DWORD *)buf = 136316418;
          v17 = v9;
          v18 = 2080;
          v19 = "-[VCMediaDevice start]";
          v20 = 1024;
          v21 = 52;
          v22 = 2112;
          p_isa = &v8->isa;
          v24 = 2048;
          v25 = self;
          v26 = 2112;
          v27 = v15;
          _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to start because of unexpected state=%@", buf, 0x3Au);
        }
      }
    }
    -[VCObject unlock](self, "unlock");
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/Common/VCMediaDevice.m", 54);
    return +[VCMediaDeviceErrorUtils mediaDeviceErrorEvent:errorPath:returnCode:reason:](VCMediaDeviceErrorUtils, "mediaDeviceErrorEvent:errorPath:returnCode:reason:", 1, v11, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannnot Transition from %@ to %@"), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", 1)));
  }
  return v6;
}

- (id)runInternal
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCMediaDevice *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[VCMediaDevice canEnterState:](self, "canEnterState:", 2))
  {
    v3 = -[VCMediaDevice onRun](self, "onRun");
    if (v3)
    {
      if ((VCMediaDevice *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaDevice runInternal].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v4 = (const __CFString *)-[VCMediaDevice performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v4 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v14 = v10;
            v15 = 2080;
            v16 = "-[VCMediaDevice runInternal]";
            v17 = 1024;
            v18 = 79;
            v19 = 2112;
            v20 = v4;
            v21 = 2048;
            v22 = self;
            v23 = 2112;
            v24 = v3;
            _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to run, error=%@", buf, 0x3Au);
          }
        }
      }
    }
    else
    {
      self->_state = 2;
    }
  }
  else
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaDevice runInternal].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCMediaDevice performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v12 = -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state);
          *(_DWORD *)buf = 136316418;
          v14 = v6;
          v15 = 2080;
          v16 = "-[VCMediaDevice runInternal]";
          v17 = 1024;
          v18 = 71;
          v19 = 2112;
          v20 = v5;
          v21 = 2048;
          v22 = self;
          v23 = 2112;
          v24 = v12;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to run because of unexpected state=%@", buf, 0x3Au);
        }
      }
    }
    -[VCObject unlock](self, "unlock");
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/Common/VCMediaDevice.m", 73);
    return +[VCMediaDeviceErrorUtils mediaDeviceErrorEvent:errorPath:returnCode:reason:](VCMediaDeviceErrorUtils, "mediaDeviceErrorEvent:errorPath:returnCode:reason:", 1, v8, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannnot Transition from %@ to %@"), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", 2)));
  }
  return v3;
}

- (id)run
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  VCMediaDevice *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ %@-run");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCMediaDevice run]";
      v11 = 1024;
      v12 = 85;
      v13 = 2112;
      v14 = -[VCObject logPrefix](self, "logPrefix");
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ %@-run (%p)", (uint8_t *)&v7, 0x30u);
    }
  }
  -[VCObject lock](self, "lock");
  v5 = -[VCMediaDevice runInternal](self, "runInternal");
  -[VCObject unlock](self, "unlock");
  return v5;
}

- (id)stop
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  NSString *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  NSString *p_isa;
  __int16 v29;
  VCMediaDevice *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ %@-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v22 = v3;
      v23 = 2080;
      v24 = "-[VCMediaDevice stop]";
      v25 = 1024;
      v26 = 93;
      v27 = 2112;
      p_isa = -[VCObject logPrefix](self, "logPrefix");
      v29 = 2048;
      v30 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ %@-stop (%p)", buf, 0x30u);
    }
  }
  -[VCObject startTimeoutTimer](self, "startTimeoutTimer");
  -[VCObject lock](self, "lock");
  if (!-[VCMediaDevice canEnterState:](self, "canEnterState:", 0))
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_21;
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v10 = -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state);
      *(_DWORD *)buf = 136315906;
      v22 = v8;
      v23 = 2080;
      v24 = "-[VCMediaDevice stop]";
      v25 = 1024;
      v26 = 97;
      v27 = 2112;
      p_isa = v10;
      v11 = " [%s] %s:%d Unable to stop because of unexpected state=%@";
      v12 = v9;
      v13 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCMediaDevice performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_21;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v16 = -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state);
      *(_DWORD *)buf = 136316418;
      v22 = v14;
      v23 = 2080;
      v24 = "-[VCMediaDevice stop]";
      v25 = 1024;
      v26 = 97;
      v27 = 2112;
      p_isa = &v7->isa;
      v29 = 2048;
      v30 = self;
      v31 = 2112;
      v32 = v16;
      v11 = " [%s] %s:%d %@(%p) Unable to stop because of unexpected state=%@";
      v12 = v15;
      v13 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_21:
    -[VCObject unlock](self, "unlock");
    -[VCObject stopTimeoutTimer](self, "stopTimeoutTimer");
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/Common/VCMediaDevice.m", 100);
    return +[VCMediaDeviceErrorUtils mediaDeviceErrorEvent:errorPath:returnCode:reason:](VCMediaDeviceErrorUtils, "mediaDeviceErrorEvent:errorPath:returnCode:reason:", 1, v17, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannnot Transition from %@ to %@"), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", 0)));
  }
  v5 = -[VCMediaDevice onStop](self, "onStop");
  if (v5)
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaDevice stop].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCMediaDevice performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v22 = v18;
          v23 = 2080;
          v24 = "-[VCMediaDevice stop]";
          v25 = 1024;
          v26 = 106;
          v27 = 2112;
          p_isa = &v6->isa;
          v29 = 2048;
          v30 = self;
          v31 = 2112;
          v32 = v5;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to stop, error=%@", buf, 0x3Au);
        }
      }
    }
  }
  else
  {
    self->_state = 0;
  }
  -[VCObject unlock](self, "unlock");
  -[VCObject stopTimeoutTimer](self, "stopTimeoutTimer");
  return v5;
}

- (id)pause
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  NSString *p_isa;
  __int16 v23;
  VCMediaDevice *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ %@-pause");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v16 = v3;
      v17 = 2080;
      v18 = "-[VCMediaDevice pause]";
      v19 = 1024;
      v20 = 114;
      v21 = 2112;
      p_isa = -[VCObject logPrefix](self, "logPrefix");
      v23 = 2048;
      v24 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ %@-pause (%p)", buf, 0x30u);
    }
  }
  -[VCObject lock](self, "lock");
  if (-[VCMediaDevice canEnterState:](self, "canEnterState:", 3))
  {
    v5 = -[VCMediaDevice onPause](self, "onPause");
    if (v5)
    {
      if ((VCMediaDevice *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaDevice pause].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 = (const __CFString *)-[VCMediaDevice performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v6 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v16 = v11;
            v17 = 2080;
            v18 = "-[VCMediaDevice pause]";
            v19 = 1024;
            v20 = 125;
            v21 = 2112;
            p_isa = &v6->isa;
            v23 = 2048;
            v24 = self;
            v25 = 2112;
            v26 = v5;
            _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to pause, error=%@", buf, 0x3Au);
          }
        }
      }
    }
    else
    {
      self->_state = 3;
    }
    -[VCObject unlock](self, "unlock");
  }
  else
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaDevice pause].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCMediaDevice performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v14 = -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state);
          *(_DWORD *)buf = 136316418;
          v16 = v8;
          v17 = 2080;
          v18 = "-[VCMediaDevice pause]";
          v19 = 1024;
          v20 = 117;
          v21 = 2112;
          p_isa = &v7->isa;
          v23 = 2048;
          v24 = self;
          v25 = 2112;
          v26 = v14;
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to pause because of unexpected state=%@", buf, 0x3Au);
        }
      }
    }
    -[VCObject unlock](self, "unlock");
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/Common/VCMediaDevice.m", 119);
    return +[VCMediaDeviceErrorUtils mediaDeviceErrorEvent:errorPath:returnCode:reason:](VCMediaDeviceErrorUtils, "mediaDeviceErrorEvent:errorPath:returnCode:reason:", 1, v10, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannnot Transition from %@ to %@"), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", 3)));
  }
  return v5;
}

- (id)resume
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  NSString *p_isa;
  __int16 v23;
  VCMediaDevice *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ %@-resume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v16 = v3;
      v17 = 2080;
      v18 = "-[VCMediaDevice resume]";
      v19 = 1024;
      v20 = 132;
      v21 = 2112;
      p_isa = -[VCObject logPrefix](self, "logPrefix");
      v23 = 2048;
      v24 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ %@-resume (%p)", buf, 0x30u);
    }
  }
  -[VCObject lock](self, "lock");
  if (-[VCMediaDevice canEnterState:](self, "canEnterState:", 2))
  {
    v5 = -[VCMediaDevice onResume](self, "onResume");
    if (v5)
    {
      if ((VCMediaDevice *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaDevice resume].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 = (const __CFString *)-[VCMediaDevice performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v6 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            v16 = v11;
            v17 = 2080;
            v18 = "-[VCMediaDevice resume]";
            v19 = 1024;
            v20 = 143;
            v21 = 2112;
            p_isa = &v6->isa;
            v23 = 2048;
            v24 = self;
            v25 = 2112;
            v26 = v5;
            _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to resume, error=%@", buf, 0x3Au);
          }
        }
      }
    }
    else
    {
      self->_state = 2;
    }
    -[VCObject unlock](self, "unlock");
  }
  else
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaDevice resume].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCMediaDevice performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v14 = -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state);
          *(_DWORD *)buf = 136316418;
          v16 = v8;
          v17 = 2080;
          v18 = "-[VCMediaDevice resume]";
          v19 = 1024;
          v20 = 135;
          v21 = 2112;
          p_isa = &v7->isa;
          v23 = 2048;
          v24 = self;
          v25 = 2112;
          v26 = v14;
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to resume because of unexpected state=%@", buf, 0x3Au);
        }
      }
    }
    -[VCObject unlock](self, "unlock");
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/Common/VCMediaDevice.m", 137);
    return +[VCMediaDeviceErrorUtils mediaDeviceErrorEvent:errorPath:returnCode:reason:](VCMediaDeviceErrorUtils, "mediaDeviceErrorEvent:errorPath:returnCode:reason:", 1, v10, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannnot Transition from %@ to %@"), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", 2)));
  }
  return v5;
}

- (id)onStart
{
  return 0;
}

- (id)onStop
{
  return 0;
}

- (id)onRun
{
  return 0;
}

- (id)onPause
{
  return 0;
}

- (id)onResume
{
  return 0;
}

- (BOOL)autoRunOnStart
{
  return 0;
}

- (BOOL)canEnterState:(unsigned int)a3
{
  BOOL result;
  BOOL v4;

  switch(a3)
  {
    case 0u:
      return self->_state - 1 < 3;
    case 1u:
      v4 = self->_state == 0;
      goto LABEL_7;
    case 2u:
      v4 = (self->_state & 0xFFFFFFFD) == 1;
      goto LABEL_7;
    case 3u:
      v4 = self->_state == 2;
LABEL_7:
      result = v4;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)stateStringForState:(unsigned int)a3
{
  if (a3 > 3)
    return CFSTR("INVALID");
  else
    return off_1E9E56E50[a3];
}

- (void)start
{
  NSObject *v0;
  char *v1;
  uint64_t v2;
  uint8_t v3[40];
  uint64_t v4;

  OUTLINED_FUNCTION_14_2();
  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_11(v1, 168);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v2, " [%s] %s:%d Unable to start because of unexpected state=%@", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)runInternal
{
  NSObject *v0;
  char *v1;
  uint64_t v2;
  uint8_t v3[40];
  uint64_t v4;

  OUTLINED_FUNCTION_14_2();
  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_11(v1, 168);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v2, " [%s] %s:%d Unable to run because of unexpected state=%@", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)stop
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Failed to stop, error=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)pause
{
  NSObject *v0;
  char *v1;
  uint64_t v2;
  uint8_t v3[40];
  uint64_t v4;

  OUTLINED_FUNCTION_14_2();
  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_11(v1, 168);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v2, " [%s] %s:%d Unable to pause because of unexpected state=%@", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)resume
{
  NSObject *v0;
  char *v1;
  uint64_t v2;
  uint8_t v3[40];
  uint64_t v4;

  OUTLINED_FUNCTION_14_2();
  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_11(v1, 168);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v2, " [%s] %s:%d Unable to resume because of unexpected state=%@", v3);
  OUTLINED_FUNCTION_3_0();
}

@end
