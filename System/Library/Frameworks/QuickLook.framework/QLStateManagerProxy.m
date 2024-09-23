@implementation QLStateManagerProxy

- (BOOL)respondsToSelector:(SEL)a3
{
  return 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  QLPreviewControllerStateProtocolHostOnly **p_stateManager;
  id WeakRetained;
  id v7;
  void *v8;
  objc_super v10;

  p_stateManager = &self->_stateManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stateManager);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_stateManager);
    objc_msgSend(v7, "methodSignatureForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)QLStateManagerProxy;
    -[QLStateManagerProxy methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_, sel_dropMethod);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)forwardInvocation:(id)a3
{
  QLPreviewControllerStateProtocolHostOnly **p_stateManager;
  id WeakRetained;
  id v6;
  id v7;

  v7 = a3;
  p_stateManager = &self->_stateManager;
  WeakRetained = objc_loadWeakRetained((id *)p_stateManager);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_stateManager);
    objc_msgSend(v7, "invokeWithTarget:", v6);

  }
}

- (QLPreviewControllerStateProtocolHostOnly)stateManager
{
  return (QLPreviewControllerStateProtocolHostOnly *)objc_loadWeakRetained((id *)&self->_stateManager);
}

- (void)setStateManager:(id)a3
{
  objc_storeWeak((id *)&self->_stateManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateManager);
}

@end
