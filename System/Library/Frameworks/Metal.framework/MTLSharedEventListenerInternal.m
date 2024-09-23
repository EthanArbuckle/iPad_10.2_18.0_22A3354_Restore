@implementation MTLSharedEventListenerInternal

- (MTLSharedEventListenerInternal)initWithDispatchQueue:(id)a3
{
  id v4;
  IONotificationPortRef v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLSharedEventListenerInternal;
  v4 = -[MTLSharedEventListener init](&v7, sel_init);
  if (v4)
  {
    v5 = IONotificationPortCreate(*MEMORY[0x1E0CBBAB8]);
    *((_QWORD *)v4 + 1) = v5;
    if (!a3
      || !v5
      || (*((_QWORD *)v4 + 2) = a3,
          dispatch_retain((dispatch_object_t)a3),
          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)v4 + 1), *((dispatch_queue_t *)v4 + 2)),
          IOSurfaceSharedEventAddEventListener()))
    {

      return 0;
    }
  }
  return (MTLSharedEventListenerInternal *)v4;
}

- (MTLSharedEventListenerInternal)init
{
  MTLSharedEventListenerInternal *v2;
  dispatch_queue_t v3;
  NSObject *v4;
  IONotificationPort *notificationPort;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLSharedEventListenerInternal;
  v2 = -[MTLSharedEventListener init](&v7, sel_init);
  if (v2)
  {
    v2->_notificationPort = IONotificationPortCreate(*MEMORY[0x1E0CBBAB8]);
    v3 = dispatch_queue_create("MTLSharedEventListener", 0);
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
    if (!v3
      || (v4 = v3, (notificationPort = v2->_notificationPort) == 0)
      || (IONotificationPortSetDispatchQueue(notificationPort, v4), IOSurfaceSharedEventAddEventListener()))
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  IONotificationPort *notificationPort;
  objc_super v4;

  if (self->_dispatchQueue)
  {
    IONotificationPortSetDispatchQueue(self->_notificationPort, 0);
    dispatch_release((dispatch_object_t)self->_dispatchQueue);
  }
  IOSurfaceSharedEventRemoveEventListener();
  notificationPort = self->_notificationPort;
  if (notificationPort)
    IONotificationPortDestroy(notificationPort);
  v4.receiver = self;
  v4.super_class = (Class)MTLSharedEventListenerInternal;
  -[MTLSharedEventListenerInternal dealloc](&v4, sel_dealloc);
}

- (id)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_notifyEventPort:(unsigned int)a3 event:(id)a4 atValue:(unint64_t)a5 block:(id)a6
{
  uint64_t v6;

  v6 = IOSurfaceSharedEventNotifyEventListener();
  if ((_DWORD)v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Internal error during notification request %08x"), v6);
}

@end
