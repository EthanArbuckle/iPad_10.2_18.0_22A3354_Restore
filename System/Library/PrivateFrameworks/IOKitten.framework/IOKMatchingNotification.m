@implementation IOKMatchingNotification

- (IOKMatchingNotification)init
{
  IOKMatchingNotification *v2;
  IOKMatchingNotificationRef *v3;
  IOKMatchingNotificationRef *notificationRef;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOKMatchingNotification;
  v2 = -[IOKMatchingNotification init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IOKMatchingNotificationRef);
    notificationRef = v2->_notificationRef;
    v2->_notificationRef = v3;

    -[IOKMatchingNotificationRef setNotification:](v2->_notificationRef, "setNotification:", v2);
  }
  return v2;
}

- (void)primeNotification
{
  void *v3;
  void (**v4)(id, void *);

  -[IOKMatchingNotification handler](self, "handler");
  v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  -[IOKMatchingNotification iterator](self, "iterator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (void)dealloc
{
  IOKMatchingNotificationRef *v3;
  NSObject *queue;
  IOKMatchingNotificationRef *v5;
  IOKMatchingNotificationRef *notificationRef;
  objc_super v7;
  _QWORD block[4];
  IOKMatchingNotificationRef *v9;

  -[IOKMatchingNotificationRef lock](self->_notificationRef, "lock");
  -[IOKMatchingNotificationRef setNotification:](self->_notificationRef, "setNotification:", 0);
  -[IOKMatchingNotificationRef unlock](self->_notificationRef, "unlock");
  v3 = self->_notificationRef;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__IOKMatchingNotification_dealloc__block_invoke;
  block[3] = &unk_24D2AA1B8;
  v9 = v3;
  v5 = v3;
  dispatch_async(queue, block);
  notificationRef = self->_notificationRef;
  self->_notificationRef = 0;

  v7.receiver = self;
  v7.super_class = (Class)IOKMatchingNotification;
  -[IOKMatchingNotification dealloc](&v7, sel_dealloc);
}

id __34__IOKMatchingNotification_dealloc__block_invoke()
{
  return (id)objc_opt_self();
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (IOKIterator)iterator
{
  return self->_iterator;
}

- (void)setIterator:(id)a3
{
  objc_storeStrong((id *)&self->_iterator, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IOKMatchingNotificationRef)notificationRef
{
  return self->_notificationRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationRef, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_iterator, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
