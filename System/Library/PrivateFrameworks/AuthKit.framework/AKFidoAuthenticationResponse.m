@implementation AKFidoAuthenticationResponse

- (AKFidoAuthenticationResponse)initWithAuthenticatorData:(id)a3 challengeString:(id)a4 relyingPartyIdentifier:(id)a5 signature:(id)a6 clientData:(id)a7 credentialID:(id)a8 userIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  AKFidoAuthenticationResponse *v26;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v15, 4);
  v26 = -[AKFidoAuthenticationResponse initWithAuthenticatorDataString:challengeString:relyingPartyIdentifier:signature:clientDataString:credentialID:userIdentifier:](self, "initWithAuthenticatorDataString:challengeString:relyingPartyIdentifier:signature:clientDataString:credentialID:userIdentifier:", v21, v20, v19, v22, v24, v23, v25);

  return v26;
}

- (AKFidoAuthenticationResponse)initWithAuthenticatorDataString:(id)a3 challengeString:(id)a4 relyingPartyIdentifier:(id)a5 signature:(id)a6 clientDataString:(id)a7 credentialID:(id)a8 userIdentifier:(id)a9
{
  id v16;
  id v17;
  AKFidoAuthenticationResponse *v18;
  AKFidoAuthenticationResponse *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)AKFidoAuthenticationResponse;
  v18 = -[AKFidoAuthenticationResponse init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_authenticatorData, a3);
    objc_storeStrong((id *)&v19->_signature, a6);
    objc_storeStrong((id *)&v19->_clientData, a7);
    objc_storeStrong((id *)&v19->_credentialID, a8);
    objc_storeStrong((id *)&v19->_userIdentifier, a9);
    objc_storeStrong((id *)&v19->_challenge, a4);
    objc_storeStrong((id *)&v19->_relyingPartyIdentifier, a5);
  }

  return v19;
}

- (AKFidoAuthenticationResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AKFidoAuthenticationResponse *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_authenticatorData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_signature"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_credentialName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_challenge"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_relyingPartyIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AKFidoAuthenticationResponse initWithAuthenticatorDataString:challengeString:relyingPartyIdentifier:signature:clientDataString:credentialID:userIdentifier:](self, "initWithAuthenticatorDataString:challengeString:relyingPartyIdentifier:signature:clientDataString:credentialID:userIdentifier:", v5, v10, v11, v6, v8, v7, v9);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *authenticatorData;
  id v5;

  authenticatorData = self->_authenticatorData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", authenticatorData, CFSTR("_authenticatorData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("_signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialID, CFSTR("_credentialName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientData, CFSTR("_clientData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdentifier, CFSTR("_userIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_challenge, CFSTR("_challenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("_relyingPartyIdentifier"));

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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_authenticatorData, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[NSString copy](self->_signature, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_credentialID, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = -[NSString copy](self->_clientData, "copy");
  v12 = (void *)v4[1];
  v4[1] = v11;

  v13 = -[NSString copy](self->_userIdentifier, "copy");
  v14 = (void *)v4[3];
  v4[3] = v13;

  v15 = -[NSString copy](self->_challenge, "copy");
  v16 = (void *)v4[4];
  v4[4] = v15;

  v17 = -[NSString copy](self->_relyingPartyIdentifier, "copy");
  v18 = (void *)v4[5];
  v4[5] = v17;

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\tAuthenticatorData: %@, \n\tSignature: %@, \n\tCredentialID: %@, \n\tClientData: %@, \n\tUserIdentifier: %@, \n\tChallenge: %@, \n\tRelyingPartyIdentifier: %@, \n}>"), v5, self, self->_authenticatorData, self->_signature, self->_credentialID, self->_clientData, self->_userIdentifier, self->_challenge, self->_relyingPartyIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)clientData
{
  return self->_clientData;
}

- (NSString)credentialID
{
  return self->_credentialID;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)challenge
{
  return self->_challenge;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSString)authenticatorData
{
  return self->_authenticatorData;
}

- (NSString)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authenticatorData, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
}

@end
