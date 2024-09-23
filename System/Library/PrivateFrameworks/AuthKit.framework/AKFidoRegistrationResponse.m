@implementation AKFidoRegistrationResponse

- (AKFidoRegistrationResponse)initWithChallengeString:(id)a3 attestationsData:(id)a4 credentialID:(id)a5 clientData:(id)a6 relyingPartyIdentifier:(id)a7 credentialName:(id)a8 userIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AKFidoRegistrationResponse *v22;
  id v24;
  id v25;
  id v26;

  v26 = a3;
  v15 = a5;
  v16 = a6;
  v25 = a7;
  v24 = a8;
  v17 = a9;
  if (a4)
  {
    objc_msgSend(a4, "base64EncodedStringWithOptions:", 0);
    a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "base64EncodedStringWithOptions:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKFidoRegistrationResponse _sanitizeCredentialIDString:](AKFidoRegistrationResponse, "_sanitizeCredentialIDString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v17, 4);
  v22 = -[AKFidoRegistrationResponse initWithChallengeString:attestationsDataString:credentialIDString:clientDataString:relyingPartyIdentifier:credentialName:userIdentifier:](self, "initWithChallengeString:attestationsDataString:credentialIDString:clientDataString:relyingPartyIdentifier:credentialName:userIdentifier:", v26, a4, v19, v20, v25, v24, v21);

  return v22;
}

- (AKFidoRegistrationResponse)initWithChallengeString:(id)a3 attestationsDataString:(id)a4 credentialIDString:(id)a5 clientDataString:(id)a6 relyingPartyIdentifier:(id)a7 credentialName:(id)a8 userIdentifier:(id)a9
{
  id v16;
  id v17;
  AKFidoRegistrationResponse *v18;
  AKFidoRegistrationResponse *v19;
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
  v26.super_class = (Class)AKFidoRegistrationResponse;
  v18 = -[AKFidoRegistrationResponse init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_challenge, a3);
    objc_storeStrong((id *)&v19->_attestationsData, a4);
    objc_storeStrong((id *)&v19->_credentialID, a5);
    objc_storeStrong((id *)&v19->_clientData, a6);
    objc_storeStrong((id *)&v19->_relyingPartyIdentifier, a7);
    objc_storeStrong((id *)&v19->_credentialName, a8);
    objc_storeStrong((id *)&v19->_userIdentifier, a9);
  }

  return v19;
}

- (AKFidoRegistrationResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AKFidoRegistrationResponse *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_challenge"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_attestationsData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_credentialID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_relyingPartyIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_credentialName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AKFidoRegistrationResponse initWithChallengeString:attestationsDataString:credentialIDString:clientDataString:relyingPartyIdentifier:credentialName:userIdentifier:](self, "initWithChallengeString:attestationsDataString:credentialIDString:clientDataString:relyingPartyIdentifier:credentialName:userIdentifier:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *challenge;
  id v5;

  challenge = self->_challenge;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", challenge, CFSTR("_challenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestationsData, CFSTR("_attestationsData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialID, CFSTR("_credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientData, CFSTR("_clientData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("_relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialName, CFSTR("_credentialName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdentifier, CFSTR("_userIdentifier"));

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
  v5 = -[NSString copy](self->_challenge, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSString copy](self->_attestationsData, "copy");
  v8 = (void *)v4[6];
  v4[6] = v7;

  v9 = -[NSString copy](self->_credentialID, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = -[NSString copy](self->_clientData, "copy");
  v12 = (void *)v4[1];
  v4[1] = v11;

  v13 = -[NSString copy](self->_relyingPartyIdentifier, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = -[NSString copy](self->_credentialName, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = -[NSString copy](self->_userIdentifier, "copy");
  v18 = (void *)v4[3];
  v4[3] = v17;

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\tChallenge: %@, \n\tAttestationsData: %@, \n\tCredentialID: %@, \n\tClientData: %@, \n\tRelyingPartyIdentifier: %@, \n\tCredentialName: %@, \n\tUserIdentifier: %@, \n}>"), v5, self, self->_challenge, self->_attestationsData, self->_credentialID, self->_clientData, self->_relyingPartyIdentifier, self->_credentialName, self->_userIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_sanitizeCredentialIDString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("="), &stru_1E2E647A8, 2, objc_msgSend(v3, "length") - 2, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (NSString)attestationsData
{
  return self->_attestationsData;
}

- (NSString)credentialName
{
  return self->_credentialName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialName, 0);
  objc_storeStrong((id *)&self->_attestationsData, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
}

@end
