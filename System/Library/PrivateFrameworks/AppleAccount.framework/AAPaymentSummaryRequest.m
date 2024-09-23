@implementation AAPaymentSummaryRequest

- (id)urlString
{
  void *v2;
  void *v3;

  +[AAURLConfiguration urlConfiguration](AAURLConfiguration, "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paymentSummaryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)forceGSToken
{
  return self->_heartbeatToken == 0;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSString *secondaryAuthToken;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AAPaymentSummaryRequest;
  -[AAAppleIDSettingsRequest urlRequest](&v9, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  secondaryAuthToken = self->_secondaryAuthToken;
  if (secondaryAuthToken)
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", secondaryAuthToken, CFSTR("X-Apple-2SV-Authenticate"));
  -[AAAppleIDSettingsRequest grandSlamAccount](self, "grandSlamAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aida_alternateDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_addGrandslamAuthorizationheaderWithAltDSID:heartbeatToken:", v7, self->_heartbeatToken);

  objc_msgSend(v4, "aa_addContentTypeHeaders:", CFSTR("application/json"));
  return v4;
}

- (NSString)secondaryAuthToken
{
  return self->_secondaryAuthToken;
}

- (void)setSecondaryAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)heartbeatToken
{
  return self->_heartbeatToken;
}

- (void)setHeartbeatToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatToken, 0);
  objc_storeStrong((id *)&self->_secondaryAuthToken, 0);
}

@end
