@implementation HMDNetworkRouterFirewallRuleManagerClientState

- (HMDNetworkRouterFirewallRuleManagerClient)client
{
  return (HMDNetworkRouterFirewallRuleManagerClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (id)startupCompletion
{
  return self->_startupCompletion;
}

- (void)setStartupCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startupCompletion, 0);
  objc_destroyWeak((id *)&self->_client);
}

@end
