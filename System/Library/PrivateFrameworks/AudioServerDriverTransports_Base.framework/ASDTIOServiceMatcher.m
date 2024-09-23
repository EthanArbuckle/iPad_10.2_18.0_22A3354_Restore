@implementation ASDTIOServiceMatcher

+ (id)forIOServiceWithClassName:(id)a3 withDelegate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForIOServiceWithClassName:withDelegate:", v6, v7);

  return v8;
}

- (id)initForIOServiceWithClassName:(id)a3 withDelegate:(id)a4
{
  id v7;
  id v8;
  char v9;
  char v10;
  ASDTIOServiceMatcher *v11;
  ASDTIOServiceMatcher *v12;
  ASDTIOServiceMatcher *v13;
  uint64_t v14;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *matcherQueue;
  IONotificationPort *v18;
  unsigned int v19;
  unsigned int v20;
  mach_port_t mainPort;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = objc_msgSend(v7, "isEqualToString:", &stru_250842438);
    v10 = v8 ? v9 : 1;
    if ((v10 & 1) == 0)
    {
      v23.receiver = self;
      v23.super_class = (Class)ASDTIOServiceMatcher;
      v13 = -[ASDTIOServiceMatcher init](&v23, sel_init);
      v12 = v13;
      if (v13)
      {
        objc_storeStrong((id *)&v13->_ioServiceClassName, a3);
        v14 = objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 1);
        v12->_ioServiceClassNameCStr = (const char *)v14;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.AudioServerDriverTransports.ASDTIOServiceMatcher.%s"), v14);
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "cStringUsingEncoding:", 1), 0);
        matcherQueue = v12->_matcherQueue;
        v12->_matcherQueue = (OS_dispatch_queue *)v16;

        objc_storeWeak((id *)&v12->_delegate, v8);
        mainPort = 0;
        if (MEMORY[0x23B801D84](*MEMORY[0x24BDAD2F0], &mainPort))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ASDTIOServiceMatcher initForIOServiceWithClassName:withDelegate:].cold.2();
          goto LABEL_11;
        }
        v18 = IONotificationPortCreate(mainPort);
        v12->_notificationPort = v18;
        if (!v18)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ASDTIOServiceMatcher initForIOServiceWithClassName:withDelegate:].cold.1();
          goto LABEL_11;
        }
        IONotificationPortSetDispatchQueue(v18, (dispatch_queue_t)v12->_matcherQueue);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v19 = -[ASDTIOServiceMatcher addMatchingNotificationForType:callback:](v12, "addMatchingNotificationForType:callback:", "IOServiceWillTerminate", ASDTIOSerivceWillTerminateHandler);
          v12->_willTerminateNotification = v19;
          if (!v19)
          {
LABEL_11:

LABEL_12:
            v11 = 0;
            goto LABEL_18;
          }
        }
        v20 = -[ASDTIOServiceMatcher addMatchingNotificationForType:callback:](v12, "addMatchingNotificationForType:callback:", "IOServiceFirstPublish", ASDTIOServiceMatchingHandler);
        v12->_matchingNotification = v20;

        if (!v20)
          goto LABEL_12;
      }
      v12 = v12;
      v11 = v12;
      goto LABEL_18;
    }
  }
  v11 = 0;
  v12 = self;
LABEL_18:

  return v11;
}

- (void)dealloc
{
  io_object_t matchingNotification;
  io_object_t willTerminateNotification;
  IONotificationPort *notificationPort;
  objc_super v6;

  matchingNotification = self->_matchingNotification;
  if (matchingNotification)
    IOObjectRelease(matchingNotification);
  willTerminateNotification = self->_willTerminateNotification;
  if (willTerminateNotification)
    IOObjectRelease(willTerminateNotification);
  notificationPort = self->_notificationPort;
  if (notificationPort)
    IONotificationPortDestroy(notificationPort);
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOServiceMatcher;
  -[ASDTIOServiceMatcher dealloc](&v6, sel_dealloc);
}

- (unsigned)addMatchingNotificationForType:(char)a3[128] callback:(void *)a4
{
  const __CFDictionary *v7;
  BOOL v8;
  NSObject *v9;
  unsigned int result;
  _QWORD block[6];
  io_iterator_t v12;
  io_iterator_t notification;

  v7 = IOServiceMatching(-[ASDTIOServiceMatcher ioServiceClassNameCStr](self, "ioServiceClassNameCStr"));
  notification = 0;
  if (IOServiceAddMatchingNotification(self->_notificationPort, a3, v7, (IOServiceMatchingCallback)a4, self, &notification))
  {
    v8 = 1;
  }
  else
  {
    v8 = notification == 0;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOServiceMatcher addMatchingNotificationForType:callback:].cold.1(self, (uint64_t)a3);
    IONotificationPortDestroy(self->_notificationPort);
    result = 0;
    self->_notificationPort = 0;
  }
  else
  {
    -[ASDTIOServiceMatcher matcherQueue](self, "matcherQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__ASDTIOServiceMatcher_addMatchingNotificationForType_callback___block_invoke;
    block[3] = &unk_2508422D8;
    block[4] = self;
    block[5] = a4;
    v12 = notification;
    dispatch_sync(v9, block);

    return notification;
  }
  return result;
}

uint64_t __64__ASDTIOServiceMatcher_addMatchingNotificationForType_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48));
}

- (ASDTIOServiceMatchDelegate)delegate
{
  return (ASDTIOServiceMatchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)ioServiceClassName
{
  return self->_ioServiceClassName;
}

- (void)setIoServiceClassName:(id)a3
{
  objc_storeStrong((id *)&self->_ioServiceClassName, a3);
}

- (const)ioServiceClassNameCStr
{
  return self->_ioServiceClassNameCStr;
}

- (void)setIoServiceClassNameCStr:(const char *)a3
{
  self->_ioServiceClassNameCStr = a3;
}

- (OS_dispatch_queue)matcherQueue
{
  return self->_matcherQueue;
}

- (void)setMatcherQueue:(id)a3
{
  objc_storeStrong((id *)&self->_matcherQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherQueue, 0);
  objc_storeStrong((id *)&self->_ioServiceClassName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initForIOServiceWithClassName:withDelegate:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s.%@: IONotificationPortCreate failed.", v1, v2, v3, v4, 2u);
}

- (void)initForIOServiceWithClassName:withDelegate:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%s.%@: IOMainPort failed.", v1, v2, v3, v4, 2u);
}

- (void)addMatchingNotificationForType:(void *)a1 callback:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  int v4[5];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ioServiceClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315650;
  OUTLINED_FUNCTION_0_7();
  v5 = 2080;
  v6 = a2;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s.%@: IOServiceAddMatchingNotification(%s) failed.", (uint8_t *)v4, 0x20u);

}

@end
