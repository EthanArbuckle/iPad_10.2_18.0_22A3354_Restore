@implementation IUISessionChangeContext

- (IUISessionChangeContext)initWithService:(id)a3 session:(id)a4 sessionChange:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IUISessionChangeContext *v14;
  IUISessionChangeContext *v15;
  IUISessionChange *v16;
  IUISessionChange *sessionChange;
  id v18;
  id completion;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)IUISessionChangeContext;
  v14 = -[IUISessionChangeContext init](&v21, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_service, v10);
    objc_storeWeak((id *)&v15->_session, v11);
    v16 = (IUISessionChange *)objc_msgSend(v12, "copy");
    sessionChange = v15->_sessionChange;
    v15->_sessionChange = v16;

    v18 = objc_msgSend(v13, "copy");
    completion = v15->_completion;
    v15->_completion = v18;

  }
  return v15;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id WeakRetained;
  id v7;
  IUISessionChange *sessionChange;
  id v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v7 = objc_loadWeakRetained((id *)&self->_session);
  sessionChange = self->_sessionChange;
  v9 = objc_retainBlock(self->_completion);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; service:%@; session:%@; sessionChange:%@ completion:%@>"),
                    v5,
                    self,
                    WeakRetained,
                    v7,
                    sessionChange,
                    v9));

  return v10;
}

- (RTIInputSystemService)service
{
  return (RTIInputSystemService *)objc_loadWeakRetained((id *)&self->_service);
}

- (RTIInputSystemServiceSession)session
{
  return (RTIInputSystemServiceSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (IUISessionChange)sessionChange
{
  return self->_sessionChange;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_sessionChange, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_destroyWeak((id *)&self->_service);
}

@end
