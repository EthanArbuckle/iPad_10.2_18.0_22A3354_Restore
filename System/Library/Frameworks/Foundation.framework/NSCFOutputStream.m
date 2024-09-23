@implementation NSCFOutputStream

- (id)initToMemory
{
  NSDeallocateObject(self);
  return CFWriteStreamCreateWithAllocatedBuffers(0, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return NSAllocateObject((Class)a1, 0, a3);
}

- (id)initToFileAtPath:(id)a3 append:(BOOL)a4
{
  _BOOL8 v4;
  id result;
  id v7;
  NSCFOutputStream *v8;

  v4 = a4;
  result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", a3);
  if (result)
  {
    v7 = result;
    v8 = -[NSCFOutputStream initWithURL:append:](self, "initWithURL:append:", result, v4);

    return v8;
  }
  return result;
}

- (NSCFOutputStream)initWithURL:(id)a3 append:(BOOL)a4
{
  _BOOL4 v4;
  CFWriteStreamRef v6;

  v4 = a4;
  NSDeallocateObject(self);
  if (a3)
  {
    v6 = CFWriteStreamCreateWithFile(0, (CFURLRef)a3);
    a3 = v6;
    if (v4)
      CFWriteStreamSetProperty(v6, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2A0], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
  }
  return (NSCFOutputStream *)a3;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (self == a3)
    return 1;
  return _CFNonObjCEqual() != 0;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)initToBuffer:(char *)a3 capacity:(unint64_t)a4
{
  NSDeallocateObject(self);
  return CFWriteStreamCreateWithBuffer(0, (UInt8 *)a3, a4);
}

- (id)delegate
{
  return (id)objc_msgSend((id)_CFWriteStreamGetClient(), "retainedDelegate");
}

- (void)setDelegate:(id)a3
{
  NSCFStreamWeakDelegateWrapper *v4;
  CFStreamClientContext v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = -[NSCFStreamWeakDelegateWrapper initWithDelegate:]([NSCFStreamWeakDelegateWrapper alloc], "initWithDelegate:", a3);
    v5.version = 0;
    v5.info = v4;
    v5.retain = (void *(__cdecl *)(void *))MEMORY[0x1E0C98BD0];
    v5.release = (void (__cdecl *)(void *))MEMORY[0x1E0C98BC0];
    v5.copyDescription = 0;
    CFWriteStreamSetClient((CFWriteStreamRef)self, 0x1DuLL, (CFWriteStreamClientCallBack)_outputStreamCallbackFunc, &v5);

  }
  else
  {
    CFWriteStreamSetClient((CFWriteStreamRef)self, 0, 0, 0);
  }
}

- (id)propertyForKey:(id)a3
{
  return (id)(id)CFWriteStreamCopyProperty((CFWriteStreamRef)self, (CFStreamPropertyKey)a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return CFWriteStreamSetProperty((CFWriteStreamRef)self, (CFStreamPropertyKey)a4, a3) != 0;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
    CFWriteStreamScheduleWithRunLoop((CFWriteStreamRef)self, (CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), (CFRunLoopMode)a4);
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
    CFWriteStreamUnscheduleFromRunLoop((CFWriteStreamRef)self, (CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), (CFRunLoopMode)a4);
}

- (id)streamError
{
  return CFWriteStreamCopyError((CFWriteStreamRef)self);
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  return CFWriteStreamWrite((CFWriteStreamRef)self, (const UInt8 *)a3, a4);
}

- (BOOL)hasSpaceAvailable
{
  return CFWriteStreamCanAcceptBytes((CFWriteStreamRef)self) != 0;
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return CFWriteStreamSetClient((CFWriteStreamRef)self, a3, (CFWriteStreamClientCallBack)a4, (CFStreamClientContext *)a5) != 0;
}

- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
  CFWriteStreamScheduleWithRunLoop((CFWriteStreamRef)self, a3, a4);
}

- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
  CFWriteStreamUnscheduleFromRunLoop((CFWriteStreamRef)self, a3, a4);
}

@end
