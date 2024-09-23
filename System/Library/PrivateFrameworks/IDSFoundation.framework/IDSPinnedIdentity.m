@implementation IDSPinnedIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPinnedIdentity)initWithIdentityBlob:(id)a3
{
  id v5;
  IDSPinnedIdentity *v6;
  IDSPinnedIdentity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSPinnedIdentity;
  v6 = -[IDSPinnedIdentity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identityBlob, a3);

  return v7;
}

- (IDSPinnedIdentity)initWithCoder:(id)a3
{
  id v4;
  IDSPinnedIdentity *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  NSData *identityBlob;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IDSPinnedIdentity;
  v5 = -[IDSPinnedIdentity init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, CFSTR("IdentityBlob"));
    v9 = objc_claimAutoreleasedReturnValue();
    identityBlob = v5->_identityBlob;
    v5->_identityBlob = (NSData *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v3;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_identityBlob, v3, CFSTR("IdentityBlob"));
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p; { identityBlob: %@ }"),
               v6,
               v4,
               self,
               self->_identityBlob);
}

- (NSData)identityBlob
{
  return self->_identityBlob;
}

- (void)setIdentityBlob:(id)a3
{
  objc_storeStrong((id *)&self->_identityBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityBlob, 0);
}

@end
