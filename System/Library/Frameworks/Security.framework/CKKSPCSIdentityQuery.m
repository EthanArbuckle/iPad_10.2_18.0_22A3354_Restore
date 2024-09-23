@implementation CKKSPCSIdentityQuery

- (CKKSPCSIdentityQuery)initWithServiceNumber:(id)a3 accessGroup:(id)a4 publicKey:(id)a5 zoneID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKKSPCSIdentityQuery *v15;
  CKKSPCSIdentityQuery *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSPCSIdentityQuery;
  v15 = -[CKKSPCSIdentityQuery init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serviceNumber, a3);
    objc_storeStrong((id *)&v16->_accessGroup, a4);
    objc_storeStrong((id *)&v16->_publicKey, a5);
    objc_storeStrong((id *)&v16->_zoneID, a6);
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
  -[CKKSPCSIdentityQuery serviceNumber](self, "serviceNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serviceNumber"));

  -[CKKSPCSIdentityQuery accessGroup](self, "accessGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accessGroup"));

  -[CKKSPCSIdentityQuery zoneID](self, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("zoneID"));

  -[CKKSPCSIdentityQuery publicKey](self, "publicKey");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("publicKey"));

}

- (CKKSPCSIdentityQuery)initWithCoder:(id)a3
{
  id v4;
  CKKSPCSIdentityQuery *v5;
  uint64_t v6;
  NSNumber *serviceNumber;
  uint64_t v8;
  NSString *accessGroup;
  uint64_t v10;
  NSString *zoneID;
  uint64_t v12;
  NSString *publicKey;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKKSPCSIdentityQuery;
  v5 = -[CKKSPCSIdentityQuery init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceNumber"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceNumber = v5->_serviceNumber;
    v5->_serviceNumber = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessGroup"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneID"));
    v10 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSString *)v12;

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

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccessGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)publicKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_serviceNumber, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
