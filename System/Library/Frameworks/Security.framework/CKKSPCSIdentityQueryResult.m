@implementation CKKSPCSIdentityQueryResult

- (CKKSPCSIdentityQueryResult)initWithServiceNumber:(id)a3 publicKey:(id)a4 zoneID:(id)a5 decryptedRecord:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKKSPCSIdentityQueryResult *v15;
  CKKSPCSIdentityQueryResult *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSPCSIdentityQueryResult;
  v15 = -[CKKSPCSIdentityQueryResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serviceNumber, a3);
    objc_storeStrong((id *)&v16->_publicKey, a4);
    objc_storeStrong((id *)&v16->_zoneID, a5);
    objc_storeStrong((id *)&v16->_decryptedRecord, a6);
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CKKSPCSIdentityQueryResult serviceNumber](self, "serviceNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serviceNumber"));

  -[CKKSPCSIdentityQueryResult zoneID](self, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("zoneID"));

  -[CKKSPCSIdentityQueryResult publicKey](self, "publicKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("publicKey"));

  -[CKKSPCSIdentityQueryResult decryptedRecord](self, "decryptedRecord");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("decryptedRecord"));

}

- (CKKSPCSIdentityQueryResult)initWithCoder:(id)a3
{
  id v4;
  CKKSPCSIdentityQueryResult *v5;
  uint64_t v6;
  NSNumber *serviceNumber;
  uint64_t v8;
  NSString *zoneID;
  uint64_t v10;
  NSString *publicKey;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *decryptedRecord;
  objc_super v18;
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKKSPCSIdentityQueryResult;
  v5 = -[CKKSPCSIdentityQueryResult init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceNumber = v5->_serviceNumber;
    v5->_serviceNumber = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneID"));
    v8 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("decryptedRecord"));
    v15 = objc_claimAutoreleasedReturnValue();
    decryptedRecord = v5->_decryptedRecord;
    v5->_decryptedRecord = (NSDictionary *)v15;

  }
  return v5;
}

- (NSNumber)serviceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServiceNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)publicKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)decryptedRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDecryptedRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptedRecord, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_serviceNumber, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
