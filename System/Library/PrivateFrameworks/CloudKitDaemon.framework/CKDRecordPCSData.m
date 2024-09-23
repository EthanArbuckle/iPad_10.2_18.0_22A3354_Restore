@implementation CKDRecordPCSData

- (CKDRecordPCSData)initWithPCSData:(id)a3 recordID:(id)a4
{
  id v7;
  CKDRecordPCSData *v8;
  CKDRecordPCSData *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKDRecordPCSData;
  v8 = -[CKDPCSData initWithPCSData:](&v11, sel_initWithPCSData_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_recordID, a4);

  return v9;
}

- (CKDRecordPCSData)initWithRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  CKDRecordPCSData *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CKRecordID *recordID;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKRecordZoneID *zoneID;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  CKRecordID *shareID;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  CKRecordID *parentID;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSData *chainParentPublicKeyID;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSString *recordType;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  CKDChainPCSData *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  CKDChainPCSData *chainPCSData;
  uint64_t v61;
  NSData *zoneishPublicKeyID;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  CKEncryptedData *encryptedPublicSharingKey;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  CKPCSKeysToRemove *pcsKeysToRemove;
  objc_super v72;

  v4 = a3;
  objc_msgSend_protectionData(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72.receiver = self;
  v72.super_class = (Class)CKDRecordPCSData;
  v8 = -[CKDPCSData initWithPCSData:](&v72, sel_initWithPCSData_, v7);

  if (v8)
  {
    objc_msgSend_recordID(v4, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    recordID = v8->_recordID;
    v8->_recordID = (CKRecordID *)v11;

    objc_msgSend_recordID(v4, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    zoneID = v8->_zoneID;
    v8->_zoneID = (CKRecordZoneID *)v18;

    objc_msgSend_share(v4, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    shareID = v8->_shareID;
    v8->_shareID = (CKRecordID *)v25;

    objc_msgSend_parent(v4, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v29, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    parentID = v8->_parentID;
    v8->_parentID = (CKRecordID *)v32;

    objc_msgSend_chainParentPublicKeyID(v4, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    chainParentPublicKeyID = v8->_chainParentPublicKeyID;
    v8->_chainParentPublicKeyID = (NSData *)v36;

    objc_msgSend_recordType(v4, v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    recordType = v8->_recordType;
    v8->_recordType = (NSString *)v40;

    objc_msgSend_protectionEtag(v4, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setEtag_(v8, v45, (uint64_t)v44);

    objc_msgSend_chainProtectionInfo(v4, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      v51 = [CKDChainPCSData alloc];
      objc_msgSend_chainProtectionInfo(v4, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_chainPrivateKey(v4, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend_initWithPCSData_encryptedPrivateKey_(v51, v58, (uint64_t)v54, v57);
      chainPCSData = v8->_chainPCSData;
      v8->_chainPCSData = (CKDChainPCSData *)v59;

    }
    objc_msgSend_zoneishKeyID(v4, v49, v50);
    v61 = objc_claimAutoreleasedReturnValue();
    zoneishPublicKeyID = v8->_zoneishPublicKeyID;
    v8->_zoneishPublicKeyID = (NSData *)v61;

    objc_msgSend_mutableEncryptedPSK(v4, v63, v64);
    v65 = objc_claimAutoreleasedReturnValue();
    encryptedPublicSharingKey = v8->_encryptedPublicSharingKey;
    v8->_encryptedPublicSharingKey = (CKEncryptedData *)v65;

    objc_msgSend_pcsKeysToRemove(v4, v67, v68);
    v69 = objc_claimAutoreleasedReturnValue();
    pcsKeysToRemove = v8->_pcsKeysToRemove;
    v8->_pcsKeysToRemove = (CKPCSKeysToRemove *)v69;

  }
  return v8;
}

+ (CKDRecordPCSData)dataWithRecord:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)objc_msgSend_initWithRecord_(v4, v5, (uint64_t)v3);

  return (CKDRecordPCSData *)v6;
}

- (BOOL)shouldEncodePCSData
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  objc_msgSend_zoneishPublicKeyID(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)setPcs:(_OpaquePCSShareProtection *)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKDRecordPCSData;
  -[CKDPCSData setPcs:](&v11, sel_setPcs_);
  objc_msgSend_zoneishPublicKeyID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    if (v7)
    {
      objc_msgSend_protectionIdentifierFromShareProtection_(CKDPCSManager, v8, (uint64_t)a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setZoneishPublicKeyID_(self, v10, (uint64_t)v9);

    }
  }
}

- (void)setZonePCSData:(id)a3
{
  CKDZonePCSData *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  CKDZonePCSData *zonePCSData;

  v4 = (CKDZonePCSData *)a3;
  objc_msgSend_zoneID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setZoneID_(self, v8, (uint64_t)v7);

  zonePCSData = self->_zonePCSData;
  self->_zonePCSData = v4;

}

- (void)setSharePCSData:(id)a3
{
  CKDSharePCSData *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  CKDSharePCSData *sharePCSData;

  v4 = (CKDSharePCSData *)a3;
  objc_msgSend_shareID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShareID_(self, v8, (uint64_t)v7);

  sharePCSData = self->_sharePCSData;
  self->_sharePCSData = v4;

}

- (void)setParentPCSData:(id)a3
{
  CKDRecordPCSData *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  CKDRecordPCSData *parentPCSData;
  CKDRecordPCSData *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  id v19;

  v4 = (CKDRecordPCSData *)a3;
  objc_msgSend_recordID(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setParentID_(self, v8, (uint64_t)v7);

  parentPCSData = self->_parentPCSData;
  self->_parentPCSData = v4;
  v10 = v4;

  objc_msgSend_chainPCSData(v10, v11, v12);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_pcs(v19, v13, v14);
  objc_msgSend_publicKeyIDFromIdentity_(CKDPCSManager, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setChainParentPublicKeyID_(self, v18, (uint64_t)v17);
}

- (void)setSigningPCS:(_OpaquePCSShareProtection *)a3
{
  _OpaquePCSShareProtection *signingPCS;
  CKDRecordPCSData *v5;
  CKDRecordPCSData *obj;

  obj = self;
  objc_sync_enter(obj);
  signingPCS = obj->_signingPCS;
  if (signingPCS != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      v5 = obj;
      signingPCS = obj->_signingPCS;
    }
    else
    {
      v5 = obj;
    }
    v5->_signingPCS = a3;
    if (signingPCS)
      CFRelease(signingPCS);
  }
  objc_sync_exit(obj);

}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  objc_super v21;

  v3 = (void *)MEMORY[0x1C3B83E24](self, a2);
  v21.receiver = self;
  v21.super_class = (Class)CKDRecordPCSData;
  -[CKDPCSData CKPropertiesDescription](&v21, sel_CKPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend_mutableCopy(v4, v5, v6);

  objc_msgSend_recordType(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_recordType(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v14, (uint64_t)CFSTR(", recordType=%@"), v13);

  }
  objc_msgSend_chainPCSData(self, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend_chainPCSData(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v7, v19, (uint64_t)CFSTR(", chainPCSData=%@"), v18);

  }
  objc_autoreleasePoolPop(v3);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  objc_super v58;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B83E24]();
  v58.receiver = self;
  v58.super_class = (Class)CKDRecordPCSData;
  -[CKDPCSData encodeWithCoder:](&v58, sel_encodeWithCoder_, v4);
  objc_msgSend_recordID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, CFSTR("RecordID"));

  objc_msgSend_recordType(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, CFSTR("RecordType"));

  objc_msgSend_zoneID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, CFSTR("RecordZoneID"));

  objc_msgSend_shareID(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, CFSTR("RecordShareID"));

  objc_msgSend_parentID(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, CFSTR("ParentID"));

  objc_msgSend_chainPCSData(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)v28, CFSTR("ChainPCS"));

  objc_msgSend_zonePCSData(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v33, (uint64_t)v32, CFSTR("ZonePCS"));

  objc_msgSend_sharePCSData(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v37, (uint64_t)v36, CFSTR("SharePCS"));

  objc_msgSend_parentPCSData(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v41, (uint64_t)v40, CFSTR("ParentPCS"));

  objc_msgSend_encryptedPublicSharingKey(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, CFSTR("PublicSharingKey"));

  objc_msgSend_chainParentPublicKeyID(self, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v49, (uint64_t)v48, CFSTR("ChainParentPublicKeyID"));

  objc_msgSend_zoneishPublicKeyID(self, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v53, (uint64_t)v52, CFSTR("ZoneishPublicKeyID"));

  objc_msgSend_pcsKeysToRemove(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v57, (uint64_t)v56, CFSTR("PCSKeysToRemove"));

  objc_autoreleasePoolPop(v5);
}

- (CKDRecordPCSData)initWithCoder:(id)a3
{
  id v4;
  CKDRecordPCSData *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKRecordID *recordID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *recordType;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  CKRecordZoneID *zoneID;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  CKRecordID *shareID;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  CKRecordID *parentID;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  CKDChainPCSData *chainPCSData;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  CKDZonePCSData *zonePCSData;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  CKDSharePCSData *sharePCSData;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  CKDRecordPCSData *parentPCSData;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  CKEncryptedData *encryptedPublicSharingKey;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  NSData *chainParentPublicKeyID;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  NSData *zoneishPublicKeyID;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  CKPCSKeysToRemove *pcsKeysToRemove;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)CKDRecordPCSData;
  v5 = -[CKDPCSData initWithCoder:](&v60, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1C3B83E24]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("RecordID"));
    v9 = objc_claimAutoreleasedReturnValue();
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, CFSTR("RecordType"));
    v13 = objc_claimAutoreleasedReturnValue();
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, CFSTR("RecordZoneID"));
    v17 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, CFSTR("RecordShareID"));
    v21 = objc_claimAutoreleasedReturnValue();
    shareID = v5->_shareID;
    v5->_shareID = (CKRecordID *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, CFSTR("ParentID"));
    v25 = objc_claimAutoreleasedReturnValue();
    parentID = v5->_parentID;
    v5->_parentID = (CKRecordID *)v25;

    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, CFSTR("ChainPCS"));
    v29 = objc_claimAutoreleasedReturnValue();
    chainPCSData = v5->_chainPCSData;
    v5->_chainPCSData = (CKDChainPCSData *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, CFSTR("ZonePCS"));
    v33 = objc_claimAutoreleasedReturnValue();
    zonePCSData = v5->_zonePCSData;
    v5->_zonePCSData = (CKDZonePCSData *)v33;

    v35 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, CFSTR("SharePCS"));
    v37 = objc_claimAutoreleasedReturnValue();
    sharePCSData = v5->_sharePCSData;
    v5->_sharePCSData = (CKDSharePCSData *)v37;

    v39 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, CFSTR("ParentPCS"));
    v41 = objc_claimAutoreleasedReturnValue();
    parentPCSData = v5->_parentPCSData;
    v5->_parentPCSData = (CKDRecordPCSData *)v41;

    v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, CFSTR("PublicSharingKey"));
    v45 = objc_claimAutoreleasedReturnValue();
    encryptedPublicSharingKey = v5->_encryptedPublicSharingKey;
    v5->_encryptedPublicSharingKey = (CKEncryptedData *)v45;

    v47 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v47, CFSTR("ChainParentPublicKeyID"));
    v49 = objc_claimAutoreleasedReturnValue();
    chainParentPublicKeyID = v5->_chainParentPublicKeyID;
    v5->_chainParentPublicKeyID = (NSData *)v49;

    v51 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, CFSTR("ZoneishPublicKeyID"));
    v53 = objc_claimAutoreleasedReturnValue();
    zoneishPublicKeyID = v5->_zoneishPublicKeyID;
    v5->_zoneishPublicKeyID = (NSData *)v53;

    v55 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v56, v55, CFSTR("PCSKeysToRemove"));
    v57 = objc_claimAutoreleasedReturnValue();
    pcsKeysToRemove = v5->_pcsKeysToRemove;
    v5->_pcsKeysToRemove = (CKPCSKeysToRemove *)v57;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)dealloc
{
  _OpaquePCSShareProtection *signingPCS;
  objc_super v4;

  signingPCS = self->_signingPCS;
  if (signingPCS)
  {
    CFRelease(signingPCS);
    self->_signingPCS = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDRecordPCSData;
  -[CKDPCSData dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const void *v104;
  const char *v105;
  objc_super v107;

  v107.receiver = self;
  v107.super_class = (Class)CKDRecordPCSData;
  v4 = -[CKDPCSData copyWithZone:](&v107, sel_copyWithZone_, a3);
  objc_msgSend_recordID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_copy(v7, v8, v9);
  objc_msgSend_setRecordID_(v4, v11, (uint64_t)v10);

  objc_msgSend_recordType(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_copy(v14, v15, v16);
  objc_msgSend_setRecordType_(v4, v18, (uint64_t)v17);

  objc_msgSend_etag(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend_copy(v21, v22, v23);
  objc_msgSend_setEtag_(v4, v25, (uint64_t)v24);

  objc_msgSend_zoneID(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_copy(v28, v29, v30);
  objc_msgSend_setZoneID_(v4, v32, (uint64_t)v31);

  objc_msgSend_shareID(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend_copy(v35, v36, v37);
  objc_msgSend_setShareID_(v4, v39, (uint64_t)v38);

  objc_msgSend_parentID(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend_copy(v42, v43, v44);
  objc_msgSend_setParentID_(v4, v46, (uint64_t)v45);

  objc_msgSend_chainParentPublicKeyID(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend_copy(v49, v50, v51);
  objc_msgSend_setChainParentPublicKeyID_(v4, v53, (uint64_t)v52);

  objc_msgSend_zoneishPublicKeyID(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend_copy(v56, v57, v58);
  objc_msgSend_setZoneishPublicKeyID_(v4, v60, (uint64_t)v59);

  objc_msgSend_encryptedPublicSharingKey(self, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend_copy(v63, v64, v65);
  objc_msgSend_setEncryptedPublicSharingKey_(v4, v67, (uint64_t)v66);

  objc_msgSend_chainPCSData(self, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend_copy(v70, v71, v72);
  objc_msgSend_setChainPCSData_(v4, v74, (uint64_t)v73);

  objc_msgSend_zonePCSData(self, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend_copy(v77, v78, v79);
  objc_msgSend_setZonePCSData_(v4, v81, (uint64_t)v80);

  objc_msgSend_sharePCSData(self, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)objc_msgSend_copy(v84, v85, v86);
  objc_msgSend_setSharePCSData_(v4, v88, (uint64_t)v87);

  objc_msgSend_parentPCSData(self, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)objc_msgSend_copy(v91, v92, v93);
  objc_msgSend_setParentPCSData_(v4, v95, (uint64_t)v94);

  objc_msgSend_pcsKeysToRemove(self, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPcsKeysToRemove_(v4, v99, (uint64_t)v98);

  if (objc_msgSend_signingPCS(self, v100, v101))
  {
    objc_msgSend_signingPCS(self, v102, v103);
    v104 = (const void *)PCSFPCopyObject();
    objc_msgSend_setSigningPCS_(v4, v105, (uint64_t)v104);
    if (v104)
      CFRelease(v104);
  }
  return v4;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
  objc_storeStrong((id *)&self->_recordType, a3);
}

- (CKRecordID)parentID
{
  return self->_parentID;
}

- (void)setParentID:(id)a3
{
  objc_storeStrong((id *)&self->_parentID, a3);
}

- (CKDRecordPCSData)parentPCSData
{
  return self->_parentPCSData;
}

- (NSData)chainParentPublicKeyID
{
  return self->_chainParentPublicKeyID;
}

- (void)setChainParentPublicKeyID:(id)a3
{
  objc_storeStrong((id *)&self->_chainParentPublicKeyID, a3);
}

- (CKDZonePCSData)zonePCSData
{
  return self->_zonePCSData;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneID, a3);
}

- (NSData)zoneishPublicKeyID
{
  return self->_zoneishPublicKeyID;
}

- (void)setZoneishPublicKeyID:(id)a3
{
  objc_storeStrong((id *)&self->_zoneishPublicKeyID, a3);
}

- (CKDSharePCSData)sharePCSData
{
  return self->_sharePCSData;
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
  objc_storeStrong((id *)&self->_shareID, a3);
}

- (_OpaquePCSShareProtection)signingPCS
{
  return self->_signingPCS;
}

- (CKDChainPCSData)chainPCSData
{
  return self->_chainPCSData;
}

- (void)setChainPCSData:(id)a3
{
  objc_storeStrong((id *)&self->_chainPCSData, a3);
}

- (CKEncryptedData)encryptedPublicSharingKey
{
  return self->_encryptedPublicSharingKey;
}

- (void)setEncryptedPublicSharingKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedPublicSharingKey, a3);
}

- (CKPCSKeysToRemove)pcsKeysToRemove
{
  return self->_pcsKeysToRemove;
}

- (void)setPcsKeysToRemove:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsKeysToRemove, 0);
  objc_storeStrong((id *)&self->_encryptedPublicSharingKey, 0);
  objc_storeStrong((id *)&self->_chainPCSData, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_sharePCSData, 0);
  objc_storeStrong((id *)&self->_zoneishPublicKeyID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_zonePCSData, 0);
  objc_storeStrong((id *)&self->_chainParentPublicKeyID, 0);
  objc_storeStrong((id *)&self->_parentPCSData, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
