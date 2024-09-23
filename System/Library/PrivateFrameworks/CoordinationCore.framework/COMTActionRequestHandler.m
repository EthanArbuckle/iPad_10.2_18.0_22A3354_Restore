@implementation COMTActionRequestHandler

- (COMTActionRequestHandler)initWithType:(id)a3 actions:(id)a4 delegate:(id)a5 dispatchQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  COMTActionRequestHandler *v15;
  COMTActionRequestHandler *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)COMTActionRequestHandler;
  v15 = -[COMTActionRequestHandler init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_targetType, a3);
    objc_storeStrong((id *)&v16->_actions, a4);
    objc_storeWeak((id *)&v16->_delegate, v13);
    objc_storeStrong((id *)&v16->_delegateQueue, a6);
  }

  return v16;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMTActionRequestHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, delegate = %p>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)targetType
{
  return self->_targetType;
}

- (NSSet)actions
{
  return self->_actions;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (COMTActionRequestHandlerDelegate)delegate
{
  return (COMTActionRequestHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_targetType, 0);
}

@end
