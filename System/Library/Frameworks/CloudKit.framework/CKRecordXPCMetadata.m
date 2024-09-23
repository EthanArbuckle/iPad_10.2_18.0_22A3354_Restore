@implementation CKRecordXPCMetadata

- (void)CKAssignToContainerWithID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_serverRecord(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAssignToContainerWithID_(v10, v8, (uint64_t)v4, v9);

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
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  id v65;

  v65 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_etag(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_etag);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v65, v10, (uint64_t)v8, (uint64_t)v9);

  objc_msgSend_creationDate(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_creationDate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v65, v16, (uint64_t)v14, (uint64_t)v15);

  objc_msgSend_modificationDate(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_modificationDate);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v65, v22, (uint64_t)v20, (uint64_t)v21);

  objc_msgSend_expirationDate(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_expirationDate);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v65, v28, (uint64_t)v26, (uint64_t)v27);

  objc_msgSend_serverRecord(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_serverRecord);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v65, v34, (uint64_t)v32, (uint64_t)v33);

  objc_msgSend_protectionData(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_protectionData);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v65, v40, (uint64_t)v38, (uint64_t)v39);

  objc_msgSend_signingPCSIdentityData(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_signingPCSIdentityData);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v65, v46, (uint64_t)v44, (uint64_t)v45);

  objc_msgSend_pcsKeyID(self, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pcsKeyID);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v65, v52, (uint64_t)v50, (uint64_t)v51);

  objc_msgSend_allPCSKeyIDs(self, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_allPCSKeyIDs);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v65, v58, (uint64_t)v56, (uint64_t)v57);

  objc_msgSend_zoneishKeyID(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_zoneishKeyID);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v65, v64, (uint64_t)v62, (uint64_t)v63);

  objc_autoreleasePoolPop(v4);
}

- (CKRecordXPCMetadata)initWithCoder:(id)a3
{
  id v4;
  CKRecordXPCMetadata *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSString *etag;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSDate *creationDate;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSDate *modificationDate;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSDate *expirationDate;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  CKRecord *serverRecord;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  NSData *protectionData;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  NSData *signingPCSIdentityData;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  NSData *pcsKeyID;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  NSArray *allPCSKeyIDs;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  NSData *zoneishKeyID;
  objc_super v63;
  _QWORD v64[3];

  v64[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)CKRecordXPCMetadata;
  v5 = -[CKRecordXPCMetadata init](&v63, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    NSStringFromSelector(sel_etag);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    v10 = objc_claimAutoreleasedReturnValue();
    etag = v5->_etag;
    v5->_etag = (NSString *)v10;

    v12 = objc_opt_class();
    NSStringFromSelector(sel_creationDate);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_modificationDate);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, (uint64_t)v18);
    v20 = objc_claimAutoreleasedReturnValue();
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_expirationDate);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v22, (uint64_t)v23);
    v25 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v25;

    v27 = objc_opt_class();
    NSStringFromSelector(sel_serverRecord);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v27, (uint64_t)v28);
    v30 = objc_claimAutoreleasedReturnValue();
    serverRecord = v5->_serverRecord;
    v5->_serverRecord = (CKRecord *)v30;

    v32 = objc_opt_class();
    NSStringFromSelector(sel_protectionData);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v32, (uint64_t)v33);
    v35 = objc_claimAutoreleasedReturnValue();
    protectionData = v5->_protectionData;
    v5->_protectionData = (NSData *)v35;

    v37 = objc_opt_class();
    NSStringFromSelector(sel_signingPCSIdentityData);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v37, (uint64_t)v38);
    v40 = objc_claimAutoreleasedReturnValue();
    signingPCSIdentityData = v5->_signingPCSIdentityData;
    v5->_signingPCSIdentityData = (NSData *)v40;

    v42 = objc_opt_class();
    NSStringFromSelector(sel_pcsKeyID);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v42, (uint64_t)v43);
    v45 = objc_claimAutoreleasedReturnValue();
    pcsKeyID = v5->_pcsKeyID;
    v5->_pcsKeyID = (NSData *)v45;

    v47 = (void *)MEMORY[0x1E0C99E60];
    v64[0] = objc_opt_class();
    v64[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v48, (uint64_t)v64, 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v47, v50, (uint64_t)v49, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_allPCSKeyIDs);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v54, (uint64_t)v52, (uint64_t)v53);
    v55 = objc_claimAutoreleasedReturnValue();
    allPCSKeyIDs = v5->_allPCSKeyIDs;
    v5->_allPCSKeyIDs = (NSArray *)v55;

    v57 = objc_opt_class();
    NSStringFromSelector(sel_zoneishKeyID);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v57, (uint64_t)v58);
    v60 = objc_claimAutoreleasedReturnValue();
    zoneishKeyID = v5->_zoneishKeyID;
    v5->_zoneishKeyID = (NSData *)v60;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CKRecord)serverRecord
{
  return self->_serverRecord;
}

- (void)setServerRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)protectionData
{
  return self->_protectionData;
}

- (void)setProtectionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)signingPCSIdentityData
{
  return self->_signingPCSIdentityData;
}

- (void)setSigningPCSIdentityData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)pcsKeyID
{
  return self->_pcsKeyID;
}

- (void)setPcsKeyID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)allPCSKeyIDs
{
  return self->_allPCSKeyIDs;
}

- (void)setAllPCSKeyIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)zoneishKeyID
{
  return self->_zoneishKeyID;
}

- (void)setZoneishKeyID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneishKeyID, 0);
  objc_storeStrong((id *)&self->_allPCSKeyIDs, 0);
  objc_storeStrong((id *)&self->_pcsKeyID, 0);
  objc_storeStrong((id *)&self->_signingPCSIdentityData, 0);
  objc_storeStrong((id *)&self->_protectionData, 0);
  objc_storeStrong((id *)&self->_serverRecord, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
