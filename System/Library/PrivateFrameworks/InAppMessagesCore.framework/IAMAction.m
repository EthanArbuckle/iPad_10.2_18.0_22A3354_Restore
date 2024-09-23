@implementation IAMAction

- (IAMAction)initWithIdentifier:(id)a3 displayText:(id)a4 url:(id)a5 requiresDelegate:(BOOL)a6 actionParameters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  IAMAction *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSString *displayText;
  uint64_t v21;
  NSURL *url;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)IAMAction;
  v16 = -[IAMAction init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    displayText = v16->_displayText;
    v16->_displayText = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    url = v16->_url;
    v16->_url = (NSURL *)v21;

    v16->_requiresDelegate = a6;
    objc_storeStrong((id *)&v16->_actionParameters, a7);
  }

  return v16;
}

- (IAMAction)initWithICAction:(id)a3
{
  id v4;
  IAMAction *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *displayText;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURL *url;
  void *v16;
  uint64_t v17;
  NSDictionary *actionParameters;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IAMAction;
  v5 = -[IAMAction init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "displayText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v10;

    v12 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "uRL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v14;

    v5->_requiresDelegate = objc_msgSend(v4, "requiresDelegate");
    objc_msgSend(v4, "actionParameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iam_dictionaryFromArrayOfICIIAMParameters");
    v17 = objc_claimAutoreleasedReturnValue();
    actionParameters = v5->_actionParameters;
    v5->_actionParameters = (NSDictionary *)v17;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:displayText:url:requiresDelegate:actionParameters:", self->_identifier, self->_displayText, self->_url, self->_requiresDelegate, self->_actionParameters);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)requiresDelegate
{
  return self->_requiresDelegate;
}

- (NSDictionary)actionParameters
{
  return self->_actionParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionParameters, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
