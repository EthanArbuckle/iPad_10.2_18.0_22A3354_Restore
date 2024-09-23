@implementation BCMutableCollectionMember

- (BCMutableCollectionMember)initWithCollectionMemberID:(id)a3
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
      sub_227E5E4FC();

    v9 = 0;
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)BCMutableCollectionMember;
  v9 = -[BCMutableCloudData init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    self = (BCMutableCollectionMember *)*((_QWORD *)v9 + 9);
    *((_QWORD *)v9 + 9) = v10;
LABEL_7:

  }
  return (BCMutableCollectionMember *)v9;
}

- (BCMutableCollectionMember)initWithCloudData:(id)a3
{
  id v4;
  BCMutableCollectionMember *v5;
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
  NSString *collectionMemberID;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BCMutableCollectionMember;
  v5 = -[BCMutableCloudData initWithCloudData:](&v25, sel_initWithCloudData_, v4);
  if (v5)
  {
    BUProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    if (v6)
    {
      objc_msgSend_collectionMemberID(v6, v7, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_copy(v12, v13, v14, v15, v16);
      collectionMemberID = v5->_collectionMemberID;
      v5->_collectionMemberID = (NSString *)v17;

      v5->_sortOrder = objc_msgSend_sortOrder(v11, v19, v20, v21, v22);
      if (v5->_collectionMemberID)
      {
LABEL_9:

        goto LABEL_10;
      }
      BDSCloudKitLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_227E5E554();
    }
    else
    {
      BDSCloudKitLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_227E5E528();
    }

    v5 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (BCMutableCollectionMember)initWithRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BCMutableCollectionMember *v8;
  uint64_t v9;
  NSString *collectionMemberID;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  objc_super v21;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_227E5E580();

    v8 = 0;
    goto LABEL_11;
  }
  v21.receiver = self;
  v21.super_class = (Class)BCMutableCollectionMember;
  v8 = -[BCMutableCloudData initWithRecord:](&v21, sel_initWithRecord_, v4);
  if (v8)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    collectionMemberID = v8->_collectionMemberID;
    v8->_collectionMemberID = (NSString *)v9;

    if (!v8->_collectionMemberID)
    {
      BDSCloudKitLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_227E5E5AC();

    }
    objc_msgSend_objectForKey_(v4, v11, (uint64_t)CFSTR("sortOrder"), v12, v13);
    self = (BCMutableCollectionMember *)objc_claimAutoreleasedReturnValue();
    v8->_sortOrder = objc_msgSend_intValue(self, v15, v16, v17, v18);
LABEL_11:

  }
  return v8;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collectionMemberID(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_sortOrder(self, v11, v12, v13, v14);
  objc_msgSend_modificationDate(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v21, (uint64_t)CFSTR("<%@: %p> collectionMemberID: %@, sortOrder:%d modificationDate:%@"), v22, v23, v5, self, v10, v15, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v24;
}

- (id)recordType
{
  return CFSTR("collectionMember");
}

- (id)zoneName
{
  return CFSTR("CollectionZone");
}

- (id)configuredRecordFromAttributes
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BCMutableCollectionMember;
  -[BCMutableCloudData configuredRecordFromAttributes](&v17, sel_configuredRecordFromAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend_sortOrder(self, v5, v6, v7, v8);
  objc_msgSend_numberWithInt_(v4, v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("sortOrder"), v15);

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
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BCMutableCollectionMember;
  v4 = a3;
  -[BCMutableCloudData encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  v9 = objc_msgSend_sortOrder(self, v5, v6, v7, v8, v12.receiver, v12.super_class);
  objc_msgSend_encodeInt_forKey_(v4, v10, v9, (uint64_t)CFSTR("sortOrder"), v11);

}

- (BCMutableCollectionMember)initWithCoder:(id)a3
{
  id v4;
  BCMutableCollectionMember *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BCMutableCollectionMember *v10;
  uint64_t v11;
  NSString *collectionMemberID;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BCMutableCollectionMember;
  v5 = -[BCMutableCloudData initWithCoder:](&v17, sel_initWithCoder_, v4);
  v10 = v5;
  if (v5)
  {
    objc_msgSend_localRecordID(v5, v6, v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    collectionMemberID = v10->_collectionMemberID;
    v10->_collectionMemberID = (NSString *)v11;

    v10->_sortOrder = objc_msgSend_decodeIntForKey_(v4, v13, (uint64_t)CFSTR("sortOrder"), v14, v15);
  }

  return v10;
}

- (NSString)collectionMemberID
{
  return self->_collectionMemberID;
}

- (void)setCollectionMemberID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int)a3
{
  self->_sortOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionMemberID, 0);
}

@end
