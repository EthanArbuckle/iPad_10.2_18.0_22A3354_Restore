@implementation MRCryptoPairingIdentity

- (MRCryptoPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRCryptoPairingIdentity *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSData *publicKey;
  uint64_t v16;
  NSData *privateKey;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MRCryptoPairingIdentity;
  v11 = -[MRCryptoPairingIdentity init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    publicKey = v11->_publicKey;
    v11->_publicKey = (NSData *)v14;

    v16 = objc_msgSend(v10, "copy");
    privateKey = v11->_privateKey;
    v11->_privateKey = (NSData *)v16;

  }
  return v11;
}

- (MRCryptoPairingIdentity)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(sel_initWithIdentifier_publicKey_privateKey_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("use %@ instead"), v5);

  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
