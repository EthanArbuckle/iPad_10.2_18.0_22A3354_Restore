@implementation BCBrtControl

+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotSupported"), CFSTR("This class doesn't support create monitor with handler"));
  return 0;
}

+ (id)copyAvailableControls
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotSupported"), CFSTR("This class doesn't support copy available controls"));
  return 0;
}

- (BCBrtControl)init
{
  BCBrtControl *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCBrtControl;
  v2 = -[BCBrtControl init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x22E2D4EA4]();
    v4 = -[BCBrtControl copyModuleIdentifier](v2, "copyModuleIdentifier");
    v2->_logHandle = 0;
    v2->_capabilities = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v2->_callbackQueue = 0;
    v2->_queue = 0;
    v2->_id = 0;
    v2->_isValid = 0;
    v2->_containerID = 0;
    v2->_cfContainerID = 0;
    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *queue;
  id displayInvalidHandler;
  __CFUUID *cfContainerID;
  objc_super v6;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);

  displayInvalidHandler = self->_displayInvalidHandler;
  if (displayInvalidHandler)
    _Block_release(displayInvalidHandler);

  cfContainerID = self->_cfContainerID;
  if (cfContainerID)
    CFRelease(cfContainerID);

  v6.receiver = self;
  v6.super_class = (Class)BCBrtControl;
  -[BCBrtControl dealloc](&v6, sel_dealloc);
}

- (id)copyModuleIdentifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", CFSTR("com.apple.BCBrtControl"));
}

- (BOOL)_checkIsValid:(id *)a3
{
  BOOL v4;
  BOOL v5;

  v4 = -[BCBrtControl isValid](self, "isValid");
  v5 = v4;
  if (a3 && !v4)
    *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithBCError:", 18);
  return v5;
}

- (OS_os_log)logHandle
{
  OS_os_log *logHandle;
  id v4;
  OS_os_log *v5;
  NSObject *inited;

  logHandle = self->_logHandle;
  if (!logHandle)
  {
    v4 = -[BCBrtControl copyModuleIdentifier](self, "copyModuleIdentifier");
    v5 = (OS_os_log *)os_log_create((const char *)objc_msgSend(v4, "UTF8String"), "default");
    self->_logHandle = v5;
    if (!v5)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT)
        inited = init_default_corebrightness_log();
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
        -[BCBrtControl logHandle].cold.1(inited);
    }

    logHandle = self->_logHandle;
  }
  if (logHandle)
    return logHandle;
  else
    return (OS_os_log *)MEMORY[0x24BDACB70];
}

- (OS_dispatch_queue)queue
{
  OS_dispatch_queue *result;

  result = self->_queue;
  if (!result)
  {
    result = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BrightnessControl", 0);
    self->_queue = result;
    if (!result)
      -[BCBrtControl queue].cold.1();
  }
  return result;
}

- (__CFUUID)cfContainerID
{
  __CFUUID *result;
  void *v4;

  if (!self->_containerID)
    return 0;
  result = self->_cfContainerID;
  if (!result)
  {
    v4 = (void *)MEMORY[0x22E2D4EA4](0, a2);
    self->_cfContainerID = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)-[NSUUID UUIDString](self->_containerID, "UUIDString"));
    objc_autoreleasePoolPop(v4);
    return self->_cfContainerID;
  }
  return result;
}

- (id)ID
{
  id result;
  void *v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  const __CFString *v8;

  result = self->_id;
  if (!result)
  {
    v4 = (void *)MEMORY[0x22E2D4EA4](0, a2);
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (-[BCBrtControl containerID](self, "containerID"))
      v8 = (const __CFString *)-[NSUUID description](-[BCBrtControl containerID](self, "containerID"), "description");
    else
      v8 = CFSTR("main");
    self->_id = (NSString *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@-%@"), v7, v8);
    objc_autoreleasePoolPop(v4);
    return self->_id;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  NSUUID *v7;

  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    return 0;
  v7 = -[BCBrtControl containerID](self, "containerID");
  return v7 == (NSUUID *)objc_msgSend(a3, "containerID");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  v3 = (void *)MEMORY[0x22E2D4EA4](self, a2);
  v4 = objc_msgSend(-[BCBrtControl ID](self, "ID"), "hash");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (BOOL)setNits:(double)a3 error:(id *)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotSupported"), CFSTR("This class doesn't support setting brightness"), a3);
  return 0;
}

- (void)_runOnCallbackQueue:(id)a3
{
  NSObject *callbackQueue;
  _QWORD v6[6];

  if (-[BCBrtControl callbackQueue](self, "callbackQueue"))
  {
    callbackQueue = self->_callbackQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__BCBrtControl__runOnCallbackQueue___block_invoke;
    v6[3] = &unk_24F2A7290;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(callbackQueue, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("callbackQueue is nil. Cannot call user supplied callback."));
  }
}

void __36__BCBrtControl__runOnCallbackQueue___block_invoke(uint64_t a1)
{
  dispatch_sync((dispatch_queue_t)objc_msgSend(*(id *)(a1 + 32), "queue"), *(dispatch_block_t *)(a1 + 40));
}

- (void)setNitsAsync:(double)a3 completionHandler:(id)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__BCBrtControl_setNitsAsync_completionHandler___block_invoke;
  v4[3] = &unk_24F2A72B8;
  *(double *)&v4[6] = a3;
  v4[4] = self;
  v4[5] = a4;
  -[BCBrtControl _runOnCallbackQueue:](self, "_runOnCallbackQueue:", v4);
}

uint64_t __47__BCBrtControl_setNitsAsync_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setNits:error:", &v3, *(double *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  return result;
}

- (double)getNitsWithError:(id *)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotSupported"), CFSTR("This class doesn't support setting brightness with this unit"));
  return -1.0;
}

- (BOOL)setProperty:(id)a3 value:(id)a4 error:(id *)a5
{
  if (a5)
    *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithBCError:", 16);
  return 0;
}

- (void)setPropertyAync:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__BCBrtControl_setPropertyAync_value_completionHandler___block_invoke;
  v5[3] = &unk_24F2A72E0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  -[BCBrtControl _runOnCallbackQueue:](self, "_runOnCallbackQueue:", v5);
}

void __56__BCBrtControl_setPropertyAync_value_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setProperty:value:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &v3);
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)copyProperty:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithBCError:", 16);
  return 0;
}

- (void)setDisplayService:(unsigned int)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("NotSupported"), CFSTR("This class doesn't support display service."));
}

- (NSUUID)containerID
{
  return self->_containerID;
}

- (double)maxNits
{
  return self->_maxNits;
}

- (double)minNits
{
  return self->_minNits;
}

- (NSDictionary)capabilities
{
  return &self->_capabilities->super;
}

- (BOOL)multipleControlEnabled
{
  return self->_multipleControlEnabled;
}

- (void)setMultipleControlEnabled:(BOOL)a3
{
  self->_multipleControlEnabled = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (id)displayInvalidHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayInvalidHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCallbackQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

+ (id)newMonitorForAllControlsWithHandler:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BCBrtMonitor *v11;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "addObject:", +[BCAppleBacklightBrtControl newMonitorWithHandler:error:](BCAppleBacklightBrtControl, "newMonitorWithHandler:error:", a3, a4));
  objc_msgSend(v6, "addObject:", +[BCHIDBrtControl newMonitorWithHandler:error:](BCHIDBrtControl, "newMonitorWithHandler:error:", a3, a4));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);

      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  v11 = objc_alloc_init(BCBrtMonitor);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__BCBrtControl_BCDisplayList__newMonitorForAllControlsWithHandler_error___block_invoke;
  v13[3] = &unk_24F2A71B0;
  v13[4] = v6;
  -[BCBrtMonitor setCancelHandler:](v11, "setCancelHandler:", v13);
  return v11;
}

void __73__BCBrtControl_BCDisplayList__newMonitorForAllControlsWithHandler_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "cancel");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)copyAllAvailableControls
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (void *)MEMORY[0x22E2D4EA4]();
  objc_msgSend(v2, "addObjectsFromArray:", +[BCAppleBacklightBrtControl copyAvailableControls](BCAppleBacklightBrtControl, "copyAvailableControls"));
  objc_msgSend(v2, "addObjectsFromArray:", +[BCHIDBrtControl copyAvailableControls](BCHIDBrtControl, "copyAvailableControls"));
  objc_autoreleasePoolPop(v3);
  return v2;
}

- (void)logHandle
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229A2F000, log, OS_LOG_TYPE_ERROR, "Unable to create log handle", v1, 2u);
}

- (void)queue
{
  __assert_rtn("-[BCBrtControl queue]", "BCBrtControl.m", 93, "_queue && \"Cannot proceed without dispatch queue\");
}

@end
