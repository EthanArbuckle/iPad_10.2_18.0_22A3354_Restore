@implementation IDSRegistrationCertificate

- (IDSRegistrationCertificate)initWithDataRepresentation:(id)a3
{
  id v4;
  IDSServerCertificate *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  IDSRegistrationCertificate *v11;

  v4 = a3;
  v5 = [IDSServerCertificate alloc];
  v8 = (void *)objc_msgSend_initWithDataRepresentation_(v5, v6, (uint64_t)v4, v7);

  v11 = (IDSRegistrationCertificate *)objc_msgSend_initWithBackingCertificate_(self, v9, (uint64_t)v8, v10);
  return v11;
}

- (IDSRegistrationCertificate)initWithBackingCertificate:(id)a3
{
  id v5;
  IDSRegistrationCertificate *v6;
  IDSRegistrationCertificate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSRegistrationCertificate;
  v6 = -[IDSRegistrationCertificate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backingCertificate, a3);

  return v7;
}

- (NSData)dataRepresentation
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_backingCertificate(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataRepresentation(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_backingCertificate(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("<%@: %p cert: %@>"), v10, v4, self, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (IDSServerCertificate)backingCertificate
{
  return self->_backingCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingCertificate, 0);
}

@end
