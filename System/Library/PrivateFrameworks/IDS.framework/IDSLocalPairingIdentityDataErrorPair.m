@implementation IDSLocalPairingIdentityDataErrorPair

- (IDSLocalPairingIdentityDataErrorPair)initWithIdentityData:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  IDSLocalPairingIdentityDataErrorPair *v9;
  IDSLocalPairingIdentityDataErrorPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSLocalPairingIdentityDataErrorPair;
  v9 = -[IDSLocalPairingIdentityDataErrorPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identityData, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (IDSLocalPairingIdentityDataErrorPair)initWithIdentityData:(id)a3
{
  return -[IDSLocalPairingIdentityDataErrorPair initWithIdentityData:error:](self, "initWithIdentityData:error:", a3, 0);
}

- (IDSLocalPairingIdentityDataErrorPair)initWithError:(id)a3
{
  return -[IDSLocalPairingIdentityDataErrorPair initWithIdentityData:error:](self, "initWithIdentityData:error:", 0, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSLocalPairingIdentityDataErrorPair)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  IDSLocalPairingIdentityDataErrorPair *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kIdentityData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kError"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IDSLocalPairingIdentityDataErrorPair initWithIdentityData:error:](self, "initWithIdentityData:error:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[IDSLocalPairingIdentityDataErrorPair identityData](self, "identityData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kIdentityData"));

  -[IDSLocalPairingIdentityDataErrorPair error](self, "error");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kError"));

}

- (NSData)identityData
{
  return self->_identityData;
}

- (void)setIdentityData:(id)a3
{
  objc_storeStrong((id *)&self->_identityData, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_identityData, 0);
}

@end
