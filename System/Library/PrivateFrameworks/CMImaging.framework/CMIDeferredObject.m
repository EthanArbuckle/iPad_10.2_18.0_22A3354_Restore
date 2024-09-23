@implementation CMIDeferredObject

- (CMIDeferredObject)initWithBlock:(id)a3
{
  void *v4;
  id realizeBlock;

  v4 = (void *)MEMORY[0x1D824D3C0](a3, a2);
  realizeBlock = self->_realizeBlock;
  self->_realizeBlock = v4;

  self->_realized = 0;
  return self;
}

- (void)_realize
{
  uint64_t v2;
  NSObject *actualValue;
  CMIDeferredObject *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_realized)
  {
    (*((void (**)(void))obj->_realizeBlock + 2))();
    v2 = objc_claimAutoreleasedReturnValue();
    actualValue = obj->_actualValue;
    obj->_actualValue = v2;

    obj->_realized = 1;
  }
  objc_sync_exit(obj);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  -[CMIDeferredObject _realize](self, "_realize", a3);
  return self->_actualValue;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CMIDeferredObject _realize](self, "_realize");
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", self->_actualValue);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CMIDeferredObject;
    -[CMIDeferredObject forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  -[CMIDeferredObject _realize](self, "_realize");
  return -[NSObject methodSignatureForSelector:](self->_actualValue, "methodSignatureForSelector:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualValue, 0);
  objc_storeStrong(&self->_realizeBlock, 0);
}

@end
