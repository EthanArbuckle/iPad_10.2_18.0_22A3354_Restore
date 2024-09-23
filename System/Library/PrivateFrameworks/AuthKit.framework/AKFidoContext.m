@implementation AKFidoContext

- (AKFidoContext)initWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AKFidoContext *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("challenge"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aaf_base64Padded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rpid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("credentialIds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AKFidoContext initWithChallengeString:relyingPartyIdentifier:userIdentifierString:displayName:credentialName:credentials:](self, "initWithChallengeString:relyingPartyIdentifier:userIdentifierString:displayName:credentialName:credentials:", v6, v7, 0, 0, 0, v8);
  return v9;
}

- (AKFidoContext)initWithChallengeString:(id)a3 relyingPartyIdentifier:(id)a4 userIdentifierString:(id)a5 displayName:(id)a6 credentialName:(id)a7 credentials:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  AKFidoContext *v23;

  v14 = a3;
  v15 = a5;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a4;
  objc_msgSend(v14, "aaf_base64Padded");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v20, 0);
  if (!v21)
  {
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "dataUsingEncoding:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[AKFidoContext initWithChallenge:relyingPartyIdentifier:userIdentifier:displayName:credentialName:credentials:](self, "initWithChallenge:relyingPartyIdentifier:userIdentifier:displayName:credentialName:credentials:", v21, v19, v22, v18, v17, v16);

  if (v23)
    objc_storeStrong((id *)&v23->_originalChallenge, a3);

  return v23;
}

- (AKFidoContext)initWithChallenge:(id)a3 relyingPartyIdentifier:(id)a4 userIdentifier:(id)a5 displayName:(id)a6 credentialName:(id)a7 credentials:(id)a8
{
  id v15;
  id v16;
  id v17;
  AKFidoContext *v18;
  AKFidoContext *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AKFidoContext;
  v18 = -[AKFidoContext init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_challenge, a3);
    objc_storeStrong((id *)&v19->_userIdentifier, a5);
    objc_storeStrong((id *)&v19->_relyingPartyIdentifier, a4);
    objc_storeStrong((id *)&v19->_displayName, a6);
    objc_storeStrong((id *)&v19->_credentialName, a7);
    objc_storeStrong((id *)&v19->_credentials, a8);
  }

  return v19;
}

- (AKFidoContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AKFidoContext *v14;
  uint64_t v15;
  NSString *originalChallenge;
  uint64_t v17;
  NSString *promptTitle;
  uint64_t v19;
  NSString *promptHeader;
  uint64_t v21;
  NSString *promptBody;
  uint64_t v23;
  NSString *incorrectKeyPresentedMessage;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_relyingPartyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_challenge"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_credentialName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_credentials"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AKFidoContext initWithChallenge:relyingPartyIdentifier:userIdentifier:displayName:credentialName:credentials:](self, "initWithChallenge:relyingPartyIdentifier:userIdentifier:displayName:credentialName:credentials:", v6, v5, v7, v8, v9, v13);
  if (v14)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalChallenge"));
    v15 = objc_claimAutoreleasedReturnValue();
    originalChallenge = v14->_originalChallenge;
    v14->_originalChallenge = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_promptTitle"));
    v17 = objc_claimAutoreleasedReturnValue();
    promptTitle = v14->_promptTitle;
    v14->_promptTitle = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_promptHeader"));
    v19 = objc_claimAutoreleasedReturnValue();
    promptHeader = v14->_promptHeader;
    v14->_promptHeader = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_promptBody"));
    v21 = objc_claimAutoreleasedReturnValue();
    promptBody = v14->_promptBody;
    v14->_promptBody = (NSString *)v21;

    v14->_useAlternativeKeysIcon = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_useAlternativeKeysIcon"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_incorrectKeyPresentedMessage"));
    v23 = objc_claimAutoreleasedReturnValue();
    incorrectKeyPresentedMessage = v14->_incorrectKeyPresentedMessage;
    v14->_incorrectKeyPresentedMessage = (NSString *)v23;

  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *relyingPartyIdentifier;
  id v5;

  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relyingPartyIdentifier, CFSTR("_relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_challenge, CFSTR("_challenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalChallenge, CFSTR("_originalChallenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdentifier, CFSTR("_userIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("_displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialName, CFSTR("_credentialName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentials, CFSTR("_credentials"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_promptTitle, CFSTR("_promptTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_promptHeader, CFSTR("_promptHeader"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_promptBody, CFSTR("_promptBody"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useAlternativeKeysIcon, CFSTR("_useAlternativeKeysIcon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_incorrectKeyPresentedMessage, CFSTR("_incorrectKeyPresentedMessage"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_relyingPartyIdentifier, "copy");
  v6 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v5;

  v7 = -[NSData copy](self->_challenge, "copy");
  v8 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = v7;

  v9 = -[NSString copy](self->_originalChallenge, "copy");
  v10 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v9;

  v11 = -[NSData copy](self->_userIdentifier, "copy");
  v12 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v11;

  v13 = -[NSString copy](self->_displayName, "copy");
  v14 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v13;

  v15 = -[NSString copy](self->_credentialName, "copy");
  v16 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v15;

  v17 = -[NSArray copy](self->_credentials, "copy");
  v18 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v17;

  v19 = -[NSString copy](self->_promptTitle, "copy");
  v20 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v19;

  v21 = -[NSString copy](self->_promptHeader, "copy");
  v22 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v21;

  v23 = -[NSString copy](self->_promptBody, "copy");
  v24 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v23;

  *((_BYTE *)v4 + 8) = self->_useAlternativeKeysIcon;
  objc_storeStrong((id *)v4 + 12, self->_incorrectKeyPresentedMessage);
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\tRelyingPartyIdentifier: %@, \n\tChallenge: %@, \n\tOriginal Challenge: %@, \n\tUserIdentifier: %@, \n\tDisplayName: %@, \n\tCredentialName: %@, \n\tCredentials: %@, \n\tPromptTitle: %@, \n\tPromptHeader: %@, \n\tPromptBody: %@, \n\tIncorrectKeyPresentedMessage: %@, \n}>"), v5, self, self->_relyingPartyIdentifier, self->_challenge, self->_originalChallenge, self->_userIdentifier, self->_displayName, self->_credentialName, self->_credentials, self->_promptTitle, self->_promptHeader, self->_promptBody, self->_incorrectKeyPresentedMessage);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (NSString)originalChallenge
{
  return self->_originalChallenge;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)credentialName
{
  return self->_credentialName;
}

- (NSArray)credentials
{
  return self->_credentials;
}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (void)setPromptTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)promptHeader
{
  return self->_promptHeader;
}

- (void)setPromptHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)promptBody
{
  return self->_promptBody;
}

- (void)setPromptBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)incorrectKeyPresentedMessage
{
  return self->_incorrectKeyPresentedMessage;
}

- (void)setIncorrectKeyPresentedMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)useAlternativeKeysIcon
{
  return self->_useAlternativeKeysIcon;
}

- (void)setUseAlternativeKeysIcon:(BOOL)a3
{
  self->_useAlternativeKeysIcon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incorrectKeyPresentedMessage, 0);
  objc_storeStrong((id *)&self->_promptBody, 0);
  objc_storeStrong((id *)&self->_promptHeader, 0);
  objc_storeStrong((id *)&self->_promptTitle, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_credentialName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_originalChallenge, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end
