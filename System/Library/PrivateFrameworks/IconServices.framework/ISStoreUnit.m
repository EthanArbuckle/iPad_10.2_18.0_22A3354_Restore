@implementation ISStoreUnit

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

+ (id)storeUnitWithStoreURL:(id)a3 UUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  int v13;
  size_t v14;
  void *v15;
  NSObject *v16;
  ISStoreUnit *v17;
  id v18;
  void *v19;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("isdata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  v12 = open((const char *)objc_msgSend(v11, "UTF8String"), 0, 256);
  if (v12 == -1)
  {
    _ISDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      +[ISStoreUnit storeUnitWithStoreURL:UUID:].cold.1();

    v17 = 0;
  }
  else
  {
    v13 = v12;
    v14 = lseek(v12, 0, 2);
    if (v14)
    {
      v15 = mmap(0, v14, 1, 1, v13, 0);
      if (v15 == (void *)-1)
        v14 = 0;
    }
    else
    {
      v15 = 0;
    }
    close(v13);
    v17 = 0;
    if (v15 && v14)
    {
      v18 = objc_alloc(MEMORY[0x1E0C99D50]);
      v19 = (void *)objc_msgSend(v18, "initWithBytesNoCopy:length:deallocator:", v15, v14, *MEMORY[0x1E0CB2910]);
      v17 = -[ISStoreUnit initWithData:UUID:]([ISStoreUnit alloc], "initWithData:UUID:", v19, v5);

    }
  }

  return v17;
}

- (ISStoreUnit)initWithData:(id)a3 UUID:(id)a4
{
  id v7;
  id v8;
  ISStoreUnit *v9;
  ISStoreUnit *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISStoreUnit;
  v9 = -[ISStoreUnit init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_UUID, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)storeUnitWithData:(id)a3
{
  id v3;
  uint64_t v4;
  size_t v5;
  size_t v6;
  ISStoreUnit *v7;
  ISStoreUnit *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  unint64_t v15;
  size_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ISStoreUnit *v22;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (!v4)
  {
    _ISDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[ISStoreUnit storeUnitWithData:].cold.1(v9);
    goto LABEL_8;
  }
  v5 = v4;
  v6 = (v4 + *MEMORY[0x1E0C85AD8] + 7) & -*MEMORY[0x1E0C85AD8];
  v7 = (ISStoreUnit *)mmap(0, v6, 3, 4097, 1224736768, 0);
  if (!v7)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_15;
  }
  v8 = v7;
  if (v7 == (ISStoreUnit *)-1)
  {
    _ISDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[ISStoreUnit storeUnitWithData:].cold.2(v9);
LABEL_8:

    v10 = 0;
    v11 = 0;
    v7 = 0;
    goto LABEL_15;
  }
  v12 = objc_alloc(MEMORY[0x1E0C99D50]);
  v10 = objc_retainAutorelease((id)objc_msgSend(v12, "initWithBytesNoCopy:length:deallocator:", v8, v5, *MEMORY[0x1E0CB2910]));
  v13 = (void *)objc_msgSend(v10, "bytes");
  v14 = (const void *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
  v15 = objc_msgSend(v10, "length");
  v16 = v5;
  if (v5 >= v15)
    v16 = objc_msgSend(v10, "length", v5);
  memcpy(v13, v14, v16);
  *(_QWORD *)((char *)v8 + v6 - 8) = v5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithBytes:size:", v8, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3940];
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cacheSaltString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@-%@"), v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v10 && v11)
    v7 = -[ISStoreUnit initWithData:UUID:]([ISStoreUnit alloc], "initWithData:UUID:", v10, v11);
LABEL_15:
  v22 = v7;

  return v22;
}

- (BOOL)isValid
{
  NSUInteger v3;

  v3 = -[NSData length](self->_data, "length");
  if (v3)
    LOBYTE(v3) = self->_UUID != 0;
  return v3;
}

- (void)remapWithStoreURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  int v11;
  void *v12;
  off_t v13;
  size_t v14;
  NSObject *v15;
  NSObject *v16;

  v4 = a3;
  if (-[ISStoreUnit isValid](self, "isValid"))
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](self->_UUID, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("isdata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_retainAutorelease(v8);
    v10 = open((const char *)objc_msgSend(v9, "UTF8String"), 0, 256);
    if (v10 == -1)
    {
      _ISDefaultLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        +[ISStoreUnit storeUnitWithStoreURL:UUID:].cold.1();

    }
    else
    {
      v11 = v10;
      v12 = -[NSData bytes](self->_data, "bytes");
      v13 = lseek(v11, 0, 2);
      if (v13 && (v14 = v13, v13 == -[NSData length](self->_data, "length")))
      {
        mmap(v12, v14, 1, 17, v11, 0);
      }
      else
      {
        _ISDefaultLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[ISStoreUnit remapWithStoreURL:].cold.2((uint64_t)v9, v15);

      }
      close(v11);
    }

  }
}

+ (void)storeUnitWithStoreURL:UUID:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_8(&dword_1AA928000, v0, v1, "Failed to open cache file for mapping at path: %@ error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)storeUnitWithData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AA928000, log, OS_LOG_TYPE_FAULT, "Failed to mmap file. The file has zero length.", v1, 2u);
}

+ (void)storeUnitWithData:(NSObject *)a1 .cold.2(NSObject *a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1AA928000, a1, OS_LOG_TYPE_FAULT, "Could not mmap(...), error: %d\n", (uint8_t *)v3, 8u);
}

- (void)remapWithStoreURL:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AA928000, a2, OS_LOG_TYPE_DEBUG, "Failed remap store entry with path: %@ due to data size mismatch.", (uint8_t *)&v2, 0xCu);
}

@end
