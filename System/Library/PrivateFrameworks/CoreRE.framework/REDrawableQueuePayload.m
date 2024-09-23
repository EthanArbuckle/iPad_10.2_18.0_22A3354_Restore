@implementation REDrawableQueuePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REDrawableQueuePayload)initWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(unint64_t)a5 textureHandles:(id)a6 allowPixelFormatConversion:(BOOL)a7 machSemaphore:(unsigned int)a8 queueStateShmem:(void *)region queueStateLength:(unint64_t)length
{
  id v16;
  REDrawableQueuePayload *v17;
  REDrawableQueuePayload *v18;
  uint64_t v19;
  NSArray *textureHandles;
  OS_xpc_object *v21;
  OS_xpc_object *queueStateShmem;
  re *v23;
  REDrawableQueuePayload *v24;
  NSObject *v25;
  const char *v26;
  __int16 v28[8];
  objc_super v29;

  v16 = a6;
  v29.receiver = self;
  v29.super_class = (Class)REDrawableQueuePayload;
  v17 = -[RESharedResourcePayload init](&v29, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_8;
  v17->_width = a3;
  v17->_height = a4;
  v17->_pixelFormat = a5;
  v19 = objc_msgSend(v16, "copy");
  textureHandles = v18->_textureHandles;
  v18->_textureHandles = (NSArray *)v19;

  if (!-[NSArray count](v18->_textureHandles, "count"))
  {
    v25 = *re::assetTypesLogObjects(0);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_18;
    v28[0] = 0;
    v26 = "Expected non-empty array of texture handles";
LABEL_17:
    _os_log_fault_impl(&dword_224FE9000, v25, OS_LOG_TYPE_FAULT, v26, (uint8_t *)v28, 2u);
    goto LABEL_18;
  }
  if (!region || !length)
  {
    v25 = *re::assetTypesLogObjects((re *)region);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_18;
    v28[0] = 0;
    v26 = "Expected non-empty queue state shmem region";
    goto LABEL_17;
  }
  v21 = (OS_xpc_object *)xpc_shmem_create(region, length);
  queueStateShmem = v18->_queueStateShmem;
  v18->_queueStateShmem = v21;

  if (!v18->_queueStateShmem)
  {
    v25 = *re::assetTypesLogObjects(v23);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_18;
    v28[0] = 0;
    v26 = "Failed to create xpc_shmem object";
    goto LABEL_17;
  }
  v18->_machSemaphore = a8;
  if (!a8)
  {
    v25 = *re::assetTypesLogObjects(v23);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      v28[0] = 0;
      v26 = "Expected non-empty machSemaphore object";
      goto LABEL_17;
    }
LABEL_18:
    v24 = 0;
    goto LABEL_19;
  }
  v18->_allowPixelFormatConversion = a7;
LABEL_8:
  v24 = v18;
LABEL_19:

  return v24;
}

- (REDrawableQueuePayload)initWithCoder:(id)a3
{
  id v4;
  REDrawableQueuePayload *v5;
  NSString *v6;
  unint64_t v7;
  unint64_t v8;
  NSString *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *textureHandles;
  void *v16;
  uint64_t v17;
  OS_xpc_object *queueStateShmem;
  NSString *v19;
  REDrawableQueuePayload *v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[16];
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)REDrawableQueuePayload;
  v5 = -[RESharedResourcePayload initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);
LABEL_16:

    v20 = 0;
    goto LABEL_17;
  }
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("width"));
  v5->_width = v7;
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("height"));
  v5->_height = v8;
  v5->_pixelFormat = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pixelFormat"));
  if (HIDWORD(v8) || HIDWORD(v7))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);
    goto LABEL_16;
  }
  v10 = v4;
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v13, CFSTR("textureHandles"));
  v14 = objc_claimAutoreleasedReturnValue();
  textureHandles = v5->_textureHandles;
  v5->_textureHandles = (NSArray *)v14;

  v5->_allowPixelFormatConversion = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("allowPixelFormatConversion"));
  objc_msgSend(v10, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFD8], CFSTR("drawableQueueMachSemaphore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v22 = *re::assetTypesLogObjects(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_224FE9000, v22, OS_LOG_TYPE_FAULT, "Unable to get decode a mach semaphore", buf, 2u);
    }
    goto LABEL_15;
  }
  v5->_machSemaphore = xpc_mach_send_copy_right();
  objc_msgSend(v10, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFE8], CFSTR("queueStateShmem"));
  v17 = objc_claimAutoreleasedReturnValue();
  queueStateShmem = v5->_queueStateShmem;
  v5->_queueStateShmem = (OS_xpc_object *)v17;

  if (!v5->_textureHandles || !v5->_queueStateShmem)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "failWithError:", v21);

LABEL_15:
    goto LABEL_16;
  }

LABEL_9:
  v20 = v5;
LABEL_17:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t isKindOfClass;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v4;
    objc_msgSend(v6, "encodeInteger:forKey:", self->_width, CFSTR("width"));
    objc_msgSend(v6, "encodeInteger:forKey:", self->_height, CFSTR("height"));
    objc_msgSend(v6, "encodeInteger:forKey:", self->_pixelFormat, CFSTR("pixelFormat"));
    objc_msgSend(v6, "encodeObject:forKey:", self->_textureHandles, CFSTR("textureHandles"));
    objc_msgSend(v6, "encodeBool:forKey:", self->_allowPixelFormatConversion, CFSTR("allowPixelFormatConversion"));
    v7 = (void *)xpc_mach_send_create();
    objc_msgSend(v6, "encodeXPCObject:forKey:", v7, CFSTR("drawableQueueMachSemaphore"));
    objc_msgSend(v6, "encodeXPCObject:forKey:", self->_queueStateShmem, CFSTR("queueStateShmem"));

  }
  else
  {
    v8 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_224FE9000, v8, OS_LOG_TYPE_FAULT, "Expected to encode an REDrawableQueuePayload into an NSXPCCoder", v9, 2u);
    }
  }

}

- (id)redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<REDrawableQueuePayload: %p, Texture handles: %@>"), self, self->_textureHandles);
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)height
{
  return self->_height;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (NSArray)textureHandles
{
  return self->_textureHandles;
}

- (BOOL)allowPixelFormatConversion
{
  return self->_allowPixelFormatConversion;
}

- (unsigned)machSemaphore
{
  return self->_machSemaphore;
}

- (OS_xpc_object)queueStateShmem
{
  return self->_queueStateShmem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueStateShmem, 0);
  objc_storeStrong((id *)&self->_textureHandles, 0);
}

@end
