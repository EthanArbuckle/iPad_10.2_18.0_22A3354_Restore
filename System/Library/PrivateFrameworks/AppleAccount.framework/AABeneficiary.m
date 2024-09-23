@implementation AABeneficiary

- (AABeneficiary)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4
{
  id v7;
  id v8;
  AABeneficiary *v9;
  AABeneficiary *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AABeneficiary;
  v9 = -[AABeneficiary init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_beneficiaryID, a3);
    objc_storeStrong((id *)&v10->_benefactorAltDSID, a4);
  }

  return v10;
}

- (AABeneficiary)initWithCoder:(id)a3
{
  id v4;
  AABeneficiary *v5;
  uint64_t v6;
  NSUUID *beneficiaryID;
  uint64_t v8;
  NSString *benefactorAltDSID;
  uint64_t v10;
  AKInheritanceAccessKey *accessKey;

  v4 = a3;
  v5 = -[AABeneficiary init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryID"));
    v6 = objc_claimAutoreleasedReturnValue();
    beneficiaryID = v5->_beneficiaryID;
    v5->_beneficiaryID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_benefactorAltDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    benefactorAltDSID = v5->_benefactorAltDSID;
    v5->_benefactorAltDSID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accessKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    accessKey = v5->_accessKey;
    v5->_accessKey = (AKInheritanceAccessKey *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *beneficiaryID;
  id v5;

  beneficiaryID = self->_beneficiaryID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", beneficiaryID, CFSTR("_beneficiaryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_benefactorAltDSID, CFSTR("_benefactorAltDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessKey, CFSTR("_accessKey"));

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

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_beneficiaryID, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_benefactorAltDSID, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[AKInheritanceAccessKey copy](self->_accessKey, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> \nBeneficiaryID %@ \nBenefactorAltDSID %@"), objc_opt_class(), self, self->_beneficiaryID, self->_benefactorAltDSID);
}

- (NSUUID)beneficiaryID
{
  return self->_beneficiaryID;
}

- (NSString)benefactorAltDSID
{
  return self->_benefactorAltDSID;
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
  objc_storeStrong((id *)&self->_benefactorAltDSID, 0);
  objc_storeStrong((id *)&self->_beneficiaryID, 0);
}

@end
