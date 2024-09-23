@implementation APUIAirPlaySetupConfigurationReceiver

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[APUIAirPlaySetupConfigurationReceiver ID](self, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setID:", v5);

  -[APUIAirPlaySetupConfigurationReceiver authString](self, "authString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthString:", v6);

  objc_msgSend(v4, "setRouteToReceiverAfterSetup:", -[APUIAirPlaySetupConfigurationReceiver routeToReceiverAfterSetup](self, "routeToReceiverAfterSetup"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  int v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[APUIAirPlaySetupConfigurationReceiver ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[APUIAirPlaySetupConfigurationReceiver authString](self, "authString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !IsAppleInternalBuild())
  {
    v7 = 0;
    v6 = CFSTR("#Redacted#");
  }
  else
  {
    -[APUIAirPlaySetupConfigurationReceiver authString](self, "authString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
  }
  v8 = -[APUIAirPlaySetupConfigurationReceiver routeToReceiverAfterSetup](self, "routeToReceiverAfterSetup");
  v9 = "no";
  if (v8)
    v9 = "yes";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Receiver<ID=%@|authString=%@|routeToReceiverAfterSetup=%s>"), v4, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)

  return v10;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)authString
{
  return self->_authString;
}

- (void)setAuthString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)routeToReceiverAfterSetup
{
  return self->_routeToReceiverAfterSetup;
}

- (void)setRouteToReceiverAfterSetup:(BOOL)a3
{
  self->_routeToReceiverAfterSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authString, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
