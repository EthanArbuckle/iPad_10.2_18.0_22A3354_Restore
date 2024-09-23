@implementation DeferredEAServiceWrapper

- (DeferredEAServiceWrapper)initWithIOService:(unsigned int)a3 withMgr:(id)a4
{
  uint64_t v4;
  id v6;
  DeferredEAServiceWrapper *v7;
  DeferredEAServiceWrapper *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DeferredEAServiceWrapper;
  v7 = -[DeferredEAServiceWrapper init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[DeferredEAServiceWrapper setService:](v7, "setService:", v4);
    -[DeferredEAServiceWrapper setMgr:](v8, "setMgr:", v6);
  }

  return v8;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (ACCTransportIOAccessoryManager)mgr
{
  return self->_mgr;
}

- (void)setMgr:(id)a3
{
  objc_storeStrong((id *)&self->_mgr, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mgr, 0);
}

@end
