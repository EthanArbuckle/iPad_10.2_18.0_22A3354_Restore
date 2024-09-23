@implementation BCMutableReadingNowDetail

- (BCMutableReadingNowDetail)initWithAssetID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v13;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_227E5E350();

    v9 = 0;
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)BCMutableReadingNowDetail;
  v9 = -[BCMutableCloudData init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    self = (BCMutableReadingNowDetail *)*((_QWORD *)v9 + 9);
    *((_QWORD *)v9 + 9) = v10;
LABEL_7:

  }
  return (BCMutableReadingNowDetail *)v9;
}

- (BCMutableReadingNowDetail)initWithCloudData:(id)a3
{
  id v4;
  BCMutableReadingNowDetail *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *assetID;
  const char *v19;
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
  NSDate *lastEngagedDate;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *cloudAssetType;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BCMutableReadingNowDetail;
  v5 = -[BCMutableCloudData initWithCloudData:](&v46, sel_initWithCloudData_, v4);
  if (v5)
  {
    BUProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    if (v6)
    {
      objc_msgSend_assetID(v6, v7, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_copy(v12, v13, v14, v15, v16);
      assetID = v5->_assetID;
      v5->_assetID = (NSString *)v17;

      v5->_isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(v11, v19, v20, v21, v22);
      objc_msgSend_lastEngagedDate(v11, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_copy(v27, v28, v29, v30, v31);
      lastEngagedDate = v5->_lastEngagedDate;
      v5->_lastEngagedDate = (NSDate *)v32;

      objc_msgSend_cloudAssetType(v11, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_copy(v38, v39, v40, v41, v42);
      cloudAssetType = v5->_cloudAssetType;
      v5->_cloudAssetType = (NSString *)v43;
    }
    else
    {
      BDSCloudKitLog();
      cloudAssetType = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(cloudAssetType, OS_LOG_TYPE_ERROR))
        sub_227E5DF7C();
      v38 = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (BCMutableReadingNowDetail)initWithRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BCMutableReadingNowDetail *v8;
  uint64_t v9;
  NSString *assetID;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSDate *lastEngagedDate;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSString *cloudAssetType;
  objc_super v30;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_227E5E37C();
    v8 = 0;
    goto LABEL_7;
  }
  v30.receiver = self;
  v30.super_class = (Class)BCMutableReadingNowDetail;
  v8 = -[BCMutableCloudData initWithRecord:](&v30, sel_initWithRecord_, v4);
  if (v8)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    assetID = v8->_assetID;
    v8->_assetID = (NSString *)v9;

    objc_msgSend_objectForKey_(v4, v11, (uint64_t)CFSTR("isTrackedAsRecent"), v12, v13);
    self = (BCMutableReadingNowDetail *)objc_claimAutoreleasedReturnValue();
    v8->_isTrackedAsRecent = objc_msgSend_BOOLValue(self, v14, v15, v16, v17);
    objc_msgSend_objectForKey_(v4, v18, (uint64_t)CFSTR("lastEngagedDate"), v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    lastEngagedDate = v8->_lastEngagedDate;
    v8->_lastEngagedDate = (NSDate *)v21;

    objc_opt_class();
    objc_msgSend_objectForKey_(v4, v23, (uint64_t)CFSTR("cloudAssetType"), v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v27 = objc_claimAutoreleasedReturnValue();
    cloudAssetType = v8->_cloudAssetType;
    v8->_cloudAssetType = (NSString *)v27;

LABEL_7:
  }

  return v8;
}

- (NSString)description
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
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_assetID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isTrackedAsRecent(self, v8, v9, v10, v11))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend_lastEngagedDate(self, v12, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cloudAssetType(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v23, (uint64_t)CFSTR("assetID: %@, isTrackedAsRecent: %@, lastEngagedDate: %@, cloudAssetType: %@"), v24, v25, v7, v16, v17, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v26;
}

- (id)recordType
{
  return CFSTR("readingNowDetail");
}

- (id)zoneName
{
  return CFSTR("AssetZone");
}

- (id)configuredRecordFromAttributes
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t isTrackedAsRecent;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)BCMutableReadingNowDetail;
  -[BCMutableCloudData configuredRecordFromAttributes](&v37, sel_configuredRecordFromAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v5, v6, v7, v8);
  objc_msgSend_numberWithBool_(v4, v10, isTrackedAsRecent, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("isTrackedAsRecent"), v15);

  objc_msgSend_lastEngagedDate(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v21, (uint64_t)v20, (uint64_t)CFSTR("lastEngagedDate"), v22);

  BDSCloudKitLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_cloudAssetType(self, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v39 = v28;
    v40 = 2112;
    v41 = CFSTR("cloudAssetType");
    _os_log_impl(&dword_227D4F000, v23, OS_LOG_TYPE_DEFAULT, "BCReadingNowDetail configuredRecordFromAttributes setting cloudAssetType:%@ for %@", buf, 0x16u);

  }
  objc_msgSend_cloudAssetType(self, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v34, (uint64_t)v33, (uint64_t)CFSTR("cloudAssetType"), v35);

  return v3;
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
  uint64_t v8;
  uint64_t isTrackedAsRecent;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)BCMutableReadingNowDetail;
  v4 = a3;
  -[BCMutableCloudData encodeWithCoder:](&v26, sel_encodeWithCoder_, v4);
  isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v5, v6, v7, v8, v26.receiver, v26.super_class);
  objc_msgSend_encodeBool_forKey_(v4, v10, isTrackedAsRecent, (uint64_t)CFSTR("isTrackedAsRecent"), v11);
  objc_msgSend_lastEngagedDate(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("lastEngagedDate"), v18);

  objc_msgSend_cloudAssetType(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("cloudAssetType"), v25);

}

- (BCMutableReadingNowDetail)initWithCoder:(id)a3
{
  id v4;
  BCMutableReadingNowDetail *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BCMutableReadingNowDetail *v10;
  uint64_t v11;
  NSString *assetID;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSDate *lastEngagedDate;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *cloudAssetType;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BCMutableReadingNowDetail;
  v5 = -[BCMutableCloudData initWithCoder:](&v27, sel_initWithCoder_, v4);
  v10 = v5;
  if (v5)
  {
    objc_msgSend_localRecordID(v5, v6, v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    assetID = v10->_assetID;
    v10->_assetID = (NSString *)v11;

    v10->_isTrackedAsRecent = objc_msgSend_decodeBoolForKey_(v4, v13, (uint64_t)CFSTR("isTrackedAsRecent"), v14, v15);
    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("lastEngagedDate"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    lastEngagedDate = v10->_lastEngagedDate;
    v10->_lastEngagedDate = (NSDate *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("cloudAssetType"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    cloudAssetType = v10->_cloudAssetType;
    v10->_cloudAssetType = (NSString *)v24;

  }
  return v10;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isTrackedAsRecent
{
  return self->_isTrackedAsRecent;
}

- (void)setIsTrackedAsRecent:(BOOL)a3
{
  self->_isTrackedAsRecent = a3;
}

- (NSDate)lastEngagedDate
{
  return self->_lastEngagedDate;
}

- (void)setLastEngagedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)cloudAssetType
{
  return self->_cloudAssetType;
}

- (void)setCloudAssetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudAssetType, 0);
  objc_storeStrong((id *)&self->_lastEngagedDate, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
