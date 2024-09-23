@implementation BMFileHandle

- (BMFileAttributes)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = xpc_fd_create(self->_fd);
    objc_msgSend(v5, "encodeXPCObject:forKey:", v4, CFSTR("xfd"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_attributes, CFSTR("attr"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 4, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "failWithError:", v4);
  }

}

- (int)fd
{
  return self->_fd;
}

- (BMFileHandle)initWithFileDescriptor:(int)a3 attributes:(id)a4
{
  BMFileHandle *v4;

  if (a3 < 0)
  {
    v4 = 0;
  }
  else
  {
    self = (BMFileHandle *)-[BMFileHandle _initWithFileDescriptor:attributes:](self, "_initWithFileDescriptor:attributes:");
    v4 = self;
  }

  return v4;
}

- (id)_initWithFileDescriptor:(int)a3 attributes:(id)a4
{
  id v7;
  BMFileHandle *v8;
  BMFileHandle *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMFileHandle;
  v8 = -[BMFileHandle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_fd = a3;
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_attributes, a4);
    v9->_initialized = 1;
  }

  return v9;
}

- (BOOL)isStale
{
  NSObject *v3;
  void *v4;
  int v5;
  BOOL v6;
  int v7;
  os_unfair_lock_s *p_lock;
  DIR *v9;
  DIR *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int *v15;
  NSObject *v16;
  NSObject *v17;
  int *v18;
  dirent *v20;
  stat v21;
  _BYTE v22[16];
  dirent v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  memset(&v21, 0, sizeof(v21));
  if (fstat(self->_fd, &v21))
  {
    __biome_log_for_category(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BMFileHandle isStale].cold.5();
    goto LABEL_28;
  }
  if (v21.st_nlink)
  {
    bm_fd_get_path(self->_fd);
    v3 = objc_claimAutoreleasedReturnValue();
    -[BMFileAttributes path](self->_attributes, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject isEqualToString:](v3, "isEqualToString:", v4);

    if (v5)
    {
      v6 = 0;
      if ((v21.st_mode & 0xF000) != 0x4000 || v21.st_nlink > 2u)
        goto LABEL_29;
      v7 = dup(self->_fd);
      if (v7 < 0)
      {
        __biome_log_for_category(2);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[BMFileHandle isStale].cold.1();

      }
      else
      {
        p_lock = &self->_lock;
        os_unfair_lock_lock(p_lock);
        v9 = fdopendir(v7);
        v10 = v9;
        if (v9)
        {
          memset(&v23, 0, 512);
          v20 = 0;
          v11 = readdir_r(v9, &v23, &v20);
          if (v11)
          {
            __biome_log_for_category(2);
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
              -[BMFileHandle isStale].cold.4(v11, v12, v13);

          }
          rewinddir(v10);
          if (closedir(v10) == -1)
          {
            __biome_log_for_category(2);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              v15 = __error();
              -[BMFileHandle isStale].cold.3(v15, (uint64_t)v22, v14);
            }

          }
          if (v20)
          {
            os_unfair_lock_unlock(p_lock);
            v6 = 0;
LABEL_29:

            return v6;
          }
        }
        else
        {
          __biome_log_for_category(2);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = __error();
            -[BMFileHandle isStale].cold.2(v18, (uint8_t *)&v23, v17);
          }

          close(v7);
        }
        os_unfair_lock_unlock(p_lock);
      }
    }
LABEL_28:
    v6 = 1;
    goto LABEL_29;
  }
  return 1;
}

- (void)dealloc
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *__error();
  v5[0] = 67240448;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_1AEB31000, a2, OS_LOG_TYPE_ERROR, "Failed to close fd %{public}d with %{darwin.errno}d", (uint8_t *)v5, 0xEu);
}

- (BOOL)overwriteWithData:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!self->_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileHandle.m"), 222, CFSTR("Attempting to use uninitialized BMFileHandle"));

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", self->_fd, 0);
  v9 = v8;
  if (!v8)
  {
    if (!a4)
      goto LABEL_9;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = CFSTR("Unspecified failure");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    LOBYTE(a4) = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(v8, "truncateAtOffset:error:", 0, a4))
    goto LABEL_8;
  LOBYTE(a4) = objc_msgSend(v9, "writeData:error:", v7, a4);
LABEL_9:

  return (char)a4;
}

- (BMFileHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BMFileAttributes *v6;
  BMFileAttributes *attributes;
  BMFileHandle *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81318], CFSTR("xfd"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_fd = xpc_fd_dup(v5);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attr"));
    v6 = (BMFileAttributes *)objc_claimAutoreleasedReturnValue();
    attributes = self->_attributes;
    self->_attributes = v6;

    self->_initialized = 1;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v5);
    v8 = 0;
  }

  return v8;
}

- (id)readDataWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!self->_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileHandle.m"), 203, CFSTR("Attempting to use uninitialized BMFileHandle"));

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", self->_fd, 0);
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    if (objc_msgSend(v5, "seekToOffset:error:", 0, a3))
    {
      objc_msgSend(v6, "readDataToEndOfFileAndReturnError:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (a3)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      v14[0] = CFSTR("Unspecified failure");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileHandle)nsFileHandle
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v8;

  if (!self->_initialized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileHandle.m"), 190, CFSTR("Attempting to use uninitialized BMFileHandle"));

  }
  v3 = dup(self->_fd);
  if ((v3 & 0x80000000) != 0)
  {
    __biome_log_for_category(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BMFileHandle nsFileHandle].cold.1();

    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v3, 1);
  }
  return (NSFileHandle *)v4;
}

- (void)performWithInProcessLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileHandle.m"), 333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(p_lock);
  v7[2]();
  os_unfair_lock_unlock(p_lock);

}

- (void)nsFileHandle
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_0_1(&dword_1AEB31000, v0, v1, "dup() failed: %{darwin.errno}d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)isStale
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_0_1(&dword_1AEB31000, v0, v1, "fstat() failed: %{darwin.errno}d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1_2();
}

@end
