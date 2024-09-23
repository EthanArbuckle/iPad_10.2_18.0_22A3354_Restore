@implementation DAShareRecipientResult

- (id)initCredentialProvisionedResultWithCredentialIdentifier:(id)a3 keyInformation:(id)a4
{
  id v7;
  id v8;
  DAShareRecipientResult *v9;
  DAShareRecipientResult *v10;
  DACarKeySharingMessage *response;
  NSError *error;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DAShareRecipientResult;
  v9 = -[DAShareRecipientResult init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 2;
    objc_storeStrong((id *)&v9->_credentialIdentifier, a3);
    objc_storeStrong((id *)&v10->_keyInformation, a4);
    response = v10->_response;
    v10->_response = 0;

    error = v10->_error;
    v10->_error = 0;

    v10->_retryCount = 0;
  }

  return v10;
}

- (id)initDataRequiredResultWithCredentialIdentifier:(id)a3 response:(id)a4 keyInformation:(id)a5
{
  id v9;
  id v10;
  id v11;
  DAShareRecipientResult *v12;
  DAShareRecipientResult *v13;
  NSError *error;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DAShareRecipientResult;
  v12 = -[DAShareRecipientResult init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = 0;
    objc_storeStrong((id *)&v12->_credentialIdentifier, a3);
    objc_storeStrong((id *)&v13->_keyInformation, a5);
    objc_storeStrong((id *)&v13->_response, a4);
    error = v13->_error;
    v13->_error = 0;

    v13->_retryCount = 0;
  }

  return v13;
}

- (id)initFailureResultWithCrdentialIdentifier:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  DAShareRecipientResult *v9;
  DAShareRecipientResult *v10;
  DAKeyInformation *keyInformation;
  DACarKeySharingMessage *response;
  uint64_t v13;
  NSError *error;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DAShareRecipientResult;
  v9 = -[DAShareRecipientResult init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 3;
    objc_storeStrong((id *)&v9->_credentialIdentifier, a3);
    keyInformation = v10->_keyInformation;
    v10->_keyInformation = 0;

    response = v10->_response;
    v10->_response = 0;

    kmlErrorToDAError(v8);
    v13 = objc_claimAutoreleasedReturnValue();
    error = v10->_error;
    v10->_error = (NSError *)v13;

    v10->_retryCount = 0;
  }

  return v10;
}

- (id)initPasscodeFailureResultWithCredentialIdentifier:(id)a3 retryCount:(unint64_t)a4
{
  id v7;
  DAShareRecipientResult *v8;
  DAShareRecipientResult *v9;
  DAKeyInformation *keyInformation;
  DACarKeySharingMessage *response;
  NSError *error;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DAShareRecipientResult;
  v8 = -[DAShareRecipientResult init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    objc_storeStrong((id *)&v8->_credentialIdentifier, a3);
    keyInformation = v9->_keyInformation;
    v9->_keyInformation = 0;

    response = v9->_response;
    v9->_response = 0;

    error = v9->_error;
    v9->_error = 0;

    v9->_retryCount = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[DAShareRecipientResult type](self, "type"), CFSTR("type"));
  -[DAShareRecipientResult credentialIdentifier](self, "credentialIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("credentialIdentifier"));

  -[DAShareRecipientResult keyInformation](self, "keyInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("keyInformation"));

  -[DAShareRecipientResult response](self, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("response"));

  -[DAShareRecipientResult error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("error"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[DAShareRecipientResult retryCount](self, "retryCount"), CFSTR("retryCount"));
}

- (DAShareRecipientResult)initWithCoder:(id)a3
{
  id v4;
  DAShareRecipientResult *v5;
  uint64_t v6;
  NSString *credentialIdentifier;
  uint64_t v8;
  DAKeyInformation *keyInformation;
  uint64_t v10;
  DACarKeySharingMessage *response;
  uint64_t v12;
  NSError *error;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAShareRecipientResult;
  v5 = -[DAShareRecipientResult init](&v15, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyInformation"));
    v8 = objc_claimAutoreleasedReturnValue();
    keyInformation = v5->_keyInformation;
    v5->_keyInformation = (DAKeyInformation *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("response"));
    v10 = objc_claimAutoreleasedReturnValue();
    response = v5->_response;
    v5->_response = (DACarKeySharingMessage *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v12 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v12;

    v5->_retryCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("retryCount"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Type               : %ld\n"), self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Retry Count        : %ld\n"), self->_retryCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error              : %@\n"), self->_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Response           : %@\n"), self->_response);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Key Information    : %@\n"), self->_keyInformation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (DACarKeySharingMessage)response
{
  return self->_response;
}

- (DAKeyInformation)keyInformation
{
  return self->_keyInformation;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_keyInformation, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end
