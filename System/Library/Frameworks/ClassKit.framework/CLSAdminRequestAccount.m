@implementation CLSAdminRequestAccount

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSAdminRequestAccount;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSAdminRequestAccount)initWithAdminRequestID:(id)a3 personID:(id)a4
{
  id v6;
  id v7;
  CLSAdminRequestAccount *v8;
  const char *v9;
  CLSAdminRequestAccount *v10;
  uint64_t v11;
  NSArray *requestedLocationIDs;
  uint64_t v13;
  NSArray *conflictingPersonIDs;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CLSAdminRequestAccount;
  v8 = -[CLSObject _init](&v16, sel__init);
  v10 = v8;
  if (v8)
  {
    objc_msgSend_setParentObjectID_(v8, v9, (uint64_t)v6);
    objc_storeStrong((id *)&v10->_personID, a4);
    v10->_requestedRoleType = 0;
    v11 = objc_opt_new();
    requestedLocationIDs = v10->_requestedLocationIDs;
    v10->_requestedLocationIDs = (NSArray *)v11;

    v13 = objc_opt_new();
    conflictingPersonIDs = v10->_conflictingPersonIDs;
    v10->_conflictingPersonIDs = (NSArray *)v13;

  }
  return v10;
}

- (CLSAdminRequestAccount)initWithAdminRequestID:(id)a3 personID:(id)a4 roleType:(int64_t)a5 atLocationIDs:(id)a6
{
  id v10;
  id v11;
  const char *v12;
  CLSAdminRequestAccount *v13;
  const char *v14;
  CLSAdminRequestAccount *v15;
  const char *v16;
  uint64_t v17;
  NSArray *requestedLocationIDs;

  v10 = a3;
  v11 = a6;
  v13 = (CLSAdminRequestAccount *)objc_msgSend_initWithAdminRequestID_personID_(self, v12, (uint64_t)v10, a4);
  v15 = v13;
  if (v13)
  {
    objc_msgSend_setParentObjectID_(v13, v14, (uint64_t)v10);
    v15->_requestedRoleType = a5;
    objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v16, (uint64_t)v11);
    v17 = objc_claimAutoreleasedReturnValue();
    requestedLocationIDs = v15->_requestedLocationIDs;
    v15->_requestedLocationIDs = (NSArray *)v17;

  }
  return v15;
}

- (CLSAdminRequestAccount)initWithAdminRequestID:(id)a3 forAccountWithGivenName:(id)a4 middleName:(id)a5 familyName:(id)a6 emailAddress:(id)a7 appleID:(id)a8 personNumber:(id)a9 roleType:(int64_t)a10 atLocationIDs:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  CLSAdminRequestAccount *v24;
  CLSPerson *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  CLSPerson *accountPersonInfo;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSString *personID;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v24 = (CLSAdminRequestAccount *)objc_msgSend_initWithAdminRequestID_personID_roleType_atLocationIDs_(self, v23, (uint64_t)a3, &stru_1E974C8A0, a10, a11);
  if (v24)
  {
    v25 = [CLSPerson alloc];
    v28 = objc_msgSend__init(v25, v26, v27);
    accountPersonInfo = v24->_accountPersonInfo;
    v24->_accountPersonInfo = (CLSPerson *)v28;

    objc_msgSend_setGivenName_(v24->_accountPersonInfo, v30, (uint64_t)v17);
    objc_msgSend_setMiddleName_(v24->_accountPersonInfo, v31, (uint64_t)v18);
    objc_msgSend_setFamilyName_(v24->_accountPersonInfo, v32, (uint64_t)v19);
    objc_msgSend_setEmailAddress_(v24->_accountPersonInfo, v33, (uint64_t)v20);
    objc_msgSend_setPersonNumber_(v24->_accountPersonInfo, v34, (uint64_t)v22);
    if (v21)
      objc_msgSend_setAppleID_(v24->_accountPersonInfo, v35, (uint64_t)v21);
    else
      objc_msgSend_setAppleID_(v24->_accountPersonInfo, v35, (uint64_t)CFSTR("🆕🆔"));
    objc_msgSend_setSourceType_(v24->_accountPersonInfo, v36, 3);
    objc_msgSend_setProgressTrackingAllowed_(v24->_accountPersonInfo, v37, a10 == 6);
    objc_msgSend_setIsSearchable_(v24->_accountPersonInfo, v38, 1);
    objc_msgSend_objectID(v24, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParentObjectID_(v24->_accountPersonInfo, v42, (uint64_t)v41);

    objc_msgSend_objectID(v24->_accountPersonInfo, v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    personID = v24->_personID;
    v24->_personID = (NSString *)v45;

  }
  return v24;
}

- (void)setRequestedRole:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *requestedRoleID;
  BOOL v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  objc_msgSend_lock(self, v4, v5);
  objc_msgSend_objectID(v16, v6, v7);
  v10 = objc_claimAutoreleasedReturnValue();
  requestedRoleID = self->_requestedRoleID;
  if ((unint64_t)requestedRoleID | v10)
  {
    if (requestedRoleID)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12 || (objc_msgSend_isEqualToString_(requestedRoleID, v8, v10) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_requestedRoleID, (id)v10);
      objc_msgSend_setModified_(self, v13, 1);
    }
  }
  objc_msgSend_unlock(self, v8, v9);

  self->_requestedRoleType = objc_msgSend_type(v16, v14, v15);
}

- (void)setTemporaryPassword:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *temporaryPassword;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  temporaryPassword = self->_temporaryPassword;
  v12 = (id)v8;
  if (v8 | (unint64_t)temporaryPassword
    && (!v8 || !temporaryPassword || (objc_msgSend_isEqualToString_(temporaryPassword, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_temporaryPassword, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)mergeWithObject:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLSAdminRequestAccount;
  -[CLSObject mergeWithObject:](&v22, sel_mergeWithObject_, v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_opt_class();
  objc_msgSend__propertyNames(v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v23, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v11, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v17, (uint64_t)v16, v15);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v18, v23, 16);
    }
    while (v12);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  objc_msgSend_parentObjectID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_copy(v10, v11, v12);
  objc_msgSend_personID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_copy(v16, v17, v18);
  v21 = (void *)objc_msgSend_initWithAdminRequestID_personID_(v7, v20, (uint64_t)v13, v19);

  v24 = objc_msgSend_status(self, v22, v23);
  objc_msgSend_setStatus_(v21, v25, v24);
  objc_msgSend_requestedRoleID(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRequestedRoleID_(v21, v29, (uint64_t)v28);

  v32 = objc_msgSend_requestedRoleType(self, v30, v31);
  objc_msgSend_setRequestedRoleType_(v21, v33, v32);
  objc_msgSend_requestedLocationIDs(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend_copy(v36, v37, v38);
  objc_msgSend_setRequestedLocationIDs_(v21, v40, (uint64_t)v39);

  objc_msgSend_temporaryPassword(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend_copy(v43, v44, v45);
  objc_msgSend_setTemporaryPassword_(v21, v47, (uint64_t)v46);

  objc_msgSend_verificationCode(self, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend_copy(v50, v51, v52);
  objc_msgSend_setVerificationCode_(v21, v54, (uint64_t)v53);

  objc_msgSend_conflictingPersonIDs(self, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend_copy(v57, v58, v59);
  objc_msgSend_setConflictingPersonIDs_(v21, v61, (uint64_t)v60);

  objc_msgSend_accountPersonInfo(self, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend_accountPersonInfo(self, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)objc_msgSend_copy(v67, v68, v69);
    objc_msgSend_setAccountPersonInfo_(v21, v71, (uint64_t)v70);

  }
  return v21;
}

- (CLSAdminRequestAccount)initWithCoder:(id)a3
{
  id v4;
  CLSAdminRequestAccount *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *personID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  CLSPerson *accountPersonInfo;
  id v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSArray *requestedLocationIDs;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSString *requestedRoleID;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSString *temporaryPassword;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSString *verificationCode;
  const char *v35;
  uint64_t v36;
  NSArray *conflictingPersonIDs;
  const char *v38;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CLSAdminRequestAccount;
  v5 = -[CLSObject initWithCoder:](&v40, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("personID"));
    v8 = objc_claimAutoreleasedReturnValue();
    personID = v5->_personID;
    v5->_personID = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("accountPersonInfo"));
    v12 = objc_claimAutoreleasedReturnValue();
    accountPersonInfo = v5->_accountPersonInfo;
    v5->_accountPersonInfo = (CLSPerson *)v12;

    v14 = objc_alloc(MEMORY[0x1E0C99E60]);
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v18 = (void *)objc_msgSend_initWithObjects_(v14, v17, v15, v16, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v18, CFSTR("requestedLocationIDs"));
    v20 = objc_claimAutoreleasedReturnValue();
    requestedLocationIDs = v5->_requestedLocationIDs;
    v5->_requestedLocationIDs = (NSArray *)v20;

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, CFSTR("requestedRoleID"));
    v24 = objc_claimAutoreleasedReturnValue();
    requestedRoleID = v5->_requestedRoleID;
    v5->_requestedRoleID = (NSString *)v24;

    v5->_requestedRoleType = objc_msgSend_decodeIntegerForKey_(v4, v26, (uint64_t)CFSTR("requestedRoleType"));
    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, CFSTR("temporaryPassword"));
    v29 = objc_claimAutoreleasedReturnValue();
    temporaryPassword = v5->_temporaryPassword;
    v5->_temporaryPassword = (NSString *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, CFSTR("verificationCode"));
    v33 = objc_claimAutoreleasedReturnValue();
    verificationCode = v5->_verificationCode;
    v5->_verificationCode = (NSString *)v33;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v35, (uint64_t)v18, CFSTR("conflictingPersonIDs"));
    v36 = objc_claimAutoreleasedReturnValue();
    conflictingPersonIDs = v5->_conflictingPersonIDs;
    v5->_conflictingPersonIDs = (NSArray *)v36;

    v5->_status = objc_msgSend_decodeIntegerForKey_(v4, v38, (uint64_t)CFSTR("status"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSAdminRequestAccount;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_personID, CFSTR("personID"), v14.receiver, v14.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_accountPersonInfo, CFSTR("accountPersonInfo"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_requestedRoleID, CFSTR("requestedRoleID"));
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_requestedRoleType, CFSTR("requestedRoleType"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_requestedLocationIDs, CFSTR("requestedLocationIDs"));
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_temporaryPassword, CFSTR("temporaryPassword"));
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_verificationCode, CFSTR("verificationCode"));
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_conflictingPersonIDs, CFSTR("conflictingPersonIDs"));
  objc_msgSend_encodeInteger_forKey_(v4, v13, self->_status, CFSTR("status"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CLSAdminRequestAccount;
  -[CLSObject dictionaryRepresentation](&v18, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_personID, CFSTR("personID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_accountPersonInfo, CFSTR("accountPersonInfo"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)self->_requestedRoleID, CFSTR("requestedRoleID"));
  objc_msgSend_stringForRoleType_(CLSRole, v7, self->_requestedRoleType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, CFSTR("requestedRoleType"));

  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)self->_requestedLocationIDs, CFSTR("requestedLocationIDs"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)self->_temporaryPassword, CFSTR("temporaryPassword"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)self->_verificationCode, CFSTR("verificationCode"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)self->_conflictingPersonIDs, CFSTR("conflictingPersonIDs"));
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v14, self->_status);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)v15, CFSTR("status"));

  return v3;
}

+ (id)_propertyNames
{
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("personID");
  v3[1] = CFSTR("accountPersonInfo");
  v3[2] = CFSTR("requestedRoleID");
  v3[3] = CFSTR("requestedRoleType");
  v3[4] = CFSTR("requestedLocationIDs");
  v3[5] = CFSTR("temporaryPassword");
  v3[6] = CFSTR("verificationCode");
  v3[7] = CFSTR("conflictingPersonIDs");
  v3[8] = CFSTR("status");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CLSPerson)accountPersonInfo
{
  return self->_accountPersonInfo;
}

- (void)setAccountPersonInfo:(id)a3
{
  objc_storeStrong((id *)&self->_accountPersonInfo, a3);
}

- (NSString)requestedRoleID
{
  return self->_requestedRoleID;
}

- (void)setRequestedRoleID:(id)a3
{
  objc_storeStrong((id *)&self->_requestedRoleID, a3);
}

- (int64_t)requestedRoleType
{
  return self->_requestedRoleType;
}

- (void)setRequestedRoleType:(int64_t)a3
{
  self->_requestedRoleType = a3;
}

- (NSArray)requestedLocationIDs
{
  return self->_requestedLocationIDs;
}

- (void)setRequestedLocationIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)temporaryPassword
{
  return self->_temporaryPassword;
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)conflictingPersonIDs
{
  return self->_conflictingPersonIDs;
}

- (void)setConflictingPersonIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictingPersonIDs, 0);
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_temporaryPassword, 0);
  objc_storeStrong((id *)&self->_requestedLocationIDs, 0);
  objc_storeStrong((id *)&self->_requestedRoleID, 0);
  objc_storeStrong((id *)&self->_accountPersonInfo, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

@end
