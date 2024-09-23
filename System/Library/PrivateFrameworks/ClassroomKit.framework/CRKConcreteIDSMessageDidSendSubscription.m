@implementation CRKConcreteIDSMessageDidSendSubscription

- (CRKConcreteIDSMessageDidSendSubscription)initWithHandler:(id)a3
{
  id v4;
  CRKConcreteIDSMessageDidSendSubscription *v5;
  uint64_t v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteIDSMessageDidSendSubscription;
  v5 = -[CRKConcreteIDSMessageDidSendSubscription init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x219A226E8](v4);
    handler = v5->_handler;
    v5->_handler = (id)v6;

  }
  return v5;
}

- (void)receiveMessageIdentifier:(id)a3 didSucceed:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteIDSMessageDidSendSubscription.m"), 37, CFSTR("%@ must be called from the main thread"), v13);

  }
  -[CRKConcreteIDSMessageDidSendSubscription handler](self, "handler");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    (*(void (**)(uint64_t, id, _BOOL8, id))(v10 + 16))(v10, v14, v6, v9);

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
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteIDSMessageDidSendSubscription.m"), 50, CFSTR("%@ must be called from the main thread"), v6);

  }
  if (-[CRKConcreteIDSMessageDidSendSubscription isResumed](self, "isResumed"))
  {
    -[CRKConcreteIDSMessageDidSendSubscription handler](self, "handler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CRKConcreteIDSMessageDidSendSubscription setHandler:](self, "setHandler:", 0);
      -[CRKConcreteIDSMessageDidSendSubscription delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didSendSubscriptionDidCancel:", self);

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
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteIDSMessageDidSendSubscription.m"), 63, CFSTR("%@ must be called from the main thread"), v6);

  }
  if (!-[CRKConcreteIDSMessageDidSendSubscription isResumed](self, "isResumed"))
  {
    -[CRKConcreteIDSMessageDidSendSubscription handler](self, "handler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CRKConcreteIDSMessageDidSendSubscription setResumed:](self, "setResumed:", 1);
      -[CRKConcreteIDSMessageDidSendSubscription delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "didSendSubscriptionDidResume:", self);

    }
  }
}

- (CRKConcreteIDSMessageDidSendSubscriptionDelegate)delegate
{
  return (CRKConcreteIDSMessageDidSendSubscriptionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
