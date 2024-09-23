@implementation _HMFNetManagerWoWAssertion

- (_HMFNetManagerWoWAssertion)initWithWifiManager:(id)a3
{
  id v5;
  _HMFNetManagerWoWAssertion *v6;
  _HMFNetManagerWoWAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HMFNetManagerWoWAssertion;
  v6 = -[_HMFNetManagerWoWAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    -[HMFWiFiManager takeWoWAssertion](v7->_manager, "takeWoWAssertion");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[HMFWiFiManager releaseWoWAssertion](self->_manager, "releaseWoWAssertion");
  v3.receiver = self;
  v3.super_class = (Class)_HMFNetManagerWoWAssertion;
  -[_HMFNetManagerWoWAssertion dealloc](&v3, sel_dealloc);
}

- (HMFWiFiManager)manager
{
  return self->_manager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
