@implementation FKPaymentPass

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FKPaymentPass)initWithCoder:(id)a3
{
  id v4;
  FKPaymentPass *v5;
  uint64_t v6;
  NSString *uniqueID;
  uint64_t v8;
  NSString *serialNumber;
  uint64_t v10;
  NSString *passTypeIdentifier;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSSet *associatedApplicationIdentifiers;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *associatedStoreIdentifiers;
  uint64_t v22;
  NSString *primaryAccountIdentifier;
  uint64_t v24;
  NSString *issuerCountryCode;
  uint64_t v26;
  NSString *primaryPaymentApplicationPaymentType;
  uint64_t v28;
  NSString *organizationName;
  uint64_t v30;
  NSString *localizedDescription;
  uint64_t v32;
  NSString *primaryPaymentApplicationDisplayName;
  uint64_t v34;
  NSString *partnerOrgID;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSSet *paymentApplications;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)FKPaymentPass;
  v5 = -[FKPaymentPass init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
    v8 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passTypeIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v10;

    v12 = objc_alloc(MEMORY[0x24BDBCF20]);
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("associatedApplicationIdentifiers"));
    v15 = objc_claimAutoreleasedReturnValue();
    associatedApplicationIdentifiers = v5->_associatedApplicationIdentifiers;
    v5->_associatedApplicationIdentifiers = (NSSet *)v15;

    v17 = objc_alloc(MEMORY[0x24BDBCF20]);
    v18 = objc_opt_class();
    v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("associatedStoreIdentifiers"));
    v20 = objc_claimAutoreleasedReturnValue();
    associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
    v5->_associatedStoreIdentifiers = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAccountIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    primaryAccountIdentifier = v5->_primaryAccountIdentifier;
    v5->_primaryAccountIdentifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuerCountryCode"));
    v24 = objc_claimAutoreleasedReturnValue();
    issuerCountryCode = v5->_issuerCountryCode;
    v5->_issuerCountryCode = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryPaymentApplicationPaymentType"));
    v26 = objc_claimAutoreleasedReturnValue();
    primaryPaymentApplicationPaymentType = v5->_primaryPaymentApplicationPaymentType;
    v5->_primaryPaymentApplicationPaymentType = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationName"));
    v28 = objc_claimAutoreleasedReturnValue();
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v30 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryPaymentApplicationDisplayName"));
    v32 = objc_claimAutoreleasedReturnValue();
    primaryPaymentApplicationDisplayName = v5->_primaryPaymentApplicationDisplayName;
    v5->_primaryPaymentApplicationDisplayName = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerOrgID"));
    v34 = objc_claimAutoreleasedReturnValue();
    partnerOrgID = v5->_partnerOrgID;
    v5->_partnerOrgID = (NSString *)v34;

    v36 = objc_alloc(MEMORY[0x24BDBCF20]);
    v37 = objc_opt_class();
    v38 = (void *)objc_msgSend(v36, "initWithObjects:", v37, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("paymentApplications"));
    v39 = objc_claimAutoreleasedReturnValue();
    paymentApplications = v5->_paymentApplications;
    v5->_paymentApplications = (NSSet *)v39;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueID;
  id v5;

  uniqueID = self->_uniqueID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueID, CFSTR("uniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passTypeIdentifier, CFSTR("passTypeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedApplicationIdentifiers, CFSTR("associatedApplicationIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedStoreIdentifiers, CFSTR("associatedStoreIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryAccountIdentifier, CFSTR("primaryAccountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_issuerCountryCode, CFSTR("issuerCountryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryPaymentApplicationPaymentType, CFSTR("primaryPaymentApplicationPaymentType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationName, CFSTR("organizationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryPaymentApplicationDisplayName, CFSTR("primaryPaymentApplicationDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partnerOrgID, CFSTR("partnerOrgID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentApplications, CFSTR("paymentApplications"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  FKPaymentPass *v4;
  uint64_t v5;
  NSString *uniqueID;
  uint64_t v7;
  NSString *serialNumber;
  uint64_t v9;
  NSString *passTypeIdentifier;
  uint64_t v11;
  NSSet *associatedApplicationIdentifiers;
  uint64_t v13;
  NSArray *associatedStoreIdentifiers;
  uint64_t v15;
  NSString *primaryAccountIdentifier;
  uint64_t v17;
  NSString *issuerCountryCode;
  uint64_t v19;
  NSString *primaryPaymentApplicationPaymentType;
  uint64_t v21;
  NSString *organizationName;
  uint64_t v23;
  NSString *localizedDescription;
  uint64_t v25;
  NSString *primaryPaymentApplicationDisplayName;
  uint64_t v27;
  NSString *partnerOrgID;
  uint64_t v29;
  NSSet *paymentApplications;

  v4 = objc_alloc_init(FKPaymentPass);
  v5 = -[NSString copy](self->_uniqueID, "copy");
  uniqueID = v4->_uniqueID;
  v4->_uniqueID = (NSString *)v5;

  v7 = -[NSString copy](self->_serialNumber, "copy");
  serialNumber = v4->_serialNumber;
  v4->_serialNumber = (NSString *)v7;

  v9 = -[NSString copy](self->_passTypeIdentifier, "copy");
  passTypeIdentifier = v4->_passTypeIdentifier;
  v4->_passTypeIdentifier = (NSString *)v9;

  v11 = -[NSSet copy](self->_associatedApplicationIdentifiers, "copy");
  associatedApplicationIdentifiers = v4->_associatedApplicationIdentifiers;
  v4->_associatedApplicationIdentifiers = (NSSet *)v11;

  v13 = -[NSArray copy](self->_associatedStoreIdentifiers, "copy");
  associatedStoreIdentifiers = v4->_associatedStoreIdentifiers;
  v4->_associatedStoreIdentifiers = (NSArray *)v13;

  v15 = -[NSString copy](self->_primaryAccountIdentifier, "copy");
  primaryAccountIdentifier = v4->_primaryAccountIdentifier;
  v4->_primaryAccountIdentifier = (NSString *)v15;

  v17 = -[NSString copy](self->_issuerCountryCode, "copy");
  issuerCountryCode = v4->_issuerCountryCode;
  v4->_issuerCountryCode = (NSString *)v17;

  v19 = -[NSString copy](self->_primaryPaymentApplicationPaymentType, "copy");
  primaryPaymentApplicationPaymentType = v4->_primaryPaymentApplicationPaymentType;
  v4->_primaryPaymentApplicationPaymentType = (NSString *)v19;

  v21 = -[NSString copy](self->_organizationName, "copy");
  organizationName = v4->_organizationName;
  v4->_organizationName = (NSString *)v21;

  v23 = -[NSString copy](self->_localizedDescription, "copy");
  localizedDescription = v4->_localizedDescription;
  v4->_localizedDescription = (NSString *)v23;

  v25 = -[NSString copy](self->_primaryPaymentApplicationDisplayName, "copy");
  primaryPaymentApplicationDisplayName = v4->_primaryPaymentApplicationDisplayName;
  v4->_primaryPaymentApplicationDisplayName = (NSString *)v25;

  v27 = -[NSString copy](self->_partnerOrgID, "copy");
  partnerOrgID = v4->_partnerOrgID;
  v4->_partnerOrgID = (NSString *)v27;

  v29 = -[NSSet copy](self->_paymentApplications, "copy");
  paymentApplications = v4->_paymentApplications;
  v4->_paymentApplications = (NSSet *)v29;

  return v4;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_uniqueID);
  objc_msgSend(v3, "safelyAddObject:", self->_serialNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_passTypeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedApplicationIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedStoreIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryAccountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_issuerCountryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryPaymentApplicationPaymentType);
  objc_msgSend(v3, "safelyAddObject:", self->_organizationName);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_primaryPaymentApplicationDisplayName);
  objc_msgSend(v3, "safelyAddObject:", self->_partnerOrgID);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentApplications);
  v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  FKPaymentPass *v4;
  FKPaymentPass *v5;
  void **v6;
  char v7;

  v4 = (FKPaymentPass *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_serialNumber, v6[2])
      && FKEqualObjects(self->_uniqueID, v6[1])
      && FKEqualObjects(self->_passTypeIdentifier, v6[3])
      && FKEqualObjects(self->_associatedApplicationIdentifiers, v6[4])
      && FKEqualObjects(self->_associatedStoreIdentifiers, v6[5])
      && FKEqualObjects(self->_primaryAccountIdentifier, v6[7])
      && FKEqualObjects(self->_issuerCountryCode, v6[6])
      && FKEqualObjects(self->_primaryPaymentApplicationPaymentType, v6[10])
      && FKEqualObjects(self->_organizationName, v6[8])
      && FKEqualObjects(self->_localizedDescription, v6[9])
      && FKEqualObjects(self->_primaryPaymentApplicationDisplayName, v6[11])
      && FKEqualObjects(self->_partnerOrgID, v6[12]))
    {
      v7 = FKEqualObjects(self->_paymentApplications, v6[13]);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)associatedStoreIdentifiers
{
  return self->_associatedStoreIdentifiers;
}

- (void)setAssociatedStoreIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)issuerCountryCode
{
  return self->_issuerCountryCode;
}

- (void)setIssuerCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)primaryPaymentApplicationPaymentType
{
  return self->_primaryPaymentApplicationPaymentType;
}

- (void)setPrimaryPaymentApplicationPaymentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)primaryPaymentApplicationDisplayName
{
  return self->_primaryPaymentApplicationDisplayName;
}

- (void)setPrimaryPaymentApplicationDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)partnerOrgID
{
  return self->_partnerOrgID;
}

- (void)setPartnerOrgID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSSet)paymentApplications
{
  return self->_paymentApplications;
}

- (void)setPaymentApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_partnerOrgID, 0);
  objc_storeStrong((id *)&self->_primaryPaymentApplicationDisplayName, 0);
  objc_storeStrong((id *)&self->_primaryPaymentApplicationPaymentType, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_issuerCountryCode, 0);
  objc_storeStrong((id *)&self->_associatedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
