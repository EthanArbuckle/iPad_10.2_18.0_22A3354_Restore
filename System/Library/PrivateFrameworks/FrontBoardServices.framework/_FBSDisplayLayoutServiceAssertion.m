@implementation _FBSDisplayLayoutServiceAssertion

- (FBSDisplayLayout)currentLayout
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_FBSDisplayLayoutService currentLayout](self->_lock_service, "currentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (FBSDisplayLayout *)v4;
}

- (void)dealloc
{
  objc_super v3;

  -[_FBSDisplayLayoutServiceAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_FBSDisplayLayoutServiceAssertion;
  -[_FBSDisplayLayoutServiceAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  _FBSDisplayLayoutService *lock_service;
  _FBSDisplayLayoutService *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_service = self->_lock_service;
  if (lock_service)
  {
    -[_FBSDisplayLayoutService removeObserverForKey:](lock_service, "removeObserverForKey:", self);
    +[_FBSDisplayLayoutEndpointServices _checkinService:](_FBSDisplayLayoutEndpointServices, "_checkinService:", self->_lock_service);
    v5 = self->_lock_service;
    self->_lock_service = 0;

  }
  os_unfair_lock_unlock(p_lock);
}

- (_FBSDisplayLayoutServiceAssertion)initWithEndpoint:(id)a3 qos:(char)a4 observer:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  _FBSDisplayLayoutServiceAssertion *v10;
  _FBSDisplayLayoutServiceAssertion *v11;
  uint64_t v12;
  _FBSDisplayLayoutService *lock_service;
  objc_super v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_FBSDisplayLayoutServiceAssertion;
  v10 = -[_FBSDisplayLayoutServiceAssertion init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    +[_FBSDisplayLayoutEndpointServices _checkoutServiceWithEndpoint:qos:](_FBSDisplayLayoutEndpointServices, "_checkoutServiceWithEndpoint:qos:", v8, v6);
    v12 = objc_claimAutoreleasedReturnValue();
    lock_service = v11->_lock_service;
    v11->_lock_service = (_FBSDisplayLayoutService *)v12;

    if (v9)
      -[_FBSDisplayLayoutService addObserver:forKey:](v11->_lock_service, "addObserver:forKey:", v9, v11);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_service, 0);
}

- (_FBSDisplayLayoutServiceAssertion)init
{
  return -[_FBSDisplayLayoutServiceAssertion initWithEndpoint:qos:observer:](self, "initWithEndpoint:qos:observer:", 0, 0, 0);
}

@end
