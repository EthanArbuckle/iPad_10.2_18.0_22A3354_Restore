@implementation CKFetchRecordsOperationInfo

- (CKFetchRecordsOperationInfo)init
{
  CKFetchRecordsOperationInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordsOperationInfo;
  result = -[CKOperationInfo init](&v3, sel_init);
  if (result)
  {
    result->_shouldFetchAssetContent = 1;
    result->_shouldFetchMergeableValues = 1;
    result->_shouldRequestEncryptedAssetOwnerIdentifier = 0;
  }
  return result;
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
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t CurrentUserOperation;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t AssetContent;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t AssetContentInMemory;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t MergeableValues;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t shouldCloneFileInAssetCache;
  const char *v70;
  objc_super v71;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v71.receiver = self;
  v71.super_class = (Class)CKFetchRecordsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v71, sel_encodeWithCoder_, v4);
  objc_msgSend_recordIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("recordIDs"));

  CurrentUserOperation = objc_msgSend_isFetchCurrentUserOperation(self, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v4, v15, CurrentUserOperation, (uint64_t)CFSTR("isFetchCurrentUser"));
  AssetContent = objc_msgSend_shouldFetchAssetContent(self, v16, v17, v18);
  objc_msgSend_encodeBool_forKey_(v4, v20, AssetContent, (uint64_t)CFSTR("shouldFetchAssetContent"));
  AssetContentInMemory = objc_msgSend_shouldFetchAssetContentInMemory(self, v21, v22, v23);
  objc_msgSend_encodeBool_forKey_(v4, v25, AssetContentInMemory, (uint64_t)CFSTR("shouldFetchAssetContentInMemory"));
  v29 = objc_msgSend_dropInMemoryAssetContentASAP(self, v26, v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v30, v29, (uint64_t)CFSTR("dropInMemoryAssetContentASAP"));
  objc_msgSend_assetTransferOptionsByRecordTypeAndKey(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, (uint64_t)CFSTR("assetTransferOptionsByRecordTypeAndKey"));

  MergeableValues = objc_msgSend_shouldFetchMergeableValues(self, v36, v37, v38);
  objc_msgSend_encodeBool_forKey_(v4, v40, MergeableValues, (uint64_t)CFSTR("shouldFetchMergeableValues"));
  objc_msgSend_desiredKeys(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, (uint64_t)CFSTR("desiredKeys"));

  objc_msgSend_recordIDsToETags(self, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v50, (uint64_t)v49, (uint64_t)CFSTR("ETag"));

  objc_msgSend_recordIDsToVersionETags(self, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v55, (uint64_t)v54, (uint64_t)CFSTR("VersionETag"));

  objc_msgSend_desiredPackageFileIndices(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v60, (uint64_t)v59, (uint64_t)CFSTR("DesiredPackageFileIndices"));

  objc_msgSend_webSharingIdentityDataByRecordID(self, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, (uint64_t)CFSTR("WebSharingIdentities"));

  shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(self, v66, v67, v68);
  objc_msgSend_encodeBool_forKey_(v4, v70, shouldCloneFileInAssetCache, (uint64_t)CFSTR("ShouldCloneFileInAssetCache"));
  objc_autoreleasePoolPop(v5);

}

- (CKFetchRecordsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKFetchRecordsOperationInfo *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSArray *recordIDs;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  NSDictionary *assetTransferOptionsByRecordTypeAndKey;
  const char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSArray *desiredKeys;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  NSDictionary *recordIDsToETags;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  NSDictionary *recordIDsToVersionETags;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  NSDictionary *desiredPackageFileIndices;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  NSDictionary *webSharingIdentityDataByRecordID;
  const char *v84;
  uint64_t v85;
  void *context;
  objc_super v88;
  _QWORD v89[4];

  v89[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v88.receiver = self;
  v88.super_class = (Class)CKFetchRecordsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v88, sel_initWithCoder_, v4);
  if (v5)
  {
    context = (void *)MEMORY[0x18D76DE4C]();
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v10, v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("recordIDs"));
    v13 = objc_claimAutoreleasedReturnValue();
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSArray *)v13;

    v5->_isFetchCurrentUserOperation = objc_msgSend_decodeBoolForKey_(v4, v15, (uint64_t)CFSTR("isFetchCurrentUser"), v16);
    v5->_shouldFetchAssetContent = objc_msgSend_decodeBoolForKey_(v4, v17, (uint64_t)CFSTR("shouldFetchAssetContent"), v18);
    v5->_shouldFetchAssetContentInMemory = objc_msgSend_decodeBoolForKey_(v4, v19, (uint64_t)CFSTR("shouldFetchAssetContentInMemory"), v20);
    v5->_dropInMemoryAssetContentASAP = objc_msgSend_decodeBoolForKey_(v4, v21, (uint64_t)CFSTR("dropInMemoryAssetContentASAP"), v22);
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend_setWithObjects_(v23, v27, v24, v28, v25, v26, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, (uint64_t)CFSTR("assetTransferOptionsByRecordTypeAndKey"));
    v31 = objc_claimAutoreleasedReturnValue();
    assetTransferOptionsByRecordTypeAndKey = v5->_assetTransferOptionsByRecordTypeAndKey;
    v5->_assetTransferOptionsByRecordTypeAndKey = (NSDictionary *)v31;

    v5->_shouldFetchMergeableValues = objc_msgSend_decodeBoolForKey_(v4, v33, (uint64_t)CFSTR("shouldFetchMergeableValues"), v34);
    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    objc_msgSend_setWithObjects_(v35, v38, v36, v39, v37, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v41, (uint64_t)v40, (uint64_t)CFSTR("desiredKeys"));
    v42 = objc_claimAutoreleasedReturnValue();
    desiredKeys = v5->_desiredKeys;
    v5->_desiredKeys = (NSArray *)v42;

    v44 = (void *)MEMORY[0x1E0C99E60];
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    v47 = objc_opt_class();
    objc_msgSend_setWithObjects_(v44, v48, v45, v49, v46, v47, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v51, (uint64_t)v50, (uint64_t)CFSTR("ETag"));
    v52 = objc_claimAutoreleasedReturnValue();
    recordIDsToETags = v5->_recordIDsToETags;
    v5->_recordIDsToETags = (NSDictionary *)v52;

    v54 = (void *)MEMORY[0x1E0C99E60];
    v55 = objc_opt_class();
    v56 = objc_opt_class();
    v57 = objc_opt_class();
    objc_msgSend_setWithObjects_(v54, v58, v55, v59, v56, v57, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v61, (uint64_t)v60, (uint64_t)CFSTR("VersionETag"));
    v62 = objc_claimAutoreleasedReturnValue();
    recordIDsToVersionETags = v5->_recordIDsToVersionETags;
    v5->_recordIDsToVersionETags = (NSDictionary *)v62;

    v64 = (void *)MEMORY[0x1E0C99E60];
    v65 = objc_opt_class();
    v66 = objc_opt_class();
    v67 = objc_opt_class();
    v68 = objc_opt_class();
    objc_msgSend_setWithObjects_(v64, v69, v65, v70, v66, v67, v68, 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v72, (uint64_t)v71, (uint64_t)CFSTR("DesiredPackageFileIndices"));
    v73 = objc_claimAutoreleasedReturnValue();
    desiredPackageFileIndices = v5->_desiredPackageFileIndices;
    v5->_desiredPackageFileIndices = (NSDictionary *)v73;

    v75 = (void *)MEMORY[0x1E0C99E60];
    v89[0] = objc_opt_class();
    v89[1] = objc_opt_class();
    v89[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v76, (uint64_t)v89, 3);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v75, v78, (uint64_t)v77, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v81, (uint64_t)v80, (uint64_t)CFSTR("WebSharingIdentities"));
    v82 = objc_claimAutoreleasedReturnValue();
    webSharingIdentityDataByRecordID = v5->_webSharingIdentityDataByRecordID;
    v5->_webSharingIdentityDataByRecordID = (NSDictionary *)v82;

    v5->_shouldCloneFileInAssetCache = objc_msgSend_decodeBoolForKey_(v4, v84, (uint64_t)CFSTR("ShouldCloneFileInAssetCache"), v85);
    objc_autoreleasePoolPop(context);
  }

  return v5;
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDs, a3);
}

- (BOOL)isFetchCurrentUserOperation
{
  return self->_isFetchCurrentUserOperation;
}

- (void)setIsFetchCurrentUserOperation:(BOOL)a3
{
  self->_isFetchCurrentUserOperation = a3;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_desiredKeys, a3);
}

- (NSDictionary)recordIDsToETags
{
  return self->_recordIDsToETags;
}

- (void)setRecordIDsToETags:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToETags, a3);
}

- (NSDictionary)recordIDsToVersionETags
{
  return self->_recordIDsToVersionETags;
}

- (void)setRecordIDsToVersionETags:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, a3);
}

- (NSDictionary)desiredPackageFileIndices
{
  return self->_desiredPackageFileIndices;
}

- (void)setDesiredPackageFileIndices:(id)a3
{
  objc_storeStrong((id *)&self->_desiredPackageFileIndices, a3);
}

- (BOOL)fetchingAssetsForRereference
{
  return self->_fetchingAssetsForRereference;
}

- (void)setFetchingAssetsForRereference:(BOOL)a3
{
  self->_fetchingAssetsForRereference = a3;
}

- (id)cloneContextReturnBlock
{
  return self->_cloneContextReturnBlock;
}

- (void)setCloneContextReturnBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (void)setShouldFetchAssetContent:(BOOL)a3
{
  self->_shouldFetchAssetContent = a3;
}

- (BOOL)shouldFetchAssetContentInMemory
{
  return self->_shouldFetchAssetContentInMemory;
}

- (void)setShouldFetchAssetContentInMemory:(BOOL)a3
{
  self->_shouldFetchAssetContentInMemory = a3;
}

- (BOOL)shouldRequestEncryptedAssetOwnerIdentifier
{
  return self->_shouldRequestEncryptedAssetOwnerIdentifier;
}

- (void)setShouldRequestEncryptedAssetOwnerIdentifier:(BOOL)a3
{
  self->_shouldRequestEncryptedAssetOwnerIdentifier = a3;
}

- (BOOL)dropInMemoryAssetContentASAP
{
  return self->_dropInMemoryAssetContentASAP;
}

- (void)setDropInMemoryAssetContentASAP:(BOOL)a3
{
  self->_dropInMemoryAssetContentASAP = a3;
}

- (BOOL)shouldFetchMergeableValues
{
  return self->_shouldFetchMergeableValues;
}

- (void)setShouldFetchMergeableValues:(BOOL)a3
{
  self->_shouldFetchMergeableValues = a3;
}

- (NSDictionary)assetTransferOptionsByRecordTypeAndKey
{
  return self->_assetTransferOptionsByRecordTypeAndKey;
}

- (void)setAssetTransferOptionsByRecordTypeAndKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, a3);
}

- (NSSet)assetFieldNamesToPublishURLs
{
  return self->_assetFieldNamesToPublishURLs;
}

- (void)setAssetFieldNamesToPublishURLs:(id)a3
{
  objc_storeStrong((id *)&self->_assetFieldNamesToPublishURLs, a3);
}

- (unint64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void)setRequestedTTL:(unint64_t)a3
{
  self->_requestedTTL = a3;
}

- (unint64_t)URLOptions
{
  return self->_URLOptions;
}

- (void)setURLOptions:(unint64_t)a3
{
  self->_URLOptions = a3;
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (NSDictionary)webSharingIdentityDataByRecordID
{
  return self->_webSharingIdentityDataByRecordID;
}

- (void)setWebSharingIdentityDataByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webSharingIdentityDataByRecordID, 0);
  objc_storeStrong((id *)&self->_assetFieldNamesToPublishURLs, 0);
  objc_storeStrong((id *)&self->_assetTransferOptionsByRecordTypeAndKey, 0);
  objc_storeStrong(&self->_cloneContextReturnBlock, 0);
  objc_storeStrong((id *)&self->_desiredPackageFileIndices, 0);
  objc_storeStrong((id *)&self->_recordIDsToVersionETags, 0);
  objc_storeStrong((id *)&self->_recordIDsToETags, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end
