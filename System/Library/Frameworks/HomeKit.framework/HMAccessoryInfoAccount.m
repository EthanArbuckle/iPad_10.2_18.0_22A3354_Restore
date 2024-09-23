@implementation HMAccessoryInfoAccount

- (HMAccessoryInfoAccount)initWithUsername:(id)a3 aaAltDSID:(id)a4 amsAltDSID:(id)a5 signedIn:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  HMAccessoryInfoAccount *v14;
  HMAccessoryInfoAccount *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMAccessoryInfoAccount;
  v14 = -[HMAccessoryInfoAccount init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_username, a3);
    objc_storeStrong((id *)&v15->_aaAltDSID, a4);
    objc_storeStrong((id *)&v15->_amsAltDSID, a5);
    v15->_signedIn = a6;
  }

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMAccessoryInfoAccount username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoAccount signedIn](self, "signedIn");
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: username = %@, signedIn = %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)protoPayload
{
  HMAccessoryInfoProtoAccountInfoEvent *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(HMAccessoryInfoProtoAccountInfoEvent);
  -[HMAccessoryInfoAccount username](self, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoAccountInfoEvent setUsername:](v3, "setUsername:", v4);

  -[HMAccessoryInfoAccount aaAltDSID](self, "aaAltDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoAccountInfoEvent setAaAltDSID:](v3, "setAaAltDSID:", v5);

  -[HMAccessoryInfoAccount amsAltDSID](self, "amsAltDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoAccountInfoEvent setAmsAltDSID:](v3, "setAmsAltDSID:", v6);

  -[HMAccessoryInfoProtoAccountInfoEvent setSignedIn:](v3, "setSignedIn:", -[HMAccessoryInfoAccount signedIn](self, "signedIn"));
  return v3;
}

- (id)protoData
{
  void *v2;
  void *v3;

  -[HMAccessoryInfoAccount protoPayload](self, "protoPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMAccessoryInfoAccount)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMAccessoryInfoAccount *v9;

  v4 = a3;
  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aaAltDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "amsAltDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "signedIn");

  v9 = -[HMAccessoryInfoAccount initWithUsername:aaAltDSID:amsAltDSID:signedIn:](self, "initWithUsername:aaAltDSID:amsAltDSID:signedIn:", v5, v6, v7, v8);
  return v9;
}

- (HMAccessoryInfoAccount)initWithProtoData:(id)a3
{
  id v4;
  HMAccessoryInfoProtoAccountInfoEvent *v5;
  HMAccessoryInfoAccount *v6;

  v4 = a3;
  v5 = -[HMAccessoryInfoProtoAccountInfoEvent initWithData:]([HMAccessoryInfoProtoAccountInfoEvent alloc], "initWithData:", v4);

  v6 = -[HMAccessoryInfoAccount initWithProtoPayload:](self, "initWithProtoPayload:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryInfoAccount *v4;
  HMAccessoryInfoAccount *v5;
  HMAccessoryInfoAccount *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;

  v4 = (HMAccessoryInfoAccount *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMAccessoryInfoAccount username](self, "username");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryInfoAccount username](v6, "username");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (HMFEqualObjects())
      {
        -[HMAccessoryInfoAccount aaAltDSID](self, "aaAltDSID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAccessoryInfoAccount aaAltDSID](v6, "aaAltDSID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (HMFEqualObjects())
        {
          -[HMAccessoryInfoAccount amsAltDSID](self, "amsAltDSID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMAccessoryInfoAccount amsAltDSID](v6, "amsAltDSID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (HMFEqualObjects())
          {
            v13 = -[HMAccessoryInfoAccount signedIn](self, "signedIn");
            v14 = v13 ^ -[HMAccessoryInfoAccount signedIn](v6, "signedIn") ^ 1;
          }
          else
          {
            LOBYTE(v14) = 0;
          }

        }
        else
        {
          LOBYTE(v14) = 0;
        }

      }
      else
      {
        LOBYTE(v14) = 0;
      }

    }
    else
    {
      LOBYTE(v14) = 0;
    }

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMAccessoryInfoAccount username](self, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMAccessoryInfoAccount aaAltDSID](self, "aaAltDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMAccessoryInfoAccount amsAltDSID](self, "amsAltDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)aaAltDSID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)amsAltDSID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)signedIn
{
  return self->_signedIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsAltDSID, 0);
  objc_storeStrong((id *)&self->_aaAltDSID, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
