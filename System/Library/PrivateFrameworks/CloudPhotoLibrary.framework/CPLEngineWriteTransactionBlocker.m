@implementation CPLEngineWriteTransactionBlocker

- (CPLEngineWriteTransactionBlocker)initWithUnblockBlock:(id)a3
{
  id v4;
  CPLEngineWriteTransactionBlocker *v5;
  CPLEngineWriteTransactionBlocker *v6;
  uint64_t v7;
  id unblock;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLEngineWriteTransactionBlocker;
  v5 = -[CPLEngineWriteTransactionBlocker init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    unblock = v6->_unblock;
    v6->_unblock = (id)v7;

  }
  return v6;
}

- (void)unblock
{
  os_unfair_lock_s *p_lock;
  id unblock;
  void *v5;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (id)MEMORY[0x1B5E08DC4](self->_unblock);
  unblock = self->_unblock;
  self->_unblock = 0;

  os_unfair_lock_unlock(p_lock);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (void)dealloc
{
  void (**unblock)(id, SEL);
  objc_super v4;

  unblock = (void (**)(id, SEL))self->_unblock;
  if (unblock)
    unblock[2](unblock, a2);
  v4.receiver = self;
  v4.super_class = (Class)CPLEngineWriteTransactionBlocker;
  -[CPLEngineWriteTransactionBlocker dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unblock, 0);
}

@end
