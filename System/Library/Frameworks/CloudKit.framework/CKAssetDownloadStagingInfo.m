@implementation CKAssetDownloadStagingInfo

- (CKAssetDownloadStagingInfo)initWithItemID:(id)a3 trackingUUID:(id)a4 signature:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKAssetDownloadStagingInfo *v14;
  uint64_t v15;
  NSNumber *itemID;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString *trackingUUID;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSData *signature;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKAssetDownloadStagingInfo;
  v14 = -[CKAssetDownloadStagingInfo init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v8, v11, v12, v13);
    itemID = v14->_itemID;
    v14->_itemID = (NSNumber *)v15;

    v20 = objc_msgSend_copy(v9, v17, v18, v19);
    trackingUUID = v14->_trackingUUID;
    v14->_trackingUUID = (NSString *)v20;

    v25 = objc_msgSend_copy(v10, v22, v23, v24);
    signature = v14->_signature;
    v14->_signature = (NSData *)v25;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  const char *v18;
  id v19;

  v4 = a3;
  objc_msgSend_itemID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("itemID"));

  objc_msgSend_trackingUUID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v13, (uint64_t)CFSTR("trackingUUID"));

  objc_msgSend_signature(self, v15, v16, v17);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v18, (uint64_t)v19, (uint64_t)CFSTR("signature"));

}

- (CKAssetDownloadStagingInfo)initWithCoder:(id)a3
{
  id v4;
  CKAssetDownloadStagingInfo *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSNumber *itemID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *trackingUUID;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSData *signature;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKAssetDownloadStagingInfo;
  v5 = -[CKAssetDownloadStagingInfo init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("itemID"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("trackingUUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    trackingUUID = v5->_trackingUUID;
    v5->_trackingUUID = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("signature"));
    v16 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v16;

  }
  return v5;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
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
  const char *v18;
  id v19;

  v4 = a3;
  objc_msgSend_itemID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("itemID"), (uint64_t)v8, 0);

  objc_msgSend_trackingUUID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("trackingUUID"), (uint64_t)v13, 0);

  objc_msgSend_signature(self, v15, v16, v17);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v18, (uint64_t)CFSTR("signature"), (uint64_t)v19, 0);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKAssetDownloadStagingInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKAssetDownloadStagingInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (NSString)trackingUUID
{
  return self->_trackingUUID;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_trackingUUID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
