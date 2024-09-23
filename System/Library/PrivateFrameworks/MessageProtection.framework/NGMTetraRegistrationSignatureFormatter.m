@implementation NGMTetraRegistrationSignatureFormatter

- (NGMTetraRegistrationSignatureFormatter)initWithKyberPublicKey:(id)a3 ecdhPublicKey:(id)a4 timestamp:(double)a5 tetraVersion:(unsigned int)a6
{
  id v11;
  id v12;
  NGMTetraRegistrationSignatureFormatter *v13;
  NGMTetraRegistrationSignatureFormatter *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NGMTetraRegistrationSignatureFormatter;
  v13 = -[NGMTetraRegistrationSignatureFormatter init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_timestamp = a5;
    v13->_tetraVersion = a6;
    objc_storeStrong((id *)&v13->_kyberPublicKey, a3);
    objc_storeStrong((id *)&v14->_ecdhPublicKey, a4);
  }

  return v14;
}

- (NGMTetraRegistrationSignatureFormatter)initWithTetraRegistration:(id)a3
{
  id v4;
  NGMTetraRegistrationSignatureFormatter *v5;
  double v6;
  uint64_t v7;
  _TtC17MessageProtection22Kyber1024ObjCPublicKey *kyberPublicKey;
  uint64_t v9;
  NSData *ecdhPublicKey;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NGMTetraRegistrationSignatureFormatter;
  v5 = -[NGMTetraRegistrationSignatureFormatter init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "timestamp");
    v5->_timestamp = v6;
    v5->_tetraVersion = objc_msgSend(v4, "tetraVersion");
    objc_msgSend(v4, "kyberPublicKey");
    v7 = objc_claimAutoreleasedReturnValue();
    kyberPublicKey = v5->_kyberPublicKey;
    v5->_kyberPublicKey = (_TtC17MessageProtection22Kyber1024ObjCPublicKey *)v7;

    objc_msgSend(v4, "serializedECDHPublicKey");
    v9 = objc_claimAutoreleasedReturnValue();
    ecdhPublicKey = v5->_ecdhPublicKey;
    v5->_ecdhPublicKey = (NSData *)v9;

  }
  return v5;
}

- (id)signedData
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  -[NGMTetraRegistrationSignatureFormatter timestamp](self, "timestamp");
  v13 = v3;
  v4 = (void *)MEMORY[0x24BDBCEC8];
  objc_msgSend(CFSTR("com.apple.Tetra.Registration"), "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NGMTetraRegistrationSignatureFormatter kyberPublicKey](self, "kyberPublicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v8);

  -[NGMTetraRegistrationSignatureFormatter ecdhPublicKey](self, "ecdhPublicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v9);

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v13, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v10);

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &self->_tetraVersion, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendData:", v11);

  return v6;
}

- (BOOL)isStillValidToEncrypt
{
  -[NGMTetraRegistrationSignatureFormatter timestamp](self, "timestamp");
  return +[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](NGMTimeBasedEvaluations, "validateFetchedPrekeyTimestamp:forEvaluationType:", 1);
}

- (BOOL)isStillValidToDecrypt
{
  -[NGMTetraRegistrationSignatureFormatter timestamp](self, "timestamp");
  return +[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](NGMTimeBasedEvaluations, "validateFetchedPrekeyTimestamp:forEvaluationType:", 2);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (unsigned)tetraVersion
{
  return self->_tetraVersion;
}

- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)kyberPublicKey
{
  return self->_kyberPublicKey;
}

- (NSData)ecdhPublicKey
{
  return self->_ecdhPublicKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecdhPublicKey, 0);
  objc_storeStrong((id *)&self->_kyberPublicKey, 0);
}

@end
