@implementation AKTrustedContactsSyncResult

- (AKTrustedContactsSyncResult)initWithCoder:(id)a3
{
  id v4;
  AKTrustedContactsSyncResult *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *orphanedCustodianUUIDs;
  uint64_t v15;
  NSString *custodianListVersion;
  uint64_t v17;
  NSArray *orphanedBeneficiaryUUIDs;
  uint64_t v19;
  NSString *beneficiaryListVersion;
  uint64_t v21;
  NSDictionary *custodianOperationsByID;
  uint64_t v23;
  NSDictionary *beneficiaryOperationsByID;

  v4 = a3;
  v5 = -[AKTrustedContactsSyncResult init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_custodianUUIDs"));
    v13 = objc_claimAutoreleasedReturnValue();
    orphanedCustodianUUIDs = v5->_orphanedCustodianUUIDs;
    v5->_orphanedCustodianUUIDs = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianListVersion"));
    v15 = objc_claimAutoreleasedReturnValue();
    custodianListVersion = v5->_custodianListVersion;
    v5->_custodianListVersion = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_beneficiaryUUIDs"));
    v17 = objc_claimAutoreleasedReturnValue();
    orphanedBeneficiaryUUIDs = v5->_orphanedBeneficiaryUUIDs;
    v5->_orphanedBeneficiaryUUIDs = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_beneficiaryListVersion"));
    v19 = objc_claimAutoreleasedReturnValue();
    beneficiaryListVersion = v5->_beneficiaryListVersion;
    v5->_beneficiaryListVersion = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_custodianOperationsByID"));
    v21 = objc_claimAutoreleasedReturnValue();
    custodianOperationsByID = v5->_custodianOperationsByID;
    v5->_custodianOperationsByID = (NSDictionary *)v21;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_beneficiaryOperationsByID"));
    v23 = objc_claimAutoreleasedReturnValue();
    beneficiaryOperationsByID = v5->_beneficiaryOperationsByID;
    v5->_beneficiaryOperationsByID = (NSDictionary *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *orphanedCustodianUUIDs;
  id v5;

  orphanedCustodianUUIDs = self->_orphanedCustodianUUIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", orphanedCustodianUUIDs, CFSTR("_custodianUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianListVersion, CFSTR("_custodianListVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orphanedBeneficiaryUUIDs, CFSTR("_beneficiaryUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryListVersion, CFSTR("_beneficiaryListVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianOperationsByID, CFSTR("_custodianOperationsByID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryOperationsByID, CFSTR("_beneficiaryOperationsByID"));

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
  uint64_t v15;
  void *v16;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSArray copy](self->_orphanedCustodianUUIDs, "copy");
  v6 = (void *)v4[5];
  v4[5] = v5;

  v7 = -[NSString copy](self->_custodianListVersion, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_orphanedBeneficiaryUUIDs, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = -[NSString copy](self->_beneficiaryListVersion, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSDictionary copy](self->_custodianOperationsByID, "copy");
  v14 = (void *)v4[1];
  v4[1] = v13;

  v15 = -[NSDictionary copy](self->_beneficiaryOperationsByID, "copy");
  v16 = (void *)v4[2];
  v4[2] = v15;

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\ncustodianListVersion: %@\nbeneficiaryListVersion: %@\n_custodianOperationsByID: %@\n_beneficiaryOperationsByID: %@\n}>"), v5, self, self->_custodianListVersion, self->_beneficiaryListVersion, self->_custodianOperationsByID, self->_beneficiaryOperationsByID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)custodianOperationsByID
{
  return self->_custodianOperationsByID;
}

- (void)setCustodianOperationsByID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)beneficiaryOperationsByID
{
  return self->_beneficiaryOperationsByID;
}

- (void)setBeneficiaryOperationsByID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)custodianListVersion
{
  return self->_custodianListVersion;
}

- (void)setCustodianListVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)beneficiaryListVersion
{
  return self->_beneficiaryListVersion;
}

- (void)setBeneficiaryListVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)orphanedCustodianUUIDs
{
  return self->_orphanedCustodianUUIDs;
}

- (void)setOrphanedCustodianUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)orphanedBeneficiaryUUIDs
{
  return self->_orphanedBeneficiaryUUIDs;
}

- (void)setOrphanedBeneficiaryUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orphanedBeneficiaryUUIDs, 0);
  objc_storeStrong((id *)&self->_orphanedCustodianUUIDs, 0);
  objc_storeStrong((id *)&self->_beneficiaryListVersion, 0);
  objc_storeStrong((id *)&self->_custodianListVersion, 0);
  objc_storeStrong((id *)&self->_beneficiaryOperationsByID, 0);
  objc_storeStrong((id *)&self->_custodianOperationsByID, 0);
}

@end
