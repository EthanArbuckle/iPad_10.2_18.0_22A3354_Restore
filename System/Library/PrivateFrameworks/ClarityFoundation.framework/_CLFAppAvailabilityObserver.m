@implementation _CLFAppAvailabilityObserver

- (_CLFAppAvailabilityObserver)initWithHandler:(id)a3
{
  id v4;
  _CLFAppAvailabilityObserver *v5;
  uint64_t v6;
  id handler;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  APSubjectMonitorSubscription *subscription;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CLFAppAvailabilityObserver;
  v5 = -[_CLFAppAvailabilityObserver init](&v14, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x212BA2D4C](v4);
    handler = v5->_handler;
    v5->_handler = (id)v6;

    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v8 = (void *)getAPSubjectClass_softClass;
    v19 = getAPSubjectClass_softClass;
    if (!getAPSubjectClass_softClass)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __getAPSubjectClass_block_invoke;
      v15[3] = &unk_24C71FB18;
      v15[4] = &v16;
      __getAPSubjectClass_block_invoke((uint64_t)v15);
      v8 = (void *)v17[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v16, 8);
    objc_msgSend(v9, "subjectMonitorRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addMonitor:subjectMask:", v5, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    subscription = v5->_subscription;
    v5->_subscription = (APSubjectMonitorSubscription *)v11;

  }
  return v5;
}

- (void)invalidate
{
  id v2;

  -[_CLFAppAvailabilityObserver subscription](self, "subscription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (APSubjectMonitorSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
