@implementation CKUserIdentityLookupInfo

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKUserIdentityLookupInfo;
  return -[CKUserIdentityLookupInfo init](&v3, sel_init);
}

- (CKUserIdentityLookupInfo)initWithEmailAddress:(NSString *)emailAddress
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKUserIdentityLookupInfo *inited;
  uint64_t v13;
  NSString *v14;
  void *v16;
  const char *v17;

  v8 = emailAddress;
  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CKUserIdentityLookupInfo.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress != nil"));

  }
  inited = (CKUserIdentityLookupInfo *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    v13 = objc_msgSend_copy(v8, v9, v10, v11);
    v14 = inited->_emailAddress;
    inited->_emailAddress = (NSString *)v13;

    inited->_shouldReportMissingIdentity = 1;
  }

  return inited;
}

- (CKUserIdentityLookupInfo)initWithUserRecordID:(CKRecordID *)userRecordID
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKRecordID *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKUserIdentityLookupInfo *inited;
  uint64_t v13;
  CKRecordID *v14;
  void *v16;
  const char *v17;

  v8 = userRecordID;
  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CKUserIdentityLookupInfo.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordID != nil"));

  }
  inited = (CKUserIdentityLookupInfo *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    v13 = objc_msgSend_copy(v8, v9, v10, v11);
    v14 = inited->_userRecordID;
    inited->_userRecordID = (CKRecordID *)v13;

    inited->_shouldReportMissingIdentity = 1;
  }

  return inited;
}

- (CKUserIdentityLookupInfo)initWithPhoneNumber:(NSString *)phoneNumber
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKUserIdentityLookupInfo *inited;
  uint64_t v13;
  NSString *v14;
  void *v16;
  const char *v17;

  v8 = phoneNumber;
  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CKUserIdentityLookupInfo.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phoneNumber != nil"));

  }
  inited = (CKUserIdentityLookupInfo *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    v13 = objc_msgSend_copy(v8, v9, v10, v11);
    v14 = inited->_phoneNumber;
    inited->_phoneNumber = (NSString *)v13;

    inited->_shouldReportMissingIdentity = 1;
  }

  return inited;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v3 = (void *)objc_opt_new();
  objc_msgSend_emailAddress(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, (uint64_t)CFSTR("emailAddress"));

  objc_msgSend_phoneNumber(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, (uint64_t)CFSTR("phoneNumber"));

  objc_msgSend_userRecordID(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, (uint64_t)CFSTR("userRecordID"));

  objc_msgSend_properties(v3, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v22;
}

- (int64_t)lookupField
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  objc_msgSend_emailAddress(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 1;
  objc_msgSend_userRecordID(self, v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    return 2;
  objc_msgSend_phoneNumber(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    return 3;
  else
    return 0;
}

- (id)lookupValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend_emailAddress(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    v10 = v5;
  }
  else
  {
    objc_msgSend_userRecordID(self, v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    if (v11)
    {
      v10 = v11;
    }
    else
    {
      objc_msgSend_phoneNumber(self, v12, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      if (v16)
        v17 = v16;

    }
  }

  return v10;
}

- (void)_stripPersonalInfo
{
  uint64_t v2;
  uint64_t v4;

  objc_msgSend_setEmailAddress_(self, a2, 0, v2);
  MEMORY[0x1E0DE7D20](self, sel_setPhoneNumber_, 0, v4);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKUserIdentityLookupInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKUserIdentityLookupInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (id)ckShortDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  __CFString *v22;

  objc_msgSend_emailAddress(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_phoneNumber(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userRecordID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v5, v14, v15, v16))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v17, (uint64_t)CFSTR("email=%@"), v19, v5);
  }
  else if (objc_msgSend_length(v9, v17, v18, v19))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("phone=%@"), v21, v9);
  }
  else
  {
    if (!v13)
    {
      v22 = CFSTR("empty");
      goto LABEL_8;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("userID=%@"), v21, v13);
  }
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v22;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v29;
  const char *v30;

  v5 = a5;
  v6 = a4;
  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], a2, 1, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_emailAddress(self, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_phoneNumber(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userRecordID(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v12, v21, v22, v23))
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v24, (uint64_t)CFSTR("email"), (uint64_t)v12);
    }
    else if (objc_msgSend_length(v16, v24, v25, v26))
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v27, (uint64_t)CFSTR("phone"), (uint64_t)v16);
    }
    else if (v20)
    {
      if (v5)
      {
        objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v20, v27, 1, 1, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v30, (uint64_t)CFSTR("userID"), (uint64_t)v29);

      }
      else
      {
        objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v27, (uint64_t)CFSTR("userID"), (uint64_t)v20);
      }
    }

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *inited;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;

  v4 = objc_alloc((Class)objc_opt_class());
  inited = (_QWORD *)objc_msgSend_initInternal(v4, v5, v6, v7);
  objc_msgSend_emailAddress(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_copy(v12, v13, v14, v15);
  v17 = (void *)inited[2];
  inited[2] = v16;

  objc_msgSend_userRecordID(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_copy(v21, v22, v23, v24);
  v26 = (void *)inited[4];
  inited[4] = v25;

  objc_msgSend_phoneNumber(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_copy(v30, v31, v32, v33);
  v35 = (void *)inited[3];
  inited[3] = v34;

  objc_msgSend_encryptedPersonalInfo(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_copy(v39, v40, v41, v42);
  v44 = (void *)inited[5];
  inited[5] = v43;

  return inited;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  objc_msgSend_emailAddress(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_userRecordID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_phoneNumber(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_emailAddress(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emailAddress(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (CKObjectsAreBothNilOrEqual(v9, v13))
    {
      objc_msgSend_phoneNumber(self, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_phoneNumber(v5, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (CKObjectsAreBothNilOrEqual(v17, v21))
      {
        objc_msgSend_userRecordID(self, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_userRecordID(v5, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = CKObjectsAreBothNilOrEqual(v25, v29);

      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t shouldReportMissingIdentity;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  id v33;

  v33 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_phoneNumber(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v33, v9, (uint64_t)v8, (uint64_t)CFSTR("PhoneNumber"));

  objc_msgSend_emailAddress(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v33, v14, (uint64_t)v13, (uint64_t)CFSTR("EmailAddress"));

  objc_msgSend_userRecordID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v33, v19, (uint64_t)v18, (uint64_t)CFSTR("RecordID"));

  if ((objc_msgSend_ck_isCodingForCKSQLiteDatabase(v33, v20, v21, v22) & 1) == 0)
  {
    shouldReportMissingIdentity = objc_msgSend_shouldReportMissingIdentity(self, v23, v24, v25);
    objc_msgSend_encodeBool_forKey_(v33, v27, shouldReportMissingIdentity, (uint64_t)CFSTR("ReportsMissing"));
    objc_msgSend_encryptedPersonalInfo(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v33, v32, (uint64_t)v31, (uint64_t)CFSTR("EncryptedPersonalInfo"));

  }
  objc_autoreleasePoolPop(v4);

}

- (CKUserIdentityLookupInfo)initWithCoder:(id)a3
{
  id v4;
  CKUserIdentityLookupInfo *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *emailAddress;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *phoneNumber;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  CKRecordID *userRecordID;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSData *encryptedPersonalInfo;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKUserIdentityLookupInfo;
  v5 = -[CKUserIdentityLookupInfo init](&v28, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("EmailAddress"));
    v8 = objc_claimAutoreleasedReturnValue();
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("PhoneNumber"));
    v12 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("RecordID"));
    v16 = objc_claimAutoreleasedReturnValue();
    userRecordID = v5->_userRecordID;
    v5->_userRecordID = (CKRecordID *)v16;

    if ((objc_msgSend_ck_isDecodingForCKSQLiteDatabase(v4, v18, v19, v20) & 1) == 0)
    {
      v5->_shouldReportMissingIdentity = objc_msgSend_decodeBoolForKey_(v4, v21, (uint64_t)CFSTR("ReportsMissing"), v22);
      v23 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("EncryptedPersonalInfo"));
      v25 = objc_claimAutoreleasedReturnValue();
      encryptedPersonalInfo = v5->_encryptedPersonalInfo;
      v5->_encryptedPersonalInfo = (NSData *)v25;

    }
  }

  return v5;
}

+ (NSArray)lookupInfosWithEmails:(NSArray *)emails
{
  uint64_t v3;

  return (NSArray *)objc_msgSend_CKMap_(emails, a2, (uint64_t)&unk_1E1F58678, v3);
}

+ (NSArray)lookupInfosWithRecordIDs:(NSArray *)recordIDs
{
  uint64_t v3;

  return (NSArray *)objc_msgSend_CKMap_(recordIDs, a2, (uint64_t)&unk_1E1F594B8, v3);
}

+ (NSArray)lookupInfosWithPhoneNumbers:(NSArray *)phoneNumbers
{
  uint64_t v3;

  return (NSArray *)objc_msgSend_CKMap_(phoneNumbers, a2, (uint64_t)&unk_1E1F59538, v3);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  id v19;

  v4 = a3;
  objc_msgSend_emailAddress(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("emailAddress"), (uint64_t)v8, 1);

  objc_msgSend_phoneNumber(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("phoneNumber"), (uint64_t)v13, 1);

  objc_msgSend_userRecordID(self, v15, v16, v17);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v18, (uint64_t)CFSTR("userRecordID"), (uint64_t)v19, 0);

}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (CKRecordID)userRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserRecordID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldReportMissingIdentity
{
  return self->_shouldReportMissingIdentity;
}

- (void)setShouldReportMissingIdentity:(BOOL)a3
{
  self->_shouldReportMissingIdentity = a3;
}

- (NSData)encryptedPersonalInfo
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEncryptedPersonalInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedPersonalInfo, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

@end
