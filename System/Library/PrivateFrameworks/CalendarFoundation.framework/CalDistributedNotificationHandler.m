@implementation CalDistributedNotificationHandler

- (CalDistributedNotificationHandler)initWithObserver:(id)a3 selector:(SEL)a4
{
  id v6;
  CalDistributedNotificationHandler *v7;
  CalDistributedNotificationHandler *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CalDistributedNotificationHandler;
  v7 = -[CalDistributedNotificationHandler init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_observer, v6);
    v8->_selector = a4;
  }

  return v8;
}

- (void)handleNotification:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_observer);
  v5 = WeakRetained;
  if (WeakRetained)
    ((void (*)(id, SEL, id))objc_msgSend(WeakRetained, "methodForSelector:", self->_selector))(WeakRetained, self->_selector, v6);

}

- (id)observer
{
  return objc_loadWeakRetained(&self->_observer);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_observer);
}

@end
