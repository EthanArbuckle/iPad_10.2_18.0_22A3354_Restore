@implementation EMRemoteConnectionRecoveryAssertion

- (EMRemoteConnectionRecoveryAssertion)initWithConnection:(id)a3
{
  id v4;
  EMRemoteConnectionRecoveryAssertion *v5;
  EMRemoteConnectionRecoveryAssertion *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMRemoteConnectionRecoveryAssertion;
  v5 = -[EMRemoteConnectionRecoveryAssertion init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(v4, "voucherInitialized");
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)dealloc
{
  objc_super v3;

  -[EMRemoteConnectionRecoveryAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)EMRemoteConnectionRecoveryAssertion;
  -[EMRemoteConnectionRecoveryAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  EMRemoteConnectionRecoveryAssertion *v2;
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v2 = (EMRemoteConnectionRecoveryAssertion *)((char *)v2 + 16);
  WeakRetained = objc_loadWeakRetained((id *)&v2->super.isa);
  objc_msgSend(WeakRetained, "voucherInvalidated");

  objc_storeWeak((id *)&v2->super.isa, 0);
  os_unfair_lock_unlock(p_lock);
}

- (EMRemoteConnectionRecoveryAssertionDelegate)delegate
{
  return (EMRemoteConnectionRecoveryAssertionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

@end
