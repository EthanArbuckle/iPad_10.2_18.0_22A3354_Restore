@implementation HMDBackingStoreCacheFetchRecordResult

- (HMDBackingStoreCacheFetchRecordResult)initWithGroup:(id)a3 record:(id)a4 data:(id)a5 encoding:(unint64_t)a6 uuid:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDBackingStoreCacheFetchRecordResult *v17;
  HMDBackingStoreCacheFetchRecordResult *v18;
  HMDBackingStoreCacheFetchRecordResult *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDBackingStoreCacheFetchRecordResult;
  v17 = -[HMDBackingStoreCacheFetchRecordResult init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_group, a3);
    objc_storeStrong((id *)&v18->_record, a4);
    objc_storeStrong((id *)&v18->_data, a5);
    v18->_encoding = a6;
    objc_storeStrong((id *)&v18->_uuid, a7);
    v19 = v18;
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[HMDBackingStoreCacheFetchRecordResult group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheFetchRecordResult group](self, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootRecordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheFetchRecordResult record](self, "record");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDBackingStoreCacheFetchRecordResult encoding](self, "encoding");
  -[HMDBackingStoreCacheFetchRecordResult data](self, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<Record: zone: %@  group: %@  record.recordName: %@  encoding: %lu data: <%lu bytes>>"), v5, v7, v10, v11, objc_msgSend(v12, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (HMDBackingStoreCacheGroup)group
{
  return self->_group;
}

- (NSData)data
{
  return self->_data;
}

- (CKRecord)record
{
  return self->_record;
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
