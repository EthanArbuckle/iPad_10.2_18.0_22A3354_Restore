@implementation MRGroupSessionAssertion

- (MRGroupSessionAssertion)initWithCancellationHandler:(id)a3
{
  id v4;
  MRGroupSessionAssertion *v5;
  MRGroupSessionAssertion *v6;
  uint64_t v7;
  id handler;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRGroupSessionAssertion;
  v5 = -[MRGroupSessionAssertion init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = MEMORY[0x194036C44](v4);
    handler = v6->_handler;
    v6->_handler = (id)v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MRGroupSessionAssertion cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MRGroupSessionAssertion;
  -[MRGroupSessionAssertion dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  _BOOL4 cancelled;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cancelled = self->_cancelled;
  self->_cancelled = 1;
  os_unfair_lock_unlock(p_lock);
  if (!cancelled)
    (*((void (**)(void))self->_handler + 2))();
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
