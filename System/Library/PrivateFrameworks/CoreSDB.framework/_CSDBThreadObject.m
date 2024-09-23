@implementation _CSDBThreadObject

- (BOOL)isCurrentThreadOtherwiseAssert:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  const void *v7;
  void *specific;
  BOOL result;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = a3;
  if ((NSThread *)objc_msgSend_currentThread(MEMORY[0x24BDD17F0], a2, a3) == self->_thread)
    return 1;
  v7 = (const void *)objc_msgSend_UTF8String(self->_queueContext, v5, v6);
  specific = dispatch_get_specific(v7);
  v10 = specific == 0;
  result = specific != 0;
  v10 = !v10 || !v3;
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20AA57000, v11, OS_LOG_TYPE_INFO, "**************************************************************************", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_20AA57000, v12, OS_LOG_TYPE_INFO, "****** Database access off the database thread, please file a radar ******", v15, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_20AA57000, v13, OS_LOG_TYPE_INFO, "**************************************************************************", v14, 2u);
        abort();
      }
    }
    abort();
  }
  return result;
}

- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4
{
  const void *v6;

  if (a4)
  {
    if (a3)
    {
      v6 = (const void *)objc_msgSend_UTF8String(self->_queueContext, a2, (uint64_t)a3);
      if (dispatch_get_specific(v6))
        (*((void (**)(id))a3 + 2))(a3);
      else
        dispatch_sync((dispatch_queue_t)self->_queue, a3);
    }
  }
  else
  {
    MEMORY[0x24BEDD108](self, sel_performBlock_, a3);
  }
}

- (void)performBlock:(id)a3
{
  if (a3)
    dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void)performBlock:(id)a3 afterDelay:(double)a4
{
  dispatch_time_t v6;

  if (a3)
  {
    v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_after(v6, (dispatch_queue_t)self->_queue, a3);
  }
}

- (void)_threadedMain
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  __CFRunLoop *Current;
  void *v8;
  CFRunLoopSourceContext v9;

  v3 = (void *)MEMORY[0x20BD2A83C](self, a2);
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9.version) = 0;
      _os_log_impl(&dword_20AA57000, v4, OS_LOG_TYPE_INFO, "Starting up database thread", (uint8_t *)&v9, 2u);
    }
  }
  objc_autoreleasePoolPop(v3);
  self->_runLoop = (NSRunLoop *)(id)objc_msgSend_currentRunLoop(MEMORY[0x24BDBCF18], v5, v6);
  memset(&v9, 0, sizeof(v9));
  self->_runLoopSource = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &v9);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  while (1)
  {
    v8 = (void *)MEMORY[0x20BD2A83C]();
    CFRunLoopRun();
    objc_autoreleasePoolPop(v8);
  }
}

- (_CSDBThreadObject)initWithIdentifier:(id)a3 qosClass:(unsigned __int16)a4
{
  dispatch_qos_class_t v4;
  const char *v6;
  _CSDBThreadObject *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  id v14;
  const char *v15;
  NSString *v16;
  NSObject *queue;
  const char *v18;
  uint64_t v19;
  const void *v20;
  objc_super v22;

  v4 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_CSDBThreadObject;
  v7 = -[_CSDBThreadObject init](&v22, sel_init);
  if (v7)
  {
    v8 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("_CSDBThreadObjectQueue-%@"), a3);
    if (v4)
    {
      v11 = objc_msgSend_UTF8String(v8, v9, v10);
      v12 = dispatch_queue_attr_make_with_qos_class(0, v4, 0);
      v13 = (const char *)v11;
    }
    else
    {
      v13 = (const char *)objc_msgSend_UTF8String(v8, v9, v10);
      v12 = 0;
    }
    v7->_queue = (OS_dispatch_queue *)dispatch_queue_create(v13, v12);
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    v16 = (NSString *)objc_msgSend_initWithFormat_(v14, v15, (uint64_t)CFSTR("%s-%@"), "_CSDBThreadObjectQueueContext", a3);
    v7->_queueContext = v16;
    queue = v7->_queue;
    v20 = (const void *)objc_msgSend_UTF8String(v16, v18, v19);
    dispatch_queue_set_specific(queue, v20, (void *)1, 0);
    v7->_identifier = (NSString *)a3;
  }
  return v7;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);

  v4.receiver = self;
  v4.super_class = (Class)_CSDBThreadObject;
  -[_CSDBThreadObject dealloc](&v4, sel_dealloc);
}

- (id)thread
{
  return self->_thread;
}

@end
