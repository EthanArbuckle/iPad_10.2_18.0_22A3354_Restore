@implementation CIDVUIProofingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  CIDVUIProofingConfiguration *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CIDVUIProofingConfiguration;
  v13 = a8;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  v17 = -[CIDVUIProofingConfiguration init](&v19, sel_init);
  -[CIDVUIProofingConfiguration setState:](v17, "setState:", v16, v19.receiver, v19.super_class);

  -[CIDVUIProofingConfiguration setCountry:](v17, "setCountry:", v15);
  -[CIDVUIProofingConfiguration setTarget:](v17, "setTarget:", a5);
  -[CIDVUIProofingConfiguration setStatus:](v17, "setStatus:", a6);
  -[CIDVUIProofingConfiguration setCredentialIdentifier:](v17, "setCredentialIdentifier:", v14);

  -[CIDVUIProofingConfiguration setProductIdentifier:](v17, "setProductIdentifier:", v13);
  return v17;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CIDVUIProofingConfiguration *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CIDVUIProofingConfiguration;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a4;
  v19 = a3;
  v20 = -[CIDVUIProofingConfiguration init](&v22, sel_init);
  -[CIDVUIProofingConfiguration setState:](v20, "setState:", v19, v22.receiver, v22.super_class);

  -[CIDVUIProofingConfiguration setCountry:](v20, "setCountry:", v18);
  -[CIDVUIProofingConfiguration setTarget:](v20, "setTarget:", a5);
  -[CIDVUIProofingConfiguration setStatus:](v20, "setStatus:", a6);
  -[CIDVUIProofingConfiguration setCredentialIdentifier:](v20, "setCredentialIdentifier:", v17);

  -[CIDVUIProofingConfiguration setProductIdentifier:](v20, "setProductIdentifier:", v16);
  -[CIDVUIProofingConfiguration setAccountKeyIdentifier:](v20, "setAccountKeyIdentifier:", v15);

  -[CIDVUIProofingConfiguration setIdType:](v20, "setIdType:", 0);
  return v20;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 learnMoreURL:(id)a10 extendedReviewURL:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CIDVUIProofingConfiguration *v23;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CIDVUIProofingConfiguration;
  v16 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a4;
  v22 = a3;
  v23 = -[CIDVUIProofingConfiguration init](&v26, sel_init);
  -[CIDVUIProofingConfiguration setState:](v23, "setState:", v22);

  -[CIDVUIProofingConfiguration setCountry:](v23, "setCountry:", v21);
  -[CIDVUIProofingConfiguration setTarget:](v23, "setTarget:", a5);
  -[CIDVUIProofingConfiguration setStatus:](v23, "setStatus:", a6);
  -[CIDVUIProofingConfiguration setCredentialIdentifier:](v23, "setCredentialIdentifier:", v20);

  -[CIDVUIProofingConfiguration setProductIdentifier:](v23, "setProductIdentifier:", v19);
  -[CIDVUIProofingConfiguration setAccountKeyIdentifier:](v23, "setAccountKeyIdentifier:", v18);

  -[CIDVUIProofingConfiguration setLearnMoreURL:](v23, "setLearnMoreURL:", v17);
  -[CIDVUIProofingConfiguration setExtendedReviewURL:](v23, "setExtendedReviewURL:", v16);

  return v23;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CIDVUIProofingConfiguration *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CIDVUIProofingConfiguration;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a4;
  v20 = a3;
  v21 = -[CIDVUIProofingConfiguration init](&v23, sel_init);
  -[CIDVUIProofingConfiguration setState:](v21, "setState:", v20, v23.receiver, v23.super_class);

  -[CIDVUIProofingConfiguration setCountry:](v21, "setCountry:", v19);
  -[CIDVUIProofingConfiguration setTarget:](v21, "setTarget:", a5);
  -[CIDVUIProofingConfiguration setStatus:](v21, "setStatus:", a6);
  -[CIDVUIProofingConfiguration setCredentialIdentifier:](v21, "setCredentialIdentifier:", v18);

  -[CIDVUIProofingConfiguration setProductIdentifier:](v21, "setProductIdentifier:", v17);
  -[CIDVUIProofingConfiguration setAccountKeyIdentifier:](v21, "setAccountKeyIdentifier:", v16);

  -[CIDVUIProofingConfiguration setIdType:](v21, "setIdType:", a10);
  return v21;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10 supplementalProvisioningData:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CIDVUIProofingConfiguration *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CIDVUIProofingConfiguration;
  v17 = a11;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a4;
  v22 = a3;
  v23 = -[CIDVUIProofingConfiguration init](&v25, sel_init);
  -[CIDVUIProofingConfiguration setState:](v23, "setState:", v22);

  -[CIDVUIProofingConfiguration setCountry:](v23, "setCountry:", v21);
  -[CIDVUIProofingConfiguration setTarget:](v23, "setTarget:", a5);
  -[CIDVUIProofingConfiguration setStatus:](v23, "setStatus:", a6);
  -[CIDVUIProofingConfiguration setCredentialIdentifier:](v23, "setCredentialIdentifier:", v20);

  -[CIDVUIProofingConfiguration setProductIdentifier:](v23, "setProductIdentifier:", v19);
  -[CIDVUIProofingConfiguration setAccountKeyIdentifier:](v23, "setAccountKeyIdentifier:", v18);

  -[CIDVUIProofingConfiguration setIdType:](v23, "setIdType:", a10);
  -[CIDVUIProofingConfiguration setSupplementalProvisioningData:](v23, "setSupplementalProvisioningData:", v17);

  return v23;
}

- (CIDVUIProofingConfiguration)initWithState:(id)a3 country:(id)a4 target:(int64_t)a5 status:(int64_t)a6 credentialIdentifier:(id)a7 productIdentifier:(id)a8 accountKeyIdentifier:(id)a9 idType:(int64_t)a10 extendedReviewURL:(id)a11 learnMoreURL:(id)a12 supplementalProvisioningData:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  CIDVUIProofingConfiguration *v25;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CIDVUIProofingConfiguration;
  v17 = a13;
  v18 = a12;
  v19 = a11;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a4;
  v24 = a3;
  v25 = -[CIDVUIProofingConfiguration init](&v29, sel_init);
  -[CIDVUIProofingConfiguration setState:](v25, "setState:", v24);

  -[CIDVUIProofingConfiguration setCountry:](v25, "setCountry:", v23);
  -[CIDVUIProofingConfiguration setTarget:](v25, "setTarget:", a5);
  -[CIDVUIProofingConfiguration setStatus:](v25, "setStatus:", a6);
  -[CIDVUIProofingConfiguration setCredentialIdentifier:](v25, "setCredentialIdentifier:", v22);

  -[CIDVUIProofingConfiguration setProductIdentifier:](v25, "setProductIdentifier:", v21);
  -[CIDVUIProofingConfiguration setAccountKeyIdentifier:](v25, "setAccountKeyIdentifier:", v20);

  -[CIDVUIProofingConfiguration setIdType:](v25, "setIdType:", a10);
  -[CIDVUIProofingConfiguration setExtendedReviewURL:](v25, "setExtendedReviewURL:", v19);

  -[CIDVUIProofingConfiguration setLearnMoreURL:](v25, "setLearnMoreURL:", v18);
  -[CIDVUIProofingConfiguration setSupplementalProvisioningData:](v25, "setSupplementalProvisioningData:", v17);

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[CIDVUIProofingConfiguration state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("state"));

  -[CIDVUIProofingConfiguration country](self, "country");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("country"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[CIDVUIProofingConfiguration target](self, "target"), CFSTR("target"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CIDVUIProofingConfiguration status](self, "status"), CFSTR("status"));
  -[CIDVUIProofingConfiguration credentialIdentifier](self, "credentialIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("credentialIdentifier"));

  -[CIDVUIProofingConfiguration productIdentifier](self, "productIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("productIdentifier"));

  -[CIDVUIProofingConfiguration accountKeyIdentifier](self, "accountKeyIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("accountKeyIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[CIDVUIProofingConfiguration idType](self, "idType"), CFSTR("idType"));
  -[CIDVUIProofingConfiguration learnMoreURL](self, "learnMoreURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("learnMoreURL"));

  -[CIDVUIProofingConfiguration extendedReviewURL](self, "extendedReviewURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("extendedReviewURL"));

  -[CIDVUIProofingConfiguration supplementalProvisioningData](self, "supplementalProvisioningData");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("supplementalProvisioningData"));

}

- (CIDVUIProofingConfiguration)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *state;
  NSString *v7;
  NSString *country;
  NSString *v9;
  NSString *credentialIdentifier;
  NSString *v11;
  NSString *productIdentifier;
  NSString *v13;
  NSString *accountKeyIdentifier;
  NSURL *v15;
  NSURL *learnMoreURL;
  NSURL *v17;
  NSURL *extendedReviewURL;
  NSData *v19;
  NSData *supplementalProvisioningData;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  self->_state = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("country"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  country = self->_country;
  self->_country = v7;

  self->_target = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("target"));
  self->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentifier"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  credentialIdentifier = self->_credentialIdentifier;
  self->_credentialIdentifier = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productIdentifier"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  productIdentifier = self->_productIdentifier;
  self->_productIdentifier = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountKeyIdentifier"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  accountKeyIdentifier = self->_accountKeyIdentifier;
  self->_accountKeyIdentifier = v13;

  self->_idType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("idType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("learnMoreURL"));
  v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  learnMoreURL = self->_learnMoreURL;
  self->_learnMoreURL = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extendedReviewURL"));
  v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
  extendedReviewURL = self->_extendedReviewURL;
  self->_extendedReviewURL = v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supplementalProvisioningData"));
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();

  supplementalProvisioningData = self->_supplementalProvisioningData;
  self->_supplementalProvisioningData = v19;

  return self;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (int64_t)target
{
  return self->_target;
}

- (void)setTarget:(int64_t)a3
{
  self->_target = a3;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifier, a3);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_productIdentifier, a3);
}

- (NSString)accountKeyIdentifier
{
  return self->_accountKeyIdentifier;
}

- (void)setAccountKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountKeyIdentifier, a3);
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreURL, a3);
}

- (NSURL)extendedReviewURL
{
  return self->_extendedReviewURL;
}

- (void)setExtendedReviewURL:(id)a3
{
  objc_storeStrong((id *)&self->_extendedReviewURL, a3);
}

- (int64_t)idType
{
  return self->_idType;
}

- (void)setIdType:(int64_t)a3
{
  self->_idType = a3;
}

- (NSData)supplementalProvisioningData
{
  return self->_supplementalProvisioningData;
}

- (void)setSupplementalProvisioningData:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalProvisioningData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalProvisioningData, 0);
  objc_storeStrong((id *)&self->_extendedReviewURL, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_accountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
