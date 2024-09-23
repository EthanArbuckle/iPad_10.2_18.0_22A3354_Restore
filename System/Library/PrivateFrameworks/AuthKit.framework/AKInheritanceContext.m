@implementation AKInheritanceContext

- (AKInheritanceContext)initWithOwnerAltDSID:(id)a3
{
  id v5;
  AKInheritanceContext *v6;
  AKInheritanceContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKInheritanceContext;
  v6 = -[AKInheritanceContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_altDSID, a3);

  return v7;
}

- (AKInheritanceContext)initWithAuthenticationContext:(id)a3
{
  id v4;
  AKInheritanceContext *v5;
  uint64_t v6;
  NSString *altDSID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKInheritanceContext;
  v5 = -[AKInheritanceContext init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "altDSID");
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

  }
  return v5;
}

- (AKInheritanceContext)initWithCoder:(id)a3
{
  id v4;
  AKInheritanceContext *v5;
  uint64_t v6;
  NSString *altDSID;
  uint64_t v8;
  NSString *beneficiaryIdentifier;
  uint64_t v10;
  AKBeneficiaryManifest *manifest;
  uint64_t v12;
  AKInheritanceAccessKey *accessKey;
  uint64_t v14;
  NSString *beneficiarySetupToken;

  v4 = a3;
  v5 = -[AKInheritanceContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    beneficiaryIdentifier = v5->_beneficiaryIdentifier;
    v5->_beneficiaryIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_manifest"));
    v10 = objc_claimAutoreleasedReturnValue();
    manifest = v5->_manifest;
    v5->_manifest = (AKBeneficiaryManifest *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accessCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    accessKey = v5->_accessKey;
    v5->_accessKey = (AKInheritanceAccessKey *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiarySetupToken"));
    v14 = objc_claimAutoreleasedReturnValue();
    beneficiarySetupToken = v5->_beneficiarySetupToken;
    v5->_beneficiarySetupToken = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  id v5;

  altDSID = self->_altDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryIdentifier, CFSTR("_beneficiaryIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_manifest, CFSTR("_manifest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessKey, CFSTR("_accessCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiarySetupToken, CFSTR("_beneficiarySetupToken"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_altDSID, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_beneficiaryIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[AKBeneficiaryManifest copy](self->_manifest, "copy");
  v10 = (void *)v4[5];
  v4[5] = v9;

  v11 = -[AKInheritanceAccessKey copy](self->_accessKey, "copy");
  v12 = (void *)v4[6];
  v4[6] = v11;

  v13 = -[NSString copy](self->_beneficiarySetupToken, "copy");
  v14 = (void *)v4[4];
  v4[4] = v13;

  return v4;
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)beneficiaryIdentifier
{
  return self->_beneficiaryIdentifier;
}

- (void)setBeneficiaryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)beneficiarySetupToken
{
  return self->_beneficiarySetupToken;
}

- (void)setBeneficiarySetupToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AKBeneficiaryManifest)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
  objc_storeStrong((id *)&self->_manifest, a3);
}

- (AKInheritanceAccessKey)accessKey
{
  return self->_accessKey;
}

- (void)setAccessKey:(id)a3
{
  objc_storeStrong((id *)&self->_accessKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_beneficiarySetupToken, 0);
  objc_storeStrong((id *)&self->_beneficiaryIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
