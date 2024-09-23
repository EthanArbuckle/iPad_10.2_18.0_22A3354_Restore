@implementation ISGenerationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISGenerationResponse)initWithData:(id)a3 uuid:(id)a4 validationToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  ISGenerationResponse *v12;
  ISGenerationResponse *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ISGenerationResponse;
  v12 = -[ISGenerationResponse init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    objc_storeStrong((id *)&v13->_uuid, a4);
    objc_storeStrong((id *)&v13->_validationToken, a5);
  }

  return v13;
}

- (ISGenerationResponse)initWithError:(id)a3
{
  id v5;
  ISGenerationResponse *v6;
  ISGenerationResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISGenerationResponse;
  v6 = -[ISGenerationResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *error;
  id v4;
  const __CFString *v5;
  NSData *validationToken;
  NSData *data;
  id v9;

  error = self->_error;
  if (error)
  {
    v4 = a3;
    v5 = CFSTR("error");
    validationToken = (NSData *)error;
  }
  else
  {
    data = self->_data;
    v9 = a3;
    objc_msgSend(v9, "encodeObject:forKey:", data, CFSTR("data"));
    objc_msgSend(v9, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
    validationToken = self->_validationToken;
    v5 = CFSTR("validationToken");
    v4 = v9;
  }
  objc_msgSend(v4, "encodeObject:forKey:", validationToken, v5);

}

- (ISGenerationResponse)initWithCoder:(id)a3
{
  id v4;
  ISGenerationResponse *v5;
  uint64_t v6;
  NSError *error;
  uint64_t v8;
  NSData *data;
  uint64_t v10;
  NSUUID *uuid;
  uint64_t v12;
  NSData *validationToken;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ISGenerationResponse;
  v5 = -[ISGenerationResponse init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    if (!v5->_error)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
      v8 = objc_claimAutoreleasedReturnValue();
      data = v5->_data;
      v5->_data = (NSData *)v8;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
      v10 = objc_claimAutoreleasedReturnValue();
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v10;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validationToken"));
      v12 = objc_claimAutoreleasedReturnValue();
      validationToken = v5->_validationToken;
      v5->_validationToken = (NSData *)v12;

    }
  }

  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)validationToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_validationToken, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
