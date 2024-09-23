@implementation FMDPairingCheckCommandRequestInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[FMDPairingCheckCommandRequestInfo pairingCheckToken](self, "pairingCheckToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pairingCheckToken"));

  -[FMDPairingCheckCommandRequestInfo authNonce](self, "authNonce");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("authNonce"));

  -[FMDPairingCheckCommandRequestInfo accessoryType](self, "accessoryType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("accessoryType"));

  -[FMDPairingCheckCommandRequestInfo eraseKeyType](self, "eraseKeyType");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("eraseKeyType"));

}

- (FMDPairingCheckCommandRequestInfo)initWithCoder:(id)a3
{
  id v4;
  FMDPairingCheckCommandRequestInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDPairingCheckCommandRequestInfo;
  v5 = -[FMDPairingCheckCommandRequestInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingCheckToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingCheckCommandRequestInfo setPairingCheckToken:](v5, "setPairingCheckToken:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authNonce"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingCheckCommandRequestInfo setAuthNonce:](v5, "setAuthNonce:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingCheckCommandRequestInfo setAccessoryType:](v5, "setAccessoryType:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eraseKeyType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDPairingCheckCommandRequestInfo setEraseKeyType:](v5, "setEraseKeyType:", v9);

  }
  return v5;
}

- (NSString)pairingCheckToken
{
  return self->_pairingCheckToken;
}

- (void)setPairingCheckToken:(id)a3
{
  objc_storeStrong((id *)&self->_pairingCheckToken, a3);
}

- (NSString)authNonce
{
  return self->_authNonce;
}

- (void)setAuthNonce:(id)a3
{
  objc_storeStrong((id *)&self->_authNonce, a3);
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryType, a3);
}

- (NSString)eraseKeyType
{
  return self->_eraseKeyType;
}

- (void)setEraseKeyType:(id)a3
{
  objc_storeStrong((id *)&self->_eraseKeyType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eraseKeyType, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
  objc_storeStrong((id *)&self->_authNonce, 0);
  objc_storeStrong((id *)&self->_pairingCheckToken, 0);
}

@end
