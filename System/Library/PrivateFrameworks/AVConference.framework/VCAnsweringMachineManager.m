@implementation VCAnsweringMachineManager

- (VCAnsweringMachineManager)init
{
  VCAnsweringMachineManager *v2;
  NSMutableArray *v3;
  NSObject *CustomRootQueue;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  VCAnsweringMachineManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCAnsweringMachineManager;
  v2 = -[VCXPCManager init](&v9, sel_init);
  if (!v2)
  {
    if (objc_opt_class())
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(0, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAnsweringMachineManager init].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAnsweringMachineManager init].cold.1();
    }
    goto LABEL_24;
  }
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2->_instances = v3;
  if (!v3)
  {
    if ((VCAnsweringMachineManager *)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAnsweringMachineManager init].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCAnsweringMachineManager performSelector:](v2, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v11 = v7;
          v12 = 2080;
          v13 = "-[VCAnsweringMachineManager init]";
          v14 = 1024;
          v15 = 33;
          v16 = 2112;
          v17 = v6;
          v18 = 2048;
          v19 = v2;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to init the instances array", buf, 0x30u);
        }
      }
    }
LABEL_24:

    return 0;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v2->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAnsweringMachineManager.callbackQueue", MEMORY[0x1E0C80D50], CustomRootQueue);
  return v2;
}

- (void)dealloc
{
  NSObject *callbackQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
    dispatch_release(callbackQueue);
  v4.receiver = self;
  v4.super_class = (Class)VCAnsweringMachineManager;
  -[VCXPCManager dealloc](&v4, sel_dealloc);
}

+ (id)sharedInstance
{
  if (sharedInstance_token_1 != -1)
    dispatch_once(&sharedInstance_token_1, &__block_literal_global_15);
  return (id)sharedInstance_instance;
}

void __43__VCAnsweringMachineManager_sharedInstance__block_invoke()
{
  if (!sharedInstance_instance)
    sharedInstance_instance = objc_alloc_init(VCAnsweringMachineManager);
}

+ (void)registerAnsweringMachineInitialize
{
  objc_msgSend(a1, "registerBlock:forService:", &__block_literal_global_10, "vcAnsweringMachineInitialize");
}

id __63__VCAnsweringMachineManager_registerAnsweringMachineInitialize__block_invoke(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v3;
  AVCAnsweringMachineConfiguration *v4;
  AVCAnsweringMachineConfiguration *v5;
  VCAnsweringMachine *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v11;
  _QWORD v12[2];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  VCAnsweringMachine *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = -[AVCAnsweringMachineConfiguration initWithClientDictionary:clientPid:]([AVCAnsweringMachineConfiguration alloc], "initWithClientDictionary:clientPid:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAnsweringMachineConfig")), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CLIENTPID")), "intValue"));
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __63__VCAnsweringMachineManager_registerAnsweringMachineInitialize__block_invoke_cold_1();
    }
    return 0;
  }
  v5 = v4;
  v6 = -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]([VCAnsweringMachine alloc], "initWithConfiguration:delegate:delegateQueue:", v4, v3, *(_QWORD *)(v3 + 192));

  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __63__VCAnsweringMachineManager_registerAnsweringMachineInitialize__block_invoke_cold_2();
    }
    return 0;
  }
  objc_msgSend(*(id *)(v3 + 184), "addObject:", v6);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v14 = v7;
      v15 = 2080;
      v16 = "+[VCAnsweringMachineManager registerAnsweringMachineInitialize]_block_invoke";
      v17 = 1024;
      v18 = 85;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAnsweringMachineManager allocated new VCAnsweringMachine=%@", buf, 0x26u);
    }
  }
  v12[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCAnsweringMachine messageAudioToken](v6, "messageAudioToken", CFSTR("CONTEXT"), CFSTR("vcAnsweringMachineMessageAudioToken"), v6));
  v9 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 2);

  return v9;
}

+ (void)registerAnsweringMachineTerminate
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(a1, "registerTerminateBlock:forService:expectedClasses:", &__block_literal_global_25, "vcAnsweringMachineTerminate", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1));
}

uint64_t __62__VCAnsweringMachineManager_registerAnsweringMachineTerminate__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;

  v3 = (void *)a2[1];
  objc_msgSend(v3, "invalidate");
  return objc_msgSend(*(id *)(*a2 + 184), "removeObject:", v3);
}

+ (void)registerAnsweringMachineStart
{
  objc_msgSend(a1, "registerBlock:forService:", &__block_literal_global_28, "vcAnsweringMachineStart");
}

uint64_t __58__VCAnsweringMachineManager_registerAnsweringMachineStart__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a2 + 8), "start");
  return 0;
}

+ (void)registerAnsweringMachineStop
{
  objc_msgSend(a1, "registerBlock:forService:", &__block_literal_global_30, "vcAnsweringMachineStop");
}

uint64_t __57__VCAnsweringMachineManager_registerAnsweringMachineStop__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a2 + 8), "stop");
  return 0;
}

+ (void)registerBlocksForService
{
  objc_msgSend(a1, "registerAnsweringMachineInitialize");
  objc_msgSend(a1, "registerAnsweringMachineTerminate");
  objc_msgSend(a1, "registerAnsweringMachineStart");
  objc_msgSend(a1, "registerAnsweringMachineStop");
}

- (void)answeringMachine:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6), CFSTR("vcAnsweringMachineStatus"), 0);
  +[VCXPCManager addNSError:toXPCArgumentDictionary:](VCXPCManager, "addNSError:toXPCArgumentDictionary:", a5, v9);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcAnsweringMachineDidStart", v9, a3);

}

- (void)answeringMachine:(id)a3 didStop:(BOOL)a4 recordingURL:(id)a5 error:(id)a6
{
  _BOOL8 v8;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  VCAnsweringMachineManager *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  VCAnsweringMachineManager *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v8 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  v11 = objc_alloc(MEMORY[0x1E0C99E08]);
  v12 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8), CFSTR("vcAnsweringMachineStatus"), 0);
  if (!a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v24 = v15;
        v25 = 2080;
        v26 = "-[VCAnsweringMachineManager answeringMachine:didStop:recordingURL:error:]";
        v27 = 1024;
        v28 = 157;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping sandbox logic as there is no recordingURL", buf, 0x1Cu);
      }
    }
    goto LABEL_22;
  }
  objc_msgSend((id)objc_msgSend(a5, "path"), "fileSystemRepresentation");
  v13 = sandbox_extension_issue_file();
  if (!v13)
  {
    if ((VCAnsweringMachineManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAnsweringMachineManager answeringMachine:didStop:recordingURL:error:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCAnsweringMachineManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v24 = v18;
          v25 = 2080;
          v26 = "-[VCAnsweringMachineManager answeringMachine:didStop:recordingURL:error:]";
          v27 = 1024;
          v28 = 161;
          v29 = 2112;
          v30 = (id)v17;
          v31 = 2048;
          v32 = self;
          v33 = 2112;
          v34 = a5;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to issue sandbox extension for url=%@, removing url", buf, 0x3Au);
        }
      }
    }
    v22 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", a5, &v22) & 1) == 0
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v24 = v20;
        v25 = 2080;
        v26 = "-[VCAnsweringMachineManager answeringMachine:didStop:recordingURL:error:]";
        v27 = 1024;
        v28 = 171;
        v29 = 2112;
        v30 = a5;
        v31 = 2112;
        v32 = v22;
        _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to remove recordingURL=%@: error=%@", buf, 0x30u);
      }
    }
LABEL_22:
    v14 = 0;
    goto LABEL_4;
  }
  v14 = (void *)v13;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", a5, CFSTR("vcAnsweringMachineMessageRecordingURL"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14), CFSTR("vcAnsweringMachineMessageRecordingURLSandboxExtensionToken"));
LABEL_4:
  free(v14);
  +[VCXPCManager addNSError:toXPCArgumentDictionary:](VCXPCManager, "addNSError:toXPCArgumentDictionary:", a6, v12);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcAnsweringMachineDidStop", v12, a3);

}

- (void)answeringMachine:(id)a3 didFinishAnnouncement:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9 = (id)objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6), CFSTR("vcAnsweringMachineStatus"), 0);
  +[VCXPCManager addNSError:toXPCArgumentDictionary:](VCXPCManager, "addNSError:toXPCArgumentDictionary:", a5, v9);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcAnsweringMachineDidFinishAnnouncement", v9, a3);

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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init the instances array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__VCAnsweringMachineManager_registerAnsweringMachineInitialize__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize answering machine configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__VCAnsweringMachineManager_registerAnsweringMachineInitialize__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize answering machine", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)answeringMachine:didStop:recordingURL:error:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCAnsweringMachineManager answeringMachine:didStop:recordingURL:error:]";
  v6 = 1024;
  v7 = 161;
  v8 = 2112;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to issue sandbox extension for url=%@, removing url", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

@end
