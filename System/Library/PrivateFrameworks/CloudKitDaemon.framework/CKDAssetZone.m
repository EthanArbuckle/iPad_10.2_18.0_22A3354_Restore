@implementation CKDAssetZone

- (CKDAssetZone)initWithAssetZoneKey:(id)a3
{
  id v5;
  CKDAssetZone *v6;
  CKDAssetZone *v7;
  uint64_t v8;
  NSMutableOrderedSet *assetRecords;
  uint64_t v10;
  NSMutableDictionary *assetRecordsByRecordID;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDAssetZone;
  v6 = -[CKDAssetZone init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetZoneKey, a3);
    v8 = objc_opt_new();
    assetRecords = v7->_assetRecords;
    v7->_assetRecords = (NSMutableOrderedSet *)v8;

    v10 = objc_opt_new();
    assetRecordsByRecordID = v7->_assetRecordsByRecordID;
    v7->_assetRecordsByRecordID = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (void)addMMCSItem:(id)a3
{
  id v5;
  CKDAssetZoneKey *assetZoneKey;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  NSMutableDictionary *assetRecordsByRecordID;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  CKDAssetRecord *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSMutableDictionary *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;
  CKDAssetZoneKey *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  id v38;

  v5 = a3;
  assetZoneKey = self->_assetZoneKey;
  v38 = v5;
  objc_msgSend_assetZoneKey(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(assetZoneKey) = objc_msgSend_isEqual_(assetZoneKey, v10, (uint64_t)v9);

  if ((assetZoneKey & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = self->_assetZoneKey;
    objc_msgSend_assetZoneKey(v38, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v37, (uint64_t)a2, self, CFSTR("CKDAssetZone.m"), 35, CFSTR("Expected Item for Zone %@ but Found %@"), v33, v36);

  }
  assetRecordsByRecordID = self->_assetRecordsByRecordID;
  objc_msgSend_recordID(v38, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(assetRecordsByRecordID, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v18 = [CKDAssetRecord alloc];
    objc_msgSend_recordType(v38, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v38, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_initWithRecordType_recordID_(v18, v25, (uint64_t)v21, v24);

    v26 = self->_assetRecordsByRecordID;
    objc_msgSend_recordID(v38, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v26, v30, (uint64_t)v16, v29);

    objc_msgSend_addObject_(self->_assetRecords, v31, (uint64_t)v16);
  }
  objc_msgSend_addMMCSItem_(v16, v17, (uint64_t)v38);

}

- (void)addRereferencedMMCSPackageItem:(id)a3
{
  id v5;
  CKDAssetZoneKey *assetZoneKey;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  NSMutableDictionary *assetRecordsByRecordID;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  CKDAssetRecord *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSMutableDictionary *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;
  CKDAssetZoneKey *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  id v38;

  v5 = a3;
  assetZoneKey = self->_assetZoneKey;
  v38 = v5;
  objc_msgSend_assetZoneKey(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(assetZoneKey) = objc_msgSend_isEqual_(assetZoneKey, v10, (uint64_t)v9);

  if ((assetZoneKey & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = self->_assetZoneKey;
    objc_msgSend_assetZoneKey(v38, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v37, (uint64_t)a2, self, CFSTR("CKDAssetZone.m"), 47, CFSTR("Expected Item for Zone %@ but Found %@"), v33, v36);

  }
  assetRecordsByRecordID = self->_assetRecordsByRecordID;
  objc_msgSend_recordID(v38, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(assetRecordsByRecordID, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v18 = [CKDAssetRecord alloc];
    objc_msgSend_recordType(v38, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v38, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_initWithRecordType_recordID_(v18, v25, (uint64_t)v21, v24);

    v26 = self->_assetRecordsByRecordID;
    objc_msgSend_recordID(v38, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v26, v30, (uint64_t)v16, v29);

    objc_msgSend_addObject_(self->_assetRecords, v31, (uint64_t)v16);
  }
  objc_msgSend_addRereferencedMMCSPackageItem_(v16, v17, (uint64_t)v38);

}

- (void)addMMCSSectionItem:(id)a3
{
  id v5;
  CKDAssetZoneKey *assetZoneKey;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  NSMutableDictionary *assetRecordsByRecordID;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  CKDAssetRecord *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSMutableDictionary *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  void *v32;
  CKDAssetZoneKey *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  id v38;

  v5 = a3;
  assetZoneKey = self->_assetZoneKey;
  v38 = v5;
  objc_msgSend_assetZoneKey(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(assetZoneKey) = objc_msgSend_isEqual_(assetZoneKey, v10, (uint64_t)v9);

  if ((assetZoneKey & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = self->_assetZoneKey;
    objc_msgSend_assetZoneKey(v38, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v37, (uint64_t)a2, self, CFSTR("CKDAssetZone.m"), 60, CFSTR("Expected Item for Zone %@ but Found %@"), v33, v36);

  }
  assetRecordsByRecordID = self->_assetRecordsByRecordID;
  objc_msgSend_recordID(v38, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(assetRecordsByRecordID, v15, (uint64_t)v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v18 = [CKDAssetRecord alloc];
    objc_msgSend_recordType(v38, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v38, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_initWithRecordType_recordID_(v18, v25, (uint64_t)v21, v24);

    v26 = self->_assetRecordsByRecordID;
    objc_msgSend_recordID(v38, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v26, v30, (uint64_t)v16, v29);

    objc_msgSend_addObject_(self->_assetRecords, v31, (uint64_t)v16);
  }
  objc_msgSend_addMMCSSectionItem_(v16, v17, (uint64_t)v38);

}

- (NSMutableOrderedSet)assetRecords
{
  uint64_t v2;

  return (NSMutableOrderedSet *)(id)objc_msgSend_copy(self->_assetRecords, a2, v2);
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_assetZoneKey(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("assetZoneKey=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  objc_msgSend_componentsJoinedByString_(v3, v11, (uint64_t)CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetZone *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (CKDAssetZoneKey)assetZoneKey
{
  return self->_assetZoneKey;
}

- (void)setAssetZoneKey:(id)a3
{
  objc_storeStrong((id *)&self->_assetZoneKey, a3);
}

- (void)setAssetRecords:(id)a3
{
  objc_storeStrong((id *)&self->_assetRecords, a3);
}

- (NSMutableDictionary)assetRecordsByRecordID
{
  return self->_assetRecordsByRecordID;
}

- (void)setAssetRecordsByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_assetRecordsByRecordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetRecordsByRecordID, 0);
  objc_storeStrong((id *)&self->_assetRecords, 0);
  objc_storeStrong((id *)&self->_assetZoneKey, 0);
}

@end
