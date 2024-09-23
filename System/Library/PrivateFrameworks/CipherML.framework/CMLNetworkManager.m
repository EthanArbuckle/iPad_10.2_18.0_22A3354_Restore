@implementation CMLNetworkManager

- (CMLNetworkManager)initWithType:(int64_t)a3
{
  return -[CMLNetworkManager initWithType:endpoint:issuer:authenticationToken:](self, "initWithType:endpoint:issuer:authenticationToken:", a3, 0, 0, 0);
}

- (CMLNetworkManager)initWithType:(int64_t)a3 endpoint:(id)a4 issuer:(id)a5 authenticationToken:(id)a6
{
  return -[CMLNetworkManager initWithType:endpoint:issuer:authenticationToken:privacyProxyFailOpen:](self, "initWithType:endpoint:issuer:authenticationToken:privacyProxyFailOpen:", a3, a4, a5, a6, 0);
}

- (CMLNetworkManager)initWithType:(int64_t)a3 endpoint:(id)a4 issuer:(id)a5 authenticationToken:(id)a6 privacyProxyFailOpen:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  CMLNetworkManager *v15;
  CMLNetworkManager *v16;
  uint64_t v17;
  NSURL *endpoint;
  uint64_t v19;
  NSURL *issuer;
  uint64_t v21;
  NSData *authenticationToken;
  objc_super v24;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CMLNetworkManager;
  v15 = -[CMLNetworkManager init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    v17 = objc_msgSend(v12, "copy");
    endpoint = v16->_endpoint;
    v16->_endpoint = (NSURL *)v17;

    v19 = objc_msgSend(v13, "copy");
    issuer = v16->_issuer;
    v16->_issuer = (NSURL *)v19;

    v21 = objc_msgSend(v14, "copy");
    authenticationToken = v16->_authenticationToken;
    v16->_authenticationToken = (NSData *)v21;

    v16->_privacyProxyFailOpen = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  CMLNetworkManager *v4;
  CMLNetworkManager *v5;
  BOOL v6;

  v4 = (CMLNetworkManager *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CMLNetworkManager isEqualToNetworkManager:](self, "isEqualToNetworkManager:", v5);

  return v6;
}

- (BOOL)isEqualToNetworkManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;
  char v23;
  int64_t v24;
  int v25;
  char v26;

  v4 = a3;
  -[CMLNetworkManager endpoint](self, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v10 = 0;
  }
  else
  {
    -[CMLNetworkManager endpoint](self, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    v10 = v9 ^ 1;
  }

  -[CMLNetworkManager issuer](self, "issuer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "issuer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == v12)
  {
    v16 = 0;
  }
  else
  {
    -[CMLNetworkManager issuer](self, "issuer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "issuer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    v16 = v15 ^ 1;
  }

  -[CMLNetworkManager authenticationToken](self, "authenticationToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticationToken");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v18)
  {
    v21 = 1;
  }
  else
  {
    -[CMLNetworkManager authenticationToken](self, "authenticationToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authenticationToken");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

  }
  v22 = -[CMLNetworkManager privacyProxyFailOpen](self, "privacyProxyFailOpen");
  v23 = objc_msgSend(v4, "privacyProxyFailOpen");
  v24 = -[CMLNetworkManager type](self, "type");
  if (v24 == objc_msgSend(v4, "type"))
    v25 = v10;
  else
    v25 = 1;
  if (((v25 | v16) & 1) != 0)
    v26 = 0;
  else
    v26 = v21 & (v22 ^ v23 ^ 1);

  return v26;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CMLNetworkManager type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CMLNetworkManager endpoint](self, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[CMLNetworkManager issuer](self, "issuer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  -[CMLNetworkManager authenticationToken](self, "authenticationToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  v11 = v10 ^ -[CMLNetworkManager privacyProxyFailOpen](self, "privacyProxyFailOpen") ^ v4;

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLNetworkManager)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CMLNetworkManager *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticationToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("privacyProxyFailOpen"));

  v10 = -[CMLNetworkManager initWithType:endpoint:issuer:authenticationToken:privacyProxyFailOpen:](self, "initWithType:endpoint:issuer:authenticationToken:privacyProxyFailOpen:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[CMLNetworkManager type](self, "type"), CFSTR("type"));
  -[CMLNetworkManager endpoint](self, "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("endpoint"));

  -[CMLNetworkManager issuer](self, "issuer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("issuer"));

  -[CMLNetworkManager authenticationToken](self, "authenticationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("authenticationToken"));

  objc_msgSend(v7, "encodeBool:forKey:", -[CMLNetworkManager privacyProxyFailOpen](self, "privacyProxyFailOpen"), CFSTR("privacyProxyFailOpen"));
}

- (int64_t)type
{
  return self->_type;
}

- (NSURL)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)privacyProxyFailOpen
{
  return self->_privacyProxyFailOpen;
}

- (void)setPrivacyProxyFailOpen:(BOOL)a3
{
  self->_privacyProxyFailOpen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
