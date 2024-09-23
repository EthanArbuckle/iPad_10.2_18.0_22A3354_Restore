@implementation CTCarrierSpaceAuthenticationContext

- (CTCarrierSpaceAuthenticationContext)init
{
  CTCarrierSpaceAuthenticationContext *v2;
  CTCarrierSpaceAuthenticationContext *v3;
  NSString *clientID;
  NSString *authURL;
  NSString *tokenURL;
  NSString *carrierName;
  NSString *iccid;
  NSString *scope;
  NSString *sourceApplicationAccountIdentifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CTCarrierSpaceAuthenticationContext;
  v2 = -[CTCarrierSpaceAuthenticationContext init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    clientID = v2->_clientID;
    v2->_clientID = 0;

    authURL = v3->_authURL;
    v3->_authURL = 0;

    tokenURL = v3->_tokenURL;
    v3->_tokenURL = 0;

    carrierName = v3->_carrierName;
    v3->_carrierName = 0;

    iccid = v3->_iccid;
    v3->_iccid = 0;

    scope = v3->_scope;
    v3->_scope = 0;

    v3->_supportsState = 0;
    sourceApplicationAccountIdentifier = v3->_sourceApplicationAccountIdentifier;
    v3->_sourceApplicationAccountIdentifier = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCarrierSpaceAuthenticationContext clientID](self, "clientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" clientID=%@"), v4);

  -[CTCarrierSpaceAuthenticationContext authURL](self, "authURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" authURL=%@"), v5);

  -[CTCarrierSpaceAuthenticationContext tokenURL](self, "tokenURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" tokenURL=%@"), v6);

  -[CTCarrierSpaceAuthenticationContext carrierName](self, "carrierName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" carrierName=%@"), v7);

  -[CTCarrierSpaceAuthenticationContext iccid](self, "iccid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" iccid=%@"), v8);

  -[CTCarrierSpaceAuthenticationContext scope](self, "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" scope=%@"), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsState=%d"), -[CTCarrierSpaceAuthenticationContext supportsState](self, "supportsState"));
  -[CTCarrierSpaceAuthenticationContext sourceApplicationAccountIdentifier](self, "sourceApplicationAccountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sourceApplicationAccountIdentifier=%@"), v10);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTCarrierSpaceAuthenticationContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  BOOL v16;
  char v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = (CTCarrierSpaceAuthenticationContext *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTCarrierSpaceAuthenticationContext clientID](self, "clientID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpaceAuthenticationContext clientID](v4, "clientID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v6))
      {
        -[CTCarrierSpaceAuthenticationContext authURL](self, "authURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceAuthenticationContext authURL](v4, "authURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", v8))
        {
          -[CTCarrierSpaceAuthenticationContext tokenURL](self, "tokenURL");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpaceAuthenticationContext tokenURL](v4, "tokenURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isEqualToString:", v10))
          {
            -[CTCarrierSpaceAuthenticationContext carrierName](self, "carrierName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[CTCarrierSpaceAuthenticationContext carrierName](v4, "carrierName");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "isEqualToString:", v12))
            {
              v23 = v11;
              -[CTCarrierSpaceAuthenticationContext iccid](self, "iccid");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[CTCarrierSpaceAuthenticationContext iccid](v4, "iccid");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v13;
              if (objc_msgSend(v13, "isEqualToString:"))
              {
                -[CTCarrierSpaceAuthenticationContext scope](self, "scope");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[CTCarrierSpaceAuthenticationContext scope](v4, "scope");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v14;
                if (objc_msgSend(v14, "isEqualToString:"))
                {
                  v15 = -[CTCarrierSpaceAuthenticationContext supportsState](self, "supportsState");
                  v16 = v15 == -[CTCarrierSpaceAuthenticationContext supportsState](v4, "supportsState");
                  v11 = v23;
                  if (v16)
                  {
                    -[CTCarrierSpaceAuthenticationContext sourceApplicationAccountIdentifier](self, "sourceApplicationAccountIdentifier");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    -[CTCarrierSpaceAuthenticationContext sourceApplicationAccountIdentifier](v4, "sourceApplicationAccountIdentifier");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = objc_msgSend(v20, "isEqualToString:", v19);

                  }
                  else
                  {
                    v17 = 0;
                  }
                }
                else
                {
                  v17 = 0;
                  v11 = v23;
                }

              }
              else
              {
                v17 = 0;
                v11 = v23;
              }

            }
            else
            {
              v17 = 0;
            }

          }
          else
          {
            v17 = 0;
          }

        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientID;
  id v5;

  clientID = self->_clientID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientID, CFSTR("client_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authURL, CFSTR("auth_url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokenURL, CFSTR("token_url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_carrierName, CFSTR("carrier_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iccid, CFSTR("iccid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scope, CFSTR("scope"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsState, CFSTR("supports_state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceApplicationAccountIdentifier, CFSTR("account_identifier"));

}

- (CTCarrierSpaceAuthenticationContext)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpaceAuthenticationContext *v5;
  uint64_t v6;
  NSString *clientID;
  uint64_t v8;
  NSString *authURL;
  uint64_t v10;
  NSString *tokenURL;
  uint64_t v12;
  NSString *carrierName;
  uint64_t v14;
  NSString *iccid;
  uint64_t v16;
  NSString *scope;
  uint64_t v18;
  NSString *sourceApplicationAccountIdentifier;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CTCarrierSpaceAuthenticationContext;
  v5 = -[CTCarrierSpaceAuthenticationContext init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("client_id"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auth_url"));
    v8 = objc_claimAutoreleasedReturnValue();
    authURL = v5->_authURL;
    v5->_authURL = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token_url"));
    v10 = objc_claimAutoreleasedReturnValue();
    tokenURL = v5->_tokenURL;
    v5->_tokenURL = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carrier_name"));
    v12 = objc_claimAutoreleasedReturnValue();
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v12;

    v5->_supportsState = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supports_state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iccid"));
    v14 = objc_claimAutoreleasedReturnValue();
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scope"));
    v16 = objc_claimAutoreleasedReturnValue();
    scope = v5->_scope;
    v5->_scope = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account_identifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    sourceApplicationAccountIdentifier = v5->_sourceApplicationAccountIdentifier;
    v5->_sourceApplicationAccountIdentifier = (NSString *)v18;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_storeStrong((id *)&self->_clientID, a3);
}

- (NSString)authURL
{
  return self->_authURL;
}

- (void)setAuthURL:(id)a3
{
  objc_storeStrong((id *)&self->_authURL, a3);
}

- (NSString)tokenURL
{
  return self->_tokenURL;
}

- (void)setTokenURL:(id)a3
{
  objc_storeStrong((id *)&self->_tokenURL, a3);
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_storeStrong((id *)&self->_carrierName, a3);
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
  objc_storeStrong((id *)&self->_iccid, a3);
}

- (NSString)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
  objc_storeStrong((id *)&self->_scope, a3);
}

- (BOOL)supportsState
{
  return self->_supportsState;
}

- (void)setSupportsState:(BOOL)a3
{
  self->_supportsState = a3;
}

- (NSString)sourceApplicationAccountIdentifier
{
  return self->_sourceApplicationAccountIdentifier;
}

- (void)setSourceApplicationAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceApplicationAccountIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplicationAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_tokenURL, 0);
  objc_storeStrong((id *)&self->_authURL, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
