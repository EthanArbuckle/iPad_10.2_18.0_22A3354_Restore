@implementation BCMutableStoreItem

- (BCMutableStoreItem)initWithStoreID:(id)a3
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
      sub_227E5AEE8();

    v9 = 0;
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)BCMutableStoreItem;
  v9 = -[BCMutableCloudData init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    self = (BCMutableStoreItem *)*((_QWORD *)v9 + 8);
    *((_QWORD *)v9 + 8) = v10;
LABEL_7:

  }
  return (BCMutableStoreItem *)v9;
}

- (BCMutableStoreItem)initWithCloudData:(id)a3
{
  id v4;
  BCMutableStoreItem *v5;
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
  NSObject *storeID;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BCMutableStoreItem;
  v5 = -[BCMutableCloudData initWithCloudData:](&v20, sel_initWithCloudData_, v4);
  if (v5)
  {
    BUProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    if (v6)
    {
      objc_msgSend_storeID(v6, v7, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_copy(v12, v13, v14, v15, v16);
      storeID = v5->_storeID;
      v5->_storeID = (NSString *)v17;
    }
    else
    {
      BDSCloudKitLog();
      storeID = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(storeID, OS_LOG_TYPE_ERROR))
        sub_227E5AD7C();
      v12 = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (BCMutableStoreItem)initWithRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v12;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_227E5AF14();

    v8 = 0;
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)BCMutableStoreItem;
  v8 = -[BCMutableCloudData initWithRecord:](&v12, sel_initWithRecord_, v4);
  if (v8)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    self = (BCMutableStoreItem *)*((_QWORD *)v8 + 8);
    *((_QWORD *)v8 + 8) = v9;
LABEL_7:

  }
  return (BCMutableStoreItem *)v8;
}

- (id)recordType
{
  return CFSTR("storeItem");
}

- (id)zoneName
{
  return CFSTR("AssetZone");
}

- (id)configuredRecordFromAttributes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCMutableStoreItem;
  -[BCMutableCloudData configuredRecordFromAttributes](&v3, sel_configuredRecordFromAttributes);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCMutableStoreItem;
  -[BCMutableCloudData encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (BCMutableStoreItem)initWithCoder:(id)a3
{
  BCMutableStoreItem *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BCMutableStoreItem *v8;
  uint64_t v9;
  NSString *storeID;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BCMutableStoreItem;
  v3 = -[BCMutableCloudData initWithCoder:](&v12, sel_initWithCoder_, a3);
  v8 = v3;
  if (v3)
  {
    objc_msgSend_localRecordID(v3, v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    storeID = v8->_storeID;
    v8->_storeID = (NSString *)v9;

  }
  return v8;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeID, 0);
}

@end
