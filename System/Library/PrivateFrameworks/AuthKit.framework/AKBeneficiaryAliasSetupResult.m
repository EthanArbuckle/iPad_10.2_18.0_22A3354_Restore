@implementation AKBeneficiaryAliasSetupResult

- (AKBeneficiaryAliasSetupResult)initWithCoder:(id)a3
{
  id v4;
  AKBeneficiaryAliasSetupResult *v5;
  uint64_t v6;
  NSString *beneficiaryAltDSID;
  uint64_t v8;
  NSString *beneficiaryAccountName;

  v4 = a3;
  v5 = -[AKBeneficiaryAliasSetupResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryAltDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    beneficiaryAltDSID = v5->_beneficiaryAltDSID;
    v5->_beneficiaryAltDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryAccountName"));
    v8 = objc_claimAutoreleasedReturnValue();
    beneficiaryAccountName = v5->_beneficiaryAccountName;
    v5->_beneficiaryAccountName = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *beneficiaryAltDSID;
  id v5;

  beneficiaryAltDSID = self->_beneficiaryAltDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", beneficiaryAltDSID, CFSTR("_beneficiaryAltDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryAccountName, CFSTR("_beneficiaryAccountName"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_beneficiaryAltDSID, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_beneficiaryAccountName, "copy");
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
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\nbeneficiaryAltDSID: %@\nbeneficiaryAccountName: %@\n}>"), v5, self, self->_beneficiaryAltDSID, self->_beneficiaryAccountName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)beneficiaryAltDSID
{
  return self->_beneficiaryAltDSID;
}

- (void)setBeneficiaryAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)beneficiaryAccountName
{
  return self->_beneficiaryAccountName;
}

- (void)setBeneficiaryAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beneficiaryAccountName, 0);
  objc_storeStrong((id *)&self->_beneficiaryAltDSID, 0);
}

@end
