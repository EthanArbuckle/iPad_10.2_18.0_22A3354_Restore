@implementation BCMutableAssetAnnotations

- (BCMutableAssetAnnotations)initWithAssetID:(id)a3
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
      sub_227E5BA80();

    v9 = 0;
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)BCMutableAssetAnnotations;
  v9 = -[BCMutableCloudData init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    self = (BCMutableAssetAnnotations *)*((_QWORD *)v9 + 8);
    *((_QWORD *)v9 + 8) = v10;
LABEL_7:

  }
  return (BCMutableAssetAnnotations *)v9;
}

- (BCMutableAssetAnnotations)initWithCloudData:(id)a3
{
  id v4;
  BCMutableAssetAnnotations *v5;
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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString *assetVersion;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *p_super;
  NSObject *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BCMutableAssetAnnotations;
  v5 = -[BCMutableCloudData initWithCloudData:](&v41, sel_initWithCloudData_, v4);
  if (v5)
  {
    BUProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    if (v6)
    {
      objc_msgSend_assetID(v6, v7, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend_copy(v12, v13, v14, v15, v16);

      if (objc_msgSend_length(v17, v18, v19, v20, v21))
      {
        objc_storeStrong((id *)&v5->_assetID, v17);
        objc_msgSend_assetVersion(v11, v22, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_copy(v26, v27, v28, v29, v30);
        assetVersion = v5->_assetVersion;
        v5->_assetVersion = (NSString *)v31;

        objc_msgSend_bookAnnotations(v11, v33, v34, v35, v36);
        v37 = objc_claimAutoreleasedReturnValue();
        p_super = &v5->_bookAnnotations->super;
        v5->_bookAnnotations = (NSData *)v37;
LABEL_12:

        goto LABEL_13;
      }
      BDSCloudKitLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_227E5BAD8();

      p_super = &v5->super.super;
    }
    else
    {
      BDSCloudKitLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        sub_227E5BAAC();
      v17 = v5;
    }
    v5 = 0;
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (BCMutableAssetAnnotations)initWithRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BCMutableAssetAnnotations *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *assetVersion;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *p_super;
  NSObject *v33;
  uint64_t v34;
  objc_super v36;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_227E5BB04();
    goto LABEL_11;
  }
  v36.receiver = self;
  v36.super_class = (Class)BCMutableAssetAnnotations;
  v8 = -[BCMutableCloudData initWithRecord:](&v36, sel_initWithRecord_, v4);
  if (v8)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7);
    self = (BCMutableAssetAnnotations *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(self, v9, v10, v11, v12))
    {
      objc_storeStrong((id *)&v8->_assetID, self);
      objc_msgSend_objectForKey_(v4, v13, (uint64_t)CFSTR("assetVersion"), v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      assetVersion = v8->_assetVersion;
      v8->_assetVersion = (NSString *)v16;

      objc_opt_class();
      objc_msgSend_objectForKey_(v4, v18, (uint64_t)CFSTR("assetAnnotations"), v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      BUDynamicCast();
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_fileURL(v22, v23, v24, v25, v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        objc_msgSend_dataWithContentsOfURL_(MEMORY[0x24BDBCE50], v27, (uint64_t)v30, v28, v29);
        v31 = objc_claimAutoreleasedReturnValue();
        p_super = &v8->_bookAnnotations->super;
        v8->_bookAnnotations = (NSData *)v31;
      }
      else
      {
        BDSCloudKitLog();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          sub_227E5BB5C((uint64_t *)&v8->_assetID, p_super, v34);
      }

      goto LABEL_15;
    }
    BDSCloudKitLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_227E5BB30();

    v22 = &v8->super.super;
LABEL_11:
    v8 = 0;
LABEL_15:

  }
  return v8;
}

- (NSString)debugDescription
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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_assetID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetVersion(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bookAnnotations(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v18, (uint64_t)CFSTR("assetID: %@, assetVersion: %@, annotations: %@"), v19, v20, v7, v12, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (id)recordType
{
  return CFSTR("assetAnnotations");
}

- (id)zoneName
{
  return CFSTR("AssetZone");
}

- (id)configuredRecordFromAttributes
{
  void *v3;
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
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
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
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  int v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)BCMutableAssetAnnotations;
  -[BCMutableCloudData configuredRecordFromAttributes](&v49, sel_configuredRecordFromAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetVersion(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v9, (uint64_t)v8, (uint64_t)CFSTR("assetVersion"), v10);

  objc_msgSend_sharedManager(BCCloudAssetManager, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetAnnotationManager(v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetID(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLForCachingCKAssetWithAssetID_(v20, v26, (uint64_t)v25, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29
    && (objc_msgSend_bookAnnotations(self, v30, v31, v32, v33),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v37 = objc_msgSend_writeToURL_atomically_(v34, v35, (uint64_t)v29, 1, v36),
        v34,
        v37))
  {
    v38 = objc_alloc(MEMORY[0x24BDB9010]);
    v42 = (void *)objc_msgSend_initWithFileURL_(v38, v39, (uint64_t)v29, v40, v41);
    objc_msgSend_setObject_forKey_(v3, v43, (uint64_t)v42, (uint64_t)CFSTR("assetAnnotations"), v44);

  }
  else
  {
    BDSCloudKitLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_227E5BBC8();

    objc_msgSend_setObject_forKey_(v3, v46, 0, (uint64_t)CFSTR("assetAnnotations"), v47);
  }

  return v3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)bookAnnotations
{
  return self->_bookAnnotations;
}

- (void)setBookAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_bookAnnotations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookAnnotations, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
