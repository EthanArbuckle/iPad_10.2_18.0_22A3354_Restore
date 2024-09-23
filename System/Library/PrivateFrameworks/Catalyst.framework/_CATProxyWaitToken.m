@implementation _CATProxyWaitToken

- (_CATProxyWaitToken)initWithExclusive:(BOOL)a3 group:(id)a4
{
  id v8;
  _CATProxyWaitToken *v9;
  _CATProxyWaitToken *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 685, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("group"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_CATProxyWaitToken;
  v9 = -[_CATProxyWaitToken init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_isExclusive = a3;
    objc_storeStrong((id *)&v9->mGroup, a4);
    dispatch_group_enter((dispatch_group_t)v10->mGroup);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[_CATProxyWaitToken cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_CATProxyWaitToken;
  -[_CATProxyWaitToken dealloc](&v3, sel_dealloc);
}

- (void)notifyWithResourceProxy:(id)a3
{
  id v5;
  BOOL *p_mFinished;
  OS_dispatch_group *mGroup;
  id v9;

  v5 = a3;
  p_mFinished = &self->mFinished;
  while (!__ldaxr((unsigned __int8 *)p_mFinished))
  {
    if (!__stlxr(1u, (unsigned __int8 *)p_mFinished))
    {
      v9 = v5;
      objc_storeStrong(&self->_resourceProxy, a3);
      dispatch_group_leave((dispatch_group_t)self->mGroup);
      mGroup = self->mGroup;
      self->mGroup = 0;

      v5 = v9;
      goto LABEL_6;
    }
  }
  __clrex();
LABEL_6:

}

- (void)cancel
{
  -[_CATProxyWaitToken notifyWithResourceProxy:](self, "notifyWithResourceProxy:", 0);
}

- (void)invalidate
{
  id resourceProxy;

  resourceProxy = self->_resourceProxy;
  self->_resourceProxy = 0;

}

- (BOOL)isExclusive
{
  return self->_isExclusive;
}

- (id)resourceProxy
{
  return self->_resourceProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resourceProxy, 0);
  objc_storeStrong((id *)&self->mGroup, 0);
}

@end
