@implementation APUIAirPlaySetupPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APUIAirPlaySetupPayload)initWithCoder:(id)a3
{
  id v4;
  APUIAirPlaySetupPayload *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APUIAirPlaySetupPayload;
  v5 = -[APUIAirPlaySetupPayload init](&v17, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("wifiSSID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[APUIAirPlaySetupPayload setWifiSSID:](v5, "setWifiSSID:", v7);

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("wifiPassphrase"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[APUIAirPlaySetupPayload setWifiPassphrase:](v5, "setWifiPassphrase:", v9);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("brokerToken"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[APUIAirPlaySetupPayload setBrokerToken:](v5, "setBrokerToken:", v11);

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("receiverToken"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[APUIAirPlaySetupPayload setReceiverToken:](v5, "setReceiverToken:", v13);

    -[APUIAirPlaySetupPayload setIsNetworkHidden:](v5, "setIsNetworkHidden:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isNetworkHidden")));
    -[APUIAirPlaySetupPayload setRouteToReceiver:](v5, "setRouteToReceiver:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("routeToReceiver")));
    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("captivePortalAuthToken"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[APUIAirPlaySetupPayload setCaptivePortalAuthToken:](v5, "setCaptivePortalAuthToken:", v15);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiSSID](self, "wifiSSID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("wifiSSID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiPassphrase](self, "wifiPassphrase"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("wifiPassphrase"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload brokerToken](self, "brokerToken"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("brokerToken"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload receiverToken](self, "receiverToken"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("receiverToken"));

  objc_msgSend(v4, "encodeBool:forKey:", -[APUIAirPlaySetupPayload isNetworkHidden](self, "isNetworkHidden"), CFSTR("isNetworkHidden"));
  objc_msgSend(v4, "encodeBool:forKey:", -[APUIAirPlaySetupPayload routeToReceiver](self, "routeToReceiver"), CFSTR("routeToReceiver"));
  v9 = (id)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload captivePortalAuthToken](self, "captivePortalAuthToken"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("captivePortalAuthToken"));

}

- (id)description
{
  void *v3;
  __CFString *v4;
  int v5;
  void *v6;
  __CFString *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  _BOOL8 v18;
  _BOOL8 v19;
  int v20;
  void *v21;
  int v22;
  const __CFString *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __CFString *v27;

  v26 = objc_opt_class(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiSSID](self, "wifiSSID"));
  if (v3 && !IsAppleInternalBuild())
  {
    v5 = 0;
    v4 = CFSTR("#Redacted#");
  }
  else
  {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiSSID](self, "wifiSSID"));
    v5 = 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiPassphrase](self, "wifiPassphrase"));
  if (v6 && !IsAppleInternalBuild())
  {
    v25 = 0;
    v7 = CFSTR("#Redacted#");
  }
  else
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiPassphrase](self, "wifiPassphrase"));
    v25 = 1;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload brokerToken](self, "brokerToken"));
  if (v24 && !IsAppleInternalBuild())
  {
    v22 = 0;
    v23 = CFSTR("#Redacted#");
  }
  else
  {
    v23 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload brokerToken](self, "brokerToken"));
    v22 = 1;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload receiverToken](self, "receiverToken"));
  if (v21 && !IsAppleInternalBuild())
  {
    v20 = 0;
    v27 = CFSTR("#Redacted#");
  }
  else
  {
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload receiverToken](self, "receiverToken"));
    v20 = 1;
  }
  v8 = -[APUIAirPlaySetupPayload routeToReceiver](self, "routeToReceiver");
  v9 = -[APUIAirPlaySetupPayload isNetworkHidden](self, "isNetworkHidden");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload captivePortalAuthToken](self, "captivePortalAuthToken"));
  if (v10 && !IsAppleInternalBuild())
  {
    v19 = v8;
    v15 = (__CFString *)v23;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p wifiSSID=%@ wifiPassphrase=%@ brokerToken=%@ receiverToken=%@ routeToReceiver=%d isNetworkHidden=%d captivePortalAuthToken=%@>"), v26, self, v4, v7, v23, v27, v19, v9, CFSTR("#Redacted#")));
  }
  else
  {
    v11 = v6;
    v12 = v5;
    v13 = v3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload captivePortalAuthToken](self, "captivePortalAuthToken"));
    v18 = v8;
    v15 = (__CFString *)v23;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p wifiSSID=%@ wifiPassphrase=%@ brokerToken=%@ receiverToken=%@ routeToReceiver=%d isNetworkHidden=%d captivePortalAuthToken=%@>"), v26, self, v4, v7, v23, v27, v18, v9, v14));

    v3 = v13;
    v5 = v12;
    v6 = v11;
  }

  if (v20)
  if (v22)

  if (v25)
  if (v5)

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL8 isNetworkHidden;
  id v5;
  Class v6;
  id v7;
  void *v8;
  NSString *wifiSSID;
  uint64_t v10;
  void *v11;
  NSString *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSString *wifiPassphrase;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSString *captivePortalAuthToken;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSString *brokerToken;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSString *receiverToken;
  void *v37;
  unsigned int v38;
  BOOL v39;
  uint64_t v41;
  int routeToReceiver;

  v5 = a3;
  if (!v5 || (v6 = NSClassFromString(CFSTR("APUIAirPlaySetupPayload")), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    v39 = 0;
    v8 = 0;
    goto LABEL_48;
  }
  v7 = v5;
  v8 = v7;
  wifiSSID = self->_wifiSSID;
  if (!wifiSSID)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "wifiSSID"));
    if (!v15)
      goto LABEL_12;
    isNetworkHidden = v15;
    if (!self->_wifiSSID)
      goto LABEL_46;
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wifiSSID"));
  if (!v10)
    goto LABEL_45;
  v11 = (void *)v10;
  v12 = self->_wifiSSID;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wifiSSID"));
  v14 = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

  if (wifiSSID)
  {
    if (!v14)
      goto LABEL_47;
  }
  else
  {

    if ((v14 & 1) == 0)
      goto LABEL_47;
  }
LABEL_12:
  wifiSSID = self->_wifiPassphrase;
  if (!wifiSSID)
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wifiPassphrase"));
    if (!v21)
      goto LABEL_21;
    isNetworkHidden = v21;
    if (!self->_wifiPassphrase)
      goto LABEL_46;
  }
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wifiPassphrase"));
  if (!v16)
    goto LABEL_45;
  v17 = (void *)v16;
  wifiPassphrase = self->_wifiPassphrase;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "wifiPassphrase"));
  v20 = -[NSString isEqualToString:](wifiPassphrase, "isEqualToString:", v19);

  if (wifiSSID)
  {
    if (!v20)
      goto LABEL_47;
  }
  else
  {

    if ((v20 & 1) == 0)
      goto LABEL_47;
  }
LABEL_21:
  wifiSSID = self->_captivePortalAuthToken;
  if (!wifiSSID)
  {
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "captivePortalAuthToken"));
    if (!v27)
      goto LABEL_30;
    isNetworkHidden = v27;
    if (!self->_captivePortalAuthToken)
      goto LABEL_46;
  }
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "captivePortalAuthToken"));
  if (!v22)
    goto LABEL_45;
  v23 = (void *)v22;
  captivePortalAuthToken = self->_captivePortalAuthToken;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "captivePortalAuthToken"));
  v26 = -[NSString isEqual:](captivePortalAuthToken, "isEqual:", v25);

  if (wifiSSID)
  {
    if (!v26)
      goto LABEL_47;
  }
  else
  {

    if ((v26 & 1) == 0)
      goto LABEL_47;
  }
LABEL_30:
  isNetworkHidden = self->_isNetworkHidden;
  if (isNetworkHidden != objc_msgSend(v8, "isNetworkHidden"))
    goto LABEL_47;
  wifiSSID = self->_brokerToken;
  if (!wifiSSID)
  {
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "brokerToken"));
    if (!v33)
      goto LABEL_40;
    isNetworkHidden = v33;
    if (!self->_brokerToken)
      goto LABEL_46;
  }
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "brokerToken"));
  if (!v28)
    goto LABEL_45;
  v29 = (void *)v28;
  brokerToken = self->_brokerToken;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "brokerToken"));
  v32 = -[NSString isEqualToString:](brokerToken, "isEqualToString:", v31);

  if (wifiSSID)
  {
    if (!v32)
      goto LABEL_47;
  }
  else
  {

    if ((v32 & 1) == 0)
      goto LABEL_47;
  }
LABEL_40:
  wifiSSID = self->_receiverToken;
  if (!wifiSSID)
  {
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "receiverToken"));
    if (!v41)
      goto LABEL_53;
    isNetworkHidden = v41;
    if (!self->_receiverToken)
    {
LABEL_46:

      goto LABEL_47;
    }
  }
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "receiverToken"));
  if (!v34)
  {
LABEL_45:
    if (wifiSSID)
      goto LABEL_47;
    goto LABEL_46;
  }
  v35 = (void *)v34;
  receiverToken = self->_receiverToken;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "receiverToken"));
  v38 = -[NSString isEqualToString:](receiverToken, "isEqualToString:", v37);

  if (!wifiSSID)
  {

    if ((v38 & 1) == 0)
      goto LABEL_47;
LABEL_53:
    routeToReceiver = self->_routeToReceiver;
    v39 = routeToReceiver == objc_msgSend(v8, "routeToReceiver");
    goto LABEL_48;
  }
  if (v38)
    goto LABEL_53;
LABEL_47:
  v39 = 0;
LABEL_48:

  return v39;
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)wifiPassphrase
{
  return self->_wifiPassphrase;
}

- (void)setWifiPassphrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)captivePortalAuthToken
{
  return self->_captivePortalAuthToken;
}

- (void)setCaptivePortalAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_captivePortalAuthToken, a3);
}

- (BOOL)isNetworkHidden
{
  return self->_isNetworkHidden;
}

- (void)setIsNetworkHidden:(BOOL)a3
{
  self->_isNetworkHidden = a3;
}

- (NSString)brokerToken
{
  return self->_brokerToken;
}

- (void)setBrokerToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)receiverToken
{
  return self->_receiverToken;
}

- (void)setReceiverToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)routeToReceiver
{
  return self->_routeToReceiver;
}

- (void)setRouteToReceiver:(BOOL)a3
{
  self->_routeToReceiver = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverToken, 0);
  objc_storeStrong((id *)&self->_brokerToken, 0);
  objc_storeStrong((id *)&self->_captivePortalAuthToken, 0);
  objc_storeStrong((id *)&self->_wifiPassphrase, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
}

@end
