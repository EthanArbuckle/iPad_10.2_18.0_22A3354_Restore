@implementation AVCPacketRelayDriver

+ (AVCPacketRelayDriver)sharedInstance
{
  void *v2;
  AVCPacketRelayDriver *Weak;
  AVCPacketRelayDriver *v4;

  v2 = (void *)objc_opt_class();
  objc_sync_enter(v2);
  Weak = (AVCPacketRelayDriver *)objc_loadWeak(&sharedInstance_sharedInstance_2);
  if (!Weak)
  {
    v4 = objc_alloc_init(AVCPacketRelayDriver);
    objc_storeWeak(&sharedInstance_sharedInstance_2, v4);
    Weak = v4;
  }
  objc_sync_exit(v2);
  return Weak;
}

- (void)startMonitoringFileDescriptor:(int)a3 forConnection:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[AVCPacketRelayDriver startMonitoringFileDescriptor:forConnection:]";
      v12 = 1024;
      v13 = 32;
      v14 = 1024;
      v15 = a3;
      v16 = 2112;
      v17 = a4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d fileDescriptor=%d, connection=%@", (uint8_t *)&v8, 0x2Cu);
    }
  }
  if (a3 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCPacketRelayDriver startMonitoringFileDescriptor:forConnection:].cold.1();
    }
  }
  else
  {
    AVCPacketRelayDriverThreadAddFileDescriptorWithConnection(a3, (uint64_t)a4);
  }
}

- (void)stopMonitoringFileDescriptor:(int)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[AVCPacketRelayDriver stopMonitoringFileDescriptor:]";
      v10 = 1024;
      v11 = 42;
      v12 = 1024;
      v13 = a3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d fileDescriptor=%d", (uint8_t *)&v6, 0x22u);
    }
  }
  if (a3 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCPacketRelayDriver stopMonitoringFileDescriptor:].cold.1();
    }
  }
  else
  {
    AVCPacketRelayDriverThreadRemoveFileDescriptor(a3);
  }
}

- (AVCPacketRelayDriver)init
{
  AVCPacketRelayDriver *v2;
  int v3;
  int ErrorLogLevelForModule;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  AVCPacketRelayDriver *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)AVCPacketRelayDriver;
  v2 = -[AVCPacketRelayDriver init](&v10, sel_init);
  if (v2)
  {
    v3 = AVCPacketRelayDriverThreadStart();
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3 == -1)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCPacketRelayDriver init].cold.1(v7, v8);
      }

      return 0;
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = v5;
        v13 = 2080;
        v14 = "-[AVCPacketRelayDriver init]";
        v15 = 1024;
        v16 = 60;
        v17 = 2048;
        v18 = v2;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayDriver init %p", buf, 0x26u);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  AVCPacketRelayDriverThreadStop();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVCPacketRelayDriver dealloc]";
      v10 = 1024;
      v11 = 68;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayDriver dealloc", buf, 0x1Cu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCPacketRelayDriver;
  -[AVCPacketRelayDriver dealloc](&v5, sel_dealloc);
}

- (void)startMonitoringFileDescriptor:forConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelayDriver: invalid file descriptor to drive", v2, v3, v4, v5, 2u);
}

- (void)stopMonitoringFileDescriptor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCPacketRelayDriver: invalid file descriptor to stop", v2, v3, v4, v5, 2u);
}

- (void)init
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = 136315906;
  v6 = a1;
  v7 = 2080;
  v8 = "-[AVCPacketRelayDriver init]";
  v9 = 1024;
  v10 = 56;
  v11 = 1024;
  v12 = v4;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelayDriver init failed: unable to start driver thread with errno %d", (uint8_t *)&v5, 0x22u);
}

@end
