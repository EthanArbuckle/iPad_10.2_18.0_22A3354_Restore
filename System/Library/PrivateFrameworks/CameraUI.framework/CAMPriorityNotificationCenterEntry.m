@implementation CAMPriorityNotificationCenterEntry

- (CAMPriorityNotificationCenterEntry)initWithObserver:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8;
  id v9;
  CAMPriorityNotificationCenterEntry *v10;
  CAMPriorityNotificationCenterEntry *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CAMPriorityNotificationCenterEntry;
  v10 = -[CAMPriorityNotificationCenterEntry init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(&v10->_observer, v8);
    v11->_selector = a4;
    objc_storeStrong(&v11->_object, a5);
  }

  return v11;
}

- (id)observer
{
  return objc_loadWeakRetained(&self->_observer);
}

- (SEL)selector
{
  return self->_selector;
}

- (id)object
{
  return self->_object;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CAMPriorityNotificationCenterEntry observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(-[CAMPriorityNotificationCenterEntry selector](self, "selector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPriorityNotificationCenterEntry object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p %@/%p>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setObserver:(id)a3
{
  objc_storeWeak(&self->_observer, a3);
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_destroyWeak(&self->_observer);
}

@end
