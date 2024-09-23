@implementation VCDispatchTimer

- (VCDispatchTimer)initWithIntervalSeconds:(unsigned int)a3 callbackBlock:(id)a4
{
  return -[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:](self, "initWithIntervalMilliseconds:callbackBlock:clientQueue:", 1000 * a3, a4, 0);
}

- (VCDispatchTimer)initWithIntervalMilliseconds:(unsigned int)a3 callbackBlock:(id)a4
{
  return -[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:](self, "initWithIntervalMilliseconds:callbackBlock:clientQueue:", *(_QWORD *)&a3, a4, 0);
}

- (VCDispatchTimer)initWithIntervalSeconds:(unsigned int)a3 callbackBlock:(id)a4 clientQueue:(id)a5
{
  return -[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:](self, "initWithIntervalMilliseconds:callbackBlock:clientQueue:", 1000 * a3, a4, a5);
}

- (VCDispatchTimer)initWithIntervalMilliseconds:(unsigned int)a3 callbackBlock:(id)a4 clientQueue:(id)a5
{
  VCDispatchTimer *v8;
  dispatch_source_t v9;
  uint64_t v10;
  NSObject *timer;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[6];
  _QWORD handler[5];
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VCDispatchTimer;
  v8 = -[VCObject init](&v19, sel_init);
  if (v8)
  {
    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)a5);
    v8->_timer = (OS_dispatch_source *)v9;
    if (v9)
    {
      v8->_callbackBlock = _Block_copy(a4);
      v8->_intervalMilliseconds = a3;
      v10 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v8);
      timer = v8->_timer;
      v12 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __74__VCDispatchTimer_initWithIntervalMilliseconds_callbackBlock_clientQueue___block_invoke;
      handler[3] = &unk_1E9E521C0;
      handler[4] = v10;
      dispatch_source_set_event_handler(timer, handler);
      v13 = v8->_timer;
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __74__VCDispatchTimer_initWithIntervalMilliseconds_callbackBlock_clientQueue___block_invoke_5;
      v17[3] = &unk_1E9E52960;
      v17[4] = v10;
      v17[5] = v13;
      dispatch_source_set_cancel_handler(v13, v17);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:].cold.1(v14, v15);
      }

      return 0;
    }
  }
  return v8;
}

void __74__VCDispatchTimer_initWithIntervalMilliseconds_callbackBlock_clientQueue___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
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
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v1)
  {
    v2 = v1;
    if (objc_msgSend(v1, "isRunning"))
    {
      v3 = objc_msgSend(v2, "callbackBlock");
      (*(void (**)(uint64_t))(v3 + 16))(v3);
      return;
    }
    if ((void *)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315650;
          v13 = v5;
          v14 = 2080;
          v15 = "-[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:]_block_invoke";
          v16 = 1024;
          v17 = 65;
          v7 = " [%s] %s:%d timer is not running. ignoring timeout.";
          v8 = v6;
          v9 = 28;
LABEL_14:
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(v2, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136316162;
          v13 = v10;
          v14 = 2080;
          v15 = "-[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:]_block_invoke";
          v16 = 1024;
          v17 = 65;
          v18 = 2112;
          v19 = v4;
          v20 = 2048;
          v21 = v2;
          v7 = " [%s] %s:%d %@(%p) timer is not running. ignoring timeout.";
          v8 = v11;
          v9 = 48;
          goto LABEL_14;
        }
      }
    }
  }
}

void __74__VCDispatchTimer_initWithIntervalMilliseconds_callbackBlock_clientQueue___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
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
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "strong");
  v2 = objc_opt_class();
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "strong"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(const __CFString **)(a1 + 40);
        v14 = 136315906;
        v15 = v4;
        v16 = 2080;
        v17 = "-[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:]_block_invoke";
        v18 = 1024;
        v19 = 70;
        v20 = 2048;
        v21 = v6;
        v7 = " [%s] %s:%d timer=%p has been cancelled";
        v8 = v5;
        v9 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "strong");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(*(id *)(a1 + 32), "strong");
        v13 = *(_QWORD *)(a1 + 40);
        v14 = 136316418;
        v15 = v10;
        v16 = 2080;
        v17 = "-[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:]_block_invoke";
        v18 = 1024;
        v19 = 70;
        v20 = 2112;
        v21 = v3;
        v22 = 2048;
        v23 = v12;
        v24 = 2048;
        v25 = v13;
        v7 = " [%s] %s:%d %@(%p) timer=%p has been cancelled";
        v8 = v11;
        v9 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)dealloc
{
  os_log_t *v3;
  const __CFString *v4;
  uint64_t v5;
  os_log_t v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  uint64_t v11;
  os_log_t v12;
  OS_dispatch_source *timer;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  OS_dispatch_source *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  OS_dispatch_source *v23;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  VCDispatchTimer *v34;
  __int16 v35;
  OS_dispatch_source *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!self->_running)
    dispatch_resume((dispatch_object_t)self->_timer);
  dispatch_source_cancel((dispatch_source_t)self->_timer);
  if (!dispatch_source_testcancel((dispatch_source_t)self->_timer))
  {
    v3 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((VCDispatchTimer *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          continue;
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *v3;
        if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
          continue;
        timer = self->_timer;
        *(_DWORD *)buf = 136315906;
        v26 = v11;
        v27 = 2080;
        v28 = "-[VCDispatchTimer dealloc]";
        v29 = 1024;
        v30 = 82;
        v31 = 2048;
        v32 = timer;
        v8 = v12;
        v9 = " [%s] %s:%d timer=%p is waiting to be test cancelled";
        v10 = 38;
      }
      else
      {
        v4 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v4 = (const __CFString *)-[VCDispatchTimer performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          continue;
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *v3;
        if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
          continue;
        v7 = self->_timer;
        *(_DWORD *)buf = 136316418;
        v26 = v5;
        v27 = 2080;
        v28 = "-[VCDispatchTimer dealloc]";
        v29 = 1024;
        v30 = 82;
        v31 = 2112;
        v32 = (void *)v4;
        v33 = 2048;
        v34 = self;
        v35 = 2048;
        v36 = v7;
        v8 = v6;
        v9 = " [%s] %s:%d %@(%p) timer=%p is waiting to be test cancelled";
        v10 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
    }
    while (!dispatch_source_testcancel((dispatch_source_t)self->_timer));
  }
  if ((VCDispatchTimer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_timer;
        *(_DWORD *)buf = 136315906;
        v26 = v15;
        v27 = 2080;
        v28 = "-[VCDispatchTimer dealloc]";
        v29 = 1024;
        v30 = 84;
        v31 = 2048;
        v32 = v17;
        v18 = " [%s] %s:%d timer=%p has been test cancelled";
        v19 = v16;
        v20 = 38;
LABEL_26:
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCDispatchTimer performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_timer;
        *(_DWORD *)buf = 136316418;
        v26 = v21;
        v27 = 2080;
        v28 = "-[VCDispatchTimer dealloc]";
        v29 = 1024;
        v30 = 84;
        v31 = 2112;
        v32 = (void *)v14;
        v33 = 2048;
        v34 = self;
        v35 = 2048;
        v36 = v23;
        v18 = " [%s] %s:%d %@(%p) timer=%p has been test cancelled";
        v19 = v22;
        v20 = 58;
        goto LABEL_26;
      }
    }
  }
  _Block_release(self->_callbackBlock);
  dispatch_release((dispatch_object_t)self->_timer);
  v24.receiver = self;
  v24.super_class = (Class)VCDispatchTimer;
  -[VCObject dealloc](&v24, sel_dealloc);
}

- (void)start
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCDispatchTimer start]";
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d started a timer=%p that was already running", v2, *(const char **)v3, (unint64_t)"-[VCDispatchTimer start]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)stop
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCDispatchTimer stop]";
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stopped a timer=%p that was already stop", v2, *(const char **)v3, (unint64_t)"-[VCDispatchTimer stop]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (BOOL)isRunning
{
  return self->_running;
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (void)initWithIntervalMilliseconds:(uint64_t)a1 callbackBlock:(NSObject *)a2 clientQueue:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:]";
  v6 = 1024;
  v7 = 49;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create dispatch timer", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

@end
