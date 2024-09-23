@implementation NSMessagePort

- (BOOL)isValid
{
  return CFMessagePortIsValid((CFMessagePortRef)self->_port) != 0;
}

- (void)invalidate
{
  -[NSMessagePort setDelegate:](self, "setDelegate:", 0);
  if (CFMessagePortIsValid((CFMessagePortRef)self->_port))
  {
    CFMessagePortInvalidate((CFMessagePortRef)self->_port);
    -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSPortDidBecomeInvalidNotification"), self, 0);
  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (id)name
{
  return (id)CFMessagePortGetName((CFMessagePortRef)self->_port);
}

- (BOOL)setName:(id)a3
{
  return a3 && CFMessagePortSetName((CFMessagePortRef)self->_port, (CFStringRef)a3) != 0;
}

+ (BOOL)sendBeforeTime:(double)a3 streamData:(id)a4 components:(id)a5 to:(id)a6 from:(id)a7 msgid:(unsigned int)a8 reserved:(unint64_t)a9
{
  __CFDictionary *Mutable;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const __CFData *Data;
  __CFMessagePort *v24;
  CFAbsoluteTime Current;
  uint64_t v26;
  NSString *v28;
  NSString *v29;
  objc_class *v30;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (a7)
    CFDictionaryAddValue(Mutable, CFSTR("NSMessagePortReplyName"), (const void *)objc_msgSend(a7, "name"));
  v30 = (objc_class *)a1;
  if (a4 && !a5)
  {
    a5 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(a5, "addObject:", a4);
  }
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = objc_msgSend(a5, "count");
  if (v19)
  {
    v20 = v19;
    for (i = 0; v20 != i; ++i)
    {
      v22 = (void *)objc_msgSend(a5, "objectAtIndex:", i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CFRelease(Mutable);
          v28 = _NSMethodExceptionProem(v30, a2);
          NSLog((NSString *)CFSTR("%@: found port in components which is not an NSMessagePort"), v28);
          return 0;
        }
        v22 = (void *)objc_msgSend(v22, "name");
      }
      objc_msgSend(v18, "addObject:", v22);
    }
  }
  CFDictionaryAddValue(Mutable, CFSTR("NSMessagePortComponents"), v18);
  Data = CFPropertyListCreateData(0, Mutable, kCFPropertyListXMLFormat_v1_0, 0, 0);
  v24 = (__CFMessagePort *)*((_QWORD *)a6 + 3);
  Current = CFAbsoluteTimeGetCurrent();
  v26 = CFMessagePortSendRequest(v24, a8, Data, a3 - Current, 0.0, 0, 0);
  CFRelease(Data);
  CFRelease(Mutable);
  if ((_DWORD)v26 == -1)
    return 0;
  if ((_DWORD)v26)
  {
    v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[NSMessagePort sendBeforeDate:] Cannot send (%d)"), v26);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSPortSendException"), v29, 0));
  }
  return 1;
}

- (BOOL)sendBeforeTime:(double)a3 streamData:(void *)a4 components:(id)a5 from:(id)a6 msgid:(unsigned int)a7
{
  return objc_msgSend((id)objc_opt_class(), "sendBeforeTime:streamData:components:to:from:msgid:reserved:", a4, a5, self, a6, *(_QWORD *)&a7, -[NSPort reservedSpaceLength](self, "reservedSpaceLength"), a3);
}

- (BOOL)sendBeforeDate:(id)a3 components:(id)a4 from:(id)a5 reserved:(unint64_t)a6
{
  void *v11;

  v11 = (void *)objc_opt_class();
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v11, "sendBeforeTime:streamData:components:to:from:msgid:reserved:", 0, a4, self, a5, 0, a6);
}

- (BOOL)sendBeforeDate:(id)a3 msgid:(unint64_t)a4 components:(id)a5 from:(id)a6 reserved:(unint64_t)a7
{
  void *v13;

  v13 = (void *)objc_opt_class();
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v13, "sendBeforeTime:streamData:components:to:from:msgid:reserved:", 0, a5, self, a6, a4, a7);
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v7;

  if (a3)
  {
    RunLoopSource = CFMessagePortCreateRunLoopSource(0, (CFMessagePortRef)self->_port, 300);
    if (RunLoopSource)
    {
      v7 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), RunLoopSource, (CFRunLoopMode)a4);
      CFRelease(v7);
    }
  }
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v7;

  if (a3)
  {
    RunLoopSource = CFMessagePortCreateRunLoopSource(0, (CFMessagePortRef)self->_port, 300);
    if (RunLoopSource)
    {
      v7 = RunLoopSource;
      CFRunLoopRemoveSource((CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), RunLoopSource, (CFRunLoopMode)a4);
      CFRelease(v7);
    }
  }
}

- (NSMessagePort)initWithName:(id)a3
{
  NSMessagePort *v3;
  CFMessagePortRef v4;
  objc_super v6;
  CFMessagePortContext context;
  Boolean shouldFreeInfo;
  uint64_t v9;

  v3 = self;
  v9 = *MEMORY[0x1E0C80C00];
  shouldFreeInfo = 0;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  v4 = CFMessagePortCreateLocal(0, (CFStringRef)a3, (CFMessagePortCallBack)__NSFireMessagePort, &context, &shouldFreeInfo);
  v3->_port = v4;
  if (v4)
  {
    if (!shouldFreeInfo)
      v3->_delegate = 0;
  }
  else
  {
    v6.receiver = v3;
    v6.super_class = (Class)NSMessagePort;
    -[NSMessagePort dealloc](&v6, sel_dealloc);
    return 0;
  }
  return v3;
}

- (NSMessagePort)initWithRemoteName:(id)a3
{
  CFMessagePortRef Remote;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  Remote = CFMessagePortCreateRemote(0, (CFStringRef)a3);
  self->_port = Remote;
  if (Remote)
  {
    self->_delegate = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NSMessagePort;
    -[NSMessagePort dealloc](&v6, sel_dealloc);
    return 0;
  }
  return self;
}

- (NSMessagePort)init
{
  return -[NSMessagePort initWithName:](self, "initWithName:", 0);
}

- (BOOL)_isDeallocating
{
  return 1;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (NSMessagePort)retain
{
  CFRetain(self->_port);
  return self;
}

- (void)release
{
  os_unfair_lock_lock((os_unfair_lock_t)&_NSGlobalRetainLock);
  if (CFGetRetainCount(self->_port) == 1)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_NSGlobalRetainLock);
    -[NSMessagePort invalidate](self, "invalidate");
    os_unfair_lock_lock((os_unfair_lock_t)&_NSGlobalRetainLock);
  }
  if (CFGetRetainCount(self->_port) == 1)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_NSGlobalRetainLock);
    -[NSMessagePort dealloc](self, "dealloc");
  }
  else
  {
    CFRelease(self->_port);
    os_unfair_lock_unlock((os_unfair_lock_t)&_NSGlobalRetainLock);
  }
}

- (unint64_t)retainCount
{
  return CFGetRetainCount(self->_port);
}

- (void)dealloc
{
  void *port;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  port = self->_port;
  if (port)
    CFRelease(port);
  self->_port = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSMessagePort;
  -[NSMessagePort dealloc](&v4, sel_dealloc);
}

@end
