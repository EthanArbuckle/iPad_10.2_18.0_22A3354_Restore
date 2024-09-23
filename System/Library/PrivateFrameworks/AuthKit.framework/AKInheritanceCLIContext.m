@implementation AKInheritanceCLIContext

- (AKInheritanceCLIContext)initWithCoder:(id)a3
{
  id v4;
  AKInheritanceCLIContext *v5;
  uint64_t v6;
  NSString *accessKeyString;
  uint64_t v8;
  NSString *beneficiaryPassword;
  uint64_t v10;
  NSString *beneficiaryFirstName;
  uint64_t v12;
  NSString *beneficiaryLastName;
  uint64_t v14;
  NSString *identityToken;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AKInheritanceCLIContext;
  v5 = -[AKInheritanceContext initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accessKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    accessKeyString = v5->_accessKeyString;
    v5->_accessKeyString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryPassword"));
    v8 = objc_claimAutoreleasedReturnValue();
    beneficiaryPassword = v5->_beneficiaryPassword;
    v5->_beneficiaryPassword = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryFirstName"));
    v10 = objc_claimAutoreleasedReturnValue();
    beneficiaryFirstName = v5->_beneficiaryFirstName;
    v5->_beneficiaryFirstName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryLastName"));
    v12 = objc_claimAutoreleasedReturnValue();
    beneficiaryLastName = v5->_beneficiaryLastName;
    v5->_beneficiaryLastName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identityToken"));
    v14 = objc_claimAutoreleasedReturnValue();
    identityToken = v5->_identityToken;
    v5->_identityToken = (NSString *)v14;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AKInheritanceCLIContext;
  v4 = -[AKInheritanceContext copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_accessKeyString, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[NSString copy](self->_beneficiaryPassword, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  v9 = -[NSString copy](self->_beneficiaryFirstName, "copy");
  v10 = (void *)v4[9];
  v4[9] = v9;

  v11 = -[NSString copy](self->_beneficiaryLastName, "copy");
  v12 = (void *)v4[10];
  v4[10] = v11;

  v13 = -[NSString copy](self->_identityToken, "copy");
  v14 = (void *)v4[11];
  v4[11] = v13;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKInheritanceCLIContext;
  v4 = a3;
  -[AKInheritanceContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_accessKeyString, CFSTR("_accessKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_beneficiaryPassword, CFSTR("_beneficiaryPassword"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_beneficiaryFirstName, CFSTR("_beneficiaryFirstName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_beneficiaryLastName, CFSTR("_beneficiaryLastName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identityToken, CFSTR("_identityToken"));

}

- (id)description
{
  void *v2;
  NSString *accessKeyString;
  NSString *beneficiaryPassword;
  NSString *beneficiaryFirstName;
  NSString *beneficiaryLastName;
  NSString *identityToken;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB3940];
  accessKeyString = self->_accessKeyString;
  beneficiaryPassword = self->_beneficiaryPassword;
  beneficiaryFirstName = self->_beneficiaryFirstName;
  beneficiaryLastName = self->_beneficiaryLastName;
  identityToken = self->_identityToken;
  -[AKInheritanceContext beneficiarySetupToken](self, "beneficiarySetupToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Access Key: %@ \nbeneficiaryPassword: %@\nbeneficiaryFirstName: %@\nbeneficiaryLastName: %@\nidentityToken: %@\nauthToken: %@"), accessKeyString, beneficiaryPassword, beneficiaryFirstName, beneficiaryLastName, identityToken, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)accessKeyString
{
  return self->_accessKeyString;
}

- (void)setAccessKeyString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)beneficiaryPassword
{
  return self->_beneficiaryPassword;
}

- (void)setBeneficiaryPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)beneficiaryFirstName
{
  return self->_beneficiaryFirstName;
}

- (void)setBeneficiaryFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)beneficiaryLastName
{
  return self->_beneficiaryLastName;
}

- (void)setBeneficiaryLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)identityToken
{
  return self->_identityToken;
}

- (void)setIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_beneficiaryLastName, 0);
  objc_storeStrong((id *)&self->_beneficiaryFirstName, 0);
  objc_storeStrong((id *)&self->_beneficiaryPassword, 0);
  objc_storeStrong((id *)&self->_accessKeyString, 0);
}

@end
