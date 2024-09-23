@implementation IOSurfaceSharedEventListener

- (IOSurfaceSharedEventListener)initWithDispatchQueue:(id)a3
{
  id v4;
  IONotificationPort *v5;
  uint64_t v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)IOSurfaceSharedEventListener;
  v4 = -[IOSurfaceSharedEventListener init](&v8, sel_init);
  if (!v4)
    return (IOSurfaceSharedEventListener *)v4;
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }
  else
  {
    a3 = dispatch_queue_create("IOSurfaceEventNotification", 0);
    if (!a3)
    {
LABEL_8:

      return 0;
    }
  }
  *((_QWORD *)v4 + 2) = a3;
  v5 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  *((_QWORD *)v4 + 1) = v5;
  if (!v5)
    goto LABEL_8;
  IONotificationPortSetDispatchQueue(v5, *((dispatch_queue_t *)v4 + 2));
  v6 = IOSurfaceSharedEventAddEventListener((unint64_t)v4, *((IONotificationPortRef *)v4 + 1));
  if ((_DWORD)v6)
  {
    NSLog(CFSTR("IOSurfaceSharedEventAddEventListener failed: %08x\n"), v6);
    goto LABEL_8;
  }
  return (IOSurfaceSharedEventListener *)v4;
}

- (IOSurfaceSharedEventListener)init
{
  return -[IOSurfaceSharedEventListener initWithDispatchQueue:](self, "initWithDispatchQueue:", 0);
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (self->_notificationPort)
  {
    IOSurfaceSharedEventRemoveEventListener((uint64_t)self);
    IONotificationPortSetDispatchQueue(self->_notificationPort, 0);
    IONotificationPortDestroy(self->_notificationPort);
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  v4.receiver = self;
  v4.super_class = (Class)IOSurfaceSharedEventListener;
  -[IOSurfaceSharedEventListener dealloc](&v4, sel_dealloc);
}

- (void)_notifyEventPort:(unsigned int)a3 event:(id)a4 atValue:(unint64_t)a5 block:(id)a6
{
  uint64_t v6;

  v6 = IOSurfaceSharedEventNotifyEventListener(self, a4, a3, a5, a6);
  if ((_DWORD)v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Internal error during notification request %08x"), v6);
}

@end
