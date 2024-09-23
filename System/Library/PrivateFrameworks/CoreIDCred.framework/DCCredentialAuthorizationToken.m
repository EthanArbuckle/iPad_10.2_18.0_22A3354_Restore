@implementation DCCredentialAuthorizationToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *credentialAuthorizationToken;
  id v5;

  credentialAuthorizationToken = self->_credentialAuthorizationToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", credentialAuthorizationToken, 0x24C307708);
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialPairingID, 0x24C307768);

}

- (DCCredentialAuthorizationToken)initWithCoder:(id)a3
{
  id v4;
  DCCredentialAuthorizationToken *v5;
  uint64_t v6;
  NSData *credentialAuthorizationToken;
  uint64_t v8;
  NSString *credentialPairingID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DCCredentialAuthorizationToken;
  v5 = -[DCCredentialAuthorizationToken init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307708);
    v6 = objc_claimAutoreleasedReturnValue();
    credentialAuthorizationToken = v5->_credentialAuthorizationToken;
    v5->_credentialAuthorizationToken = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307768);
    v8 = objc_claimAutoreleasedReturnValue();
    credentialPairingID = v5->_credentialPairingID;
    v5->_credentialPairingID = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DCCredentialAuthorizationToken authorizationToken = %@, pairingID = %@"), self->_credentialAuthorizationToken, self->_credentialPairingID);
}

- (DCCredentialAuthorizationToken)initWithCredentialAuthorizationToken:(id)a3 pairingID:(id)a4
{
  id v6;
  id v7;
  DCCredentialAuthorizationToken *v8;
  uint64_t v9;
  NSData *credentialAuthorizationToken;
  uint64_t v11;
  NSString *credentialPairingID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DCCredentialAuthorizationToken;
  v8 = -[DCCredentialAuthorizationToken init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    credentialAuthorizationToken = v8->_credentialAuthorizationToken;
    v8->_credentialAuthorizationToken = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    credentialPairingID = v8->_credentialPairingID;
    v8->_credentialPairingID = (NSString *)v11;

  }
  return v8;
}

- (NSData)credentialAuthorizationToken
{
  return self->_credentialAuthorizationToken;
}

- (NSString)credentialPairingID
{
  return self->_credentialPairingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialPairingID, 0);
  objc_storeStrong((id *)&self->_credentialAuthorizationToken, 0);
}

@end
