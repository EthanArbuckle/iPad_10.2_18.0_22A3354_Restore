@implementation AMSPurchaseSIWA

- (AMSPurchaseSIWA)initWithPurchaseType:(int64_t)a3 buyParams:(id)a4
{
  AMSPurchaseSIWA *v4;
  void *v5;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)AMSPurchaseSIWA;
  v4 = -[AMSPurchase initWithPurchaseType:buyParams:](&v7, sel_initWithPurchaseType_buyParams_, a3, a4);
  if (v4)
  {
    v8 = CFSTR("shouldReturnIsAtbWithPaymentAuth");
    v9[0] = CFSTR("true");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPurchase setAdditionalHeaders:](v4, "setAdditionalHeaders:", v5);

  }
  return v4;
}

- (id)authenticationContextForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  -[AMSPurchaseSIWA authenticationContext](self, "authenticationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)AMSPurchaseSIWA;
    -[AMSPurchase authenticationContextForRequest:](&v16, sel_authenticationContextForRequest_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[AMSPurchaseSIWA appProvidedData](self, "appProvidedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appProvidedData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v14 = v13;

  objc_msgSend(v14, "addEntriesFromDictionary:", v9);
  objc_msgSend(v8, "setAppProvidedData:", v14);

  return v8;
}

- (id)appProvidedData
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("subscriptionTokenGen");
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AMSPurchaseSIWA;
  v4 = -[AMSPurchase copyWithZone:](&v15, sel_copyWithZone_, a3);
  -[AMSPurchaseSIWA bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[21];
  v4[21] = v6;

  -[AMSPurchaseSIWA serviceID](self, "serviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[22];
  v4[22] = v9;

  -[AMSPurchaseSIWA teamID](self, "teamID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[23];
  v4[23] = v12;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMSPurchaseSIWA;
  v4 = a3;
  -[AMSPurchase encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[AMSPurchaseSIWA authenticationContext](self, "authenticationContext", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("authenticationContext"));

  -[AMSPurchaseSIWA bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleID"));

  -[AMSPurchaseSIWA serviceID](self, "serviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serviceID"));

  -[AMSPurchaseSIWA teamID](self, "teamID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("teamID"));

}

- (AMSPurchaseSIWA)initWithCoder:(id)a3
{
  id v4;
  AMSPurchaseSIWA *v5;
  uint64_t v6;
  AKAppleIDAuthenticationContext *authenticationContext;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSString *serviceID;
  uint64_t v12;
  NSString *teamID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSPurchaseSIWA;
  v5 = -[AMSPurchase initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (AKAppleIDAuthenticationContext *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceID"));
    v10 = objc_claimAutoreleasedReturnValue();
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamID"));
    v12 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAppleIDAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationContext, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end
