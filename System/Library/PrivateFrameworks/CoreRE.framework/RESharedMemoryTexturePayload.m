@implementation RESharedMemoryTexturePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RESharedMemoryTexturePayload)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5
{
  RESharedMemoryTexturePayload *v5;
  RESharedMemoryTexturePayload *v6;
  RESharedMemoryTexturePayload *v7;
  NSObject *v8;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RESharedMemoryTexturePayload;
  v5 = -[RESharedResourcePayload init](&v11, sel_init, a3, a4, a5);
  v6 = v5;
  if (v5 && !v5->_data)
  {
    v8 = *re::assetTypesLogObjects((re *)v5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_fault_impl(&dword_224FE9000, v8, OS_LOG_TYPE_FAULT, "Expected data to be non-nil", v10, 2u);
    }
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (RESharedMemoryTexturePayload)initWithCoder:(id)a3
{
  id v4;
  RESharedMemoryTexturePayload *v5;
  void *v6;
  uint64_t v7;
  OS_dispatch_data *data;
  re *v9;
  RESharedMemoryTexturePayload *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  RESharedMemoryTexturePayload *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RESharedMemoryTexturePayload;
  v5 = -[RESharedResourcePayload initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "_createDispatchData"),
        data = v5->_data,
        v5->_data = (OS_dispatch_data *)v7,
        data,
        v6,
        !v5->_data))
  {
    v11 = *re::assetTypesLogObjects(v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_fault_impl(&dword_224FE9000, v11, OS_LOG_TYPE_FAULT, "Failed to decode data object for %@", buf, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_data, CFSTR("data"));
}

- (id)redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<RESharedMemoryTexturePayload: %p>"), self);
}

- (OS_dispatch_data)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
