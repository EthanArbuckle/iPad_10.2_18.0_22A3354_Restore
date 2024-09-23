@implementation DAShareInitiatorResult

- (id)initInviteAcceptedResultWithResponse:(id)a3
{
  id v5;
  DAShareInitiatorResult *v6;
  DAShareInitiatorResult *v7;
  NSError *error;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAShareInitiatorResult;
  v6 = -[DAShareInitiatorResult init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    objc_storeStrong((id *)&v6->_response, a3);
    error = v7->_error;
    v7->_error = 0;

  }
  return v7;
}

- (id)initDataRequiredResultWithResponse:(id)a3
{
  id v5;
  DAShareInitiatorResult *v6;
  DAShareInitiatorResult *v7;
  NSError *error;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAShareInitiatorResult;
  v6 = -[DAShareInitiatorResult init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong((id *)&v6->_response, a3);
    error = v7->_error;
    v7->_error = 0;

  }
  return v7;
}

- (id)initFailureResultWithResponse:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  DAShareInitiatorResult *v9;
  DAShareInitiatorResult *v10;
  uint64_t v11;
  NSError *error;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DAShareInitiatorResult;
  v9 = -[DAShareInitiatorResult init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 2;
    objc_storeStrong((id *)&v9->_response, a3);
    kmlErrorToDAError(v8);
    v11 = objc_claimAutoreleasedReturnValue();
    error = v10->_error;
    v10->_error = (NSError *)v11;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DAShareInitiatorResult type](self, "type"), CFSTR("type"));
  -[DAShareInitiatorResult response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("response"));

  -[DAShareInitiatorResult error](self, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("error"));

}

- (DAShareInitiatorResult)initWithCoder:(id)a3
{
  id v4;
  DAShareInitiatorResult *v5;
  uint64_t v6;
  DACarKeySharingMessage *response;
  uint64_t v8;
  NSError *error;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DAShareInitiatorResult;
  v5 = -[DAShareInitiatorResult init](&v11, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("response"));
    v6 = objc_claimAutoreleasedReturnValue();
    response = v5->_response;
    v5->_response = (DACarKeySharingMessage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Type        : %ld\n"), self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error       : %@\n"), self->_error);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Response    : %@\n"), self->_response);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (DACarKeySharingMessage)response
{
  return self->_response;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
