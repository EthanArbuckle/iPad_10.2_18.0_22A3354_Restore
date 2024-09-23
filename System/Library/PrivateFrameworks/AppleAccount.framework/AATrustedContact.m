@implementation AATrustedContact

- (AATrustedContact)initWithID:(id)a3 status:(int64_t)a4 handle:(id)a5 firstName:(id)a6 lastName:(id)a7 displayName:(id)a8 isAcceptedAndShared:(BOOL)a9 isIdMSConfirmed:(BOOL)a10 preflightStatus:(int64_t)a11 otCustodianID:(id)a12 keyCreatedOnBuild:(id)a13 repairDate:(id)a14 repairCount:(unint64_t)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  AATrustedContact *v27;
  AATrustedContact *v28;
  id v31;
  id obj;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v21 = a3;
  v31 = a5;
  v22 = a5;
  obj = a6;
  v23 = a6;
  v33 = a7;
  v24 = a7;
  v34 = a8;
  v36 = a8;
  v25 = a12;
  v26 = a13;
  v35 = a14;
  v37.receiver = self;
  v37.super_class = (Class)AATrustedContact;
  v27 = -[AATrustedContact init](&v37, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_custodianID, a3);
    v28->_status = a4;
    objc_storeStrong((id *)&v28->_handle, v31);
    objc_storeStrong((id *)&v28->_firstName, obj);
    objc_storeStrong((id *)&v28->_lastName, v33);
    objc_storeStrong((id *)&v28->_displayName, v34);
    v28->_isAcceptedAndShared = a9;
    v28->_isIdMSConfirmed = a10;
    v28->_preflightStatus = a11;
    objc_storeStrong((id *)&v28->_otCustodianID, a12);
    objc_storeStrong((id *)&v28->_keyCreatedOnBuild, a13);
    objc_storeStrong((id *)&v28->_repairDate, a14);
    v28->_repairCount = a15;
  }

  return v28;
}

- (AATrustedContact)initWithCoder:(id)a3
{
  id v4;
  AATrustedContact *v5;
  uint64_t v6;
  NSUUID *custodianID;
  uint64_t v8;
  NSString *handle;
  uint64_t v10;
  NSString *firstName;
  uint64_t v12;
  NSString *lastName;
  uint64_t v14;
  NSString *displayName;
  uint64_t v16;
  NSUUID *otCustodianID;
  uint64_t v18;
  NSString *keyCreatedOnBuild;
  uint64_t v20;
  NSString *repairDate;

  v4 = a3;
  v5 = -[AATrustedContact init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianID"));
    v6 = objc_claimAutoreleasedReturnValue();
    custodianID = v5->_custodianID;
    v5->_custodianID = (NSUUID *)v6;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handle"));
    v8 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_firstName"));
    v10 = objc_claimAutoreleasedReturnValue();
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastName"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayName"));
    v14 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v14;

    v5->_isAcceptedAndShared = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isAcceptedAndShared"));
    v5->_isIdMSConfirmed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isIdMSConfirmed"));
    v5->_preflightStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_preflightStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_otCustodianID"));
    v16 = objc_claimAutoreleasedReturnValue();
    otCustodianID = v5->_otCustodianID;
    v5->_otCustodianID = (NSUUID *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_keyCreatedOnBuild"));
    v18 = objc_claimAutoreleasedReturnValue();
    keyCreatedOnBuild = v5->_keyCreatedOnBuild;
    v5->_keyCreatedOnBuild = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_repairDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    repairDate = v5->_repairDate;
    v5->_repairDate = (NSString *)v20;

    v5->_repairCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_repairCount"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *custodianID;
  id v5;

  custodianID = self->_custodianID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", custodianID, CFSTR("_custodianID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("_status"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("_handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_firstName, CFSTR("_firstName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastName, CFSTR("_lastName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("_displayName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAcceptedAndShared, CFSTR("_isAcceptedAndShared"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isIdMSConfirmed, CFSTR("_isIdMSConfirmed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_preflightStatus, CFSTR("_preflightStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_otCustodianID, CFSTR("_otCustodianID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyCreatedOnBuild, CFSTR("_keyCreatedOnBuild"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_repairDate, CFSTR("_repairDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_repairCount, CFSTR("_repairCount"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
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

  v4 = objc_opt_new();
  v5 = -[NSUUID copy](self->_custodianID, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  *(_QWORD *)(v4 + 24) = self->_status;
  v7 = -[NSString copy](self->_handle, "copy");
  v8 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v7;

  v9 = -[NSString copy](self->_firstName, "copy");
  v10 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v9;

  v11 = -[NSString copy](self->_lastName, "copy");
  v12 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v11;

  v13 = -[NSString copy](self->_displayName, "copy");
  v14 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v13;

  *(_BYTE *)(v4 + 8) = self->_isAcceptedAndShared;
  *(_BYTE *)(v4 + 9) = self->_isIdMSConfirmed;
  *(_QWORD *)(v4 + 64) = self->_preflightStatus;
  objc_storeStrong((id *)(v4 + 72), self->_otCustodianID);
  objc_storeStrong((id *)(v4 + 80), self->_keyCreatedOnBuild);
  objc_storeStrong((id *)(v4 + 88), self->_repairDate);
  *(_QWORD *)(v4 + 96) = self->_repairCount;
  return (id)v4;
}

- (NSUUID)custodianID
{
  return self->_custodianID;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isAcceptedAndShared
{
  return self->_isAcceptedAndShared;
}

- (BOOL)isIdMSConfirmed
{
  return self->_isIdMSConfirmed;
}

- (int64_t)preflightStatus
{
  return self->_preflightStatus;
}

- (NSUUID)otCustodianID
{
  return self->_otCustodianID;
}

- (NSString)keyCreatedOnBuild
{
  return self->_keyCreatedOnBuild;
}

- (NSString)repairDate
{
  return self->_repairDate;
}

- (unint64_t)repairCount
{
  return self->_repairCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairDate, 0);
  objc_storeStrong((id *)&self->_keyCreatedOnBuild, 0);
  objc_storeStrong((id *)&self->_otCustodianID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_custodianID, 0);
}

@end
