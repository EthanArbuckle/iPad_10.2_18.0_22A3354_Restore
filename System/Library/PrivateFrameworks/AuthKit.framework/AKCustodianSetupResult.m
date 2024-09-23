@implementation AKCustodianSetupResult

- (AKCustodianSetupResult)initWithCoder:(id)a3
{
  id v4;
  AKCustodianSetupResult *v5;
  uint64_t v6;
  NSData *encryptedPRKC;
  uint64_t v8;
  NSString *ownerCustodianAltDSID;

  v4 = a3;
  v5 = -[AKCustodianSetupResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_encryptedPRKC"));
    v6 = objc_claimAutoreleasedReturnValue();
    encryptedPRKC = v5->_encryptedPRKC;
    v5->_encryptedPRKC = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ownerCustodianAltDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerCustodianAltDSID = v5->_ownerCustodianAltDSID;
    v5->_ownerCustodianAltDSID = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *encryptedPRKC;
  id v5;

  encryptedPRKC = self->_encryptedPRKC;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", encryptedPRKC, CFSTR("_encryptedPRKC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerCustodianAltDSID, CFSTR("_ownerCustodianAltDSID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSData copy](self->_encryptedPRKC, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_ownerCustodianAltDSID, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_encryptedPRKC, 4);
  v4 = v3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 4)
  {
    objc_msgSend(v3, "substringToIndex:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p {\nencryptedPRKC: %@...\nownerCustodianAltDSID: %@\n}>"), v7, self, v4, self->_ownerCustodianAltDSID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)encryptedPRKC
{
  return self->_encryptedPRKC;
}

- (void)setEncryptedPRKC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)ownerCustodianAltDSID
{
  return self->_ownerCustodianAltDSID;
}

- (void)setOwnerCustodianAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerCustodianAltDSID, 0);
  objc_storeStrong((id *)&self->_encryptedPRKC, 0);
}

@end
