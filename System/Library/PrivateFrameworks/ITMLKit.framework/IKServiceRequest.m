@implementation IKServiceRequest

- (IKServiceRequest)initWithAppContext:(id)a3 serviceContext:(id)a4
{
  id v6;
  id v7;
  IKServiceRequest *v8;
  IKServiceRequest *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IKServiceRequest;
  v8 = -[IKServiceRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_appContext, v6);
    objc_storeStrong((id *)&v9->_serviceContext, a4);
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  IKServiceRequestDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_srDelegateFlags.hasDidCompleteWithStatus = p_delegate & 1;
}

- (void)send
{
  if (!self->_state)
  {
    self->_state = 1;
    -[IKServiceRequest onSend](self, "onSend");
  }
}

- (void)cancel
{
  id v3;

  self->_state = 2;
  -[IKServiceRequest onCancel](self, "onCancel");
  -[IKServiceRequest delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceRequest:didCompleteWithStatus:errorDictionary:", self, 2, 0);

}

- (void)_completedWithStatus:(int64_t)a3 errorDictionary:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  if (self->_state == 1)
  {
    self->_state = 3;
    if (self->_srDelegateFlags.hasDidCompleteWithStatus)
    {
      v8 = v6;
      -[IKServiceRequest delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceRequest:didCompleteWithStatus:errorDictionary:", self, a3, v8);

      v6 = v8;
    }
  }

}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (IKServiceContext)serviceContext
{
  return self->_serviceContext;
}

- (IKServiceRequestDelegate)delegate
{
  return (IKServiceRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceContext, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

@end
