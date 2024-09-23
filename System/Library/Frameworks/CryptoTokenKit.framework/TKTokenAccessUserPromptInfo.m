@implementation TKTokenAccessUserPromptInfo

- (TKTokenAccessUserPromptInfo)initWithTokenAccessRequest:(id)a3
{
  id v4;
  TKTokenAccessUserPromptInfo *v5;
  uint64_t v6;
  NSUUID *correlationID;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *clientDisplayName;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *providerDisplayName;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TKTokenAccessUserPromptInfo;
  v5 = -[TKTokenAccessUserPromptInfo init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "correlationID");
    v6 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSUUID *)v6;

    objc_msgSend(v4, "clientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v4, "clientBundleID");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    clientDisplayName = v5->_clientDisplayName;
    v5->_clientDisplayName = v10;

    objc_msgSend(v4, "providerName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v4, "providerBundleID");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    providerDisplayName = v5->_providerDisplayName;
    v5->_providerDisplayName = v14;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenAccessUserPromptInfo)initWithCoder:(id)a3
{
  id v4;
  TKTokenAccessUserPromptInfo *v5;
  uint64_t v6;
  NSString *clientDisplayName;
  uint64_t v8;
  NSString *providerDisplayName;
  uint64_t v10;
  NSUUID *correlationID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TKTokenAccessUserPromptInfo;
  v5 = -[TKTokenAccessUserPromptInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kClientDisplayName"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientDisplayName = v5->_clientDisplayName;
    v5->_clientDisplayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kProviderDisplayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    providerDisplayName = v5->_providerDisplayName;
    v5->_providerDisplayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCorrelationID"));
    v10 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSUUID *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientDisplayName;
  id v5;

  clientDisplayName = self->_clientDisplayName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clientDisplayName, CFSTR("kClientDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerDisplayName, CFSTR("kProviderDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_correlationID, CFSTR("kCorrelationID"));

}

- (NSString)clientDisplayName
{
  return self->_clientDisplayName;
}

- (NSString)providerDisplayName
{
  return self->_providerDisplayName;
}

- (NSUUID)correlationID
{
  return self->_correlationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_providerDisplayName, 0);
  objc_storeStrong((id *)&self->_clientDisplayName, 0);
}

@end
