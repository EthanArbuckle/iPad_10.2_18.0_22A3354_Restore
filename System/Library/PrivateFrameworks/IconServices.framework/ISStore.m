@implementation ISStore

- (id)unitForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_registryLock);
    -[NSMutableDictionary objectForKey:](self->_registry, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_registryLock);
    if (!v5)
    {
      -[ISStore storeURL](self, "storeURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISStoreUnit storeUnitWithStoreURL:UUID:](ISStoreUnit, "storeUnitWithStoreURL:UUID:", v6, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        os_unfair_lock_lock(&self->_registryLock);
        -[NSMutableDictionary setObject:forKey:](self->_registry, "setObject:forKey:", v5, v4);
        os_unfair_lock_unlock(&self->_registryLock);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSURL)storeURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (ISStore)initWithURL:(id)a3
{
  id v5;
  ISStore *v6;
  ISStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISStore;
  v6 = -[ISStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storeURL, a3);

  return v7;
}

- (BOOL)writeStoreUnit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  char v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    -[NSURL path](self->_storeURL, "path");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CB2AA8];
    v42 = *MEMORY[0x1E0CB2AA8];
    v43[0] = &unk_1E5816158;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v11 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, v10, &v33);
    v12 = v33;

    if ((v11 & 1) == 0)
    {
      _ISDefaultLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[ISStore writeStoreUnit:].cold.4();
      v26 = 0;
      goto LABEL_23;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%s"), v14, "isdata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject stringByAppendingPathComponent:](v7, "stringByAppendingPathComponent:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    -[NSObject stringByAppendingPathExtension:](v16, "stringByAppendingPathExtension:", CFSTR("tmp"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v12;
    v18 = objc_msgSend(v5, "writeToFile:options:error:", v17, 0x10000000, &v32);
    v19 = v32;

    if ((v18 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v9;
      v41 = &unk_1E5816170;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v19;
      v22 = objc_msgSend(v20, "setAttributes:ofItemAtPath:error:", v21, v17, &v31);
      v23 = v31;

      if ((v22 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v23;
        v25 = objc_msgSend(v24, "moveItemAtPath:toPath:error:", v17, v16, &v30);
        v19 = v30;

        if ((v25 & 1) != 0)
        {
          v26 = 1;
LABEL_22:

          v12 = v19;
LABEL_23:

          goto LABEL_24;
        }
        _ISDefaultLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v35 = v17;
          v36 = 2112;
          v37 = v16;
          v38 = 2112;
          v39 = v19;
          _os_log_fault_impl(&dword_1AA928000, v28, OS_LOG_TYPE_FAULT, "Failed to move temp file %@ to %@ with error: %@", buf, 0x20u);
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v27 = objc_claimAutoreleasedReturnValue();
        -[NSObject removeItemAtPath:error:](v27, "removeItemAtPath:error:", v17, 0);
      }
      else
      {
        _ISDefaultLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          -[ISStore writeStoreUnit:].cold.2();
        v19 = v23;
      }
    }
    else
    {
      _ISDefaultLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        -[ISStore writeStoreUnit:].cold.3();
    }

    v26 = 0;
    goto LABEL_22;
  }
  _ISDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[ISStore writeStoreUnit:].cold.1(v7);
  v26 = 0;
LABEL_24:

  return v26;
}

- (id)addUnitWithData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[ISStoreUnit storeUnitWithData:](ISStoreUnit, "storeUnitWithData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isValid"))
  {
    objc_msgSend(v4, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISStore unitForUUID:](self, "unitForUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isValid") & 1) != 0)
    {
      v7 = v6;
    }
    else
    {
      _ISDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1AA928000, v8, OS_LOG_TYPE_INFO, "ADDING_NEW_STORE_ENTRY with UUID: %@", (uint8_t *)&v13, 0xCu);

      }
      v7 = v4;

      if (-[ISStore writeStoreUnit:](self, "writeStoreUnit:", v7))
      {
        -[ISStore storeURL](self, "storeURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "remapWithStoreURL:", v11);

      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)removeUnitForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;

  v4 = a3;
  -[NSURL path](self->_storeURL, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%s"), v7, "isdata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v10, "removeItemAtPath:error:", v9, &v15);
  v12 = v15;

  if ((v11 & 1) == 0 && objc_msgSend(v12, "code") != 4)
  {
    _ISDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ISStore removeUnitForUUID:].cold.1(v4, (uint64_t)v12, v13);

  }
  return v11;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)registry
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (os_unfair_lock_s)registryLock
{
  return self->_registryLock;
}

- (void)setRegistryLock:(os_unfair_lock_s)a3
{
  self->_registryLock = a3;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)writeStoreUnit:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AA928000, log, OS_LOG_TYPE_FAULT, "Error: unable to write store unit. No data to write", v1, 2u);
}

- (void)writeStoreUnit:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1AA928000, v0, v1, "Error setting permissions on file at path: %@. Error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)writeStoreUnit:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1AA928000, v0, v1, "Error writing to data to file at path: %@. Error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)writeStoreUnit:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_5(&dword_1AA928000, v0, v1, "Error creating cache folder at path: %@. Error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)removeUnitForUUID:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1AA928000, a3, OS_LOG_TYPE_ERROR, "Failed to remove store entry for UUID: %@ with error: %@", (uint8_t *)&v6, 0x16u);

}

@end
