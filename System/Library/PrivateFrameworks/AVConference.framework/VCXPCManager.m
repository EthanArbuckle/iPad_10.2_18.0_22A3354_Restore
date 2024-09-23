@implementation VCXPCManager

- (unint64_t)retainCount
{
  return -1;
}

- (VCXPCManager)init
{
  VCXPCManager *v2;
  objc_class *v3;
  const char *v4;
  NSObject *CustomRootQueue;
  dispatch_queue_t v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCXPCManager;
  v2 = -[VCObject init](&v8, sel_init);
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCXPCManager init].cold.1();
    }
    goto LABEL_10;
  }
  v3 = (objc_class *)objc_opt_class();
  v4 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.%@.%s"), "com.apple.AVConference", NSStringFromClass(v3), "xpcCommandQueue"), "UTF8String");
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v6 = dispatch_queue_create_with_target_V2(v4, 0, CustomRootQueue);
  v2->_xpcCommandQueue = (OS_dispatch_queue *)v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCXPCManager init].cold.2();
    }
LABEL_10:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  NSObject *xpcCommandQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[VCXPCManager deregisterBlocksFromService](self, "deregisterBlocksFromService");

  xpcCommandQueue = self->_xpcCommandQueue;
  if (xpcCommandQueue)
    dispatch_release(xpcCommandQueue);
  v4.receiver = self;
  v4.super_class = (Class)VCXPCManager;
  -[VCObject dealloc](&v4, sel_dealloc);
}

+ (id)sharedInstance
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "+[VCXPCManager sharedInstance]"), 0));
}

+ (void)registerBlocksForService
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "+[VCXPCManager registerBlocksForService]"), 0));
}

- (void)deregisterBlocksFromService
{
  NSMutableArray *registeredServices;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  registeredServices = self->_registeredServices;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](registeredServices, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(registeredServices);
        objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "UTF8String"));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](registeredServices, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_registeredServices, "removeAllObjects");
}

+ (void)registerBlock:(id)a3 forService:(const char *)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a1, "sharedInstance");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__VCXPCManager_registerBlock_forService___block_invoke;
  v8[3] = &unk_1E9E537D0;
  v8[4] = a1;
  v8[5] = a3;
  objc_msgSend(*(id *)(v7 + 176), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4));
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", a4, v8, *(_QWORD *)(v7 + 168));
}

uint64_t __41__VCXPCManager_registerBlock_forService___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "sharedInstance");
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)registerTerminateBlock:(id)a3 forService:(const char *)a4 expectedClasses:(id)a5
{
  uint64_t v9;
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a1, "sharedInstance");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__VCXPCManager_registerTerminateBlock_forService_expectedClasses___block_invoke;
  v10[3] = &unk_1E9E537F8;
  v10[4] = a5;
  v10[5] = a1;
  v10[6] = a3;
  objc_msgSend(*(id *)(v9 + 176), "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4, MEMORY[0x1E0C809B0], 3221225472, __66__VCXPCManager_registerTerminateBlock_forService_expectedClasses___block_invoke, &unk_1E9E537F8, a5, a1, a3));
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", a4, v10, *(_QWORD *)(v9 + 168));
}

id __66__VCXPCManager_registerTerminateBlock_forService_expectedClasses___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = 0;
  }
  else
  {
    v18 = CFSTR("CONTEXT");
    v19[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  }
  v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
        if (v8)
          goto LABEL_6;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v12[0] = objc_msgSend(*(id *)(a1 + 40), "sharedInstance");
    v12[1] = v5;
    (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v12);
  }
  return v4;
}

+ (void)addNSError:(id)a3 toXPCArgumentDictionary:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v6 = objc_msgSend(a3, "domain");
    if (v6)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("ERROR_DOMAIN"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "code")), CFSTR("ERROR_CODE"));
    v7 = objc_msgSend(a3, "userInfo");
    if (v7)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("ERROR_USERINFO"));
    objc_msgSend(a4, "setObject:forKeyedSubscript:", v8, CFSTR("ERROR"));

  }
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate xpcCommandQueue", v2, v3, v4, v5, 2u);
}

@end
