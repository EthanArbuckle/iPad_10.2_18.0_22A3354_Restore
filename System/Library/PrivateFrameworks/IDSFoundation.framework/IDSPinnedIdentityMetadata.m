@implementation IDSPinnedIdentityMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPinnedIdentityMetadata)initWithCoder:(id)a3
{
  id v4;
  IDSPinnedIdentityMetadata *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  NSString *service;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  NSData *identity;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSPinnedIdentityMetadata;
  v5 = -[IDSPinnedIdentityMetadata init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, CFSTR("PinnedIdentityMetadataService"));
    v9 = objc_claimAutoreleasedReturnValue();
    service = v5->_service;
    v5->_service = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, v13, CFSTR("PinnedIdentityMetadataIdentity"));
    v14 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (NSData *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *service;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  service = self->_service;
  v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)service, v6, CFSTR("PinnedIdentityMetadataService"));
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_identity, v8, CFSTR("PinnedIdentityMetadataIdentity"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p; { service: %@, identity: %@ }"),
               v6,
               v4,
               self,
               self->_service,
               self->_identity);
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_debugDescription(self->_service, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(self->_identity, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: %p; { service: %@,\n identity: %@ }"),
    v14,
    v4,
    self,
    v8,
    v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSData)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
