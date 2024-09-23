@implementation CKQueryOperationInfo

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (CKQueryOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKQueryOperationInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKQuery *query;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  CKRecordZoneID *zoneID;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  CKQueryCursor *cursor;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSArray *desiredKeys;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  NSDictionary *assetTransferOptionsByKey;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CKQueryOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v45, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("query"));
    v9 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (CKQuery *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("zoneID"));
    v13 = objc_claimAutoreleasedReturnValue();
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("cursor"));
    v17 = objc_claimAutoreleasedReturnValue();
    cursor = v5->_cursor;
    v5->_cursor = (CKQueryCursor *)v17;

    v5->_resultsLimit = objc_msgSend_decodeInt64ForKey_(v4, v19, (uint64_t)CFSTR("limit"), v20);
    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend_setWithObjects_(v21, v24, v22, v25, v23, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v26, (uint64_t)CFSTR("desiredKeys"));
    v28 = objc_claimAutoreleasedReturnValue();
    desiredKeys = v5->_desiredKeys;
    v5->_desiredKeys = (NSArray *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    objc_msgSend_setWithObjects_(v30, v34, v31, v35, v32, v33, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v36, (uint64_t)CFSTR("assetTransferOptionsByKey"));
    v38 = objc_claimAutoreleasedReturnValue();
    assetTransferOptionsByKey = v5->_assetTransferOptionsByKey;
    v5->_assetTransferOptionsByKey = (NSDictionary *)v38;

    v5->_shouldFetchAssetContent = objc_msgSend_decodeBoolForKey_(v4, v40, (uint64_t)CFSTR("fetchAssetContent"), v41);
    v5->_fetchAllResults = objc_msgSend_decodeBoolForKey_(v4, v42, (uint64_t)CFSTR("fetchAllResults"), v43);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKQueryOperationInfo)init
{
  CKQueryOperationInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKQueryOperationInfo;
  result = -[CKOperationInfo init](&v3, sel_init);
  if (result)
    result->_shouldFetchAssetContent = 1;
  return result;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (CKQuery)query
{
  return self->_query;
}

- (CKQueryCursor)cursor
{
  return self->_cursor;
}

- (NSDictionary)assetTransferOptionsByKey
{
  return self->_assetTransferOptionsByKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTransferOptionsByKey, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (BOOL)shouldFetchAssetContent
{
  return self->_shouldFetchAssetContent;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (BOOL)fetchAllResults
{
  return self->_fetchAllResults;
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
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t AssetContent;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t AllResults;
  const char *v45;
  objc_super v46;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v46.receiver = self;
  v46.super_class = (Class)CKQueryOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v46, sel_encodeWithCoder_, v4);
  objc_msgSend_query(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("query"));

  objc_msgSend_zoneID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("zoneID"));

  objc_msgSend_cursor(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, (uint64_t)CFSTR("cursor"));

  v24 = objc_msgSend_resultsLimit(self, v21, v22, v23);
  objc_msgSend_encodeInt64_forKey_(v4, v25, v24, (uint64_t)CFSTR("limit"));
  objc_msgSend_desiredKeys(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v29, (uint64_t)CFSTR("desiredKeys"));

  objc_msgSend_assetTransferOptionsByKey(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, (uint64_t)CFSTR("assetTransferOptionsByKey"));

  AssetContent = objc_msgSend_shouldFetchAssetContent(self, v36, v37, v38);
  objc_msgSend_encodeBool_forKey_(v4, v40, AssetContent, (uint64_t)CFSTR("fetchAssetContent"));
  AllResults = objc_msgSend_fetchAllResults(self, v41, v42, v43);
  objc_msgSend_encodeBool_forKey_(v4, v45, AllResults, (uint64_t)CFSTR("fetchAllResults"));
  objc_autoreleasePoolPop(v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
