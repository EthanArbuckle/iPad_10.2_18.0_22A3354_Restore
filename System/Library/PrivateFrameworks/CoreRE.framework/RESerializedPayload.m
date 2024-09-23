@implementation RESerializedPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RESerializedPayload)initWithTypeName:(id)a3 serializedBytes:(const void *)a4 size:(unint64_t)a5 blobBytes:(const void *)a6 size:(unint64_t)a7
{
  id v13;
  RESerializedPayload *v14;
  dispatch_data_t v15;
  id v16;
  dispatch_data_t v17;
  id v18;
  OS_dispatch_data *serializedData;
  NSObject *v20;
  OS_dispatch_data *blobData;
  objc_super v23;

  v13 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RESerializedPayload;
  v14 = -[RESharedResourcePayload init](&v23, sel_init);
  if (v14)
  {
    v15 = (dispatch_data_t)MEMORY[0x24BDAC990];
    v16 = MEMORY[0x24BDAC990];
    if (a4 && a5)
    {
      v15 = dispatch_data_create(a4, a5, 0, 0);

    }
    v17 = (dispatch_data_t)MEMORY[0x24BDAC990];
    v18 = MEMORY[0x24BDAC990];
    if (a6 && a7)
    {
      v17 = dispatch_data_create(a6, a7, 0, 0);

    }
    objc_storeStrong((id *)&v14->_typeName, a3);
    serializedData = v14->_serializedData;
    v14->_serializedData = (OS_dispatch_data *)v15;
    v20 = v15;

    blobData = v14->_blobData;
    v14->_blobData = (OS_dispatch_data *)v17;

  }
  return v14;
}

- (RESerializedPayload)initWithCoder:(id)a3
{
  id v4;
  RESerializedPayload *v5;
  uint64_t v6;
  NSString *typeName;
  void *v8;
  uint64_t v9;
  OS_dispatch_data *serializedData;
  void *v11;
  uint64_t v12;
  OS_dispatch_data *blobData;
  re *v14;
  RESerializedPayload *v15;
  NSObject *v16;
  NSString *v17;
  const char *v18;
  NSString *v20;
  objc_super v21;
  uint8_t buf[4];
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RESerializedPayload;
  v5 = -[RESharedResourcePayload initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeName"));
  v6 = objc_claimAutoreleasedReturnValue();
  typeName = v5->_typeName;
  v5->_typeName = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serializedData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_createDispatchData");
  serializedData = v5->_serializedData;
  v5->_serializedData = (OS_dispatch_data *)v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blobData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_createDispatchData");
  blobData = v5->_blobData;
  v5->_blobData = (OS_dispatch_data *)v12;

  if (!v5->_serializedData)
  {
    v16 = *re::foundationSerializationLogObjects(v14);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
LABEL_8:
      v15 = 0;
      goto LABEL_9;
    }
    v17 = v5->_typeName;
    *(_DWORD *)buf = 138412290;
    v23 = v17;
    v18 = "Failed to decode serialized data object for serialized payload of type %@";
LABEL_11:
    _os_log_fault_impl(&dword_224FE9000, v16, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    goto LABEL_8;
  }
  if (!v5->_blobData)
  {
    v16 = *re::foundationSerializationLogObjects(v14);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v20 = v5->_typeName;
    *(_DWORD *)buf = 138412290;
    v23 = v20;
    v18 = "Failed to decode blob data object for serialized payload of type %@";
    goto LABEL_11;
  }
LABEL_4:
  v15 = v5;
LABEL_9:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *typeName;
  id v5;

  typeName = self->_typeName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", typeName, CFSTR("typeName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serializedData, CFSTR("serializedData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_blobData, CFSTR("blobData"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<RESerializedPayload: %@: %@>"), self->_typeName, self->_serializedData);
}

- (id)redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<RESerializedPayload: %@>"), self->_typeName);
}

- (NSString)typeName
{
  return self->_typeName;
}

- (OS_dispatch_data)serializedData
{
  return self->_serializedData;
}

- (OS_dispatch_data)blobData
{
  return self->_blobData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blobData, 0);
  objc_storeStrong((id *)&self->_serializedData, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
}

@end
