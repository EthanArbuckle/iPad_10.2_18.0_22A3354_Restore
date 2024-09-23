@implementation HMDRemoteEventRouterAssertion

- (HMDRemoteEventRouterAssertion)initWithAssertionController:(id)a3
{
  id v4;
  void *v5;
  HMDRemoteEventRouterAssertion *v6;
  HMDRemoteEventRouterAssertion *v7;
  HMDRemoteEventRouterAssertion *result;
  HMDRemoteEventRouterAssertion *v9;
  SEL v10;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)HMDRemoteEventRouterAssertion;
    v6 = -[HMDRemoteEventRouterAssertion init](&v11, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeWeak((id *)&v6->_activeStateDelegate, v5);
      v7->_isActive = 1;
      v7->_lock._os_unfair_lock_opaque = 0;
    }

    return v7;
  }
  else
  {
    v9 = (HMDRemoteEventRouterAssertion *)_HMFPreconditionFailure();
    -[HMDRemoteEventRouterAssertion cancel](v9, v10);
  }
  return result;
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  BOOL v4;
  id v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[HMDRemoteEventRouterAssertion isActive](self, "isActive");
  -[HMDRemoteEventRouterAssertion setIsActive:](self, "setIsActive:", 0);
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    -[HMDRemoteEventRouterAssertion activeStateDelegate](self, "activeStateDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertionDidBecomeInactive:", self);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[HMDRemoteEventRouterAssertion cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)HMDRemoteEventRouterAssertion;
  -[HMDRemoteEventRouterAssertion dealloc](&v3, sel_dealloc);
}

- (HMDRemoteEventRouterClientActiveStateDelegate)activeStateDelegate
{
  return (HMDRemoteEventRouterClientActiveStateDelegate *)objc_loadWeakRetained((id *)&self->_activeStateDelegate);
}

- (void)setActiveStateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_activeStateDelegate, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeStateDelegate);
}

@end
