@implementation CKXProxyBase

- (id)initInternal
{
  CKXProxyBase *v2;
  const char *v3;
  uint64_t v4;
  CKXProxyBase *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKXProxyBase;
  v2 = -[CKXProxyBase init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_reset(v2, v3, v4);
  return v5;
}

- (void)associateWithBackingStore:(id)a3
{
  objc_storeWeak((id *)&self->_backingStore, a3);
}

- (BOOL)isMutable
{
  return 0;
}

- (void)commit
{
  self->_scope = 0;
  self->_committed = 1;
}

- (void)reset
{
  objc_storeWeak((id *)&self->_backingStore, 0);
  self->_scope = 0;
  self->_committed = 0;
}

- (CKXBackingStore)backingStore
{
  return (CKXBackingStore *)objc_loadWeakRetained((id *)&self->_backingStore);
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (BOOL)committed
{
  return self->_committed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backingStore);
}

@end
