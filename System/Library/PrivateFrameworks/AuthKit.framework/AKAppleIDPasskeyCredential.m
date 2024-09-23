@implementation AKAppleIDPasskeyCredential

- (AKAppleIDPasskeyCredential)initWithRelyingPartyIdentifier:(id)a3 attestationDataString:(id)a4 clientDataString:(id)a5 credentialIDString:(id)a6 userIDString:(id)a7 originalChallengeString:(id)a8 credentialName:(id)a9
{
  id v16;
  id v17;
  AKAppleIDPasskeyCredential *v18;
  AKAppleIDPasskeyCredential *v19;
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
  v26.super_class = (Class)AKAppleIDPasskeyCredential;
  v18 = -[AKAppleIDPasskeyCredential init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_relyingPartyIdentifier, a3);
    objc_storeStrong((id *)&v19->_attestationDataString, a4);
    objc_storeStrong((id *)&v19->_clientDataString, a5);
    objc_storeStrong((id *)&v19->_credentialIDString, a6);
    objc_storeStrong((id *)&v19->_userIDString, a7);
    objc_storeStrong((id *)&v19->_originalChallengeString, a8);
    objc_storeStrong((id *)&v19->_credentialName, a9);
  }

  return v19;
}

- (AKAppleIDPasskeyCredential)initWithRelyingPartyIdentifier:(id)a3 attestationData:(id)a4 clientData:(id)a5 credentialID:(id)a6 originalChallenge:(id)a7 userID:(id)a8 credentialName:(id)a9
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
  AKAppleIDPasskeyCredential *v25;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  objc_msgSend(a4, "base64EncodedStringWithOptions:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "base64EncodedStringWithOptions:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4);
  v25 = -[AKAppleIDPasskeyCredential initWithRelyingPartyIdentifier:attestationDataString:clientDataString:credentialIDString:userIDString:originalChallengeString:credentialName:](self, "initWithRelyingPartyIdentifier:attestationDataString:clientDataString:credentialIDString:userIDString:originalChallengeString:credentialName:", v20, v21, v22, v23, v24, v17, v15);

  return v25;
}

- (AKAppleIDPasskeyCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  AKAppleIDPasskeyCredential *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_relyingPartyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_attestationDataString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientDataString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_credentialIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userIDString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalChallengeString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_credentialName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[AKAppleIDPasskeyCredential initWithRelyingPartyIdentifier:attestationDataString:clientDataString:credentialIDString:userIDString:originalChallengeString:credentialName:](self, "initWithRelyingPartyIdentifier:attestationDataString:clientDataString:credentialIDString:userIDString:originalChallengeString:credentialName:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *relyingPartyIdentifier;
  id v5;

  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relyingPartyIdentifier, CFSTR("_relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestationDataString, CFSTR("_attestationDataString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientDataString, CFSTR("_clientDataString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIDString, CFSTR("_credentialIDString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIDString, CFSTR("_userIDString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalChallengeString, CFSTR("_originalChallengeString"));
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_relyingPartyIdentifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_attestationDataString, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_clientDataString, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSString copy](self->_credentialIDString, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSString copy](self->_userIDString, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = -[NSString copy](self->_originalChallengeString, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  v17 = -[NSString copy](self->_credentialName, "copy");
  v18 = (void *)v4[7];
  v4[7] = v17;

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\trelyingPartyIdentifier: %@, \n\tattestationDataString: %@, \n\tclientDataString: %@, \n\tcredentialIDString: %@, \n\tuserIDString: %@, \n\toriginalChallengeString: %@, \n\tcredentialName: %@, \n}>"), v5, self, self->_relyingPartyIdentifier, self->_attestationDataString, self->_clientDataString, self->_credentialIDString, self->_userIDString, self->_originalChallengeString, self->_credentialIDString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)attestationDataString
{
  return self->_attestationDataString;
}

- (void)setAttestationDataString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)clientDataString
{
  return self->_clientDataString;
}

- (void)setClientDataString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)credentialIDString
{
  return self->_credentialIDString;
}

- (void)setCredentialIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)userIDString
{
  return self->_userIDString;
}

- (void)setUserIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)originalChallengeString
{
  return self->_originalChallengeString;
}

- (void)setOriginalChallengeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)credentialName
{
  return self->_credentialName;
}

- (void)setCredentialName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialName, 0);
  objc_storeStrong((id *)&self->_originalChallengeString, 0);
  objc_storeStrong((id *)&self->_userIDString, 0);
  objc_storeStrong((id *)&self->_credentialIDString, 0);
  objc_storeStrong((id *)&self->_clientDataString, 0);
  objc_storeStrong((id *)&self->_attestationDataString, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end
