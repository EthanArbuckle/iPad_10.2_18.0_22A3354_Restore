@implementation AKGrandSlamResponseHandler

- (AKGrandSlamResponseHandler)initWithContext:(id)a3
{
  id v5;
  AKGrandSlamResponseHandler *v6;
  AKGrandSlamResponseHandler *v7;

  v5 = a3;
  v6 = -[AKGrandSlamResponseHandler init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (void)handleResponseError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ec"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sec"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "domain");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8 != CFSTR("AKAuthenticationError") || v10 == 0)
  {

  }
  else
  {

    if (v7 && objc_msgSend(v10, "integerValue") == -22411)
      -[AKGrandSlamResponseHandler _handleInvalidMasterTokenWithSubErrorCode:](self, "_handleInvalidMasterTokenWithSubErrorCode:", objc_msgSend(v7, "integerValue"));
  }

}

- (void)_handleInvalidMasterTokenWithSubErrorCode:(int64_t)a3
{
  if (a3 == -22423 || a3 == -42333)
    -[AKGrandSlamResponseHandler _revokeDeviceTrust](self, "_revokeDeviceTrust");
}

- (void)_revokeDeviceTrust
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AKGrandSlamResponseHandler context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authKitAccountWithAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v6, "setDeviceRemovalReason:onAccount:", 0, v5);
    objc_msgSend(v6, "saveAccount:error:", v5, 0);
  }

}

- (AKAuthenticatedServerRequest)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
