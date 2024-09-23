@implementation CPSViewServicePresentationContext

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_deviceName, CFSTR("deviceName"), 1);
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_delegatePurchaseRequest, CFSTR("delegatePurchaseRequest"), 1);
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_paymentRequest, CFSTR("paymentRequest"), 1);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_paymentContext, CFSTR("paymentContext"), 1);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_storeAccount, CFSTR("storeAccount"), 1);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_systemAuthenticationRequest, CFSTR("systemAuthenticationRequest"));
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_webAuthenticationRequest, CFSTR("webAuthenticationRequest"), 1);
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_proxiedAppDomains, CFSTR("proxiedAppDomains"), 1);
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_restrictedAccessRequest, CFSTR("restrictedAccessRequest"), 1);
  v12 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_storeAuthenticationRequest, CFSTR("storeAuthenticationRequest"), 1);
  v13 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_tvProviderRequest, CFSTR("tvProviderRequest"), 1);
  v14 = (id)objc_msgSend(v3, "appendObject:withName:", self->_learnMoreRequest, CFSTR("learnMoreRequest"));
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", self->_dedicatedCameraRequest, CFSTR("dedicatedCameraRequest"));
  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSViewServicePresentationContext)initWithCoder:(id)a3
{
  id v4;
  CPSViewServicePresentationContext *v5;
  void *v6;
  uint64_t v7;
  NSString *deviceName;
  uint64_t v9;
  AMSDelegatePurchaseRequest *delegatePurchaseRequest;
  uint64_t v11;
  PKPaymentRequest *paymentRequest;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *paymentContext;
  void *v22;
  uint64_t v23;
  ACAccount *storeAccount;
  void *v25;
  uint64_t v26;
  CPSSystemAuthenticationRequest *systemAuthenticationRequest;
  void *v28;
  uint64_t v29;
  CPSWebRequest *webAuthenticationRequest;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSArray *proxiedAppDomains;
  void *v37;
  uint64_t v38;
  NSData *sharingData;
  void *v40;
  uint64_t v41;
  CPSRestrictedAccessRequest *restrictedAccessRequest;
  void *v43;
  uint64_t v44;
  CPSStoreAuthenticationRequest *storeAuthenticationRequest;
  void *v46;
  uint64_t v47;
  CPSTVProviderRequest *tvProviderRequest;
  void *v49;
  uint64_t v50;
  CPSLearnMoreRequest *learnMoreRequest;
  void *v52;
  uint64_t v53;
  CPSDedicatedCameraRequest *dedicatedCameraRequest;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CPSViewServicePresentationContext;
  v5 = -[CPSViewServicePresentationContext init](&v56, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("deviceName"));
    v7 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v7;

    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("delegatePurchaseRequest")) & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", getAMSDelegatePurchaseRequestClass(), CFSTR("delegatePurchaseRequest"));
      v9 = objc_claimAutoreleasedReturnValue();
      delegatePurchaseRequest = v5->_delegatePurchaseRequest;
      v5->_delegatePurchaseRequest = (AMSDelegatePurchaseRequest *)v9;
    }
    else
    {
      delegatePurchaseRequest = v5->_delegatePurchaseRequest;
      v5->_delegatePurchaseRequest = 0;
    }

    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("paymentRequest")) & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", getPKPaymentRequestClass(), CFSTR("paymentRequest"));
      v11 = objc_claimAutoreleasedReturnValue();
      paymentRequest = v5->_paymentRequest;
      v5->_paymentRequest = (PKPaymentRequest *)v11;
    }
    else
    {
      paymentRequest = v5->_paymentRequest;
      v5->_paymentRequest = 0;
    }

    v13 = (void *)MEMORY[0x24BDBCF20];
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("paymentContext"));
    v20 = objc_claimAutoreleasedReturnValue();
    paymentContext = v5->_paymentContext;
    v5->_paymentContext = (NSDictionary *)v20;

    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, CFSTR("storeAccount"));
    v23 = objc_claimAutoreleasedReturnValue();
    storeAccount = v5->_storeAccount;
    v5->_storeAccount = (ACAccount *)v23;

    objc_opt_self();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("systemAuthenticationRequest"));
    v26 = objc_claimAutoreleasedReturnValue();
    systemAuthenticationRequest = v5->_systemAuthenticationRequest;
    v5->_systemAuthenticationRequest = (CPSSystemAuthenticationRequest *)v26;

    objc_opt_self();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, CFSTR("webAuthenticationRequest"));
    v29 = objc_claimAutoreleasedReturnValue();
    webAuthenticationRequest = v5->_webAuthenticationRequest;
    v5->_webAuthenticationRequest = (CPSWebRequest *)v29;

    v31 = (void *)MEMORY[0x24BDBCF20];
    objc_opt_self();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithObjects:", v32, v33, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("proxiedAppDomains"));
    v35 = objc_claimAutoreleasedReturnValue();
    proxiedAppDomains = v5->_proxiedAppDomains;
    v5->_proxiedAppDomains = (NSArray *)v35;

    objc_opt_self();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, CFSTR("sharingData"));
    v38 = objc_claimAutoreleasedReturnValue();
    sharingData = v5->_sharingData;
    v5->_sharingData = (NSData *)v38;

    objc_opt_self();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v40, CFSTR("restrictedAccessRequest"));
    v41 = objc_claimAutoreleasedReturnValue();
    restrictedAccessRequest = v5->_restrictedAccessRequest;
    v5->_restrictedAccessRequest = (CPSRestrictedAccessRequest *)v41;

    objc_opt_self();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v43, CFSTR("storeAuthenticationRequest"));
    v44 = objc_claimAutoreleasedReturnValue();
    storeAuthenticationRequest = v5->_storeAuthenticationRequest;
    v5->_storeAuthenticationRequest = (CPSStoreAuthenticationRequest *)v44;

    objc_opt_self();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v46, CFSTR("tvProviderRequest"));
    v47 = objc_claimAutoreleasedReturnValue();
    tvProviderRequest = v5->_tvProviderRequest;
    v5->_tvProviderRequest = (CPSTVProviderRequest *)v47;

    objc_opt_self();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v49, CFSTR("learnMoreRequest"));
    v50 = objc_claimAutoreleasedReturnValue();
    learnMoreRequest = v5->_learnMoreRequest;
    v5->_learnMoreRequest = (CPSLearnMoreRequest *)v50;

    objc_opt_self();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v52, CFSTR("dedicatedCameraRequest"));
    v53 = objc_claimAutoreleasedReturnValue();
    dedicatedCameraRequest = v5->_dedicatedCameraRequest;
    v5->_dedicatedCameraRequest = (CPSDedicatedCameraRequest *)v53;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  id v5;

  deviceName = self->_deviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_delegatePurchaseRequest, CFSTR("delegatePurchaseRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentRequest, CFSTR("paymentRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentContext, CFSTR("paymentContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeAccount, CFSTR("storeAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemAuthenticationRequest, CFSTR("systemAuthenticationRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webAuthenticationRequest, CFSTR("webAuthenticationRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proxiedAppDomains, CFSTR("proxiedAppDomains"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharingData, CFSTR("sharingData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_restrictedAccessRequest, CFSTR("restrictedAccessRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_storeAuthenticationRequest, CFSTR("storeAuthenticationRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tvProviderRequest, CFSTR("tvProviderRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_learnMoreRequest, CFSTR("learnMoreRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dedicatedCameraRequest, CFSTR("dedicatedCameraRequest"));

}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AMSDelegatePurchaseRequest)delegatePurchaseRequest
{
  return self->_delegatePurchaseRequest;
}

- (void)setDelegatePurchaseRequest:(id)a3
{
  objc_storeStrong((id *)&self->_delegatePurchaseRequest, a3);
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_paymentRequest, a3);
}

- (NSDictionary)paymentContext
{
  return self->_paymentContext;
}

- (void)setPaymentContext:(id)a3
{
  objc_storeStrong((id *)&self->_paymentContext, a3);
}

- (ACAccount)storeAccount
{
  return self->_storeAccount;
}

- (void)setStoreAccount:(id)a3
{
  objc_storeStrong((id *)&self->_storeAccount, a3);
}

- (CPSSystemAuthenticationRequest)systemAuthenticationRequest
{
  return self->_systemAuthenticationRequest;
}

- (void)setSystemAuthenticationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_systemAuthenticationRequest, a3);
}

- (CPSWebRequest)webAuthenticationRequest
{
  return self->_webAuthenticationRequest;
}

- (void)setWebAuthenticationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_webAuthenticationRequest, a3);
}

- (NSArray)proxiedAppDomains
{
  return self->_proxiedAppDomains;
}

- (void)setProxiedAppDomains:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedAppDomains, a3);
}

- (NSData)sharingData
{
  return self->_sharingData;
}

- (void)setSharingData:(id)a3
{
  objc_storeStrong((id *)&self->_sharingData, a3);
}

- (CPSRestrictedAccessRequest)restrictedAccessRequest
{
  return self->_restrictedAccessRequest;
}

- (void)setRestrictedAccessRequest:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedAccessRequest, a3);
}

- (CPSStoreAuthenticationRequest)storeAuthenticationRequest
{
  return self->_storeAuthenticationRequest;
}

- (void)setStoreAuthenticationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_storeAuthenticationRequest, a3);
}

- (CPSTVProviderRequest)tvProviderRequest
{
  return self->_tvProviderRequest;
}

- (void)setTvProviderRequest:(id)a3
{
  objc_storeStrong((id *)&self->_tvProviderRequest, a3);
}

- (CPSLearnMoreRequest)learnMoreRequest
{
  return self->_learnMoreRequest;
}

- (void)setLearnMoreRequest:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreRequest, a3);
}

- (CPSDedicatedCameraRequest)dedicatedCameraRequest
{
  return self->_dedicatedCameraRequest;
}

- (void)setDedicatedCameraRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dedicatedCameraRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dedicatedCameraRequest, 0);
  objc_storeStrong((id *)&self->_learnMoreRequest, 0);
  objc_storeStrong((id *)&self->_tvProviderRequest, 0);
  objc_storeStrong((id *)&self->_storeAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_restrictedAccessRequest, 0);
  objc_storeStrong((id *)&self->_sharingData, 0);
  objc_storeStrong((id *)&self->_proxiedAppDomains, 0);
  objc_storeStrong((id *)&self->_webAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_systemAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_storeAccount, 0);
  objc_storeStrong((id *)&self->_paymentContext, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_delegatePurchaseRequest, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
