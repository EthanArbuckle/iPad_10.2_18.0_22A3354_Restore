@implementation BCMutableGlobalMetadatum

- (BCMutableGlobalMetadatum)initWithKey:(id)a3
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
      sub_227E5E908();

    v9 = 0;
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)BCMutableGlobalMetadatum;
  v9 = -[BCMutableCloudData init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    self = (BCMutableGlobalMetadatum *)*((_QWORD *)v9 + 8);
    *((_QWORD *)v9 + 8) = v10;
LABEL_7:

  }
  return (BCMutableGlobalMetadatum *)v9;
}

- (BCMutableGlobalMetadatum)initWithCloudData:(id)a3
{
  id v4;
  BCMutableGlobalMetadatum *v5;
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
  NSString *key;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *value;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BCMutableGlobalMetadatum;
  v5 = -[BCMutableCloudData initWithCloudData:](&v31, sel_initWithCloudData_, v4);
  if (v5)
  {
    BUProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    if (v6)
    {
      objc_msgSend_key(v6, v7, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_copy(v12, v13, v14, v15, v16);
      key = v5->_key;
      v5->_key = (NSString *)v17;

      objc_msgSend_value(v11, v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend_copy(v23, v24, v25, v26, v27);
      value = v5->_value;
      v5->_value = (NSString *)v28;
    }
    else
    {
      BDSCloudKitLog();
      value = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(value, OS_LOG_TYPE_ERROR))
        sub_227E5E79C();
      v23 = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (BCMutableGlobalMetadatum)initWithRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BCMutableGlobalMetadatum *v8;
  uint64_t v9;
  NSString *key;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *value;
  objc_super v21;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    value = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(value, OS_LOG_TYPE_ERROR))
      sub_227E5E934();
    v8 = 0;
    goto LABEL_7;
  }
  v21.receiver = self;
  v21.super_class = (Class)BCMutableGlobalMetadatum;
  v8 = -[BCMutableCloudData initWithRecord:](&v21, sel_initWithRecord_, v4);
  if (v8)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    key = v8->_key;
    v8->_key = (NSString *)v9;

    objc_msgSend_objectForKey_(v4, v11, (uint64_t)CFSTR("value"), v12, v13);
    self = (BCMutableGlobalMetadatum *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_copy(self, v14, v15, v16, v17);
    value = v8->_value;
    v8->_value = (NSString *)v18;
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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_key(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_value(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("key: %@, value: %@"), v14, v15, v7, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (id)recordType
{
  return CFSTR("globalMetadata");
}

- (id)zoneName
{
  return CFSTR("GlobalMetadata");
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BCMutableGlobalMetadatum;
  -[BCMutableCloudData configuredRecordFromAttributes](&v12, sel_configuredRecordFromAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_value(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v9, (uint64_t)v8, (uint64_t)CFSTR("value"), v10);

  return v3;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
