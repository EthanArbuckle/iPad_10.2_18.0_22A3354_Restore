@implementation ProxyDriverManagerObserver

- (ProxyDriverManagerObserver)initWithObserver:(id)a3
{
  id v5;
  ProxyDriverManagerObserver *v6;
  ProxyDriverManagerObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ProxyDriverManagerObserver;
  v6 = -[ProxyDriverManagerObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_observer, a3);

  return v7;
}

- (void)approvalStateDidChange:(BOOL)a3
{
  -[DriverManagerObserver approvalStateDidChange:](self->_observer, "approvalStateDidChange:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
