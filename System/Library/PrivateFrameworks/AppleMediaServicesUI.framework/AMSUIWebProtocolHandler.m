@implementation AMSUIWebProtocolHandler

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v7 = a5;
  v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebProtocolHandler;
  -[AMSURLProtocolHandler reconfigureNewRequest:originalTask:redirect:error:](&v13, sel_reconfigureNewRequest_originalTask_redirect_error_, v10, a4, v7, a6);
  -[AMSUIWebProtocolHandler delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[AMSUIWebProtocolHandler delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "protocolHandler:didEncodeNetworkRequest:", self, v10);

  }
}

- (AMSUIWebProtocolDelegate)delegate
{
  return (AMSUIWebProtocolDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
