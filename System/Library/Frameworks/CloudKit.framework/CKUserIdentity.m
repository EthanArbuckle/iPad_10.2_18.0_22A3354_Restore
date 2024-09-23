@implementation CKUserIdentity

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
  CKUserIdentity *v2;
  CKUserIdentity *v3;
  NSPersonNameComponents *v4;
  NSPersonNameComponents *nameComponents;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKUserIdentity;
  v2 = -[CKUserIdentity init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_hasiCloudAccount = 1;
    v4 = (NSPersonNameComponents *)objc_alloc_init(MEMORY[0x1E0CB3850]);
    nameComponents = v3->_nameComponents;
    v3->_nameComponents = v4;

    v3->_publicKeyVersion = 2;
  }
  return v3;
}

- (CKUserIdentity)initWithUserRecordID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKUserIdentity *inited;
  uint64_t v12;
  CKRecordID *userRecordID;

  v4 = a3;
  inited = (CKUserIdentity *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    userRecordID = inited->_userRecordID;
    inited->_userRecordID = (CKRecordID *)v12;

    inited->_publicKeyVersion = 2;
  }

  return inited;
}

- (CKUserIdentityLookupInfo)lookupInfo
{
  CKUserIdentity *v2;
  CKUserIdentityLookupInfo *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lookupInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLookupInfo:(id)a3
{
  CKUserIdentity *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CKUserIdentityLookupInfo *lookupInfo;
  id v22;

  v22 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_userRecordID(v22, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend_userRecordID(v4, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend_userRecordID(v22, v8, v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend_copy(v13, v14, v15, v16);
      objc_msgSend_setUserRecordID_(v4, v18, (uint64_t)v17, v19);

    }
  }
  v20 = objc_msgSend_copy(v22, v8, v9, v10);
  lookupInfo = v4->_lookupInfo;
  v4->_lookupInfo = (CKUserIdentityLookupInfo *)v20;

  objc_sync_exit(v4);
}

- (BOOL)isOutOfNetwork
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  if (!objc_msgSend_hasiCloudAccount(self, a2, v2, v3))
    return 1;
  objc_msgSend_publicSharingKey(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  return v9;
}

- (NSArray)contactIdentifiers
{
  CKUserIdentity *v2;
  NSArray *contactIdentifiers;
  NSArray *v4;

  v2 = self;
  objc_sync_enter(v2);
  contactIdentifiers = v2->_contactIdentifiers;
  if (!contactIdentifiers)
    contactIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];
  v4 = contactIdentifiers;
  objc_sync_exit(v2);

  return v4;
}

- (void)setContactIdentifiers:(id)a3
{
  CKUserIdentity *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *contactIdentifiers;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  contactIdentifiers = v4->_contactIdentifiers;
  v4->_contactIdentifiers = (NSArray *)v8;

  objc_sync_exit(v4);
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
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  void *v46;
  void *v47;
  void *v48;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_userRecordID(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userRecordID(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (CKObjectsAreBothNilOrEqual(v9, v13))
    {
      objc_msgSend_nameComponents(self, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_nameComponents(v5, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (CKObjectsAreBothNilOrEqual(v17, v21))
      {
        objc_msgSend_publicSharingKey(self, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_publicSharingKey(v5, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (CKObjectsAreBothNilOrEqual(v25, v29))
        {
          objc_msgSend_outOfNetworkPrivateKey(self, v30, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_outOfNetworkPrivateKey(v5, v34, v35, v36);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (CKObjectsAreBothNilOrEqual(v33, v48))
          {
            objc_msgSend_lookupInfo(self, v37, v38, v39);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lookupInfo(v5, v40, v41, v42);
            v47 = v33;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = CKObjectsAreBothNilOrEqual(v46, v43);

            v33 = v47;
          }
          else
          {
            v44 = 0;
          }

        }
        else
        {
          v44 = 0;
        }

      }
      else
      {
        v44 = 0;
      }

    }
    else
    {
      v44 = 0;
    }

  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;

  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_userRecordID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_initWithUserRecordID_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_lookupInfo(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_copy(v15, v16, v17, v18);
  v20 = *(void **)(v11 + 16);
  *(_QWORD *)(v11 + 16) = v19;

  objc_msgSend_nameComponents(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_copy(v24, v25, v26, v27);
  v29 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v28;

  objc_msgSend_userRecordID(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_copy(v33, v34, v35, v36);
  v38 = *(void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = v37;

  objc_msgSend_contactIdentifiers(self, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v42, v43, v44, v45);
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = *(void **)(v11 + 24);
  *(_QWORD *)(v11 + 24) = v46;

  *(_BYTE *)(v11 + 8) = objc_msgSend_hasiCloudAccount(self, v48, v49, v50);
  *(_BYTE *)(v11 + 9) = objc_msgSend_isCached(self, v51, v52, v53);
  objc_msgSend_publicSharingKey(self, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_copy(v57, v58, v59, v60);
  v62 = *(void **)(v11 + 48);
  *(_QWORD *)(v11 + 48) = v61;

  objc_msgSend_outOfNetworkPrivateKey(self, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend_copy(v66, v67, v68, v69);
  v71 = *(void **)(v11 + 64);
  *(_QWORD *)(v11 + 64) = v70;

  objc_msgSend_encryptedPersonalInfo(self, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend_copy(v75, v76, v77, v78);
  v80 = *(void **)(v11 + 72);
  *(_QWORD *)(v11 + 72) = v79;

  *(_QWORD *)(v11 + 56) = objc_msgSend_publicKeyVersion(self, v81, v82, v83);
  return (id)v11;
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
  unint64_t v17;

  objc_msgSend_nameComponents(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_userRecordID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEquivalentToUserIdentity:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char isEqual;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;

  v4 = a3;
  objc_msgSend_userRecordID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userRecordID(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);

  if ((isEqual & 1) != 0)
  {
    v19 = 1;
  }
  else
  {
    objc_msgSend_lookupInfo(self, v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lookupInfo(v4, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_isEqual_(v20, v25, (uint64_t)v24, v26);

  }
  return v19;
}

- (BOOL)isEquivalentToUserIdentityOrPublicKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char isEqual;
  const char *v16;
  uint64_t v17;
  char isEquivalentToUserIdentity;

  v4 = a3;
  objc_msgSend_publicSharingKey(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicSharingKey(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14);

  if ((isEqual & 1) != 0)
    isEquivalentToUserIdentity = 1;
  else
    isEquivalentToUserIdentity = objc_msgSend_isEquivalentToUserIdentity_(self, v16, (uint64_t)v4, v17);

  return isEquivalentToUserIdentity;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;

  v42 = a3;
  objc_msgSend_userRecordID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v42, v8, (uint64_t)CFSTR("userID"), (uint64_t)v7, 0);

  objc_msgSend_nameComponents(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v42, v13, (uint64_t)CFSTR("nameComponents"), (uint64_t)v12, 1);

  objc_msgSend_contactIdentifiers(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_count(v17, v18, v19, v20);

  if (v21)
  {
    objc_msgSend_contactIdentifiers(self, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v42, v26, (uint64_t)CFSTR("contactIdentifiers"), (uint64_t)v25, 0);

  }
  objc_msgSend_lookupInfo(self, v22, v23, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v42, v28, (uint64_t)CFSTR("lookupInfo"), (uint64_t)v27, 0);

  if (objc_msgSend_isCached(self, v29, v30, v31))
    objc_msgSend_addProperty_value_shouldRedact_(v42, v32, (uint64_t)CFSTR("cached"), (uint64_t)CFSTR("true"), 0);
  else
    objc_msgSend_addProperty_value_shouldRedact_(v42, v32, (uint64_t)CFSTR("cached"), (uint64_t)CFSTR("false"), 0);
  v36 = (void *)MEMORY[0x1E0CB37E8];
  v37 = objc_msgSend_publicKeyVersion(self, v33, v34, v35);
  objc_msgSend_numberWithUnsignedInteger_(v36, v38, v37, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v42, v41, (uint64_t)CFSTR("publicKeyVersion"), (uint64_t)v40, 0);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKUserIdentity *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKUserIdentity *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
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
  uint64_t isCached;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  id v55;

  v55 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_userRecordID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v55, v9, (uint64_t)v8, (uint64_t)CFSTR("UserRecordID"));

  objc_msgSend_nameComponents(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v55, v14, (uint64_t)v13, (uint64_t)CFSTR("NameComponents"));

  objc_msgSend_lookupInfo(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v55, v19, (uint64_t)v18, (uint64_t)CFSTR("LookupInfo"));

  objc_msgSend_contactIdentifiers(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v55, v24, (uint64_t)v23, (uint64_t)CFSTR("ContactIdentifiers"));

  objc_msgSend_publicSharingKey(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v55, v29, (uint64_t)v28, (uint64_t)CFSTR("ProtectionData"));

  objc_msgSend_outOfNetworkPrivateKey(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v55, v34, (uint64_t)v33, (uint64_t)CFSTR("OONProtectionData"));

  isCached = objc_msgSend_isCached(self, v35, v36, v37);
  objc_msgSend_encodeBool_forKey_(v55, v39, isCached, (uint64_t)CFSTR("IsCached"));
  v43 = objc_msgSend_hasiCloudAccount(self, v40, v41, v42);
  objc_msgSend_encodeBool_forKey_(v55, v44, v43, (uint64_t)CFSTR("HasICloudAccount"));
  objc_msgSend_encryptedPersonalInfo(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v55, v49, (uint64_t)v48, (uint64_t)CFSTR("EncryptedPersonalInfo"));

  v53 = objc_msgSend_publicKeyVersion(self, v50, v51, v52);
  objc_msgSend_encodeInt64_forKey_(v55, v54, v53, (uint64_t)CFSTR("PublicKeyVersion"));
  objc_autoreleasePoolPop(v4);

}

- (CKUserIdentity)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKUserIdentity *inited;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  CKRecordID *userRecordID;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSPersonNameComponents *nameComponents;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  CKUserIdentityLookupInfo *lookupInfo;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSArray *contactIdentifiers;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSData *publicSharingKey;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  NSData *outOfNetworkPrivateKey;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSData *encryptedPersonalInfo;
  const char *v47;
  uint64_t v48;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  inited = (CKUserIdentity *)objc_msgSend_initInternal(self, v5, v6, v7);
  if (inited)
  {
    v9 = (void *)MEMORY[0x18D76DE4C]();
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("UserRecordID"));
    v12 = objc_claimAutoreleasedReturnValue();
    userRecordID = inited->_userRecordID;
    inited->_userRecordID = (CKRecordID *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("NameComponents"));
    v16 = objc_claimAutoreleasedReturnValue();
    nameComponents = inited->_nameComponents;
    inited->_nameComponents = (NSPersonNameComponents *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, (uint64_t)CFSTR("LookupInfo"));
    v20 = objc_claimAutoreleasedReturnValue();
    lookupInfo = inited->_lookupInfo;
    inited->_lookupInfo = (CKUserIdentityLookupInfo *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v50[0] = objc_opt_class();
    v50[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)v50, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v22, v25, (uint64_t)v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v28, (uint64_t)v27, (uint64_t)CFSTR("ContactIdentifiers"));
    v29 = objc_claimAutoreleasedReturnValue();
    contactIdentifiers = inited->_contactIdentifiers;
    inited->_contactIdentifiers = (NSArray *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("ProtectionData"));
    v33 = objc_claimAutoreleasedReturnValue();
    publicSharingKey = inited->_publicSharingKey;
    inited->_publicSharingKey = (NSData *)v33;

    v35 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, (uint64_t)CFSTR("OONProtectionData"));
    v37 = objc_claimAutoreleasedReturnValue();
    outOfNetworkPrivateKey = inited->_outOfNetworkPrivateKey;
    inited->_outOfNetworkPrivateKey = (NSData *)v37;

    inited->_isCached = objc_msgSend_decodeBoolForKey_(v4, v39, (uint64_t)CFSTR("IsCached"), v40);
    inited->_hasiCloudAccount = objc_msgSend_decodeBoolForKey_(v4, v41, (uint64_t)CFSTR("HasICloudAccount"), v42);
    v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, (uint64_t)CFSTR("EncryptedPersonalInfo"));
    v45 = objc_claimAutoreleasedReturnValue();
    encryptedPersonalInfo = inited->_encryptedPersonalInfo;
    inited->_encryptedPersonalInfo = (NSData *)v45;

    inited->_publicKeyVersion = objc_msgSend_decodeInt64ForKey_(v4, v47, (uint64_t)CFSTR("PublicKeyVersion"), v48);
    objc_autoreleasePoolPop(v9);
  }

  return inited;
}

- (CKRecordID)userRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserRecordID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSPersonNameComponents)nameComponents
{
  return (NSPersonNameComponents *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNameComponents:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)hasiCloudAccount
{
  return self->_hasiCloudAccount;
}

- (void)setHasiCloudAccount:(BOOL)a3
{
  self->_hasiCloudAccount = a3;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (NSData)publicSharingKey
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPublicSharingKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (unint64_t)publicKeyVersion
{
  return self->_publicKeyVersion;
}

- (void)setPublicKeyVersion:(unint64_t)a3
{
  self->_publicKeyVersion = a3;
}

- (NSData)outOfNetworkPrivateKey
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOutOfNetworkPrivateKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSData)encryptedPersonalInfo
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEncryptedPersonalInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)firstName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)lastName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_encryptedPersonalInfo, 0);
  objc_storeStrong((id *)&self->_outOfNetworkPrivateKey, 0);
  objc_storeStrong((id *)&self->_publicSharingKey, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_lookupInfo, 0);
}

@end
