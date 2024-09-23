@implementation BiometricKitEventLogger

+ (id)logger
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__BiometricKitEventLogger_logger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (logger_once != -1)
    dispatch_once(&logger_once, block);
  return (id)logger_sharedInstance;
}

void __33__BiometricKitEventLogger_logger__block_invoke(uint64_t a1)
{
  os_log_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v2 = os_log_create("com.apple.BiometricKit", "BKEventLogging");
  v3 = (void *)OSLogHandle;
  OSLogHandle = (uint64_t)v2;

  v4 = (void *)OSLogHandle;
  if (!OSLogHandle)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __33__BiometricKitEventLogger_logger__block_invoke_cold_1();
    v4 = (void *)OSLogHandle;
  }
  objc_storeStrong(&OSLogTraceHandle, v4);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___BiometricKitEventLogger;
  v5 = objc_msgSend(objc_msgSendSuper2(&v7, sel_allocWithZone_, 0), "init");
  v6 = (void *)logger_sharedInstance;
  logger_sharedInstance = v5;

}

- (BiometricKitEventLogger)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_source_t v5;
  void *v6;
  NSObject *v7;
  _QWORD handler[4];
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BiometricKitEventLogger;
  v2 = -[BiometricKitEventLogger init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.BiometricKitEventLogger.dispatch", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = *((_QWORD *)v2 + 2);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __31__BiometricKitEventLogger_init__block_invoke;
    handler[3] = &unk_24D241268;
    v10 = v2;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));

  }
  return (BiometricKitEventLogger *)v2;
}

uint64_t __31__BiometricKitEventLogger_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flushEvents");
}

- (void)appendEventValue:(unsigned int)a3 isMetadata:(BOOL)a4
{
  int eventListLength;
  unsigned int *eventList;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  eventListLength = self->_eventListLength;
  if (eventListLength)
  {
    if (eventListLength != 200)
      goto LABEL_6;
    eventList = self->_eventList;
    v9 = self->_eventList[199];
    self->_eventList[199] = 1;
    -[BiometricKitEventLogger flushEvents](self, "flushEvents");
    v10 = self->_eventListLength;
    self->_eventListLength = v10 + 1;
    eventList[v10] = 1;
    v11 = self->_eventListLength;
    self->_eventListLength = v11 + 1;
    eventList[v11] = v9;
  }
  if (!a4)
    -[BiometricKitEventLogger logDeviceMetadata](self, "logDeviceMetadata");
LABEL_6:
  v12 = self->_eventListLength;
  self->_eventListLength = v12 + 1;
  self->_eventList[v12] = a3;
}

- (void)appendEvent:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = 0;
  objc_msgSend(v4, "encodeEventValue:secondValue:", (char *)&v6 + 4, &v6);
  -[BiometricKitEventLogger appendEventValue:isMetadata:](self, "appendEventValue:isMetadata:", HIDWORD(v6), objc_msgSend(v4, "isMetadata"));
  if ((_DWORD)v6)
    -[BiometricKitEventLogger appendEventValue:isMetadata:](self, "appendEventValue:isMetadata:", v6, objc_msgSend(v4, "isMetadata"));
  if (OSLogHandle)
    v5 = OSLogHandle;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEBUG, "BKLogEvent: %@\n", buf, 0xCu);
  }

}

- (void)logEventOrCode:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__BiometricKitEventLogger_logEventOrCode___block_invoke;
  v4[3] = &unk_24D2413D8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __42__BiometricKitEventLogger_logEventOrCode___block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  BKEvent *obj;

  obj = -[BKEvent initWithEventOrCode:]([BKEvent alloc], "initWithEventOrCode:", *(_QWORD *)(a1 + 40));
  if (-[BKEvent isStart](obj, "isStart"))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 829) = 1;
  if (-[BKEvent isSmartKeyboard](obj, "isSmartKeyboard"))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 832), obj);
  objc_msgSend(*(id *)(a1 + 32), "appendEvent:", obj);
  v2 = -[BKEvent isTerminal](obj, "isTerminal");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4 = *(NSObject **)(v3 + 16);
    v5 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 828) = 1;
  }
  else if (!*(_BYTE *)(v3 + 828))
  {
    v6 = *(NSObject **)(v3 + 16);
    v7 = dispatch_time(0, 90000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  }

}

- (void)logDeviceMetadata
{
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_registry_entry_t v6;
  const __CFAllocator *v7;
  void *v8;
  BOOL v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BKEvent *v15;
  id CFProperty;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = *MEMORY[0x24BDD8B18];
  v4 = IOServiceMatching("ApplePearlSEPDriver");
  MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    v6 = MatchingService;
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CFProperty = (id)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("CombinedSequenceEnabled"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v8 = (void *)IORegistryEntryCreateCFProperty(v6, CFSTR("CombinedSequenceAutoSet"), v7, 0);
    if (CFProperty)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      v10 = objc_msgSend(v8, "BOOLValue");
      v11 = objc_msgSend(CFProperty, "BOOLValue");
      if (v11)
        v12 = 524290;
      else
        v12 = 524291;
      v13 = 0x80000;
      if (!v11)
        v13 = 524289;
      if (v10)
        v14 = v12;
      else
        v14 = v13;
      v15 = -[BKEvent initWithEventOrCode:]([BKEvent alloc], "initWithEventOrCode:", v14);
      -[BiometricKitEventLogger appendEvent:](self, "appendEvent:", v15);

      -[BiometricKitEventLogger logSmartKeyboardStatus](self, "logSmartKeyboardStatus");
    }
    IOObjectRelease(v6);

  }
}

- (void)logSmartKeyboardStatus
{
  if (self->_lastSmartKeyboardEvent)
    -[BiometricKitEventLogger appendEvent:](self, "appendEvent:");
}

- (void)flushEvents
{
  _BOOL4 startEventFound;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  unsigned int *eventList;
  NSObject *v11;
  NSObject *v12;
  BKEvent *v13;
  BOOL v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  BKEvent *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_eventListLength)
  {
LABEL_23:
    v7 = 0;
    goto LABEL_24;
  }
  startEventFound = self->_startEventFound;
  v4 = MEMORY[0x24BDACB70];
  if (OSLogHandle)
    v5 = OSLogHandle;
  else
    v5 = MEMORY[0x24BDACB70];
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (!startEventFound)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEBUG, "BKLogEvent: not flushing events since no operation was created\n", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEBUG, "BKLogEvent: flushing events\n", buf, 2u);
  }
  v7 = objc_alloc_init(NSClassFromString(CFSTR("AWDBiometricKitEventLog")));
  if (self->_eventListLength >= 1)
  {
    v9 = 0;
    eventList = self->_eventList;
    *(_QWORD *)&v8 = 67109378;
    v17 = v8;
    do
    {
      if (OSLogHandle)
        v11 = OSLogHandle;
      else
        v11 = v4;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = v11;
        v13 = -[BKEvent initWithEncodedEventOrCode:]([BKEvent alloc], "initWithEncodedEventOrCode:", eventList[v9]);
        *(_DWORD *)buf = v17;
        v19 = v9;
        v20 = 2112;
        v21 = v13;
        _os_log_impl(&dword_2148C7000, v12, OS_LOG_TYPE_DEBUG, "BKLogEvent flush %3d: %@\n\n", buf, 0x12u);

      }
      objc_msgSend(v7, "addEvent:", eventList[v9++], v17);
    }
    while (v9 < self->_eventListLength);
  }
  if (MEMORY[0x24BEC2B10])
    v14 = v7 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    AWDPostMetric();
    v15 = (void *)MEMORY[0x24BE0CE80];
    objc_msgSend(v7, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "analyticsOSLogNSDictionary:forEvent:", v16, CFSTR("biometricKitLogEvent"));

  }
LABEL_24:
  self->_eventListLength = 0;
  *(_WORD *)&self->_terminalFlushPending = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSmartKeyboardEvent, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __33__BiometricKitEventLogger_logger__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2148C7000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.BKEventLogging'!\n", v0, 2u);
}

@end
