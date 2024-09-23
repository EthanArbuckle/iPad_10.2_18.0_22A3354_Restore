@implementation FPDXPCDomainServicerLifetimeExtender

- (void)stopExtendingLifetime
{
  void (**stopBlock)(id, FPDXPCDomainServicerLifetimeExtender *);
  id v3;
  FPDXPCDomainServicerLifetimeExtender *obj;

  obj = self;
  objc_sync_enter(obj);
  stopBlock = (void (**)(id, FPDXPCDomainServicerLifetimeExtender *))obj->_stopBlock;
  if (stopBlock)
  {
    stopBlock[2](stopBlock, obj);
    v3 = obj->_stopBlock;
    obj->_stopBlock = 0;

  }
  objc_sync_exit(obj);

}

- (void)setStopBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setRequestEffectivePID:(int)a3
{
  self->_requestEffectivePID = a3;
}

- (void)setPrettyDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)requestEffectivePID
{
  return self->_requestEffectivePID;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopBlock, 0);
  objc_storeStrong((id *)&self->_prettyDescription, 0);
}

- (NSString)prettyDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)stopBlock
{
  return self->_stopBlock;
}

@end
