@implementation HMDBackingStoreCacheUpdateRecordOperation

- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 name:(id)a4 record:(id)a5 data:(id)a6 encoding:(unint64_t)a7 model:(id)a8 resultBlock:(id)a9
{
  HMDBackingStoreCacheGroup *v15;
  NSString *v16;
  CKRecord *v17;
  NSData *v18;
  HMDBackingStoreModelObject *v19;
  HMDBackingStoreCacheUpdateRecordOperation *v20;
  HMDBackingStoreCacheGroup *group;
  HMDBackingStoreCacheGroup *v22;
  NSString *recordName;
  NSString *v24;
  CKRecord *record;
  CKRecord *v26;
  NSData *data;
  NSData *v28;
  HMDBackingStoreModelObject *model;
  objc_super v31;

  v15 = (HMDBackingStoreCacheGroup *)a3;
  v16 = (NSString *)a4;
  v17 = (CKRecord *)a5;
  v18 = (NSData *)a6;
  v19 = (HMDBackingStoreModelObject *)a8;
  v31.receiver = self;
  v31.super_class = (Class)HMDBackingStoreCacheUpdateRecordOperation;
  v20 = -[HMDBackingStoreOperation initWithResultBlock:](&v31, sel_initWithResultBlock_, a9);
  group = v20->_group;
  v20->_group = v15;
  v22 = v15;

  recordName = v20->_recordName;
  v20->_recordName = v16;
  v24 = v16;

  record = v20->_record;
  v20->_record = v17;
  v26 = v17;

  data = v20->_data;
  v20->_data = v18;
  v28 = v18;

  v20->_encoding = a7;
  model = v20->_model;
  v20->_model = v19;

  return v20;
}

- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 record:(id)a4 data:(id)a5 encoding:(unint64_t)a6 resultBlock:(id)a7
{
  return -[HMDBackingStoreCacheUpdateRecordOperation initWithGroup:name:record:data:encoding:model:resultBlock:](self, "initWithGroup:name:record:data:encoding:model:resultBlock:", a3, 0, a4, a5, a6, 0, a7);
}

- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 record:(id)a4 resultBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDBackingStoreCacheUpdateRecordOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("k00"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (HMDBackingStoreCacheUpdateRecordOperation *)objc_msgSend(v11, "integerValue");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("k%02lu"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      self = -[HMDBackingStoreCacheUpdateRecordOperation initWithGroup:name:record:data:encoding:model:resultBlock:](self, "initWithGroup:name:record:data:encoding:model:resultBlock:", v8, 0, v9, v16, v12, 0, v10);
      v12 = self;
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (HMDBackingStoreCacheUpdateRecordOperation)initWithGroup:(id)a3 name:(id)a4 model:(id)a5 resultBlock:(id)a6
{
  return -[HMDBackingStoreCacheUpdateRecordOperation initWithGroup:name:record:data:encoding:model:resultBlock:](self, "initWithGroup:name:record:data:encoding:model:resultBlock:", a3, a4, 0, 0, 0, a5, a6);
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;

  -[HMDBackingStoreOperation store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreOperation store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v8 = objc_msgSend(v4, "_fetchIDForStore:error:", v7, &v19);
  v9 = v19;

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    -[HMDBackingStoreCacheUpdateRecordOperation record](self, "record");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDBackingStoreOperation store](self, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "local");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreCacheUpdateRecordOperation group](self, "group");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "groupID");
    if (v11)
    {
      -[HMDBackingStoreCacheUpdateRecordOperation record](self, "record");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreCacheUpdateRecordOperation data](self, "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_updateRecordWithGroupID:store:record:data:encoding:", v15, v8, v16, v17, -[HMDBackingStoreCacheUpdateRecordOperation encoding](self, "encoding"));
    }
    else
    {
      -[HMDBackingStoreCacheUpdateRecordOperation recordName](self, "recordName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackingStoreCacheUpdateRecordOperation model](self, "model");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_updateRecordWithGroupID:store:name:model:", v15, v8, v16, v17);
    }
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (HMDBackingStoreCacheGroup)group
{
  return (HMDBackingStoreCacheGroup *)objc_getProperty(self, a2, 280, 1);
}

- (NSString)recordName
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (CKRecord)record
{
  return (CKRecord *)objc_getProperty(self, a2, 296, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 304, 1);
}

- (HMDBackingStoreModelObject)model
{
  return (HMDBackingStoreModelObject *)objc_getProperty(self, a2, 312, 1);
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
