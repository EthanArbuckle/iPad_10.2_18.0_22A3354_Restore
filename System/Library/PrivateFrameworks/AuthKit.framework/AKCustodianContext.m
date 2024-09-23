@implementation AKCustodianContext

- (AKCustodianContext)initWithCoder:(id)a3
{
  id v4;
  AKCustodianContext *v5;
  uint64_t v6;
  NSUUID *custodianUUID;
  uint64_t v8;
  NSString *altDSID;
  uint64_t v10;
  NSData *wrappingKeyRKC;
  uint64_t v12;
  NSString *recordBuildVersion;
  uint64_t v14;
  NSString *ownerAppleID;
  uint64_t v16;
  NSString *ownerCustodianAltDSID;
  uint64_t v18;
  NSString *custodianSetupToken;
  uint64_t v20;
  NSString *pushToken;
  uint64_t v22;
  NSString *recoverySessionID;
  uint64_t v24;
  NSString *custodianRecoveryToken;
  uint64_t v26;
  NSData *aaData;
  uint64_t v28;
  NSData *idmsData;
  uint64_t v30;
  NSData *encryptedPRKC;
  uint64_t v32;
  NSString *recoveryStep;
  uint64_t v34;
  NSString *transactionID;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSArray *custodianUUIDs;
  uint64_t v41;
  NSArray *beneficiaryUUIDs;
  uint64_t v43;
  NSDate *lastDataSyncTimestamp;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSArray *custodianContacts;
  uint64_t v50;
  NSArray *beneficiaryContacts;

  v4 = a3;
  v5 = -[AKCustodianContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    custodianUUID = v5->_custodianUUID;
    v5->_custodianUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wrappingKeyRKC"));
    v10 = objc_claimAutoreleasedReturnValue();
    wrappingKeyRKC = v5->_wrappingKeyRKC;
    v5->_wrappingKeyRKC = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordBuildVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    recordBuildVersion = v5->_recordBuildVersion;
    v5->_recordBuildVersion = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ownerAppleID"));
    v14 = objc_claimAutoreleasedReturnValue();
    ownerAppleID = v5->_ownerAppleID;
    v5->_ownerAppleID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ownerCustodianAltDSID"));
    v16 = objc_claimAutoreleasedReturnValue();
    ownerCustodianAltDSID = v5->_ownerCustodianAltDSID;
    v5->_ownerCustodianAltDSID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianSetupToken"));
    v18 = objc_claimAutoreleasedReturnValue();
    custodianSetupToken = v5->_custodianSetupToken;
    v5->_custodianSetupToken = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pushToken"));
    v20 = objc_claimAutoreleasedReturnValue();
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recoverySessionID"));
    v22 = objc_claimAutoreleasedReturnValue();
    recoverySessionID = v5->_recoverySessionID;
    v5->_recoverySessionID = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianRecoveryToken"));
    v24 = objc_claimAutoreleasedReturnValue();
    custodianRecoveryToken = v5->_custodianRecoveryToken;
    v5->_custodianRecoveryToken = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_aaData"));
    v26 = objc_claimAutoreleasedReturnValue();
    aaData = v5->_aaData;
    v5->_aaData = (NSData *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_idmsData"));
    v28 = objc_claimAutoreleasedReturnValue();
    idmsData = v5->_idmsData;
    v5->_idmsData = (NSData *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_encryptedPRKC"));
    v30 = objc_claimAutoreleasedReturnValue();
    encryptedPRKC = v5->_encryptedPRKC;
    v5->_encryptedPRKC = (NSData *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recoveryStep"));
    v32 = objc_claimAutoreleasedReturnValue();
    recoveryStep = v5->_recoveryStep;
    v5->_recoveryStep = (NSString *)v32;

    v5->_ownerDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_ownerDevice"));
    v5->_clientErrorCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_errorCode"));
    v5->_cliMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_cliMode"));
    v5->__cliMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__cliMode"));
    v5->_notificationAction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_notificationAction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transactionID"));
    v34 = objc_claimAutoreleasedReturnValue();
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSString *)v34;

    v36 = (void *)MEMORY[0x1E0C99E60];
    v37 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("_custodianUUIDs"));
    v39 = objc_claimAutoreleasedReturnValue();
    custodianUUIDs = v5->_custodianUUIDs;
    v5->_custodianUUIDs = (NSArray *)v39;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v38, CFSTR("_beneficiaryUUIDs"));
    v41 = objc_claimAutoreleasedReturnValue();
    beneficiaryUUIDs = v5->_beneficiaryUUIDs;
    v5->_beneficiaryUUIDs = (NSArray *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastDataSyncTimestamp"));
    v43 = objc_claimAutoreleasedReturnValue();
    lastDataSyncTimestamp = v5->_lastDataSyncTimestamp;
    v5->_lastDataSyncTimestamp = (NSDate *)v43;

    v45 = (void *)MEMORY[0x1E0C99E60];
    v46 = objc_opt_class();
    objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("_custodianContacts"));
    v48 = objc_claimAutoreleasedReturnValue();
    custodianContacts = v5->_custodianContacts;
    v5->_custodianContacts = (NSArray *)v48;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("_beneficiaryContacts"));
    v50 = objc_claimAutoreleasedReturnValue();
    beneficiaryContacts = v5->_beneficiaryContacts;
    v5->_beneficiaryContacts = (NSArray *)v50;

    v5->_custodianSyncAction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCustodianSyncAction"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *custodianUUID;
  id v5;

  custodianUUID = self->_custodianUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", custodianUUID, CFSTR("_custodianUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappingKeyRKC, CFSTR("_wrappingKeyRKC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordBuildVersion, CFSTR("_recordBuildVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerAppleID, CFSTR("_ownerAppleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerCustodianAltDSID, CFSTR("_ownerCustodianAltDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianSetupToken, CFSTR("_custodianSetupToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushToken, CFSTR("_pushToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recoverySessionID, CFSTR("_recoverySessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianRecoveryToken, CFSTR("_custodianRecoveryToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_aaData, CFSTR("_aaData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idmsData, CFSTR("_idmsData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptedPRKC, CFSTR("_encryptedPRKC"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recoveryStep, CFSTR("_recoveryStep"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ownerDevice, CFSTR("_ownerDevice"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_clientErrorCode, CFSTR("_errorCode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cliMode, CFSTR("_cliMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->__cliMode, CFSTR("__cliMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationAction, CFSTR("_notificationAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionID, CFSTR("_transactionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianUUIDs, CFSTR("_custodianUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryUUIDs, CFSTR("_beneficiaryUUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastDataSyncTimestamp, CFSTR("_lastDataSyncTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianContacts, CFSTR("_custodianContacts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beneficiaryContacts, CFSTR("_beneficiaryContacts"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_custodianSyncAction, CFSTR("_isCustodianSyncAction"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSUUID copy](self->_custodianUUID, "copy");
  v6 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v5;

  v7 = -[NSString copy](self->_altDSID, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[NSData copy](self->_wrappingKeyRKC, "copy");
  v10 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v9;

  v11 = -[NSString copy](self->_recordBuildVersion, "copy");
  v12 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v11;

  v13 = -[NSString copy](self->_ownerAppleID, "copy");
  v14 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v13;

  v15 = -[NSString copy](self->_ownerCustodianAltDSID, "copy");
  v16 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v15;

  v17 = -[NSString copy](self->_custodianSetupToken, "copy");
  v18 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v17;

  v19 = -[NSString copy](self->_pushToken, "copy");
  v20 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v19;

  v21 = -[NSString copy](self->_recoverySessionID, "copy");
  v22 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v21;

  v23 = -[NSString copy](self->_custodianRecoveryToken, "copy");
  v24 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = v23;

  v25 = -[NSData copy](self->_aaData, "copy");
  v26 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = v25;

  v27 = -[NSData copy](self->_idmsData, "copy");
  v28 = *(void **)(v4 + 128);
  *(_QWORD *)(v4 + 128) = v27;

  v29 = -[NSData copy](self->_encryptedPRKC, "copy");
  v30 = *(void **)(v4 + 136);
  *(_QWORD *)(v4 + 136) = v29;

  v31 = -[NSString copy](self->_recoveryStep, "copy");
  v32 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = v31;

  *(_BYTE *)(v4 + 10) = self->_ownerDevice;
  *(_QWORD *)(v4 + 152) = self->_clientErrorCode;
  *(_BYTE *)(v4 + 9) = self->_cliMode;
  *(_BYTE *)(v4 + 8) = self->__cliMode;
  *(_QWORD *)(v4 + 160) = self->_notificationAction;
  v33 = -[NSString copy](self->_transactionID, "copy");
  v34 = *(void **)(v4 + 168);
  *(_QWORD *)(v4 + 168) = v33;

  v35 = -[NSArray copy](self->_custodianUUIDs, "copy");
  v36 = *(void **)(v4 + 176);
  *(_QWORD *)(v4 + 176) = v35;

  v37 = -[NSArray copy](self->_beneficiaryUUIDs, "copy");
  v38 = *(void **)(v4 + 184);
  *(_QWORD *)(v4 + 184) = v37;

  v39 = -[NSDate copy](self->_lastDataSyncTimestamp, "copy");
  v40 = *(void **)(v4 + 192);
  *(_QWORD *)(v4 + 192) = v39;

  v41 = -[NSArray copy](self->_custodianContacts, "copy");
  v42 = *(void **)(v4 + 200);
  *(_QWORD *)(v4 + 200) = v41;

  v43 = -[NSArray copy](self->_beneficiaryContacts, "copy");
  v44 = *(void **)(v4 + 208);
  *(_QWORD *)(v4 + 208) = v43;

  *(_BYTE *)(v4 + 11) = self->_custodianSyncAction;
  return (id)v4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> with \nCustodianUUID: %@ \naltDSID: %@ \nOwnerAppleID: %@ \nownerCustodianAltDSID: %@ \nwrappingKeyRKC: %@ \npushToken: %@ \nsessionID: %@ \ncustodianRecoveryToken: %@ \nrecoveryStep: %@ \ncliMode: %i \n custodianContacts: %@ \n beneficiaryContacts: %@ \n isCustodianSyncAction: %d \nrecordBuildVersion: %@"), objc_opt_class(), self, self->_custodianUUID, self->_altDSID, self->_ownerAppleID, self->_ownerCustodianAltDSID, self->_wrappingKeyRKC, self->_pushToken, self->_recoverySessionID, self->_custodianRecoveryToken, self->_recoveryStep, self->_cliMode, self->_custodianContacts, self->_beneficiaryContacts, self->_custodianSyncAction, self->_recordBuildVersion);
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (BOOL)cliMode
{
  return self->__cliMode;
}

- (void)setCliMode:(BOOL)a3
{
  self->__cliMode = a3;
}

- (BOOL)_cliMode
{
  return self->_cliMode;
}

- (void)set_cliMode:(BOOL)a3
{
  self->_cliMode = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)_identityToken
{
  return self->_identityToken;
}

- (void)_setIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)_heartbeatToken
{
  return self->_heartbeatToken;
}

- (void)_setHeartbeatToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)ownerAppleID
{
  return self->_ownerAppleID;
}

- (void)setOwnerAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)ownerCustodianAltDSID
{
  return self->_ownerCustodianAltDSID;
}

- (void)setOwnerCustodianAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSUUID)custodianUUID
{
  return self->_custodianUUID;
}

- (void)setCustodianUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)wrappingKeyRKC
{
  return self->_wrappingKeyRKC;
}

- (void)setWrappingKeyRKC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)recordBuildVersion
{
  return self->_recordBuildVersion;
}

- (void)setRecordBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)custodianSetupToken
{
  return self->_custodianSetupToken;
}

- (void)setCustodianSetupToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)recoverySessionID
{
  return self->_recoverySessionID;
}

- (void)setRecoverySessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)custodianRecoveryToken
{
  return self->_custodianRecoveryToken;
}

- (void)setCustodianRecoveryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSData)aaData
{
  return self->_aaData;
}

- (void)setAaData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSData)idmsData
{
  return self->_idmsData;
}

- (void)setIdmsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSData)encryptedPRKC
{
  return self->_encryptedPRKC;
}

- (void)setEncryptedPRKC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)recoveryStep
{
  return self->_recoveryStep;
}

- (void)setRecoveryStep:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)ownerDevice
{
  return self->_ownerDevice;
}

- (void)setOwnerDevice:(BOOL)a3
{
  self->_ownerDevice = a3;
}

- (int64_t)clientErrorCode
{
  return self->_clientErrorCode;
}

- (void)setClientErrorCode:(int64_t)a3
{
  self->_clientErrorCode = a3;
}

- (int64_t)notificationAction
{
  return self->_notificationAction;
}

- (void)setNotificationAction:(int64_t)a3
{
  self->_notificationAction = a3;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)custodianUUIDs
{
  return self->_custodianUUIDs;
}

- (void)setCustodianUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)beneficiaryUUIDs
{
  return self->_beneficiaryUUIDs;
}

- (void)setBeneficiaryUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSDate)lastDataSyncTimestamp
{
  return self->_lastDataSyncTimestamp;
}

- (void)setLastDataSyncTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSArray)custodianContacts
{
  return self->_custodianContacts;
}

- (void)setCustodianContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)beneficiaryContacts
{
  return self->_beneficiaryContacts;
}

- (void)setBeneficiaryContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)isCustodianSyncAction
{
  return self->_custodianSyncAction;
}

- (void)setCustodianSyncAction:(BOOL)a3
{
  self->_custodianSyncAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beneficiaryContacts, 0);
  objc_storeStrong((id *)&self->_custodianContacts, 0);
  objc_storeStrong((id *)&self->_lastDataSyncTimestamp, 0);
  objc_storeStrong((id *)&self->_beneficiaryUUIDs, 0);
  objc_storeStrong((id *)&self->_custodianUUIDs, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_recoveryStep, 0);
  objc_storeStrong((id *)&self->_encryptedPRKC, 0);
  objc_storeStrong((id *)&self->_idmsData, 0);
  objc_storeStrong((id *)&self->_aaData, 0);
  objc_storeStrong((id *)&self->_custodianRecoveryToken, 0);
  objc_storeStrong((id *)&self->_recoverySessionID, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_custodianSetupToken, 0);
  objc_storeStrong((id *)&self->_recordBuildVersion, 0);
  objc_storeStrong((id *)&self->_wrappingKeyRKC, 0);
  objc_storeStrong((id *)&self->_custodianUUID, 0);
  objc_storeStrong((id *)&self->_ownerCustodianAltDSID, 0);
  objc_storeStrong((id *)&self->_ownerAppleID, 0);
  objc_storeStrong((id *)&self->_heartbeatToken, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
