@implementation APUIAirPlaySetupConfigurationDiscoveryBroker

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[APUIAirPlaySetupConfigurationDiscoveryBroker ID](self, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setID:", v5);

  -[APUIAirPlaySetupConfigurationDiscoveryBroker authToken](self, "authToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthToken:", v6);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[APUIAirPlaySetupConfigurationDiscoveryBroker ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUIAirPlaySetupConfigurationDiscoveryBroker authToken](self, "authToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !IsAppleInternalBuild())
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Broker<systemID=%@|authToken=%@>"), v4, CFSTR("#Redacted#"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[APUIAirPlaySetupConfigurationDiscoveryBroker authToken](self, "authToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Broker<systemID=%@|authToken=%@>"), v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
