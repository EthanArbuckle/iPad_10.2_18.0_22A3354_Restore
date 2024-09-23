@implementation PolicyResponse

- (PolicyResponse)initWithTermsOfService:(id)a3 privacyPolicyText:(id)a4 privacyPolicyURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  PolicyResponse *v12;
  PolicyResponse *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PolicyResponse;
  v12 = -[PolicyResponse init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_termsOfService, a3);
    objc_storeStrong((id *)&v13->_privacyPolicyText, a4);
    objc_storeStrong((id *)&v13->_privacyPolicyURL, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PolicyResponse termsOfService](self, "termsOfService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("termsOfService"));

  -[PolicyResponse privacyPolicyText](self, "privacyPolicyText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("privacyPolicyText"));

  -[PolicyResponse privacyPolicyURL](self, "privacyPolicyURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("privacyPolicyURL"));

}

- (PolicyResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PolicyResponse *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsOfService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyPolicyText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyPolicyURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PolicyResponse initWithTermsOfService:privacyPolicyText:privacyPolicyURL:](self, "initWithTermsOfService:privacyPolicyText:privacyPolicyURL:", v5, v6, v7);
  return v8;
}

- (NSString)termsOfService
{
  return self->_termsOfService;
}

- (NSString)privacyPolicyText
{
  return self->_privacyPolicyText;
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_privacyPolicyText, 0);
  objc_storeStrong((id *)&self->_termsOfService, 0);
}

@end
