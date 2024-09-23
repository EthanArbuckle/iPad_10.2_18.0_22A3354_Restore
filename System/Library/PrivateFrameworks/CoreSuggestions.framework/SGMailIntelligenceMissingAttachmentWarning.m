@implementation SGMailIntelligenceMissingAttachmentWarning

- (SGMailIntelligenceMissingAttachmentWarning)initWithCoder:(id)a3
{
  id v4;
  SGMailIntelligenceWarning *v5;
  SGMailIntelligenceMissingAttachmentWarning *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  SGMailIntelligenceMissingAttachmentWarning *v13;

  v4 = a3;
  v5 = -[SGMailIntelligenceWarning initWithCoder:]([SGMailIntelligenceWarning alloc], "initWithCoder:", v4);

  if (v5)
  {
    v6 = [SGMailIntelligenceMissingAttachmentWarning alloc];
    -[SGMailIntelligenceWarning snippet](v5, "snippet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMailIntelligenceWarning core](v5, "core");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMailIntelligenceWarning signature](v5, "signature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMailIntelligenceWarning detectedLanguage](v5, "detectedLanguage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SGMailIntelligenceWarning isIncomingMessage](v5, "isIncomingMessage");
    -[SGMailIntelligenceWarning score](v5, "score");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SGMailIntelligenceWarning initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:](v6, "initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:", v7, v8, v9, v10, v11, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGMailIntelligenceWarning snippet](self, "snippet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMailIntelligenceWarning signature](self, "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMailIntelligenceWarning score](self, "score");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGMailIntelligenceMissingAttachmentWarning triggered on: %@ (with signature %@) score: %@>"), v4, v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
