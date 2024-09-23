@implementation CKAccountInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsDeviceToDeviceEncryption
{
  uint64_t v2;
  uint64_t v3;

  return ((unint64_t)objc_msgSend_deviceToDeviceEncryptionAvailability(self, a2, v2, v3) >> 1) & 1;
}

- (CKAccountInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKAccountInfo *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKAccountInfo;
  v7 = -[CKAccountInfo init](&v25, sel_init);
  if (v7)
  {
    v7->_accountStatus = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("AccountStatus"), v6);
    v7->_accountPartition = objc_msgSend_decodeIntegerForKey_(v4, v8, (uint64_t)CFSTR("AccountPartition"), v9);
    v7->_bypassPCSEncryption = objc_msgSend_decodeBoolForKey_(v4, v10, (uint64_t)CFSTR("BypassPCSEncryption"), v11);
    v7->_deviceToDeviceEncryptionAvailability = objc_msgSend_decodeIntegerForKey_(v4, v12, (uint64_t)CFSTR("DeviceToDeviceEncryptionAvailability"), v13);
    v7->_hasValidCredentials = objc_msgSend_decodeBoolForKey_(v4, v14, (uint64_t)CFSTR("HasValidCredentials"), v15);
    v7->_validationCounter = objc_msgSend_decodeIntegerForKey_(v4, v16, (uint64_t)CFSTR("AccountInfoValidationCounter"), v17);
    v7->_walrusStatus = objc_msgSend_decodeIntegerForKey_(v4, v18, (uint64_t)CFSTR("WalrusStatus"), v19);
    v7->_accountAccessAuthorization = objc_msgSend_decodeIntegerForKey_(v4, v20, (uint64_t)CFSTR("AccountAccessAuthorization"), v21);
    if (!v7->_accountPartition)
      v7->_accountPartition = 1;
    v7->_needsToVerifyTerms = objc_msgSend_decodeBoolForKey_(v4, v22, (uint64_t)CFSTR("NeedsToVerifyTerms"), v23);
  }

  return v7;
}

- (void)setIsFromCache:(BOOL)a3
{
  self->_isFromCache = a3;
}

- (void)setAsCachedAccountInfoForSetupInfoHash:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKAccountInfo *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uid_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  CKAccountInfo *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (byte_1EDF6A0E0)
  {
    objc_opt_class();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    v36 = 0;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v6, (uint64_t)self, 1, &v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (CKAccountInfo *)v36;
    if (v11)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v12 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v11;
        _os_log_error_impl(&dword_18A5C5000, v12, OS_LOG_TYPE_ERROR, "Failed to archive account info cache: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v8, v9, v10);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v35, v13, (uint64_t)CFSTR("CloudKitAccountInfoCache"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend_mutableCopy(v15, v16, v17, v18);
      if (!v20)
        v20 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKey_(v20, v19, (uint64_t)v7, (uint64_t)v4);
      v21 = v20;
      objc_opt_self();
      objc_opt_class();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v22);
      v26 = objc_msgSend_copy(v21, v23, v24, v25);
      v27 = (void *)qword_1ECD96A68;
      qword_1ECD96A68 = v26;

      v28 = geteuid();
      if (v28 == 501 || !v28)
      {
        objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v32, v33, qword_1ECD96A68, (uint64_t)CFSTR("CloudKitAccountInfoCache"));

      }
      objc_sync_exit(v22);

      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v34 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = self;
        _os_log_impl(&dword_18A5C5000, v34, OS_LOG_TYPE_INFO, "Set cached account info: %@", buf, 0xCu);
      }

    }
    objc_sync_exit(v5);

  }
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  unint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  int64_t accountAccessAuthorization;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 8, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_msgSend_accountStatus(self, v6, v7, v8);
  CKStringFromAccountStatus(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("accountStatus=%@"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v14, (uint64_t)v13, v15);

  v16 = (void *)MEMORY[0x1E0CB3940];
  v20 = objc_msgSend_accountPartition(self, v17, v18, v19);
  v23 = CFSTR("Unknown Partition Type");
  if (v20 == 1)
    v23 = CFSTR("Prod");
  if (v20 == 2)
    v23 = CFSTR("Carry");
  objc_msgSend_stringWithFormat_(v16, v21, (uint64_t)CFSTR("accountPartition=%@"), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v25, (uint64_t)v24, v26);

  if (objc_msgSend_bypassPCSEncryption(self, v27, v28, v29))
  {
    objc_msgSend_addObject_(v4, v30, (uint64_t)CFSTR("deviceToDeviceEncryptionAvailability=(bypassPCSEncryption)"), v32);
  }
  else
  {
    v36 = (void *)MEMORY[0x1E0CB3940];
    v37 = objc_msgSend_deviceToDeviceEncryptionAvailability(self, v30, v31, v32);
    CKStringFromDeviceToDeviceEncryptionStatus(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v36, v39, (uint64_t)CFSTR("deviceToDeviceEncryptionAvailability=%@"), v40, v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v42, (uint64_t)v41, v43);

  }
  v44 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend_hasValidCredentials(self, v33, v34, v35))
    objc_msgSend_stringWithFormat_(v44, v45, (uint64_t)CFSTR("hasValidCredentials=%@"), v46, CFSTR("true"));
  else
    objc_msgSend_stringWithFormat_(v44, v45, (uint64_t)CFSTR("hasValidCredentials=%@"), v46, CFSTR("false"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v48, (uint64_t)v47, v49);

  if (objc_msgSend_bypassPCSEncryption(self, v50, v51, v52))
  {
    objc_msgSend_addObject_(v4, v53, (uint64_t)CFSTR("walrus=bypassPCSEncryption"), v55);
  }
  else
  {
    v59 = (void *)MEMORY[0x1E0CB3940];
    v60 = objc_msgSend_walrusStatus(self, v53, v54, v55);
    if (v60 > 2)
      objc_msgSend_stringWithFormat_(v59, v61, (uint64_t)CFSTR("walrus=%@"), v62, CFSTR("Unknown"));
    else
      objc_msgSend_stringWithFormat_(v59, v61, (uint64_t)CFSTR("walrus=%@"), v62, off_1E1F5F6A0[v60]);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v64, (uint64_t)v63, v65);

  }
  v66 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend_needsToVerifyTerms(self, v56, v57, v58))
    objc_msgSend_stringWithFormat_(v66, v67, (uint64_t)CFSTR("needsToVerifyTerms=%@"), v68, CFSTR("true"));
  else
    objc_msgSend_stringWithFormat_(v66, v67, (uint64_t)CFSTR("needsToVerifyTerms=%@"), v68, CFSTR("false"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v70, (uint64_t)v69, v71);

  v72 = (void *)MEMORY[0x1E0CB3940];
  if (self)
    accountAccessAuthorization = self->_accountAccessAuthorization;
  else
    accountAccessAuthorization = 0;
  CKTernaryDescription(accountAccessAuthorization);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v72, v75, (uint64_t)CFSTR("accountAccessAuthorization=%@"), v76, v74);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v78, (uint64_t)v77, v79);

  if (self)
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v80, (uint64_t)CFSTR("validationCounter=%zu"), v81, self->_validationCounter);
  else
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v80, (uint64_t)CFSTR("validationCounter=%zu"), v81, 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v83, (uint64_t)v82, v84);

  objc_msgSend_componentsJoinedByString_(v4, v85, (uint64_t)CFSTR(", "), v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  return v87;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t hasValidCredentials;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  id v52;

  v52 = a3;
  v7 = objc_msgSend_accountStatus(self, v4, v5, v6);
  objc_msgSend_encodeInteger_forKey_(v52, v8, v7, (uint64_t)CFSTR("AccountStatus"));
  v12 = objc_msgSend_accountPartition(self, v9, v10, v11);
  objc_msgSend_encodeInteger_forKey_(v52, v13, v12, (uint64_t)CFSTR("AccountPartition"));
  v17 = objc_msgSend_bypassPCSEncryption(self, v14, v15, v16);
  objc_msgSend_encodeBool_forKey_(v52, v18, v17, (uint64_t)CFSTR("BypassPCSEncryption"));
  v22 = objc_msgSend_deviceToDeviceEncryptionAvailability(self, v19, v20, v21);
  objc_msgSend_encodeInteger_forKey_(v52, v23, v22, (uint64_t)CFSTR("DeviceToDeviceEncryptionAvailability"));
  hasValidCredentials = objc_msgSend_hasValidCredentials(self, v24, v25, v26);
  objc_msgSend_encodeBool_forKey_(v52, v28, hasValidCredentials, (uint64_t)CFSTR("HasValidCredentials"));
  if (self)
  {
    objc_msgSend_encodeInteger_forKey_(v52, v29, self->_validationCounter, (uint64_t)CFSTR("AccountInfoValidationCounter"));
    v33 = objc_msgSend_walrusStatus(self, v30, v31, v32);
    objc_msgSend_encodeInteger_forKey_(v52, v34, v33, (uint64_t)CFSTR("WalrusStatus"));
    v38 = objc_msgSend_needsToVerifyTerms(self, v35, v36, v37);
    objc_msgSend_encodeBool_forKey_(v52, v39, v38, (uint64_t)CFSTR("NeedsToVerifyTerms"));
    objc_msgSend_encodeInteger_forKey_(v52, v40, self->_accountAccessAuthorization, (uint64_t)CFSTR("AccountAccessAuthorization"));
  }
  else
  {
    objc_msgSend_encodeInteger_forKey_(v52, v29, 0, (uint64_t)CFSTR("AccountInfoValidationCounter"));
    v44 = objc_msgSend_walrusStatus(0, v41, v42, v43);
    objc_msgSend_encodeInteger_forKey_(v52, v45, v44, (uint64_t)CFSTR("WalrusStatus"));
    v49 = objc_msgSend_needsToVerifyTerms(0, v46, v47, v48);
    objc_msgSend_encodeBool_forKey_(v52, v50, v49, (uint64_t)CFSTR("NeedsToVerifyTerms"));
    objc_msgSend_encodeInteger_forKey_(v52, v51, 0, (uint64_t)CFSTR("AccountAccessAuthorization"));
  }

}

- (int64_t)deviceToDeviceEncryptionAvailability
{
  return self->_deviceToDeviceEncryptionAvailability;
}

- (int64_t)walrusStatus
{
  return self->_walrusStatus;
}

- (BOOL)needsToVerifyTerms
{
  return self->_needsToVerifyTerms;
}

- (BOOL)hasValidCredentials
{
  return self->_hasValidCredentials;
}

- (int64_t)accountPartition
{
  return self->_accountPartition;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (id)description
{
  return (id)((uint64_t (*)(CKAccountInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

+ (void)setValidAccountInfoValidationCounterValue:(int64_t)a3
{
  uid_t v4;
  const char *v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = geteuid();
  if (v4)
  {
    if (v4 != 501)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = sub_18A6AD138;
      v7[3] = &unk_1E1F5F5C8;
      v7[4] = a3;
      objc_msgSend_performAtomicDefaultsOperation_(CKUserDefaults, v5, (uint64_t)v7, v6);
    }
  }
}

+ (int64_t)validAccountInfoValidationCounterValue
{
  uint64_t v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_18A6AD2F0;
  v5[3] = &unk_1E1F5F5F0;
  v5[4] = &v6;
  objc_msgSend_performAtomicDefaultsOperation_(CKUserDefaults, a2, (uint64_t)v5, v2);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (int64_t)invalidateCachedAccountInfo
{
  uint64_t v2;
  void *v3;
  uid_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  int64_t v15;
  uint8_t v17[8];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (byte_1EDF6A0E0)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v3);
    v4 = geteuid();
    if (v4 == 501 || !v4)
    {
      objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v5, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("CloudKitAccountInfoCache"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend_setObject_forKey_(v8, v12, 0, (uint64_t)CFSTR("CloudKitAccountInfoCache"));
        if (ck_log_initialization_predicate != -1)
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        v13 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_INFO, "Cleared account info cache.", v17, 2u);
        }
      }

    }
    v14 = (void *)qword_1ECD96A68;
    qword_1ECD96A68 = 0;

    objc_sync_exit(v3);
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_18A6AD6DC;
    v18[3] = &unk_1E1F5F5F0;
    v18[4] = &v19;
    objc_msgSend_performAtomicDefaultsOperation_(CKUserDefaults, a2, (uint64_t)v18, v2);
  }
  v15 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v15;
}

- (CKAccountInfo)initWithValidationCounter:(unint64_t)a3 accountStatus:(int64_t)a4 accountPartition:(int64_t)a5 hasValidCredentials:(BOOL)a6 bypassPCSEncryption:(BOOL)a7 deviceToDeviceEncryptionAvailability:(int64_t)a8 walrusStatus:(int64_t)a9 needsToVerifyTerms:(BOOL)a10 accountAccessAuthorization:(int64_t)a11
{
  CKAccountInfo *result;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKAccountInfo;
  result = -[CKAccountInfo init](&v18, sel_init);
  if (result)
  {
    result->_hasValidCredentials = a6;
    result->_accountPartition = a5;
    result->_deviceToDeviceEncryptionAvailability = a8;
    result->_bypassPCSEncryption = a7;
    result->_needsToVerifyTerms = a10;
    result->_walrusStatus = a9;
    result->_accountAccessAuthorization = a11;
    result->_validationCounter = a3;
    result->_accountStatus = a4;
  }
  return result;
}

- (id)copyWithFakeDeviceToDeviceEncryptionAvailability:(int64_t)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  int64_t validationCounter;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t hasValidCredentials;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  const char *v27;
  int64_t accountAccessAuthorization;

  v8 = objc_alloc((Class)objc_opt_class());
  if (self)
    validationCounter = self->_validationCounter;
  else
    validationCounter = 0;
  v10 = objc_msgSend_accountStatus(self, v5, v6, v7);
  v14 = objc_msgSend_accountPartition(self, v11, v12, v13);
  hasValidCredentials = objc_msgSend_hasValidCredentials(self, v15, v16, v17);
  v22 = objc_msgSend_walrusStatus(self, v19, v20, v21);
  v26 = objc_msgSend_needsToVerifyTerms(self, v23, v24, v25);
  if (self)
    accountAccessAuthorization = self->_accountAccessAuthorization;
  else
    accountAccessAuthorization = 0;
  return (id)objc_msgSend_initWithValidationCounter_accountStatus_accountPartition_hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization_(v8, v27, validationCounter, v10, v14, hasValidCredentials, 0, a3, v22, v26, accountAccessAuthorization);
}

- (BOOL)isEqual:(id)a3
{
  CKAccountInfo *v4;
  CKAccountInfo *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int hasValidCredentials;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  int64_t accountAccessAuthorization;
  int64_t v58;

  v4 = (CKAccountInfo *)a3;
  if (self == v4)
  {
    v55 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v55 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  v9 = objc_msgSend_accountStatus(self, v6, v7, v8);
  if (v9 == objc_msgSend_accountStatus(v5, v10, v11, v12))
  {
    v16 = objc_msgSend_accountPartition(self, v13, v14, v15);
    if (v16 == objc_msgSend_accountPartition(v5, v17, v18, v19))
    {
      v23 = objc_msgSend_bypassPCSEncryption(self, v20, v21, v22);
      if (v23 == objc_msgSend_bypassPCSEncryption(v5, v24, v25, v26))
      {
        v30 = objc_msgSend_deviceToDeviceEncryptionAvailability(self, v27, v28, v29);
        if (v30 == objc_msgSend_deviceToDeviceEncryptionAvailability(v5, v31, v32, v33))
        {
          hasValidCredentials = objc_msgSend_hasValidCredentials(self, v34, v35, v36);
          if (hasValidCredentials == objc_msgSend_hasValidCredentials(v5, v38, v39, v40))
          {
            v44 = objc_msgSend_walrusStatus(self, v41, v42, v43);
            if (v44 == objc_msgSend_walrusStatus(v5, v45, v46, v47))
            {
              v51 = objc_msgSend_needsToVerifyTerms(self, v48, v49, v50);
              if (v51 == objc_msgSend_needsToVerifyTerms(v5, v52, v53, v54))
              {
                if (self)
                {
                  accountAccessAuthorization = self->_accountAccessAuthorization;
                  if (v5)
                  {
LABEL_17:
                    v58 = v5->_accountAccessAuthorization;
LABEL_18:
                    v55 = accountAccessAuthorization == v58;
                    goto LABEL_11;
                  }
                }
                else
                {
                  accountAccessAuthorization = 0;
                  if (v5)
                    goto LABEL_17;
                }
                v58 = 0;
                goto LABEL_18;
              }
            }
          }
        }
      }
    }
  }
  v55 = 0;
LABEL_11:

LABEL_14:
  return v55;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int hasValidCredentials;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;

  v5 = objc_msgSend_accountStatus(self, a2, v2, v3);
  v9 = objc_msgSend_accountPartition(self, v6, v7, v8);
  hasValidCredentials = objc_msgSend_hasValidCredentials(self, v10, v11, v12);
  v17 = objc_msgSend_deviceToDeviceEncryptionAvailability(self, v14, v15, v16);
  v21 = objc_msgSend_walrusStatus(self, v18, v19, v20);
  v25 = objc_msgSend_needsToVerifyTerms(self, v22, v23, v24);
  if (self)
    v29 = self->_accountAccessAuthorization << 8;
  else
    v29 = 0;
  v30 = 16;
  if (!hasValidCredentials)
    v30 = 0;
  v31 = v5 ^ (4 * v9) ^ v30 ^ (32 * v17) ^ (v21 << 6);
  v32 = 128;
  if (!v25)
    v32 = 0;
  v33 = v32 ^ v29;
  v34 = objc_msgSend_bypassPCSEncryption(self, v26, v27, v28);
  v35 = 512;
  if (!v34)
    v35 = 0;
  return v31 ^ v33 ^ v35;
}

- (CKAccountInfo)init
{
  _QWORD *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t hasValidCredentials;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  CKAccountInfo *hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization;

  v3 = (_QWORD *)objc_opt_new();
  v7 = v3;
  if (v3)
    v8 = v3[7];
  else
    v8 = 0;
  v9 = objc_msgSend_accountStatus(v3, v4, v5, v6);
  v13 = objc_msgSend_accountPartition(v7, v10, v11, v12);
  hasValidCredentials = objc_msgSend_hasValidCredentials(v7, v14, v15, v16);
  v21 = objc_msgSend_bypassPCSEncryption(v7, v18, v19, v20);
  v25 = objc_msgSend_deviceToDeviceEncryptionAvailability(v7, v22, v23, v24);
  v29 = objc_msgSend_walrusStatus(v7, v26, v27, v28);
  v33 = objc_msgSend_needsToVerifyTerms(v7, v30, v31, v32);
  v37 = objc_msgSend_accountAccessAuthorization(v7, v34, v35, v36);
  hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization = (CKAccountInfo *)objc_msgSend_initWithValidationCounter_accountStatus_accountPartition_hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization_(self, v38, v8, v9, v13, hasValidCredentials, v21, v25, v29, v33, v37);

  return hasValidCredentials_bypassPCSEncryption_deviceToDeviceEncryptionAvailability_walrusStatus_needsToVerifyTerms_accountAccessAuthorization;
}

+ (id)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CKAccountInfo;
  return objc_msgSendSuper2(&v3, "new");
}

- (void)setSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  if (a3)
    objc_msgSend_setDeviceToDeviceEncryptionAvailability_(self, a2, 3, v3);
  else
    objc_msgSend_setDeviceToDeviceEncryptionAvailability_(self, a2, 0, v3);
  objc_msgSend_setBypassPCSEncryption_(self, v5, 0, v6);
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (void)setAccountPartition:(int64_t)a3
{
  self->_accountPartition = a3;
}

- (void)setDeviceToDeviceEncryptionAvailability:(int64_t)a3
{
  self->_deviceToDeviceEncryptionAvailability = a3;
}

- (void)setHasValidCredentials:(BOOL)a3
{
  self->_hasValidCredentials = a3;
}

- (BOOL)isFromCache
{
  return self->_isFromCache;
}

- (BOOL)bypassPCSEncryption
{
  return self->_bypassPCSEncryption;
}

- (void)setBypassPCSEncryption:(BOOL)a3
{
  self->_bypassPCSEncryption = a3;
}

- (BOOL)hasEncryptionIdentity
{
  return self->_hasEncryptionIdentity;
}

- (void)setHasEncryptionIdentity:(BOOL)a3
{
  self->_hasEncryptionIdentity = a3;
}

@end
