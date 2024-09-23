@implementation CKDMMCSItem

- (id)init:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDMMCSItem;
  result = -[CKDMMCSItem init](&v5, sel_init);
  if (result)
  {
    *((_BYTE *)result + 13) = a3;
    *((_QWORD *)result + 15) = -1;
  }
  return result;
}

- (CKDMMCSItem)initWithAsset:(id)a3
{
  return (CKDMMCSItem *)objc_msgSend_initWithAsset_temporary_(self, a2, (uint64_t)a3, 0);
}

- (CKDMMCSItem)initWithAsset:(id)a3 temporary:(BOOL)a4
{
  _BOOL8 v4;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CKDMMCSItem *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKRecordID *recordID;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *recordType;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSString *recordKey;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSURL *fileURL;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSNumber *deviceID;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSNumber *fileID;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSNumber *generationID;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  NSFileHandle *fileHandle;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSData *signature;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSString *itemTypeHint;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSURL *contentBaseURL;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  NSString *owner;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  NSString *requestor;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  NSString *authToken;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  CKAssetDownloadPreauthorization *downloadPreauthorization;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  NSData *assetKey;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  NSData *wrappedAssetKey;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  NSData *clearAssetKey;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  NSData *boundaryKey;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  NSData *referenceSignature;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  NSDictionary *assetChunkerOptions;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  NSURL *constructedAssetDownloadURL;
  const char *v110;
  uint64_t v111;
  CKDAssetZoneKey *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  CKDAssetZoneKey *assetZoneKey;
  void *v126;
  const char *v127;

  v4 = a4;
  v8 = a3;
  objc_msgSend_record(v8, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v126, v127, (uint64_t)a2, self, CFSTR("CKDMMCSItem.m"), 46, CFSTR("Expected non-nil record for %@"), v8);

  }
  v14 = objc_msgSend_init_(self, v11, v4);
  v15 = (CKDMMCSItem *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 136), a3);
    objc_msgSend_recordID(v13, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    recordID = v15->_recordID;
    v15->_recordID = (CKRecordID *)v18;

    objc_msgSend_recordType(v13, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    recordType = v15->_recordType;
    v15->_recordType = (NSString *)v22;

    objc_msgSend_recordKey(v8, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    recordKey = v15->_recordKey;
    v15->_recordKey = (NSString *)v26;

    objc_msgSend_fileURL(v8, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    fileURL = v15->_fileURL;
    v15->_fileURL = (NSURL *)v30;

    objc_msgSend_deviceID(v8, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    deviceID = v15->_deviceID;
    v15->_deviceID = (NSNumber *)v34;

    objc_msgSend_fileID(v8, v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    fileID = v15->_fileID;
    v15->_fileID = (NSNumber *)v38;

    objc_msgSend_generationCountToSave(v8, v40, v41);
    v42 = objc_claimAutoreleasedReturnValue();
    generationID = v15->_generationID;
    v15->_generationID = (NSNumber *)v42;

    objc_msgSend_fileHandle(v8, v44, v45);
    v46 = objc_claimAutoreleasedReturnValue();
    fileHandle = v15->_fileHandle;
    v15->_fileHandle = (NSFileHandle *)v46;

    objc_msgSend_signature(v8, v48, v49);
    v50 = objc_claimAutoreleasedReturnValue();
    signature = v15->_signature;
    v15->_signature = (NSData *)v50;

    objc_msgSend_itemTypeHint(v8, v52, v53);
    v54 = objc_claimAutoreleasedReturnValue();
    itemTypeHint = v15->_itemTypeHint;
    v15->_itemTypeHint = (NSString *)v54;

    objc_msgSend_contentBaseURL(v8, v56, v57);
    v58 = objc_claimAutoreleasedReturnValue();
    contentBaseURL = v15->_contentBaseURL;
    v15->_contentBaseURL = (NSURL *)v58;

    objc_msgSend_owner(v8, v60, v61);
    v62 = objc_claimAutoreleasedReturnValue();
    owner = v15->_owner;
    v15->_owner = (NSString *)v62;

    objc_msgSend_requestor(v8, v64, v65);
    v66 = objc_claimAutoreleasedReturnValue();
    requestor = v15->_requestor;
    v15->_requestor = (NSString *)v66;

    objc_msgSend_authToken(v8, v68, v69);
    v70 = objc_claimAutoreleasedReturnValue();
    authToken = v15->_authToken;
    v15->_authToken = (NSString *)v70;

    objc_msgSend_downloadPreauthorization(v8, v72, v73);
    v74 = objc_claimAutoreleasedReturnValue();
    downloadPreauthorization = v15->_downloadPreauthorization;
    v15->_downloadPreauthorization = (CKAssetDownloadPreauthorization *)v74;

    objc_msgSend_assetKey(v8, v76, v77);
    v78 = objc_claimAutoreleasedReturnValue();
    assetKey = v15->_assetKey;
    v15->_assetKey = (NSData *)v78;

    objc_msgSend_wrappedAssetKey(v8, v80, v81);
    v82 = objc_claimAutoreleasedReturnValue();
    wrappedAssetKey = v15->_wrappedAssetKey;
    v15->_wrappedAssetKey = (NSData *)v82;

    objc_msgSend_clearAssetKey(v8, v84, v85);
    v86 = objc_claimAutoreleasedReturnValue();
    clearAssetKey = v15->_clearAssetKey;
    v15->_clearAssetKey = (NSData *)v86;

    objc_msgSend_boundaryKey(v8, v88, v89);
    v90 = objc_claimAutoreleasedReturnValue();
    boundaryKey = v15->_boundaryKey;
    v15->_boundaryKey = (NSData *)v90;

    objc_msgSend_referenceSignature(v8, v92, v93);
    v94 = objc_claimAutoreleasedReturnValue();
    referenceSignature = v15->_referenceSignature;
    v15->_referenceSignature = (NSData *)v94;

    v15->_shouldReadRawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(v8, v96, v97);
    v15->_shouldReadAssetContentUsingClientProxy = objc_msgSend_shouldReadAssetContentUsingClientProxy(v8, v98, v99);
    v15->_downloadTokenExpiration = objc_msgSend_downloadTokenExpiration(v8, v100, v101);
    objc_msgSend_assetChunkerOptions(v8, v102, v103);
    v104 = objc_claimAutoreleasedReturnValue();
    assetChunkerOptions = v15->_assetChunkerOptions;
    v15->_assetChunkerOptions = (NSDictionary *)v104;

    objc_msgSend_constructedAssetDownloadURL(v8, v106, v107);
    v108 = objc_claimAutoreleasedReturnValue();
    constructedAssetDownloadURL = v15->_constructedAssetDownloadURL;
    v15->_constructedAssetDownloadURL = (NSURL *)v108;

    v15->_constructedAssetEstimatedSize = objc_msgSend_constructedAssetEstimatedSize(v8, v110, v111);
    v112 = [CKDAssetZoneKey alloc];
    objc_msgSend_zoneID(v15->_recordID, v113, v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = (void *)MEMORY[0x1E0CB37E8];
    v119 = objc_msgSend_useMMCSEncryptionV2(v8, v117, v118);
    objc_msgSend_numberWithBool_(v116, v120, v119);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend_initWithDestinationZoneID_destinationDatabaseScope_usesMMCSEncryptionV2_(v112, v122, (uint64_t)v115, 0, v121);
    assetZoneKey = v15->_assetZoneKey;
    v15->_assetZoneKey = (CKDAssetZoneKey *)v123;

  }
  return v15;
}

- (unint64_t)MMCSEncoding
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  unint64_t v6;

  v3 = (void *)MEMORY[0x1E0C95138];
  objc_msgSend_signature(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isValidV2Signature_(v3, v5, (uint64_t)v4))
    v6 = 2;
  else
    v6 = 1;

  return v6;
}

- (void)setupForReReferenceWithAsset:(id)a3 destinationDatabaseScope:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSURL *v12;
  NSURL *contentBaseURL;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSString *v19;
  NSString *requestor;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSString *v26;
  NSString *authToken;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  CKDAssetZoneKey *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t isPackageMember;
  const char *v56;
  CKDAssetZoneKey *isPackageRereference;
  CKDAssetZoneKey *assetZoneKey;
  id v59;

  v6 = a3;
  objc_msgSend_assetRereferenceInfo(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentBaseURL(v9, v10, v11);
  v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
  contentBaseURL = self->_contentBaseURL;
  self->_contentBaseURL = v12;

  objc_msgSend_assetRereferenceInfo(v6, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestor(v16, v17, v18);
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestor = self->_requestor;
  self->_requestor = v19;

  objc_msgSend_assetRereferenceInfo(v6, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_downloadToken(v23, v24, v25);
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  authToken = self->_authToken;
  self->_authToken = v26;

  objc_msgSend_assetRereferenceInfo(v6, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  self->_downloadTokenExpiration = objc_msgSend_downloadTokenExpiration(v30, v31, v32);

  v35 = objc_msgSend_useMMCSEncryptionV2(v6, v33, v34);
  objc_msgSend_assetReference(v6, v36, v37);
  v59 = (id)objc_claimAutoreleasedReturnValue();

  v38 = [CKDAssetZoneKey alloc];
  objc_msgSend_zoneID(self->_recordID, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v42, v35);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v59, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_databaseScope(v59, v50, v51);
  isPackageMember = objc_msgSend_isPackageMember(v59, v53, v54);
  isPackageRereference = (CKDAssetZoneKey *)objc_msgSend_initWithDestinationZoneID_destinationDatabaseScope_usesMMCSEncryptionV2_sourceZoneID_sourceDatabaseScope_isPackageRereference_(v38, v56, (uint64_t)v41, a4, v43, v49, v52, isPackageMember);
  assetZoneKey = self->_assetZoneKey;
  self->_assetZoneKey = isPackageRereference;

}

- (CKDMMCSItem)initWithPackage:(id)a3
{
  return (CKDMMCSItem *)objc_msgSend_initWithPackage_temporary_(self, a2, (uint64_t)a3, 0);
}

- (CKDMMCSItem)initWithPackage:(id)a3 temporary:(BOOL)a4
{
  _BOOL8 v4;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CKDMMCSItem *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  CKRecordID *recordID;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *recordType;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSString *recordKey;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSData *boundaryKey;
  CKDAssetZoneKey *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  CKDAssetZoneKey *assetZoneKey;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;

  v4 = a4;
  v8 = a3;
  objc_msgSend_record(v8, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, self, CFSTR("CKDMMCSItem.m"), 113, CFSTR("Expected non-nil record for %@"), v8);

  }
  v14 = objc_msgSend_init_(self, v11, v4);
  v15 = (CKDMMCSItem *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 144), a3);
    objc_msgSend_recordID(v13, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    recordID = v15->_recordID;
    v15->_recordID = (CKRecordID *)v18;

    objc_msgSend_recordType(v13, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    recordType = v15->_recordType;
    v15->_recordType = (NSString *)v22;

    objc_msgSend_recordKey(v8, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    recordKey = v15->_recordKey;
    v15->_recordKey = (NSString *)v26;

    if (objc_msgSend_useMMCSEncryptionV2(v8, v28, v29))
    {
      objc_msgSend_boundaryKey(v8, v30, v31);
      v32 = objc_claimAutoreleasedReturnValue();
      boundaryKey = v15->_boundaryKey;
      v15->_boundaryKey = (NSData *)v32;

      if (!v15->_boundaryKey)
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v30, v31);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v51, (uint64_t)a2, v15, CFSTR("CKDMMCSItem.m"), 122, CFSTR("Expected non-nil boundary key for %@"), v8);

      }
    }
    v15->_shouldReadRawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(v8, v30, v31);
    v34 = [CKDAssetZoneKey alloc];
    objc_msgSend_zoneID(v15->_recordID, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CB37E8];
    v41 = objc_msgSend_useMMCSEncryptionV2(v8, v39, v40);
    objc_msgSend_numberWithBool_(v38, v42, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_initWithDestinationZoneID_destinationDatabaseScope_usesMMCSEncryptionV2_(v34, v44, (uint64_t)v37, 0, v43);
    assetZoneKey = v15->_assetZoneKey;
    v15->_assetZoneKey = (CKDAssetZoneKey *)v45;

  }
  return v15;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_hasSize = 1;
  self->_fileSize = a3;
}

- (BOOL)canBeRegistered
{
  uint64_t v2;

  return objc_msgSend_fileSize(self, a2, v2) != 0;
}

- (void)clearFileSize
{
  self->_hasSize = 0;
  self->_fileSize = 0;
}

- (void)setOffset:(unint64_t)a3
{
  self->_hasOffset = 1;
  self->_offset = a3;
}

- (id)CKPropertiesDescription
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  const char *v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  const char *v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  const char *v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  const char *v114;
  void *v115;
  const char *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  char isEqualToString;
  void *v139;
  void *v140;
  const char *v141;
  void *v142;
  const char *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  const char *v149;
  void *v150;
  const char *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  const char *v157;
  void *v158;
  const char *v159;
  const char *v160;
  double v161;
  void *v162;
  id v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  void *v170;
  const char *v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  void *v189;
  const char *v190;
  void *v191;
  const char *v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  void *v197;
  const char *v198;
  void *v199;
  const char *v200;
  void *v201;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_itemID(self, v4, v5))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_msgSend_itemID(self, v6, v7);
    objc_msgSend_stringWithFormat_(v8, v10, (uint64_t)CFSTR("itemID=%llu"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v12, (uint64_t)v11);

  }
  objc_msgSend_putPackageSectionIdentifier(self, v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_putPackageSectionIdentifier(self, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v18, (uint64_t)CFSTR("putPackageSectionIdentifier=%@"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v20, (uint64_t)v19);

  }
  objc_msgSend_trackingUUID(self, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_trackingUUID(self, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v24, v26, (uint64_t)CFSTR("trackingUUID=%@"), v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v28, (uint64_t)v27);

  }
  if (objc_msgSend_hasSize(self, v22, v23))
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    v32 = objc_msgSend_fileSize(self, v29, v30);
    objc_msgSend_stringWithFormat_(v31, v33, (uint64_t)CFSTR("size=%llu"), v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v35, (uint64_t)v34);

  }
  if (objc_msgSend_paddedFileSize(self, v29, v30))
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    v39 = objc_msgSend_paddedFileSize(self, v36, v37);
    objc_msgSend_stringWithFormat_(v38, v40, (uint64_t)CFSTR("paddedSize=%llu"), v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v42, (uint64_t)v41);

  }
  if (objc_msgSend_hasOffset(self, v36, v37))
  {
    v45 = (void *)MEMORY[0x1E0CB3940];
    v46 = objc_msgSend_offset(self, v43, v44);
    objc_msgSend_stringWithFormat_(v45, v47, (uint64_t)CFSTR("offset=%llu"), v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v49, (uint64_t)v48);

  }
  objc_msgSend_recordKey(self, v43, v44);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    v53 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_recordKey(self, v51, v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v53, v55, (uint64_t)CFSTR("recordKey=%@"), v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v57, (uint64_t)v56);

  }
  objc_msgSend_fileURL(self, v51, v52);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    v61 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_fileURL(self, v59, v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v61, v66, (uint64_t)CFSTR("path=\"%@\"), v65);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v68, (uint64_t)v67);

  }
  objc_msgSend_signature(self, v59, v60);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    v72 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_signature(self, v70, v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v72, v74, (uint64_t)CFSTR("signature=%@"), v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v76, (uint64_t)v75);

  }
  objc_msgSend_deviceID(self, v70, v71);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
  {
    v80 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_deviceID(self, v78, v79);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v80, v82, (uint64_t)CFSTR("deviceID=%@"), v81);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v84, (uint64_t)v83);

  }
  objc_msgSend_fileID(self, v78, v79);
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    v88 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_fileID(self, v86, v87);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v88, v90, (uint64_t)CFSTR("fileID=%@"), v89);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v92, (uint64_t)v91);

  }
  objc_msgSend_generationID(self, v86, v87);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    v96 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_generationID(self, v94, v95);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v96, v98, (uint64_t)CFSTR("generationID=%@"), v97);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v100, (uint64_t)v99);

  }
  objc_msgSend_fileHandle(self, v94, v95);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (v101)
  {
    v104 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_fileHandle(self, v102, v103);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v104, v106, (uint64_t)CFSTR("fileHandle=\"%@\"), v105);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v108, (uint64_t)v107);

  }
  objc_msgSend_contentBaseURL(self, v102, v103);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    v112 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_contentBaseURL(self, v110, v111);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v112, v114, (uint64_t)CFSTR("contentBaseURL=%@"), v113);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v116, (uint64_t)v115);

  }
  objc_msgSend_owner(self, v110, v111);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  if (v117)
  {
    v120 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_owner(self, v118, v119);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v120, v122, (uint64_t)CFSTR("owner=%@"), v121);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v124, (uint64_t)v123);

  }
  objc_msgSend_requestor(self, v118, v119);
  v125 = objc_claimAutoreleasedReturnValue();
  if (v125)
  {
    v128 = (void *)v125;
    objc_msgSend_owner(self, v126, v127);
    v129 = objc_claimAutoreleasedReturnValue();
    if (v129)
    {
      v132 = (void *)v129;
      objc_msgSend_requestor(self, v130, v131);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_owner(self, v134, v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v133, v137, (uint64_t)v136);

      if ((isEqualToString & 1) != 0)
        goto LABEL_37;
    }
    else
    {

    }
    v139 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_requestor(self, v126, v127);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v139, v141, (uint64_t)CFSTR("requestor=%@"), v140);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v143, (uint64_t)v142);

  }
LABEL_37:
  objc_msgSend_authToken(self, v126, v127);
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  if (v144)
  {
    v147 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_authToken(self, v145, v146);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v147, v149, (uint64_t)CFSTR("authToken=%@"), v148);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v151, (uint64_t)v150);

  }
  objc_msgSend_uploadReceipt(self, v145, v146);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  if (v152)
  {
    v155 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_uploadReceipt(self, v153, v154);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v155, v157, (uint64_t)CFSTR("uploadReceipt=%@"), v156);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v159, (uint64_t)v158);

  }
  objc_msgSend_uploadReceiptExpiration(self, v153, v154);
  if (v161 != 0.0)
  {
    v162 = (void *)MEMORY[0x1E0CB3940];
    v163 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend_uploadReceiptExpiration(self, v164, v165);
    v168 = (void *)objc_msgSend_initWithTimeIntervalSince1970_(v163, v166, v167);
    objc_msgSend_stringWithFormat_(v162, v169, (uint64_t)CFSTR("uploadReceiptExpiration=%@"), v168);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v171, (uint64_t)v170);

  }
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v160, 5);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_finished(self, v173, v174))
    objc_msgSend_addObject_(v172, v175, (uint64_t)CFSTR("finished"));
  if (objc_msgSend_isTemporary(self, v175, v176))
    objc_msgSend_addObject_(v172, v177, (uint64_t)CFSTR("temporary"));
  if (objc_msgSend_shouldReadRawEncryptedData(self, v177, v178))
    objc_msgSend_addObject_(v172, v179, (uint64_t)CFSTR("read-encrypted"));
  if (objc_msgSend_shouldReadAssetContentUsingClientProxy(self, v179, v180))
    objc_msgSend_addObject_(v172, v181, (uint64_t)CFSTR("read-from-client-proxy"));
  objc_msgSend_downloadPreauthorization(self, v181, v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();

  if (v183)
    objc_msgSend_addObject_(v172, v184, (uint64_t)CFSTR("has-download-preauth"));
  if (objc_msgSend_count(v172, v184, v185))
  {
    v188 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v172, v186, (uint64_t)CFSTR("|"));
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v188, v190, (uint64_t)CFSTR("flags=%@"), v189);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v192, (uint64_t)v191);

  }
  objc_msgSend_error(self, v186, v187);
  v193 = (void *)objc_claimAutoreleasedReturnValue();

  if (v193)
  {
    v196 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_error(self, v194, v195);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v196, v198, (uint64_t)CFSTR("error=%@"), v197);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v200, (uint64_t)v199);

  }
  objc_msgSend_componentsJoinedByString_(v3, v194, (uint64_t)CFSTR(", "));
  v201 = (void *)objc_claimAutoreleasedReturnValue();

  return v201;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDMMCSItem *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)_openInfo
{
  uint64_t v2;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t RawEncryptedData;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *RawEncryptedData_fileHandle_assetDownloadStagingInfo;

  if (objc_msgSend_usesAssetDownloadStagingManager(self, a2, v2))
  {
    v4 = objc_alloc(MEMORY[0x1E0C94BC8]);
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v8 = objc_msgSend_itemID(self, v6, v7);
    objc_msgSend_numberWithUnsignedLongLong_(v5, v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trackingUUID(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signature(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend_initWithItemID_trackingUUID_signature_(v4, v17, (uint64_t)v10, v13, v16);

  }
  else
  {
    v18 = 0;
  }
  v19 = objc_alloc(MEMORY[0x1E0C94E98]);
  objc_msgSend_trackingUUID(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURL(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceID(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileID(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_generationID(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(self, v38, v39);
  objc_msgSend_fileHandle(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  RawEncryptedData_fileHandle_assetDownloadStagingInfo = (void *)objc_msgSend_initWithUUID_path_deviceID_fileID_generationID_shouldReadRawEncryptedData_fileHandle_assetDownloadStagingInfo_(v19, v44, (uint64_t)v22, v28, v31, v34, v37, RawEncryptedData, v43, v18);

  return RawEncryptedData_fileHandle_assetDownloadStagingInfo;
}

- (id)openWithOperation:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  char isTemporary;
  const char *v33;
  uint64_t v34;
  id v35;
  id v37;
  id v38;
  id v39;

  v6 = a3;
  objc_msgSend__openInfo(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1C3B83E24]();
  if ((objc_msgSend_isTemporary(self, v11, v12) & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend_path(v9, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUID(v9, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v22 = (void *)v19;
      objc_msgSend_operationInfo(v6, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_usesAssetDownloadStagingManager(v23, v24, v25);

      if (v26)
      {
        v39 = 0;
        objc_msgSend_openFileWithOpenInfo_error_(v6, v27, (uint64_t)v9, &v39);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v39;
      }
      else
      {
        objc_msgSend_container(v6, v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        objc_msgSend_openFileWithOpenInfo_error_(v30, v31, (uint64_t)v9, &v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v38;

      }
      if (v29)
      {
        objc_autoreleasePoolPop(v10);
        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend_errorWithDomain_code_path_format_(MEMORY[0x1E0C94FF8], v20, *MEMORY[0x1E0C94B20], 3001, v16, CFSTR("nil UUID"));
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  isTemporary = objc_msgSend_isTemporary(self, v13, v14);
  if (!v6 || (isTemporary & 1) != 0 || objc_msgSend_isLongLived(v6, v33, v34))
  {
    v37 = v15;
    objc_msgSend_openWithOpenInfo_error_(MEMORY[0x1E0C94BB8], v33, (uint64_t)v9, &v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v37;

    v15 = v35;
  }
  else
  {
    v29 = 0;
  }
  objc_autoreleasePoolPop(v10);
  if (a4 && !v29)
  {
    v15 = objc_retainAutorelease(v15);
    *a4 = v15;
  }
LABEL_18:

  return v29;
}

- (id)openWithError:(id *)a3
{
  return (id)objc_msgSend_openWithOperation_error_(self, a2, 0, a3);
}

- (id)getFileSizeWithOperation:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;

  v6 = a3;
  if (objc_msgSend_shouldReadAssetContentUsingClientProxy(self, v7, v8))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_asset(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_size(v12, v13, v14);
    objc_msgSend_numberWithUnsignedLongLong_(v11, v16, v15);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend_isTemporary(self, v9, v10) & 1) != 0
         || (objc_msgSend_openWithOperation_error_(self, v18, (uint64_t)v6, a4),
             (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v21 = (void *)MEMORY[0x1E0C94BB8];
    objc_msgSend__openInfo(self, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getFileSizeWithOpenInfo_error_(v21, v22, (uint64_t)v12, a4);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v20;
    objc_msgSend_fileSize(v20, v18, v19);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v17;

  return v23;
}

- (id)getFileSizeWithError:(id *)a3
{
  return (id)objc_msgSend_getFileSizeWithOperation_error_(self, a2, 0, a3);
}

- (id)getFileMetadataWithContainer:(id)a3 fileHandle:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1C3B83E24]();
  if ((objc_msgSend_isTemporary(self, v11, v12) & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend__openInfo(self, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(v8, v17, (uint64_t)v9, v16, &v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;

    if (v18)
    {
      objc_autoreleasePoolPop(v10);
      goto LABEL_8;
    }
  }
  v19 = v15;
  v20 = (void *)MEMORY[0x1E0C94BB8];
  objc_msgSend__openInfo(self, v13, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v15;
  objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(v20, v22, (uint64_t)v9, v21, &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v24;

  objc_autoreleasePoolPop(v10);
  if (a5 && !v18)
  {
    v15 = objc_retainAutorelease(v15);
    *a5 = v15;
  }
LABEL_8:

  return v18;
}

- (id)getFileMetadataWithFileHandle:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0C94BB8];
  v7 = a3;
  objc_msgSend__openInfo(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(v6, v11, (uint64_t)v7, v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)readBytesOfInMemoryAssetContentWithContainer:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  id v19;
  id v21;

  v10 = a3;
  v11 = (void *)MEMORY[0x1C3B83E24]();
  if (objc_msgSend_shouldReadAssetContentUsingClientProxy(self, v12, v13))
  {
    objc_msgSend_trackingUUID(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend_readBytesOfInMemoryAssetContentWithUUID_offset_length_error_(v10, v17, (uint64_t)v16, a4, a5, &v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;

  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 3001, CFSTR("Requested to read bytes using client proxy when shouldReadAssetContentUsingClientProxy is NO"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
  }
  objc_autoreleasePoolPop(v11);
  if (a6 && !v18)
    *a6 = objc_retainAutorelease(v19);

  return v18;
}

- (id)clonedFileURLInDestinationDirectory:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  int v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  void *v40;
  id v42;
  id v43;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B83E24]();
  objc_msgSend_fileHandle(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v11 = v8;
    v12 = v5;
    v42 = 0;
    v13 = objc_msgSend_fileDescriptor(v8, v9, v10);
  }
  else
  {
    v43 = 0;
    objc_msgSend_openWithError_(self, v9, (uint64_t)&v43);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v43;
    objc_msgSend_fileHandle(v14, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v40 = 0;
      goto LABEL_9;
    }
    v42 = v15;
    v12 = v5;
    v13 = objc_msgSend_fileDescriptor(v11, v18, v19);
  }
  v20 = v13;
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signature(self, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  CKStringWithData();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend_initWithFormat_(v21, v32, (uint64_t)CFSTR("%@.%@"), v27, v31);

  objc_msgSend_stringByAppendingPathComponent_(v4, v34, (uint64_t)v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (const char *)objc_msgSend_fileSystemRepresentation(v35, v36, v37);
  if (fclonefileat(v20, -1, v38, 0))
  {
    v40 = 0;
  }
  else
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v39, (uint64_t)v35);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v12;

  v15 = v42;
LABEL_9:

  objc_autoreleasePoolPop(v5);
  return v40;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
  objc_storeStrong((id *)&self->_fileID, a3);
}

- (NSNumber)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(id)a3
{
  objc_storeStrong((id *)&self->_generationID, a3);
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandle, a3);
}

- (NSNumber)modTimeInSeconds
{
  return self->_modTimeInSeconds;
}

- (void)setModTimeInSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_modTimeInSeconds, a3);
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (unint64_t)paddedFileSize
{
  return self->_paddedFileSize;
}

- (void)setPaddedFileSize:(unint64_t)a3
{
  self->_paddedFileSize = a3;
}

- (NSData)verificationKey
{
  return self->_verificationKey;
}

- (void)setVerificationKey:(id)a3
{
  objc_storeStrong((id *)&self->_verificationKey, a3);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unsigned)chunkCount
{
  return self->_chunkCount;
}

- (void)setChunkCount:(unsigned int)a3
{
  self->_chunkCount = a3;
}

- (int64_t)packageIndex
{
  return self->_packageIndex;
}

- (void)setPackageIndex:(int64_t)a3
{
  self->_packageIndex = a3;
}

- (NSString)putPackageSectionIdentifier
{
  return self->_putPackageSectionIdentifier;
}

- (void)setPutPackageSectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_putPackageSectionIdentifier, a3);
}

- (CKAsset)asset
{
  return self->_asset;
}

- (CKPackage)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
  objc_storeStrong((id *)&self->_package, a3);
}

- (BOOL)isPackageManifest
{
  return self->_isPackageManifest;
}

- (void)setIsPackageManifest:(BOOL)a3
{
  self->_isPackageManifest = a3;
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

- (NSString)recordKey
{
  return self->_recordKey;
}

- (void)setRecordKey:(id)a3
{
  objc_storeStrong((id *)&self->_recordKey, a3);
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSString)itemTypeHint
{
  return self->_itemTypeHint;
}

- (void)setItemTypeHint:(id)a3
{
  objc_storeStrong((id *)&self->_itemTypeHint, a3);
}

- (NSURL)contentBaseURL
{
  return self->_contentBaseURL;
}

- (void)setContentBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_contentBaseURL, a3);
}

- (NSString)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong((id *)&self->_owner, a3);
}

- (NSString)requestor
{
  return self->_requestor;
}

- (void)setRequestor:(id)a3
{
  objc_storeStrong((id *)&self->_requestor, a3);
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
  objc_storeStrong((id *)&self->_authToken, a3);
}

- (CKAssetDownloadPreauthorization)downloadPreauthorization
{
  return self->_downloadPreauthorization;
}

- (void)setDownloadPreauthorization:(id)a3
{
  objc_storeStrong((id *)&self->_downloadPreauthorization, a3);
}

- (NSString)uploadReceipt
{
  return self->_uploadReceipt;
}

- (void)setUploadReceipt:(id)a3
{
  objc_storeStrong((id *)&self->_uploadReceipt, a3);
}

- (double)uploadReceiptExpiration
{
  return self->_uploadReceiptExpiration;
}

- (void)setUploadReceiptExpiration:(double)a3
{
  self->_uploadReceiptExpiration = a3;
}

- (NSMutableArray)sectionItems
{
  return self->_sectionItems;
}

- (void)setSectionItems:(id)a3
{
  objc_storeStrong((id *)&self->_sectionItems, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSData)assetKey
{
  return self->_assetKey;
}

- (void)setAssetKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetKey, a3);
}

- (NSData)wrappedAssetKey
{
  return self->_wrappedAssetKey;
}

- (void)setWrappedAssetKey:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedAssetKey, a3);
}

- (NSData)clearAssetKey
{
  return self->_clearAssetKey;
}

- (void)setClearAssetKey:(id)a3
{
  objc_storeStrong((id *)&self->_clearAssetKey, a3);
}

- (NSData)boundaryKey
{
  return self->_boundaryKey;
}

- (void)setBoundaryKey:(id)a3
{
  objc_storeStrong((id *)&self->_boundaryKey, a3);
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (void)setReferenceSignature:(id)a3
{
  objc_storeStrong((id *)&self->_referenceSignature, a3);
}

- (CKDMMCSItemCommandWriter)writer
{
  return self->_writer;
}

- (void)setWriter:(id)a3
{
  objc_storeStrong((id *)&self->_writer, a3);
}

- (BOOL)downloadLooksOkay
{
  return self->_downloadLooksOkay;
}

- (void)setDownloadLooksOkay:(BOOL)a3
{
  self->_downloadLooksOkay = a3;
}

- (unint64_t)uploadTokenExpiration
{
  return self->_uploadTokenExpiration;
}

- (void)setUploadTokenExpiration:(unint64_t)a3
{
  self->_uploadTokenExpiration = a3;
}

- (unint64_t)downloadTokenExpiration
{
  return self->_downloadTokenExpiration;
}

- (void)setDownloadTokenExpiration:(unint64_t)a3
{
  self->_downloadTokenExpiration = a3;
}

- (NSDictionary)assetChunkerOptions
{
  return self->_assetChunkerOptions;
}

- (void)setAssetChunkerOptions:(id)a3
{
  objc_storeStrong((id *)&self->_assetChunkerOptions, a3);
}

- (CKDAssetZoneKey)assetZoneKey
{
  return self->_assetZoneKey;
}

- (void)setAssetZoneKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetZoneKey, a3);
}

- (NSURL)constructedAssetDownloadURL
{
  return self->_constructedAssetDownloadURL;
}

- (void)setConstructedAssetDownloadURL:(id)a3
{
  objc_storeStrong((id *)&self->_constructedAssetDownloadURL, a3);
}

- (unint64_t)constructedAssetEstimatedSize
{
  return self->_constructedAssetEstimatedSize;
}

- (void)setConstructedAssetEstimatedSize:(unint64_t)a3
{
  self->_constructedAssetEstimatedSize = a3;
}

- (NSString)trackingUUID
{
  return self->_trackingUUID;
}

- (void)setTrackingUUID:(id)a3
{
  objc_storeStrong((id *)&self->_trackingUUID, a3);
}

- (BOOL)hasSize
{
  return self->_hasSize;
}

- (void)setHasSize:(BOOL)a3
{
  self->_hasSize = a3;
}

- (BOOL)hasOffset
{
  return self->_hasOffset;
}

- (void)setHasOffset:(BOOL)a3
{
  self->_hasOffset = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isTemporary
{
  return self->_isTemporary;
}

- (BOOL)shouldReadRawEncryptedData
{
  return self->_shouldReadRawEncryptedData;
}

- (void)setShouldReadRawEncryptedData:(BOOL)a3
{
  self->_shouldReadRawEncryptedData = a3;
}

- (BOOL)shouldReadAssetContentUsingClientProxy
{
  return self->_shouldReadAssetContentUsingClientProxy;
}

- (void)setShouldReadAssetContentUsingClientProxy:(BOOL)a3
{
  self->_shouldReadAssetContentUsingClientProxy = a3;
}

- (BOOL)usesAssetDownloadStagingManager
{
  return self->_usesAssetDownloadStagingManager;
}

- (void)setUsesAssetDownloadStagingManager:(BOOL)a3
{
  self->_usesAssetDownloadStagingManager = a3;
}

- (BOOL)isAlreadyRegistered
{
  return self->_isAlreadyRegistered;
}

- (void)setIsAlreadyRegistered:(BOOL)a3
{
  self->_isAlreadyRegistered = a3;
}

- (BOOL)isReaderReadFrom
{
  return self->_isReaderReadFrom;
}

- (void)setIsReaderReadFrom:(BOOL)a3
{
  self->_isReaderReadFrom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingUUID, 0);
  objc_storeStrong((id *)&self->_constructedAssetDownloadURL, 0);
  objc_storeStrong((id *)&self->_assetZoneKey, 0);
  objc_storeStrong((id *)&self->_assetChunkerOptions, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_boundaryKey, 0);
  objc_storeStrong((id *)&self->_clearAssetKey, 0);
  objc_storeStrong((id *)&self->_wrappedAssetKey, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sectionItems, 0);
  objc_storeStrong((id *)&self->_uploadReceipt, 0);
  objc_storeStrong((id *)&self->_downloadPreauthorization, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_requestor, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_contentBaseURL, 0);
  objc_storeStrong((id *)&self->_itemTypeHint, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_putPackageSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_verificationKey, 0);
  objc_storeStrong((id *)&self->_modTimeInSeconds, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
