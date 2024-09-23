@implementation CRKDispatchSourceSubscription

- (void)dealloc
{
  objc_super v3;

  -[CRKDispatchSourceSubscription cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CRKDispatchSourceSubscription;
  -[CRKDispatchSourceSubscription dealloc](&v3, sel_dealloc);
}

- (CRKDispatchSourceSubscription)initWithSource:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  CRKDispatchSourceSubscription *v9;
  CRKDispatchSourceSubscription *v10;
  uint64_t v11;
  id handler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKDispatchSourceSubscription;
  v9 = -[CRKDispatchSourceSubscription init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    v11 = MEMORY[0x219A226E8](v8);
    handler = v10->_handler;
    v10->_handler = (id)v11;

  }
  return v10;
}

+ (id)subscriptionWithSource:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  CRKDispatchSourceSubscription *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CRKDispatchSourceSubscription initWithSource:handler:]([CRKDispatchSourceSubscription alloc], "initWithSource:handler:", v6, v5);

  -[CRKDispatchSourceSubscription resume](v7, "resume");
  return v7;
}

- (void)cancel
{
  NSObject *v3;

  -[CRKDispatchSourceSubscription source](self, "source");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v3);

  -[CRKDispatchSourceSubscription setHandler:](self, "setHandler:", 0);
}

- (void)resume
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[CRKDispatchSourceSubscription source](self, "source");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __39__CRKDispatchSourceSubscription_resume__block_invoke;
  v8 = &unk_24D9C7A60;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v3, &v5);

  -[CRKDispatchSourceSubscription source](self, "source", v5, v6, v7, v8);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __39__CRKDispatchSourceSubscription_resume__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void (**v3)(void);
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "handler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v4;
    if (v2)
    {
      objc_msgSend(v4, "handler");
      v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v3[2]();

      WeakRetained = v4;
    }
  }

}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
