@implementation MXDebugPlatform

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_57);
  return (id)sharedInstance_sSharedInstance_6;
}

MXDebugPlatform *__33__MXDebugPlatform_sharedInstance__block_invoke()
{
  MXDebugPlatform *result;

  result = objc_alloc_init(MXDebugPlatform);
  sharedInstance_sSharedInstance_6 = (uint64_t)result;
  return result;
}

- (MXDebugPlatform)init
{
  MXDebugPlatform *v2;
  NSObject *v3;
  CFDictionaryValueCallBacks v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MXDebugPlatform;
  v2 = -[MXDebugPlatform init](&v6, sel_init);
  if (v2)
  {
    *(_OWORD *)&v5.version = xmmword_1E309E530;
    *(_OWORD *)&v5.release = *(_OWORD *)&off_1E309E540;
    v5.equal = 0;
    v2->_logger = (OS_os_log *)MXGetSessionLog();
    v2->_sysdiagnoseBlockRegistry = (NSMutableDictionary *)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], &v5);
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_sysdiagnoseBlockQueue = (OS_dispatch_queue *)dispatch_queue_create("MXSysdiagnoseBlockRegistryQueue", v3);
    os_state_add_handler();
  }
  return v2;
}

uint64_t __23__MXDebugPlatform_init__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3)
    -[MXDebugPlatform executeSysdiagnoseBlocks](+[MXDebugPlatform sharedInstance](MXDebugPlatform, "sharedInstance"), "executeSysdiagnoseBlocks");
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_sysdiagnoseBlockQueue);
  self->_sysdiagnoseBlockQueue = 0;

  self->_sysdiagnoseBlockRegistry = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXDebugPlatform;
  -[MXDebugPlatform dealloc](&v3, sel_dealloc);
}

- (void)executeSysdiagnoseBlocks
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = -[MXDebugPlatform sysdiagnoseBlockRegistry](self, "sysdiagnoseBlockRegistry");
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = -[NSMutableDictionary objectForKey:](-[MXDebugPlatform sysdiagnoseBlockRegistry](self, "sysdiagnoseBlockRegistry", v10, v11), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        if (v8)
        {
          (*(void (**)(void))(v8 + 16))();
        }
        else
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
}

- (void)installSysdiagnoseBlock:(id)a3 blockToRun:(id)a4
{
  OS_dispatch_queue *v7;
  _QWORD v8[7];

  v7 = -[MXDebugPlatform sysdiagnoseBlockQueue](self, "sysdiagnoseBlockQueue");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__MXDebugPlatform_installSysdiagnoseBlock_blockToRun___block_invoke;
  v8[3] = &unk_1E309E580;
  v8[5] = a3;
  v8[6] = a4;
  v8[4] = self;
  MXDispatchSync((uint64_t)"-[MXDebugPlatform installSysdiagnoseBlock:blockToRun:]", (uint64_t)"MXDebugPlatform.m", 199, 0, 0, v7, (uint64_t)v8);
}

uint64_t __54__MXDebugPlatform_installSysdiagnoseBlock_blockToRun___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "sysdiagnoseBlockRegistry");
  if (v2)
    return objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)simulateCrash:(const char *)a3
{
  OS_os_log *v4;

  v4 = -[MXDebugPlatform logger](self, "logger");
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_FAULT))
    -[MXDebugPlatform simulateCrash:].cold.1((uint64_t)a3, v4);
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)sysdiagnoseBlockQueue
{
  return self->_sysdiagnoseBlockQueue;
}

- (NSMutableDictionary)sysdiagnoseBlockRegistry
{
  return self->_sysdiagnoseBlockRegistry;
}

- (void)simulateCrash:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = a1;
  _os_log_fault_impl(&dword_1935FC000, a2, OS_LOG_TYPE_FAULT, "%s (This is not a crash)", (uint8_t *)&v2, 0xCu);
}

@end
