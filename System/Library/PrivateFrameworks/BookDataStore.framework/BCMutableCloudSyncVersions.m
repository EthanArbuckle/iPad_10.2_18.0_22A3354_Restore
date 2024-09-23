@implementation BCMutableCloudSyncVersions

- (BCMutableCloudSyncVersions)initWithCloudSyncVersions:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BCMutableCloudSyncVersions *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *dataType;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSPersistentHistoryToken *historyToken;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BCMutableCloudSyncVersions;
  v9 = -[BCMutableCloudSyncVersions init](&v45, sel_init);
  if (v9)
  {
    objc_msgSend_dataType(v4, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_copy(v10, v11, v12, v13, v14);
    dataType = v9->_dataType;
    v9->_dataType = (NSString *)v15;

    v9->_cloudVersion = objc_msgSend_cloudVersion(v4, v17, v18, v19, v20);
    v9->_localVersion = objc_msgSend_localVersion(v4, v21, v22, v23, v24);
    v9->_syncVersion = objc_msgSend_syncVersion(v4, v25, v26, v27, v28);
    objc_msgSend_historyToken(v4, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_copy(v33, v34, v35, v36, v37);
    historyToken = v9->_historyToken;
    v9->_historyToken = (NSPersistentHistoryToken *)v38;

    v9->_historyTokenOffset = objc_msgSend_historyTokenOffset(v4, v40, v41, v42, v43);
  }

  return v9;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_dataType(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_cloudVersion(self, v8, v9, v10, v11);
  v17 = objc_msgSend_localVersion(self, v13, v14, v15, v16);
  v22 = objc_msgSend_syncVersion(self, v18, v19, v20, v21);
  objc_msgSend_historyToken(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_historyTokenOffset(self, v28, v29, v30, v31);
  objc_msgSend_stringWithFormat_(v6, v33, (uint64_t)CFSTR("dataType: %@, cloudVersion: %lld, localVersion: %lld, syncVersion: %lld historyToken:%@ historyTokenOffset=%lld"), v34, v35, v7, v12, v17, v22, v27, v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  id v46;

  v46 = a3;
  objc_msgSend_dataType(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v46, v9, (uint64_t)v8, (uint64_t)CFSTR("dataType"), v10);

  v15 = objc_msgSend_cloudVersion(self, v11, v12, v13, v14);
  objc_msgSend_encodeInt64_forKey_(v46, v16, v15, (uint64_t)CFSTR("cloudVersion"), v17);
  v22 = objc_msgSend_localVersion(self, v18, v19, v20, v21);
  objc_msgSend_encodeInt64_forKey_(v46, v23, v22, (uint64_t)CFSTR("localVersion"), v24);
  v29 = objc_msgSend_syncVersion(self, v25, v26, v27, v28);
  objc_msgSend_encodeInt64_forKey_(v46, v30, v29, (uint64_t)CFSTR("syncVersion"), v31);
  objc_msgSend_historyToken(self, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v46, v37, (uint64_t)v36, (uint64_t)CFSTR("historyToken"), v38);

  v43 = objc_msgSend_historyTokenOffset(self, v39, v40, v41, v42);
  objc_msgSend_encodeInt64_forKey_(v46, v44, v43, (uint64_t)CFSTR("historyTokenOffset"), v45);

}

- (NSPersistentHistoryToken)historyToken
{
  return self->_historyToken;
}

- (int64_t)historyTokenOffset
{
  return self->_historyTokenOffset;
}

- (NSString)dataType
{
  return self->_dataType;
}

- (int64_t)cloudVersion
{
  return self->_cloudVersion;
}

- (int64_t)syncVersion
{
  return self->_syncVersion;
}

- (int64_t)localVersion
{
  return self->_localVersion;
}

- (BCMutableCloudSyncVersions)initWithCoder:(id)a3
{
  id v4;
  BCMutableCloudSyncVersions *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
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
  uint64_t v23;
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
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BCMutableCloudSyncVersions;
  v5 = -[BCMutableCloudSyncVersions init](&v45, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("dataType"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDataType_(v5, v10, (uint64_t)v9, v11, v12);

    v16 = objc_msgSend_decodeInt64ForKey_(v4, v13, (uint64_t)CFSTR("cloudVersion"), v14, v15);
    objc_msgSend_setCloudVersion_(v5, v17, v16, v18, v19);
    v23 = objc_msgSend_decodeInt64ForKey_(v4, v20, (uint64_t)CFSTR("localVersion"), v21, v22);
    objc_msgSend_setLocalVersion_(v5, v24, v23, v25, v26);
    v30 = objc_msgSend_decodeInt64ForKey_(v4, v27, (uint64_t)CFSTR("syncVersion"), v28, v29);
    objc_msgSend_setSyncVersion_(v5, v31, v30, v32, v33);
    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, (uint64_t)CFSTR("historyToken"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHistoryToken_(v5, v38, (uint64_t)v37, v39, v40);

    v5->_historyTokenOffset = objc_msgSend_decodeInt64ForKey_(v4, v41, (uint64_t)CFSTR("historyTokenOffset"), v42, v43);
  }

  return v5;
}

- (void)setSyncVersion:(int64_t)a3
{
  self->_syncVersion = a3;
}

- (void)setLocalVersion:(int64_t)a3
{
  self->_localVersion = a3;
}

- (void)setHistoryToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDataType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCloudVersion:(int64_t)a3
{
  self->_cloudVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_dataType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setHistoryTokenOffset:(int64_t)a3
{
  self->_historyTokenOffset = a3;
}

@end
