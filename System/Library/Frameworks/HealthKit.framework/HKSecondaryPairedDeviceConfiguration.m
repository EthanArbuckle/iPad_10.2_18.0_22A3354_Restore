@implementation HKSecondaryPairedDeviceConfiguration

+ (id)secondaryPairedDeviceConfigurationWithNanoRegistryDeviceUUID:(id)a3 setupType:(unint64_t)a4 firstName:(id)a5 lastName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithNanoRegistryDeviceUUID:setupType:firstName:lastName:", v12, a4, v11, v10);

  return v13;
}

- (id)_initWithNanoRegistryDeviceUUID:(id)a3 setupType:(unint64_t)a4 firstName:(id)a5 lastName:(id)a6
{
  id v11;
  id v12;
  id v13;
  HKSecondaryPairedDeviceConfiguration *v14;
  HKSecondaryPairedDeviceConfiguration *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKSecondaryPairedDeviceConfiguration;
  v14 = -[HKSecondaryPairedDeviceConfiguration init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_nanoRegistryDeviceUUID, a3);
    v15->_setupType = a4;
    objc_storeStrong((id *)&v15->_firstName, a5);
    objc_storeStrong((id *)&v15->_lastName, a6);
  }

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSUUID *nanoRegistryDeviceUUID;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  nanoRegistryDeviceUUID = self->_nanoRegistryDeviceUUID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_setupType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, UUID:%@, setupType:%@, dateOfBirth:%@, firstName:%@, lastName:%@, DSID:%@, guardianFirstName:%@, guardianLastName:%@, guardianDSID:%@>"), v4, self, nanoRegistryDeviceUUID, v6, self->_dateOfBirth, self->_firstName, self->_lastName, self->_dsid, self->_guardianFirstName, self->_guardianLastName, self->_guardianDSID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSecondaryPairedDeviceConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKSecondaryPairedDeviceConfiguration *v5;
  uint64_t v6;
  NSUUID *nanoRegistryDeviceUUID;
  uint64_t v8;
  NSDateComponents *dateOfBirth;
  uint64_t v10;
  NSString *firstName;
  uint64_t v12;
  NSString *lastName;
  uint64_t v14;
  NSNumber *dsid;
  uint64_t v16;
  NSString *guardianFirstName;
  uint64_t v18;
  NSString *guardianLastName;
  uint64_t v20;
  NSNumber *guardianDSID;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKSecondaryPairedDeviceConfiguration;
  v5 = -[HKSecondaryPairedDeviceConfiguration init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    nanoRegistryDeviceUUID = v5->_nanoRegistryDeviceUUID;
    v5->_nanoRegistryDeviceUUID = (NSUUID *)v6;

    v5->_setupType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("setupType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateOfBirth"));
    v8 = objc_claimAutoreleasedReturnValue();
    dateOfBirth = v5->_dateOfBirth;
    v5->_dateOfBirth = (NSDateComponents *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstName"));
    v10 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastName"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
    v14 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guardianFirstName"));
    v16 = objc_claimAutoreleasedReturnValue();
    guardianFirstName = v5->_guardianFirstName;
    v5->_guardianFirstName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guardianLastName"));
    v18 = objc_claimAutoreleasedReturnValue();
    guardianLastName = v5->_guardianLastName;
    v5->_guardianLastName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("guardianDSID"));
    v20 = objc_claimAutoreleasedReturnValue();
    guardianDSID = v5->_guardianDSID;
    v5->_guardianDSID = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *nanoRegistryDeviceUUID;
  id v5;

  nanoRegistryDeviceUUID = self->_nanoRegistryDeviceUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", nanoRegistryDeviceUUID, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateOfBirth, CFSTR("dateOfBirth"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_setupType, CFSTR("setupType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstName, CFSTR("firstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastName, CFSTR("lastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dsid, CFSTR("dsid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_guardianFirstName, CFSTR("guardianFirstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_guardianLastName, CFSTR("guardianLastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_guardianDSID, CFSTR("guardianDSID"));

}

- (NSUUID)nanoRegistryDeviceUUID
{
  return self->_nanoRegistryDeviceUUID;
}

- (void)setNanoRegistryDeviceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)setupType
{
  return self->_setupType;
}

- (void)setSetupType:(unint64_t)a3
{
  self->_setupType = a3;
}

- (NSDateComponents)dateOfBirth
{
  return self->_dateOfBirth;
}

- (void)setDateOfBirth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)guardianFirstName
{
  return self->_guardianFirstName;
}

- (void)setGuardianFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)guardianLastName
{
  return self->_guardianLastName;
}

- (void)setGuardianLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)guardianDSID
{
  return self->_guardianDSID;
}

- (void)setGuardianDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)hashedDSID
{
  return self->_hashedDSID;
}

- (void)setHashedDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)guardianHashedDSID
{
  return self->_guardianHashedDSID;
}

- (void)setGuardianHashedDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardianHashedDSID, 0);
  objc_storeStrong((id *)&self->_hashedDSID, 0);
  objc_storeStrong((id *)&self->_guardianDSID, 0);
  objc_storeStrong((id *)&self->_guardianLastName, 0);
  objc_storeStrong((id *)&self->_guardianFirstName, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_nanoRegistryDeviceUUID, 0);
}

@end
