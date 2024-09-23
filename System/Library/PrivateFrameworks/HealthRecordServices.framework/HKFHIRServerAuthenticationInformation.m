@implementation HKFHIRServerAuthenticationInformation

- (HKFHIRServerAuthenticationInformation)initWithClientID:(id)a3 clientSecret:(id)a4 PKCEAlgorithm:(int64_t)a5
{
  id v8;
  id v9;
  HKFHIRServerAuthenticationInformation *v10;
  uint64_t v11;
  NSString *clientID;
  uint64_t v13;
  NSString *clientSecret;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKFHIRServerAuthenticationInformation;
  v10 = -[HKFHIRServerAuthenticationInformation init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    clientID = v10->_clientID;
    v10->_clientID = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    clientSecret = v10->_clientSecret;
    v10->_clientSecret = (NSString *)v13;

    v10->_PKCEAlgorithm = a5;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKFHIRServerAuthenticationInformation *v5;
  HKFHIRServerAuthenticationInformation *v6;
  HKFHIRServerAuthenticationInformation *v7;
  NSString *clientID;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  BOOL v13;
  NSString *clientSecret;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  void *v20;
  int64_t v21;
  int64_t PKCEAlgorithm;
  void *v24;

  v5 = (HKFHIRServerAuthenticationInformation *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
    clientID = self->_clientID;
    -[HKFHIRServerAuthenticationInformation clientID](v7, "clientID");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (clientID != v9)
    {
      -[HKFHIRServerAuthenticationInformation clientID](v7, "clientID");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v13 = 0;
        goto LABEL_20;
      }
      v3 = (void *)v10;
      v11 = self->_clientID;
      -[HKFHIRServerAuthenticationInformation clientID](v7, "clientID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v11, "isEqualToString:", v12))
      {
        v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v24 = v12;
    }
    clientSecret = self->_clientSecret;
    -[HKFHIRServerAuthenticationInformation clientSecret](v7, "clientSecret");
    v15 = objc_claimAutoreleasedReturnValue();
    if (clientSecret == (NSString *)v15)
    {
      PKCEAlgorithm = self->_PKCEAlgorithm;
      v13 = PKCEAlgorithm == -[HKFHIRServerAuthenticationInformation PKCEAlgorithm](v7, "PKCEAlgorithm");

    }
    else
    {
      v16 = (void *)v15;
      -[HKFHIRServerAuthenticationInformation clientSecret](v7, "clientSecret");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = self->_clientSecret;
        -[HKFHIRServerAuthenticationInformation clientSecret](v7, "clientSecret");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](v19, "isEqualToString:", v20))
        {
          v21 = self->_PKCEAlgorithm;
          v13 = v21 == -[HKFHIRServerAuthenticationInformation PKCEAlgorithm](v7, "PKCEAlgorithm");

          goto LABEL_18;
        }

      }
      v13 = 0;
    }
LABEL_18:
    v12 = v24;
    if (clientID != v9)
      goto LABEL_19;
LABEL_20:

    goto LABEL_21;
  }
  v13 = 1;
LABEL_22:

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *clientID;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  clientID = self->_clientID;
  HKStringFromBool();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = self->_PKCEAlgorithm - 1;
  if (v9 > 2)
    v10 = CFSTR("none");
  else
    v10 = off_24D549B90[v9];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, client ID: %@, has client secret: %@, PKCE: %@>"), v5, self, clientID, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientID;
  id v5;

  clientID = self->_clientID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientID, CFSTR("clientID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientSecret, CFSTR("clientSecret"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_PKCEAlgorithm, CFSTR("PKCEAlgorithm"));

}

- (HKFHIRServerAuthenticationInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HKFHIRServerAuthenticationInformation *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientSecret"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PKCEAlgorithm"));

  v8 = -[HKFHIRServerAuthenticationInformation initWithClientID:clientSecret:PKCEAlgorithm:](self, "initWithClientID:clientSecret:PKCEAlgorithm:", v5, v6, v7);
  return v8;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientSecret
{
  return self->_clientSecret;
}

- (int64_t)PKCEAlgorithm
{
  return self->_PKCEAlgorithm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSecret, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
