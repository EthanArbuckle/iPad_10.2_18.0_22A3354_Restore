@implementation APUIAirPlaySetupConfigurationWiFi

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[APUIAirPlaySetupConfigurationWiFi SSID](self, "SSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSSID:", v5);

  -[APUIAirPlaySetupConfigurationWiFi passphrase](self, "passphrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPassphrase:", v6);

  -[APUIAirPlaySetupConfigurationWiFi captivePortalBypassToken](self, "captivePortalBypassToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaptivePortalBypassToken:", v7);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  int v6;
  void *v7;
  __CFString *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[APUIAirPlaySetupConfigurationWiFi SSID](self, "SSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !IsAppleInternalBuild())
  {
    v6 = 0;
    v5 = CFSTR("#Redacted#");
  }
  else
  {
    -[APUIAirPlaySetupConfigurationWiFi SSID](self, "SSID");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  -[APUIAirPlaySetupConfigurationWiFi passphrase](self, "passphrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && !IsAppleInternalBuild())
  {
    v9 = 0;
    v8 = CFSTR("#Redacted#");
  }
  else
  {
    -[APUIAirPlaySetupConfigurationWiFi passphrase](self, "passphrase");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = 1;
  }
  -[APUIAirPlaySetupConfigurationWiFi captivePortalBypassToken](self, "captivePortalBypassToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && !IsAppleInternalBuild())
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("WiFi<SSID=%@|passphrase=%@|captivePortalBypassToken=%@>"), v5, v8, CFSTR("#Redacted#"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[APUIAirPlaySetupConfigurationWiFi captivePortalBypassToken](self, "captivePortalBypassToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("WiFi<SSID=%@|passphrase=%@|captivePortalBypassToken=%@>"), v5, v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v9)

  if (v6)
  return v12;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)captivePortalBypassToken
{
  return self->_captivePortalBypassToken;
}

- (void)setCaptivePortalBypassToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captivePortalBypassToken, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
}

@end
