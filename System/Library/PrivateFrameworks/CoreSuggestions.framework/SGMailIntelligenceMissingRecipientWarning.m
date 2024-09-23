@implementation SGMailIntelligenceMissingRecipientWarning

- (SGMailIntelligenceMissingRecipientWarning)initWithSnippet:(id)a3 core:(id)a4 signature:(id)a5 detectedLanguage:(id)a6 isIncomingMessage:(BOOL)a7 score:(id)a8 matchFoundInBCC:(id)a9
{
  _BOOL8 v10;
  id v16;
  SGMailIntelligenceMissingRecipientWarning *v17;
  SGMailIntelligenceMissingRecipientWarning *v18;
  NSString *handle;
  objc_super v21;

  v10 = a7;
  v16 = a9;
  v21.receiver = self;
  v21.super_class = (Class)SGMailIntelligenceMissingRecipientWarning;
  v17 = -[SGMailIntelligenceWarning initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:](&v21, sel_initWithSnippet_core_signature_detectedLanguage_isIncomingMessage_score_, a3, a4, a5, a6, v10, a8);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_matchFoundInBCC, a9);
    handle = v18->_handle;
    v18->_handle = 0;

  }
  return v18;
}

- (SGMailIntelligenceMissingRecipientWarning)initWithSnippet:(id)a3 core:(id)a4 handle:(id)a5 signature:(id)a6 detectedLanguage:(id)a7 isIncomingMessage:(BOOL)a8 score:(id)a9 matchFoundInBCC:(id)a10
{
  _BOOL8 v10;
  id v17;
  SGMailIntelligenceMissingRecipientWarning *v18;
  SGMailIntelligenceMissingRecipientWarning *v19;
  id v21;
  objc_super v22;

  v10 = a8;
  v21 = a5;
  v17 = a10;
  v22.receiver = self;
  v22.super_class = (Class)SGMailIntelligenceMissingRecipientWarning;
  v18 = -[SGMailIntelligenceWarning initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:](&v22, sel_initWithSnippet_core_signature_detectedLanguage_isIncomingMessage_score_, a3, a4, a6, a7, v10, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_matchFoundInBCC, a10);
    objc_storeStrong((id *)&v19->_handle, a5);
  }

  return v19;
}

- (SGMailIntelligenceMissingRecipientWarning)initWithCoder:(id)a3
{
  id v4;
  SGMailIntelligenceWarning *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  SGMailIntelligenceMissingRecipientWarning *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  SGMailIntelligenceMissingRecipientWarning *v23;
  SGMailIntelligenceMissingRecipientWarning *v24;

  v4 = a3;
  v5 = -[SGMailIntelligenceWarning initWithCoder:]([SGMailIntelligenceWarning alloc], "initWithCoder:", v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D81610];
    v7 = objc_opt_class();
    sgMailIntelligenceLogHandle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v7, CFSTR("matchFoundInBCC"), v4, 0, CFSTR("SGErrorDomain"), 11, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0D81610];
    v11 = objc_opt_class();
    sgMailIntelligenceLogHandle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v11, CFSTR("handle"), v4, 0, CFSTR("SGErrorDomain"), 11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = 0;
    }
    else
    {
      v23 = [SGMailIntelligenceMissingRecipientWarning alloc];
      -[SGMailIntelligenceWarning snippet](v5, "snippet");
      v24 = self;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGMailIntelligenceWarning core](v5, "core");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGMailIntelligenceWarning signature](v5, "signature");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGMailIntelligenceWarning detectedLanguage](v5, "detectedLanguage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SGMailIntelligenceWarning isIncomingMessage](v5, "isIncomingMessage");
      -[SGMailIntelligenceWarning score](v5, "score");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SGMailIntelligenceMissingRecipientWarning initWithSnippet:core:handle:signature:detectedLanguage:isIncomingMessage:score:matchFoundInBCC:](v23, "initWithSnippet:core:handle:signature:detectedLanguage:isIncomingMessage:score:matchFoundInBCC:", v16, v17, v13, v18, v19, v20, v21, v9);

      self = v24;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGMailIntelligenceMissingRecipientWarning;
  v4 = a3;
  -[SGMailIntelligenceWarning encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchFoundInBCC, CFSTR("matchFoundInBCC"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_handle, CFSTR("handle"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGMailIntelligenceWarning snippet](self, "snippet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMailIntelligenceWarning signature](self, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMailIntelligenceWarning core](self, "core");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMailIntelligenceMissingRecipientWarning handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMailIntelligenceWarning score](self, "score");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (self->_matchFoundInBCC)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" BCC match:%@"), self->_matchFoundInBCC);
    v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGMailIntelligenceMissingRecipientWarning triggered on: %@ (with signature %@) core:%@ handle:%@ score: %@%@>"), v4, v5, v6, v7, v9, v10);

  }
  else
  {
    v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGMailIntelligenceMissingRecipientWarning triggered on: %@ (with signature %@) core:%@ handle:%@ score: %@%@>"), v4, v5, v6, v7, v8, &stru_1E4762D08);
  }

  return v11;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)matchFoundInBCC
{
  return self->_matchFoundInBCC;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchFoundInBCC, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
