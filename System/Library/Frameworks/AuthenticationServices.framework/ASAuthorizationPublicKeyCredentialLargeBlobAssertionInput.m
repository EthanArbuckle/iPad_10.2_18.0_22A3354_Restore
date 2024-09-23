@implementation ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)initWithOperation:(ASAuthorizationPublicKeyCredentialLargeBlobAssertionOperation)operation
{
  return (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *)-[ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput _initWithOperation:dataToWrite:](self, "_initWithOperation:dataToWrite:", operation, 0);
}

- (id)_initWithOperation:(int64_t)a3 dataToWrite:(id)a4
{
  id v6;
  ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *v7;
  ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *v8;
  uint64_t v9;
  NSData *dataToWrite;
  ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput;
  v7 = -[ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_operation = a3;
    v9 = objc_msgSend(v6, "copy");
    dataToWrite = v8->_dataToWrite;
    v8->_dataToWrite = (NSData *)v9;

    v11 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput _initWithOperation:dataToWrite:](+[ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput allocWithZone:](ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput, "allocWithZone:", a3), "_initWithOperation:dataToWrite:", self->_operation, self->_dataToWrite);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t operation;
  id v5;

  operation = self->_operation;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", operation, CFSTR("operation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataToWrite, CFSTR("dataToWrite"));

}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("operation"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataToWrite"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput _initWithOperation:dataToWrite:](self, "_initWithOperation:dataToWrite:", v5, v6);
  return v7;
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOperation)operation
{
  return self->_operation;
}

- (NSData)dataToWrite
{
  return self->_dataToWrite;
}

- (void)setDataToWrite:(NSData *)dataToWrite
{
  objc_storeStrong((id *)&self->_dataToWrite, dataToWrite);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataToWrite, 0);
}

@end
