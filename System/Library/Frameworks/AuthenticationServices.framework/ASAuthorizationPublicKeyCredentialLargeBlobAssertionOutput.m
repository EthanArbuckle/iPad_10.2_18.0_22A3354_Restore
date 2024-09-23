@implementation ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput

+ (id)_outputWithData:(id)a3 didWrite:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithData:didWrite:", v6, v4);

  return v7;
}

- (id)_initWithData:(id)a3 didWrite:(BOOL)a4
{
  id v6;
  ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput *v7;
  uint64_t v8;
  NSData *readData;
  ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput;
  v7 = -[ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    readData = v7->_readData;
    v7->_readData = (NSData *)v8;

    v7->_didWrite = a4;
    v10 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput _initWithData:didWrite:](+[ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput allocWithZone:](ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput, "allocWithZone:", a3), "_initWithData:didWrite:", self->_readData, self->_didWrite);
}

- (void)encodeWithCoder:(id)a3
{
  NSData *readData;
  id v5;

  readData = self->_readData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", readData, CFSTR("readData"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didWrite, CFSTR("didWrite"));

}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didWrite"));

  v7 = -[ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput _initWithData:didWrite:](self, "_initWithData:didWrite:", v5, v6);
  return v7;
}

- (NSData)readData
{
  return self->_readData;
}

- (BOOL)didWrite
{
  return self->_didWrite;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readData, 0);
}

@end
