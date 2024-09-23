@implementation NSCFInputStream

- (NSCFInputStream)initWithFileAtPath:(id)a3
{
  uint64_t v4;
  void *v5;
  NSCFInputStream *v6;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", a3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[NSCFInputStream initWithURL:](self, "initWithURL:", v4);

    return v6;
  }
  else
  {
    NSDeallocateObject(self);
    return 0;
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return NSAllocateObject((Class)a1, 0, a3);
}

- (NSCFInputStream)initWithURL:(id)a3
{
  NSCFInputStream *result;

  NSDeallocateObject(self);
  result = 0;
  if (a3)
    return (NSCFInputStream *)CFReadStreamCreateWithFile(0, (CFURLRef)a3);
  return result;
}

- (NSCFInputStream)initWithData:(id)a3
{
  NSDeallocateObject(self);
  return (NSCFInputStream *)CFReadStreamCreateWithData();
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

- (id)delegate
{
  return (id)objc_msgSend((id)_CFReadStreamGetClient(), "retainedDelegate");
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
    CFReadStreamSetClient((CFReadStreamRef)self, 0x1BuLL, (CFReadStreamClientCallBack)_inputStreamCallbackFunc, &v5);

  }
  else
  {
    CFReadStreamSetClient((CFReadStreamRef)self, 0, 0, 0);
  }
}

- (id)propertyForKey:(id)a3
{
  return (id)(id)CFReadStreamCopyProperty((CFReadStreamRef)self, (CFStreamPropertyKey)a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return CFReadStreamSetProperty((CFReadStreamRef)self, (CFStreamPropertyKey)a4, a3) != 0;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
    CFReadStreamScheduleWithRunLoop((CFReadStreamRef)self, (CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), (CFRunLoopMode)a4);
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
    CFReadStreamUnscheduleFromRunLoop((CFReadStreamRef)self, (CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), (CFRunLoopMode)a4);
}

- (id)streamError
{
  return CFReadStreamCopyError((CFReadStreamRef)self);
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  return CFReadStreamRead((CFReadStreamRef)self, (UInt8 *)a3, a4);
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  char *Buffer;
  unint64_t v7;

  Buffer = (char *)CFReadStreamGetBuffer((CFReadStreamRef)self, 0, (CFIndex *)a4);
  v7 = *a4;
  if (*a4)
    *a3 = Buffer;
  return v7 != 0;
}

- (BOOL)hasBytesAvailable
{
  return CFReadStreamHasBytesAvailable((CFReadStreamRef)self) != 0;
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return CFReadStreamSetClient((CFReadStreamRef)self, a3, (CFReadStreamClientCallBack)a4, (CFStreamClientContext *)a5) != 0;
}

- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
  CFReadStreamScheduleWithRunLoop((CFReadStreamRef)self, a3, a4);
}

- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
  CFReadStreamUnscheduleFromRunLoop((CFReadStreamRef)self, a3, a4);
}

@end
