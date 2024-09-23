@implementation _CATArbitratorResourceProxy

- (_CATArbitratorResourceProxy)initWithResource:(id)a3 registration:(id)a4 exclusive:(BOOL)a5
{
  id v9;
  id v10;

  v9 = a3;
  v10 = a4;
  if (self)
  {
    self->_isExclusive = a5;
    objc_storeStrong(&self->mResource, a3);
    objc_storeStrong((id *)&self->mRegistration, a4);
  }

  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[_CATArbitratorResourceProxy invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_CATArbitratorResourceProxy;
  -[_CATArbitratorResourceProxy dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id mResource;

  mResource = self->mResource;
  self->mResource = 0;

  -[_CATArbitratorRegistrationEntry resourceProxyDidInvalidate:](self->mRegistration, "resourceProxyDidInvalidate:", self);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v6;
  void *v7;

  if (!self->mResource)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 538, CFSTR("%@ cannot call %@ because receiver has been invalidated"), self, v7);

  }
  return objc_opt_respondsToSelector() & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id mResource;
  void *v7;
  void *v8;

  mResource = self->mResource;
  if (!mResource)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 545, CFSTR("%@ cannot call %@ because receiver has been invalidated"), self, v8);

    mResource = self->mResource;
  }
  return mResource;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id mResource;
  void *v8;
  void *v9;

  mResource = self->mResource;
  if (!mResource)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 552, CFSTR("%@ cannot call %@ because receiver has been invalidated"), self, v9);

    mResource = self->mResource;
  }
  return (id)objc_msgSend(mResource, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!self->mResource)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATArbitrator.m"), 559, CFSTR("%@ cannot call %@ because receiver has been invalidated"), self, v7);

    v5 = v8;
  }
  objc_msgSend(v5, "setTarget:");
  objc_msgSend(v8, "invoke");

}

- (BOOL)isExclusive
{
  return self->_isExclusive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRegistration, 0);
  objc_storeStrong(&self->mResource, 0);
}

@end
