@implementation IOKInterestNotification

id __34__IOKInterestNotification_dealloc__block_invoke()
{
  return (id)objc_opt_self();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRef, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
}

- (void)dealloc
{
  io_object_t object;
  IOKInterestNotificationRef *v4;
  IOKInterestNotificationRef *v5;
  NSObject *queue;
  IOKInterestNotificationRef *notificationRef;
  objc_super v8;
  _QWORD block[4];
  IOKInterestNotificationRef *v10;

  object = self->_object;
  if (object)
    IOObjectRelease(object);
  -[IOKInterestNotificationRef lock](self->_notificationRef, "lock");
  -[IOKInterestNotificationRef setNotification:](self->_notificationRef, "setNotification:", 0);
  -[IOKInterestNotificationRef unlock](self->_notificationRef, "unlock");
  v4 = self->_notificationRef;
  v5 = v4;
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__IOKInterestNotification_dealloc__block_invoke;
    block[3] = &unk_24D2AA1B8;
    v10 = v4;
    dispatch_async(queue, block);

  }
  notificationRef = self->_notificationRef;
  self->_notificationRef = 0;

  v8.receiver = self;
  v8.super_class = (Class)IOKInterestNotification;
  -[IOKInterestNotification dealloc](&v8, sel_dealloc);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setObject:(unsigned int)a3
{
  io_object_t object;

  object = self->_object;
  if (object)
    IOObjectRelease(object);
  self->_object = a3;
  if (a3)
    IOObjectRetain(a3);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (IOKInterestNotificationRef)notificationRef
{
  return self->_notificationRef;
}

- (IOKInterestNotification)init
{
  IOKInterestNotification *v2;
  IOKInterestNotificationRef *v3;
  IOKInterestNotificationRef *notificationRef;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOKInterestNotification;
  v2 = -[IOKInterestNotification init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IOKInterestNotificationRef);
    notificationRef = v2->_notificationRef;
    v2->_notificationRef = v3;

    -[IOKInterestNotificationRef setNotification:](v2->_notificationRef, "setNotification:", v2);
  }
  return v2;
}

- (id)handler
{
  return self->_handler;
}

- (unsigned)object
{
  return self->_object;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end
