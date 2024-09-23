@implementation AKAppleIDPasskeyCredentialRequestContext

- (AKAppleIDPasskeyCredentialRequestContext)initWithRelyingPartyIdentifier:(id)a3 challenge:(id)a4 originalChallenge:(id)a5 userID:(id)a6 credentialName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  AKAppleIDPasskeyCredentialRequestContext *v17;
  AKAppleIDPasskeyCredentialRequestContext *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)AKAppleIDPasskeyCredentialRequestContext;
  v17 = -[AKAppleIDPasskeyCredentialRequestContext init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_relyingPartyIdentifier, a3);
    objc_storeStrong((id *)&v18->_challenge, a4);
    objc_storeStrong((id *)&v18->_originalChallenge, a5);
    objc_storeStrong((id *)&v18->_userID, a6);
    objc_storeStrong((id *)&v18->_credentialName, a7);
  }

  return v18;
}

- (AKAppleIDPasskeyCredentialRequestContext)initWithRelyingPartyIdentifier:(id)a3 challengeString:(id)a4 userIDString:(id)a5 credentialName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  AKAppleIDPasskeyCredentialRequestContext *v17;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[AKAppleIDPasskeyCredentialRequestContext _sanitizeBase64EncodedString:](self, "_sanitizeBase64EncodedString:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v14, 4);
  if (!v15)
  {
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[AKAppleIDPasskeyCredentialRequestContext initWithRelyingPartyIdentifier:challenge:originalChallenge:userID:credentialName:](self, "initWithRelyingPartyIdentifier:challenge:originalChallenge:userID:credentialName:", v13, v15, v12, v16, v11);

  return v17;
}

- (AKAppleIDPasskeyCredentialRequestContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AKAppleIDPasskeyCredentialRequestContext *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_relyingPartyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_challenge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalChallenge"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_credentialName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AKAppleIDPasskeyCredentialRequestContext initWithRelyingPartyIdentifier:challenge:originalChallenge:userID:credentialName:](self, "initWithRelyingPartyIdentifier:challenge:originalChallenge:userID:credentialName:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *relyingPartyIdentifier;
  id v5;

  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relyingPartyIdentifier, CFSTR("_relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_challenge, CFSTR("_challenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_challenge, CFSTR("_originalChallenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userID, CFSTR("_userID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialName, CFSTR("_credentialName"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_relyingPartyIdentifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSData copy](self->_challenge, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_originalChallenge, "copy");
  v10 = (void *)v4[5];
  v4[5] = v9;

  v11 = -[NSData copy](self->_userID, "copy");
  v12 = (void *)v4[3];
  v4[3] = v11;

  v13 = -[NSString copy](self->_credentialName, "copy");
  v14 = (void *)v4[4];
  v4[4] = v13;

  return v4;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\trelyingPartyIdentifier: %@, \n\tchallenge: %@, \n\toriginalChallenge: %@, \n\tuserID: %@, \n\tcredentialName: %@, \n}>"), v5, self, self->_relyingPartyIdentifier, self->_challenge, self->_originalChallenge, self->_userID, self->_credentialName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_sanitizeBase64EncodedString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "length") & 3) != 0)
  {
    do
    {
      objc_msgSend(v4, "stringByAppendingString:", CFSTR("="));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v5;
    }
    while ((objc_msgSend(v5, "length") & 3) != 0);
  }
  else
  {
    v5 = v4;
  }
  return v5;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)credentialName
{
  return self->_credentialName;
}

- (void)setCredentialName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)originalChallenge
{
  return self->_originalChallenge;
}

- (void)setOriginalChallenge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalChallenge, 0);
  objc_storeStrong((id *)&self->_credentialName, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end
