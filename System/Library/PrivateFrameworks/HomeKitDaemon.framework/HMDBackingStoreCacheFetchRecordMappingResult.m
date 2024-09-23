@implementation HMDBackingStoreCacheFetchRecordMappingResult

- (HMDBackingStoreCacheFetchRecordMappingResult)initWithGroup:(id)a3 recordName:(id)a4 uuid:(id)a5 parentUuid:(id)a6 type:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDBackingStoreCacheFetchRecordMappingResult *v17;
  HMDBackingStoreCacheFetchRecordMappingResult *v18;
  HMDBackingStoreCacheFetchRecordMappingResult *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMDBackingStoreCacheFetchRecordMappingResult;
  v17 = -[HMDBackingStoreCacheFetchRecordMappingResult init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_group, a3);
    objc_storeStrong((id *)&v18->_recordName, a4);
    objc_storeStrong((id *)&v18->_uuid, a5);
    objc_storeStrong((id *)&v18->_parentUuid, a6);
    objc_storeStrong((id *)&v18->_type, a7);
    v19 = v18;
  }

  return v18;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDBackingStoreCacheFetchRecordMappingResult group](self, "group");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "zone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheFetchRecordMappingResult group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootRecordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheFetchRecordMappingResult recordName](self, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheFetchRecordMappingResult uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheFetchRecordMappingResult parentUuid](self, "parentUuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreCacheFetchRecordMappingResult type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<Mapping: zone: %@  group: %@  name: %@  uuid: %@  parent uuid: %@ type: %@>"), v4, v6, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)parentUuid
{
  return self->_parentUuid;
}

- (NSString)type
{
  return self->_type;
}

- (HMDBackingStoreCacheGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_parentUuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

@end
