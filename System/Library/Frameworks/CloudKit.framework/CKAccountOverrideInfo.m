@implementation CKAccountOverrideInfo

- (CKAccountOverrideInfo)initWithSqliteRepresentation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  CKAccountOverrideInfo *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *accountID;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *altDSID;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSString *email;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSString *secondEmail;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSString *password;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSString *recoveryKey;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSDictionary *accountPropertyOverrides;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  NSDictionary *overridesByDataclass;
  CKAccountOverrideInfo *v55;
  NSObject *v56;
  objc_super v58;
  id v59;
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_dataUsingEncoding_(v4, v8, 4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v11, (uint64_t)v10, 0, &v59);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v59;
    if (v13 || !v12)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v56 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v13;
        _os_log_error_impl(&dword_18A5C5000, v56, OS_LOG_TYPE_ERROR, "Error converting JSON data to CKAccountOverrideInfo: %@", buf, 0xCu);
      }
      v55 = 0;
    }
    else
    {
      v58.receiver = self;
      v58.super_class = (Class)CKAccountOverrideInfo;
      v14 = -[CKAccountOverrideInfo init](&v58, sel_init);
      if (v14)
      {
        NSStringFromSelector(sel_accountID);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v16, (uint64_t)v15, v17);
        v18 = objc_claimAutoreleasedReturnValue();
        accountID = v14->_accountID;
        v14->_accountID = (NSString *)v18;

        NSStringFromSelector(sel_altDSID);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v21, (uint64_t)v20, v22);
        v23 = objc_claimAutoreleasedReturnValue();
        altDSID = v14->_altDSID;
        v14->_altDSID = (NSString *)v23;

        NSStringFromSelector(sel_email);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v26, (uint64_t)v25, v27);
        v28 = objc_claimAutoreleasedReturnValue();
        email = v14->_email;
        v14->_email = (NSString *)v28;

        NSStringFromSelector(sel_secondEmail);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v31, (uint64_t)v30, v32);
        v33 = objc_claimAutoreleasedReturnValue();
        secondEmail = v14->_secondEmail;
        v14->_secondEmail = (NSString *)v33;

        NSStringFromSelector(sel_password);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v36, (uint64_t)v35, v37);
        v38 = objc_claimAutoreleasedReturnValue();
        password = v14->_password;
        v14->_password = (NSString *)v38;

        NSStringFromSelector(sel_recoveryKey);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v41, (uint64_t)v40, v42);
        v43 = objc_claimAutoreleasedReturnValue();
        recoveryKey = v14->_recoveryKey;
        v14->_recoveryKey = (NSString *)v43;

        NSStringFromSelector(sel_accountPropertyOverrides);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v46, (uint64_t)v45, v47);
        v48 = objc_claimAutoreleasedReturnValue();
        accountPropertyOverrides = v14->_accountPropertyOverrides;
        v14->_accountPropertyOverrides = (NSDictionary *)v48;

        NSStringFromSelector(sel_overridesByDataclass);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v51, (uint64_t)v50, v52);
        v53 = objc_claimAutoreleasedReturnValue();
        overridesByDataclass = v14->_overridesByDataclass;
        v14->_overridesByDataclass = (NSDictionary *)v53;

      }
      self = v14;
      v55 = self;
    }

  }
  else
  {
    v55 = 0;
  }

  return v55;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridesByDataclass, 0);
  objc_storeStrong((id *)&self->_accountPropertyOverrides, 0);
  objc_storeStrong((id *)&self->_secondEmail, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

- (CKAccountOverrideInfo)initWithAccountID:(id)a3
{
  return (CKAccountOverrideInfo *)objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(self, a2, 0, 0, 0, 0, a3, 0, 0, 0);
}

- (CKAccountOverrideInfo)initWithAltDSID:(id)a3
{
  return (CKAccountOverrideInfo *)objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(self, a2, 0, 0, 0, 0, 0, a3, 0, 0);
}

- (CKAccountOverrideInfo)initWithEmail:(id)a3 password:(id)a4
{
  return (CKAccountOverrideInfo *)objc_msgSend__initWithEmail_password_recoveryKey_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (id)_initWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5
{
  return (id)objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0, 0, 0);
}

- (CKAccountOverrideInfo)initWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 secondEmail:(id)a6 accountPropertyOverrides:(id)a7 overridesByDataclass:(id)a8
{
  return (CKAccountOverrideInfo *)objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0, 0, 0);
}

- (id)_initWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 secondEmail:(id)a6 accountID:(id)a7 altDSID:(id)a8 accountPropertyOverrides:(id)a9 overridesByDataclass:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  CKAccountOverrideInfo *v27;
  uint64_t v28;
  NSString *email;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString *password;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSString *recoveryKey;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSString *secondEmail;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSString *accountID;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSString *altDSID;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSDictionary *accountPropertyOverrides;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSDictionary *overridesByDataclass;
  objc_super v66;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v66.receiver = self;
  v66.super_class = (Class)CKAccountOverrideInfo;
  v27 = -[CKAccountOverrideInfo init](&v66, sel_init);
  if (v27)
  {
    v28 = objc_msgSend_copy(v16, v24, v25, v26);
    email = v27->_email;
    v27->_email = (NSString *)v28;

    v33 = objc_msgSend_copy(v17, v30, v31, v32);
    password = v27->_password;
    v27->_password = (NSString *)v33;

    v38 = objc_msgSend_copy(v18, v35, v36, v37);
    recoveryKey = v27->_recoveryKey;
    v27->_recoveryKey = (NSString *)v38;

    v43 = objc_msgSend_copy(v19, v40, v41, v42);
    secondEmail = v27->_secondEmail;
    v27->_secondEmail = (NSString *)v43;

    v48 = objc_msgSend_copy(v20, v45, v46, v47);
    accountID = v27->_accountID;
    v27->_accountID = (NSString *)v48;

    v53 = objc_msgSend_copy(v21, v50, v51, v52);
    altDSID = v27->_altDSID;
    v27->_altDSID = (NSString *)v53;

    objc_msgSend_CKDeepCopy(v22, v55, v56, v57);
    v58 = objc_claimAutoreleasedReturnValue();
    accountPropertyOverrides = v27->_accountPropertyOverrides;
    v27->_accountPropertyOverrides = (NSDictionary *)v58;

    objc_msgSend_CKDeepCopy(v23, v60, v61, v62);
    v63 = objc_claimAutoreleasedReturnValue();
    overridesByDataclass = v27->_overridesByDataclass;
    v27->_overridesByDataclass = (NSDictionary *)v63;

  }
  return v27;
}

+ (id)anonymousAccount
{
  if (qword_1ECD96BD0 != -1)
    dispatch_once(&qword_1ECD96BD0, &unk_1E1F58558);
  return (id)qword_1ECD96BD8;
}

+ (id)liveAccount
{
  if (qword_1ECD96BE0 != -1)
    dispatch_once(&qword_1ECD96BE0, &unk_1E1F62DE8);
  return (id)qword_1ECD96BE8;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 4, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_accountID(self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v12, v14, (uint64_t)CFSTR("accountID=%@"), v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v17, (uint64_t)v16, v18);

  }
  objc_msgSend_altDSID(self, v9, v10, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_altDSID(self, v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v23, v25, (uint64_t)CFSTR("altDSID=%@"), v26, v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v28, (uint64_t)v27, v29);

  }
  objc_msgSend_email(self, v20, v21, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v34 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_email(self, v31, v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v34, v36, (uint64_t)CFSTR("email=%@"), v37, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v39, (uint64_t)v38, v40);

  }
  objc_msgSend_secondEmail(self, v31, v32, v33);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v45 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_secondEmail(self, v42, v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v45, v47, (uint64_t)CFSTR("secondEmail=%@"), v48, v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v50, (uint64_t)v49, v51);

  }
  objc_msgSend_accountPropertyOverrides(self, v42, v43, v44);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_count(v52, v53, v54, v55);

  if (v56)
  {
    v60 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_accountPropertyOverrides(self, v57, v58, v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v60, v62, (uint64_t)CFSTR("customProps=%@"), v63, v61);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v65, (uint64_t)v64, v66);

  }
  objc_msgSend_overridesByDataclass(self, v57, v58, v59);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend_count(v67, v68, v69, v70);

  if (v71)
  {
    v75 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_overridesByDataclass(self, v72, v73, v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v75, v77, (uint64_t)CFSTR("customPropsByDataclass=%@"), v78, v76);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v80, (uint64_t)v79, v81);

  }
  objc_msgSend_componentsJoinedByString_(v4, v72, (uint64_t)CFSTR(", "), v74);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  return v82;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKAccountOverrideInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSString)uniqueID
{
  void *v2;
  const char *v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CC_LONG v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], a2, (uint64_t)self, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v19, 0, sizeof(v19));
  objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v3, (uint64_t)v19, 32, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v2);
  v9 = (const void *)objc_msgSend_bytes(v5, v6, v7, v8);
  v13 = objc_msgSend_length(v5, v10, v11, v12);
  CC_SHA256(v9, v13, (unsigned __int8 *)v19);
  objc_msgSend_CKLowercaseHexStringWithoutSpaces(v4, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (id)copyWithAccountPropertyOverrides:(id)a3 overridesByDataclass:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;
  id v43;

  v6 = a3;
  v7 = a4;
  v43 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_email(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_password(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recoveryKey(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_secondEmail(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_altDSID(self, v28, v29, v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v6;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
LABEL_7:
    objc_msgSend_overridesByDataclass(self, v31, v32, v33);
    v42 = v7;
    v38 = (uint64_t)v15;
    v39 = (uint64_t)v11;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(v43, v41, v39, v38, v19, v23, v27, v34, v35, v40);

    v11 = (void *)v39;
    v15 = (void *)v38;
    v7 = v42;
    if (v6)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend_accountPropertyOverrides(self, v31, v32, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_7;
LABEL_3:
  v36 = (void *)objc_msgSend__initWithEmail_password_recoveryKey_secondEmail_accountID_altDSID_accountPropertyOverrides_overridesByDataclass_(v43, v31, (uint64_t)v11, (uint64_t)v15, v19, v23, v27, v34, v35, v7);
  if (!v6)
LABEL_4:

LABEL_5:
  return v36;
}

- (BOOL)isEqual:(id)a3
{
  CKAccountOverrideInfo *v4;
  CKAccountOverrideInfo *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  char v77;

  v4 = (CKAccountOverrideInfo *)a3;
  if (self == v4)
  {
    v77 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_accountID(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountID(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (!v14)
        goto LABEL_13;
      objc_msgSend_altDSID(self, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_altDSID(v5, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      if (!v23)
        goto LABEL_13;
      objc_msgSend_email(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_email(v5, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      if (!v32)
        goto LABEL_13;
      objc_msgSend_secondEmail(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_secondEmail(v5, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CKObjectsAreBothNilOrEqual(v36, v40);

      if (!v41)
        goto LABEL_13;
      objc_msgSend_password(self, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_password(v5, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CKObjectsAreBothNilOrEqual(v45, v49);

      if (!v50)
        goto LABEL_13;
      objc_msgSend_recoveryKey(self, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recoveryKey(v5, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = CKObjectsAreBothNilOrEqual(v54, v58);

      if (!v59)
        goto LABEL_13;
      objc_msgSend_accountPropertyOverrides(self, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountPropertyOverrides(v5, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CKObjectsAreBothNilOrEqual(v63, v67);

      if (v68)
      {
        objc_msgSend_overridesByDataclass(self, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_overridesByDataclass(v5, v73, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = CKObjectsAreBothNilOrEqual(v72, v76);

      }
      else
      {
LABEL_13:
        v77 = 0;
      }

    }
    else
    {
      v77 = 0;
    }
  }

  return v77;
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
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;

  objc_msgSend_email(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_secondEmail(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_password(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_hash(v21, v22, v23, v24);
  objc_msgSend_recoveryKey(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);
  objc_msgSend_accountID(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_hash(v37, v38, v39, v40);
  objc_msgSend_altDSID(self, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v41 ^ objc_msgSend_hash(v45, v46, v47, v48);
  objc_msgSend_accountPropertyOverrides(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v33 ^ v49 ^ objc_msgSend_hash(v53, v54, v55, v56);
  objc_msgSend_overridesByDataclass(self, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v57 ^ objc_msgSend_hash(v61, v62, v63, v64);

  return v65;
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
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  id v45;

  v45 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_accountID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v9, (uint64_t)v8, (uint64_t)CFSTR("AccountID"));

  objc_msgSend_altDSID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v14, (uint64_t)v13, (uint64_t)CFSTR("AltDSID"));

  objc_msgSend_email(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v19, (uint64_t)v18, (uint64_t)CFSTR("Email"));

  objc_msgSend_secondEmail(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v24, (uint64_t)v23, (uint64_t)CFSTR("SecondEmail"));

  objc_msgSend_password(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v29, (uint64_t)v28, (uint64_t)CFSTR("Password"));

  objc_msgSend_recoveryKey(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v34, (uint64_t)v33, (uint64_t)CFSTR("RecoveryKey"));

  objc_msgSend_accountPropertyOverrides(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v39, (uint64_t)v38, (uint64_t)CFSTR("AccountPropertyOverrides"));

  objc_msgSend_overridesByDataclass(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v44, (uint64_t)v43, (uint64_t)CFSTR("OverridesByDataclass"));

  objc_autoreleasePoolPop(v4);
}

- (CKAccountOverrideInfo)initWithCoder:(id)a3
{
  id v4;
  CKAccountOverrideInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *accountID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *altDSID;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *email;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSString *secondEmail;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSString *password;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSString *recoveryKey;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  NSDictionary *accountPropertyOverrides;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  NSDictionary *overridesByDataclass;
  objc_super v50;
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CKAccountOverrideInfo;
  v5 = -[CKAccountOverrideInfo init](&v50, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("AccountID"));
    v9 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("AltDSID"));
    v13 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("Email"));
    v17 = objc_claimAutoreleasedReturnValue();
    email = v5->_email;
    v5->_email = (NSString *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("SecondEmail"));
    v21 = objc_claimAutoreleasedReturnValue();
    secondEmail = v5->_secondEmail;
    v5->_secondEmail = (NSString *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("Password"));
    v25 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v25;

    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, (uint64_t)CFSTR("RecoveryKey"));
    v29 = objc_claimAutoreleasedReturnValue();
    recoveryKey = v5->_recoveryKey;
    v5->_recoveryKey = (NSString *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v52[0] = objc_opt_class();
    v52[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v32, (uint64_t)v52, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v31, v34, (uint64_t)v33, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v36, (uint64_t)CFSTR("AccountPropertyOverrides"));
    v38 = objc_claimAutoreleasedReturnValue();
    accountPropertyOverrides = v5->_accountPropertyOverrides;
    v5->_accountPropertyOverrides = (NSDictionary *)v38;

    v40 = (void *)MEMORY[0x1E0C99E60];
    v51[0] = objc_opt_class();
    v51[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v41, (uint64_t)v51, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v40, v43, (uint64_t)v42, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, (uint64_t)CFSTR("OverridesByDataclass"));
    v47 = objc_claimAutoreleasedReturnValue();
    overridesByDataclass = v5->_overridesByDataclass;
    v5->_overridesByDataclass = (NSDictionary *)v47;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)sqliteRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  const char *v52;
  void *v53;
  id v54;
  NSObject *v55;
  id v56;
  const char *v57;
  void *v58;
  id v60;
  uint8_t buf[4];
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend_accountID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v7, (uint64_t)v8);

  objc_msgSend_altDSID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_altDSID);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v13, (uint64_t)v14);

  objc_msgSend_email(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_email);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v19, (uint64_t)v20);

  objc_msgSend_secondEmail(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_secondEmail);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v27, (uint64_t)v25, (uint64_t)v26);

  objc_msgSend_password(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_password);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v31, (uint64_t)v32);

  objc_msgSend_recoveryKey(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_recoveryKey);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v39, (uint64_t)v37, (uint64_t)v38);

  objc_msgSend_accountPropertyOverrides(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accountPropertyOverrides);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v43, (uint64_t)v44);

  objc_msgSend_overridesByDataclass(self, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_overridesByDataclass);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v51, (uint64_t)v49, (uint64_t)v50);

  v60 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v52, (uint64_t)v3, 0, &v60);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v60;
  if (v54)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v55 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v54;
      _os_log_error_impl(&dword_18A5C5000, v55, OS_LOG_TYPE_ERROR, "Error converting CKAccountOverrideInfo to JSON: %@", buf, 0xCu);
    }
  }
  v56 = objc_alloc(MEMORY[0x1E0CB3940]);
  v58 = (void *)objc_msgSend_initWithData_encoding_(v56, v57, (uint64_t)v53, 4);

  return v58;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (NSString)secondEmail
{
  return self->_secondEmail;
}

- (NSDictionary)accountPropertyOverrides
{
  return self->_accountPropertyOverrides;
}

- (NSDictionary)overridesByDataclass
{
  return self->_overridesByDataclass;
}

@end
