@implementation CSDataWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcData, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)dealloc
{
  void *dataPtr;
  objc_super v4;

  dataPtr = (void *)self->_dataPtr;
  if (dataPtr && self->_mapped)
    munmap(dataPtr, self->_mapSize);
  v4.receiver = self;
  v4.super_class = (Class)CSDataWrapper;
  -[CSDataWrapper dealloc](&v4, sel_dealloc);
}

- (NSData)data
{
  NSData *data;
  const void *dataPtr;
  NSData *v5;
  NSData *v6;

  data = self->_data;
  if (!data)
  {
    dataPtr = self->_dataPtr;
    if (dataPtr)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", dataPtr, self->_dataSize, 0);
      v5 = (NSData *)objc_claimAutoreleasedReturnValue();
      v6 = self->_data;
      self->_data = v5;

      data = self->_data;
    }
    else
    {
      data = 0;
    }
  }
  return data;
}

- (CSDataWrapper)initWithXPCValue:(id)a3 allowWritableSharedMemory:(BOOL)a4
{
  id v7;
  CSDataWrapper *v8;
  uint64_t v9;
  size_t length;
  size_t v11;
  uint64_t v12;
  NSData *data;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSDataWrapper;
  v8 = -[CSDataWrapper init](&v15, sel_init);
  if (v8)
  {
    if (v7)
    {
      v9 = MEMORY[0x18D7829C8](v7);
      if (v9 == MEMORY[0x1E0C81388])
      {
        if (a4)
        {
          v11 = xpc_shmem_map(v7, (void **)&v8->_dataPtr);
          v8->_mapSize = v11;
          if (v8->_dataPtr)
          {
            v8->_dataSize = v11;
            v8->_mapped = 1;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          -[CSDataWrapper initWithXPCValue:allowWritableSharedMemory:].cold.1();
        }
      }
      else if (v9 == MEMORY[0x1E0C812E8])
      {
        length = xpc_data_get_length(v7);
        v8->_dataSize = length;
        if (length)
        {
          v8->_dataPtr = xpc_data_get_bytes_ptr(v7);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v12 = objc_claimAutoreleasedReturnValue();
          data = v8->_data;
          v8->_data = (NSData *)v12;

        }
      }
      if (v8->_dataPtr)
      {
        objc_storeStrong((id *)&v8->_xpcData, a3);
        goto LABEL_17;
      }
      if (v8->_data)
        goto LABEL_17;
    }

    v8 = 0;
  }
LABEL_17:

  return v8;
}

- (void)setDataSize:(unint64_t)a3
{
  if (self->_dataSize > a3)
    self->_dataSize = a3;
}

- (CSDataWrapper)initWithXPCValue:(id)a3
{
  return -[CSDataWrapper initWithXPCValue:allowWritableSharedMemory:](self, "initWithXPCValue:allowWritableSharedMemory:", a3, 1);
}

- (CSDataWrapper)initWithData:(id)a3
{
  id v5;
  CSDataWrapper *v6;
  CSDataWrapper *v7;
  id v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSDataWrapper;
  v6 = -[CSDataWrapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_data, a3);
      v8 = objc_retainAutorelease(v5);
      v7->_dataPtr = (const void *)objc_msgSend(v8, "bytes");
      v7->_dataSize = objc_msgSend(v8, "length");
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)dataSize
{
  return self->_dataSize;
}

- (OS_xpc_object)xpcData
{
  return self->_xpcData;
}

- (const)dataPtr
{
  return self->_dataPtr;
}

- (unint64_t)mapSize
{
  return self->_mapSize;
}

- (BOOL)mapped
{
  return self->_mapped;
}

- (void)initWithXPCValue:allowWritableSharedMemory:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_18C42F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "XPC_TYPE_SHMEM not allowed", v0, 2u);
}

@end
