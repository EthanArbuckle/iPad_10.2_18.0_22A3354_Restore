@implementation IDSKTOptInOutStatusData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTOptInOutStatusData)initWithCoder:(id)a3
{
  id v4;
  IDSKTOptInOutStatusData *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  NSData *publicAccountKey;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  NSNumber *optInStatus;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  NSString *ktApplication;
  uint64_t v21;
  const char *v22;
  double v23;
  uint64_t v24;
  NSString *serviceIdentifier;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IDSKTOptInOutStatusData;
  v5 = -[IDSKTOptInOutStatusData init](&v27, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, CFSTR("KTOptStatusDataPubAccKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    publicAccountKey = v5->_publicAccountKey;
    v5->_publicAccountKey = (NSData *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, v13, CFSTR("KTOptStatusDataOptInStatus"));
    v14 = objc_claimAutoreleasedReturnValue();
    optInStatus = v5->_optInStatus;
    v5->_optInStatus = (NSNumber *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, v18, CFSTR("KTOptStatusKTApplication"));
    v19 = objc_claimAutoreleasedReturnValue();
    ktApplication = v5->_ktApplication;
    v5->_ktApplication = (NSString *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, v23, CFSTR("KTOptStatusServiceIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *publicAccountKey;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  id v13;

  publicAccountKey = self->_publicAccountKey;
  v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)publicAccountKey, v6, CFSTR("KTOptStatusDataPubAccKey"));
  objc_msgSend_encodeObject_forKey_(v13, v7, (uint64_t)self->_optInStatus, v8, CFSTR("KTOptStatusDataOptInStatus"));
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_ktApplication, v10, CFSTR("KTOptStatusKTApplication"));
  objc_msgSend_encodeObject_forKey_(v13, v11, (uint64_t)self->_serviceIdentifier, v12, CFSTR("KTOptStatusServiceIdentifier"));

}

- (id)description
{
  uint64_t v2;
  double v3;
  void *v5;
  NSData *publicAccountKey;
  const char *v7;
  double v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  publicAccountKey = self->_publicAccountKey;
  if (objc_msgSend_BOOLValue(self->_optInStatus, a2, v2, v3))
    return (id)objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("<IDSKTOptInOutStatusData: %p, accountKey: %@, optInStatus: %@, ktApplication: %@, serviceIdentifier: %@>"), v8, self, publicAccountKey, CFSTR("YES"), self->_ktApplication, self->_serviceIdentifier);
  else
    return (id)objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("<IDSKTOptInOutStatusData: %p, accountKey: %@, optInStatus: %@, ktApplication: %@, serviceIdentifier: %@>"), v8, self, publicAccountKey, CFSTR("NO"), self->_ktApplication, self->_serviceIdentifier);
}

- (NSData)publicAccountKey
{
  return self->_publicAccountKey;
}

- (void)setPublicAccountKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicAccountKey, a3);
}

- (NSNumber)optInStatus
{
  return self->_optInStatus;
}

- (void)setOptInStatus:(id)a3
{
  objc_storeStrong((id *)&self->_optInStatus, a3);
}

- (NSString)ktApplication
{
  return self->_ktApplication;
}

- (void)setKtApplication:(id)a3
{
  objc_storeStrong((id *)&self->_ktApplication, a3);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_ktApplication, 0);
  objc_storeStrong((id *)&self->_optInStatus, 0);
  objc_storeStrong((id *)&self->_publicAccountKey, 0);
}

@end
