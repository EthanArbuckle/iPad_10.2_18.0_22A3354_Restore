@implementation CRKConcreteIDSMessageDidReceiveSubscription

- (CRKConcreteIDSMessageDidReceiveSubscription)initWithHandler:(id)a3
{
  id v4;
  CRKConcreteIDSMessageDidReceiveSubscription *v5;
  uint64_t v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteIDSMessageDidReceiveSubscription;
  v5 = -[CRKConcreteIDSMessageDidReceiveSubscription init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x219A226E8](v4);
    handler = v5->_handler;
    v5->_handler = (id)v6;

  }
  return v5;
}

- (void)receiveMessage:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteIDSMessageDidReceiveSubscription.m"), 37, CFSTR("%@ must be called from the main thread"), v14);

  }
  -[CRKConcreteIDSMessageDidReceiveSubscription handler](self, "handler");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    (*(void (**)(uint64_t, id, id, id))(v11 + 16))(v11, v15, v9, v10);

}

- (void)cancel
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteIDSMessageDidReceiveSubscription.m"), 50, CFSTR("%@ must be called from the main thread"), v6);

  }
  if (-[CRKConcreteIDSMessageDidReceiveSubscription isResumed](self, "isResumed"))
  {
    -[CRKConcreteIDSMessageDidReceiveSubscription handler](self, "handler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CRKConcreteIDSMessageDidReceiveSubscription setHandler:](self, "setHandler:", 0);
      -[CRKConcreteIDSMessageDidReceiveSubscription delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didReceiveSubscriptionDidCancel:", self);

    }
  }
}

- (void)resume
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteIDSMessageDidReceiveSubscription.m"), 63, CFSTR("%@ must be called from the main thread"), v6);

  }
  if (!-[CRKConcreteIDSMessageDidReceiveSubscription isResumed](self, "isResumed"))
  {
    -[CRKConcreteIDSMessageDidReceiveSubscription handler](self, "handler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CRKConcreteIDSMessageDidReceiveSubscription setResumed:](self, "setResumed:", 1);
      -[CRKConcreteIDSMessageDidReceiveSubscription delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didReceiveSubscriptionDidResume:", self);

    }
  }
}

- (CRKConcreteIDSMessageDidReceiveSubscriptionDelegate)delegate
{
  return (CRKConcreteIDSMessageDidReceiveSubscriptionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isResumed
{
  return self->_resumed;
}

- (void)setResumed:(BOOL)a3
{
  self->_resumed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
