@implementation SGKeyValueCacheFile

- (id)valueForKey:(id)a3 found:(BOOL *)a4
{
  id v7;
  const char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v15;
  _QWORD v16[7];
  __int16 v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  __n128 (*v24)(__n128 *, __n128 *);
  void (*v25)(uint64_t);
  const char *v26;
  __int128 v27;
  __int128 v28;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheFile.m"), 341, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (objc_msgSend(v7, "length"))
  {
    v8 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    v21 = 0;
    v22 = &v21;
    v23 = 0x5012000000;
    v24 = __Block_byref_object_copy__15;
    v25 = __Block_byref_object_dispose__16;
    v26 = "\"0";
    v27 = xmmword_1A22EAD50;
    v28 = unk_1A22EAD60;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x5012000000;
    v18[3] = __Block_byref_object_copy__15;
    v18[4] = __Block_byref_object_dispose__16;
    v18[5] = "\"0";
    v19 = xmmword_1A22EAD50;
    v20 = unk_1A22EAD60;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__SGKeyValueCacheFile_valueForKey_found___block_invoke;
    v16[3] = &unk_1E47606C0;
    v16[4] = v18;
    v16[5] = &v21;
    v16[6] = v8;
    v17 = strlen(v8);
    -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v16);
    v9 = v22;
    if (a4)
      *a4 = v22[8] != 0;
    v10 = v9[8];
    if (v10)
    {
      v11 = *((unsigned __int16 *)v9 + 28);
      v12 = *((unsigned __int16 *)v9 + 29);
      v13 = (id)v9[9];
      if (v12)
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v10 + v11 + 16, v12, 4);

    }
    else
    {
      v12 = 0;
    }
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v12 = 0;
  }

  return (id)v12;
}

- (void)enumerateRowsWithBlock:(void *)a1
{
  void (**v3)(id, uint64_t *, char *);
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  __int16 v17;
  int v18;
  uint64_t v19;
  id v20;
  char v21;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "_map");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_retainAutorelease(v4);
      v7 = objc_msgSend(v6, "bytes");
      v8 = objc_retainAutorelease(v6);
      v9 = objc_msgSend(v8, "bytes");
      v10 = v9 + objc_msgSend(v8, "length");
      v21 = 0;
      while ((unint64_t)(v10 - v7) >= 0x10)
      {
        v11 = v8;
        v12 = *(unsigned __int16 *)(v7 + 8);
        v13 = *(unsigned __int16 *)(v7 + 10);
        v14 = v13 + v12;
        if (v10 - (v7 + 16) < v13 + v12)
        {

          break;
        }
        v15 = *(_QWORD *)v7;
        v16 = v12;
        v17 = v13;
        v18 = 0;
        v19 = v7;
        v20 = v11;
        v3[2](v3, &v15, &v21);
        v7 += 16 + v14;
        if (v21)
          break;
      }
    }

  }
}

void __41__SGKeyValueCacheFile_valueForKey_found___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  _QWORD *v10;
  void *v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;

  if (!(*((unsigned __int16 *)a2 + 4) | *((unsigned __int16 *)a2 + 5)))
  {
    v4 = *a2;
    v5 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    if (*a2 == v5[6])
    {
      v5[6] = -1;
      v5[7] = 0;
      v6 = (void *)v5[9];
      v5[8] = 0;
      v5[9] = 0;

      v4 = *a2;
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v4 == *(_QWORD *)(v7 + 48))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(_OWORD *)(v8 + 48);
      *(_QWORD *)(v7 + 64) = *(_QWORD *)(v8 + 64);
      *(_OWORD *)(v7 + 48) = v9;
      objc_storeStrong((id *)(v7 + 72), *(id *)(v8 + 72));
      v10 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
      v10[6] = -1;
      v10[7] = 0;
      v11 = (void *)v10[9];
      v10[8] = 0;
      v10[9] = 0;

    }
  }
  v12 = *((unsigned __int16 *)a2 + 4);
  if ((_DWORD)v12 == *(unsigned __int16 *)(a1 + 56)
    && !memcmp((const void *)(a2[2] + 16), *(const void **)(a1 + 48), v12))
  {
    if (*a2 == -1)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_QWORD *)(v13 + 48) != -1)
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v15 = *(_OWORD *)(v13 + 48);
        *(_QWORD *)(v14 + 64) = *(_QWORD *)(v13 + 64);
        *(_OWORD *)(v14 + 48) = v15;
        objc_storeStrong((id *)(v14 + 72), *(id *)(v13 + 72));
      }
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(_OWORD *)a2;
    *(_QWORD *)(v16 + 64) = a2[2];
    *(_OWORD *)(v16 + 48) = v17;
    objc_storeStrong((id *)(v16 + 72), (id)a2[3]);
  }

}

- (id)_map
{
  _opaque_pthread_mutex_t *p_lock;
  NSMutableData *memStore;
  NSData *v5;
  NSData *data;
  NSData *v7;
  NSData **p_data;
  dispatch_data_t v9;
  int fd;
  size_t st_size;
  void *v12;
  NSObject *v13;
  int v14;
  int *v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  NSData *v19;
  int v21;
  int *v22;
  char *v23;
  stat v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  memStore = self->_memStore;
  if (memStore && !self->_data)
  {
    v5 = (NSData *)-[NSMutableData copy](memStore, "copy");
    data = self->_data;
    self->_data = v5;

  }
  p_data = &self->_data;
  v7 = self->_data;
  if (!v7)
  {
    fd = self->_fd;
    if ((fd & 0x80000000) == 0)
    {
      memset(&v24, 0, sizeof(v24));
      if (fstat(fd, &v24) == -1)
      {
        sgLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_15:

          goto LABEL_16;
        }
        v14 = *__error();
        v15 = __error();
        v16 = strerror(*v15);
        *(_DWORD *)buf = 67109378;
        v26 = v14;
        v27 = 2080;
        v28 = v16;
        v17 = "Could not stat fd: [%i] %s";
LABEL_19:
        _os_log_error_impl(&dword_1A2267000, v13, OS_LOG_TYPE_ERROR, v17, buf, 0x12u);
        goto LABEL_15;
      }
      st_size = v24.st_size;
      if (v24.st_size)
      {
        v12 = mmap(0, v24.st_size, 1, 2, self->_fd, 0);
        if (v12 != (void *)-1)
        {
          v9 = dispatch_data_create(v12, st_size, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE8]);
          objc_storeStrong((id *)p_data, v9);
          goto LABEL_17;
        }
        sgLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        v21 = *__error();
        v22 = __error();
        v23 = strerror(*v22);
        *(_DWORD *)buf = 67109378;
        v26 = v21;
        v27 = 2080;
        v28 = v23;
        v17 = "Could not mmap fd: [%i] %s";
        goto LABEL_19;
      }
      v18 = objc_opt_new();
      v19 = *p_data;
      *p_data = (NSData *)v18;

    }
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v9 = v7;
LABEL_17:
  pthread_mutex_unlock(p_lock);
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SGKeyValueCacheFile)initWithCoder:(id)a3
{
  id v4;
  SGKeyValueCacheFile *v5;
  uint64_t v6;
  NSData *data;

  v4 = a3;
  v5 = -[SGKeyValueCacheFile initBlank](self, "initBlank");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

  }
  return v5;
}

- (id)initBlank
{
  SGKeyValueCacheFile *v2;
  SGKeyValueCacheFile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGKeyValueCacheFile;
  v2 = -[SGKeyValueCacheFile init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fd = -1;
    pthread_mutex_init(&v2->_lock, 0);
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SGKeyValueCacheFile _map](self, "_map");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (SGKeyValueCacheFile)initWithFileDescriptor:(int)a3
{
  SGKeyValueCacheFile *result;

  result = -[SGKeyValueCacheFile initBlank](self, "initBlank");
  if (result)
    result->_fd = a3;
  return result;
}

- (SGKeyValueCacheFile)initWithPath:(id)a3
{
  id v4;
  uint64_t v5;
  SGKeyValueCacheFile *v6;
  SGKeyValueCacheFile *v7;
  SGKeyValueCacheFile *v8;
  SGKeyValueCacheFile *v9;
  NSObject *v10;
  int v12;
  int *v13;
  char *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = open_dprotected_np((const char *)objc_msgSend(v4, "UTF8String"), 522, 3, 0, 384);
  if ((v5 & 0x80000000) != 0)
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = *__error();
      v13 = __error();
      v14 = strerror(*v13);
      *(_DWORD *)buf = 138412802;
      v16 = v4;
      v17 = 1024;
      v18 = v12;
      v19 = 2080;
      v20 = v14;
      _os_log_error_impl(&dword_1A2267000, v10, OS_LOG_TYPE_ERROR, "Could not open cache file %@: [%i] %s", buf, 0x1Cu);
    }

    v8 = -[SGKeyValueCacheFile initBlank](self, "initBlank");
    v9 = 0;
  }
  else
  {
    v6 = -[SGKeyValueCacheFile initWithFileDescriptor:](self, "initWithFileDescriptor:", v5);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_path, v4);
    v8 = v7;
    v9 = v8;
  }

  return v9;
}

- (id)initTemporaryForOverwritingCache:(id)a3
{
  id *v5;
  id *v6;
  id *v7;
  id *v8;
  id *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  SGKeyValueCacheFile *v20;
  id *p_isa;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  int v27;
  int *v28;
  char *v29;
  id v30;
  uint8_t buf[4];
  id *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  v6 = v5;
  if (v5[13])
  {
    v7 = -[SGKeyValueCacheFile initInMemory](self, "initInMemory");
    v8 = v7;
    if (v7)
      objc_storeStrong(v7 + 14, a3);
    v9 = v8;
    v10 = v9;
  }
  else if (v5[11] && *((int *)v5 + 20) > 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v12, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v11, 1, &v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id *)v30;
    objc_msgSend(v13, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v6[11], "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingPathComponent:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_retainAutorelease(v17);
      v19 = open_dprotected_np((const char *)objc_msgSend(v18, "UTF8String"), 2562, 3, 0, 384);
      if ((v19 & 0x80000000) != 0)
      {
        sgLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v27 = *__error();
          v28 = __error();
          v29 = strerror(*v28);
          *(_DWORD *)buf = 138412802;
          v32 = (id *)v18;
          v33 = 1024;
          v34 = v27;
          v35 = 2080;
          v36 = v29;
          _os_log_error_impl(&dword_1A2267000, v24, OS_LOG_TYPE_ERROR, "Could not open temporary cache file %@: [%i] %s", buf, 0x1Cu);
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeItemAtPath:error:", v15, 0);

        v9 = -[SGKeyValueCacheFile initBlank](self, "initBlank");
        v10 = 0;
      }
      else
      {
        v20 = -[SGKeyValueCacheFile initWithFileDescriptor:](self, "initWithFileDescriptor:", v19);
        p_isa = (id *)&v20->super.isa;
        if (v20)
        {
          objc_storeStrong((id *)&v20->_tmpDir, v15);
          objc_storeStrong(p_isa + 11, v18);
          objc_storeStrong(p_isa + 14, a3);
        }
        v9 = p_isa;
        v10 = v9;
      }

    }
    else
    {
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v14;
        _os_log_error_impl(&dword_1A2267000, v23, OS_LOG_TYPE_ERROR, "Could not create temporary directory: %@", buf, 0xCu);
      }

      v9 = -[SGKeyValueCacheFile initBlank](self, "initBlank");
      v10 = 0;
    }

  }
  else
  {
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v6;
      _os_log_error_impl(&dword_1A2267000, v22, OS_LOG_TYPE_ERROR, "Could not create temporary directory for readonly target: %@", buf, 0xCu);
    }

    v9 = -[SGKeyValueCacheFile initBlank](self, "initBlank");
    v10 = 0;
  }

  return v10;
}

- (id)initInMemory
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = -[SGKeyValueCacheFile initBlank](self, "initBlank");
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)v2[13];
    v2[13] = v3;

  }
  return v2;
}

- (void)dealloc
{
  int fd;
  void *v4;
  objc_super v5;

  pthread_mutex_destroy(&self->_lock);
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
    close(fd);
  if (self->_tmpDir)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtPath:error:", self->_tmpDir, 0);

  }
  v5.receiver = self;
  v5.super_class = (Class)SGKeyValueCacheFile;
  -[SGKeyValueCacheFile dealloc](&v5, sel_dealloc);
}

- (void)commitTemporaryFile
{
  SGKeyValueCacheFile *v3;
  SGKeyValueCacheFile *v4;
  NSMutableData *memStore;
  NSData *data;
  NSObject *v7;
  const char *v8;
  NSString *path;
  const std::__fs::filesystem::path *v10;
  const std::__fs::filesystem::path *v11;
  std::error_code *v12;
  int v13;
  int fd;
  NSString *tmpDir;
  void *v16;
  int v17;
  NSString *v18;
  SGKeyValueCacheFile *other;
  NSData *v20;
  NSMutableData *v21;
  NSString *v22;
  int v23;
  int *v24;
  char *v25;
  NSObject *v26;
  uint32_t v27;
  int v28;
  NSString *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = self->_other;
  v4 = v3;
  if (!v3)
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    LOWORD(v28) = 0;
    v8 = "Could not commit cache file as it is not temporary";
LABEL_25:
    v26 = v7;
    v27 = 2;
    goto LABEL_26;
  }
  pthread_mutex_lock(&v3->_lock);
  memStore = self->_memStore;
  if (memStore)
  {
    objc_storeStrong((id *)&v4->_memStore, memStore);
LABEL_4:
    data = v4->_data;
    v4->_data = 0;

    goto LABEL_15;
  }
  if (!self->_tmpDir || (path = self->_path) == 0)
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    LOWORD(v28) = 0;
    v8 = "Could not commit cache file as it is not temporary";
    goto LABEL_25;
  }
  v10 = -[NSString UTF8String](path, "UTF8String");
  v11 = -[NSString UTF8String](v4->_path, "UTF8String");
  rename(v10, v11, v12);
  if (v13 != -1)
  {
    fd = v4->_fd;
    if (fd >= 1)
      close(fd);
    v4->_fd = self->_fd;
    self->_fd = -1;
    goto LABEL_4;
  }
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v22 = v4->_path;
    v23 = *__error();
    v24 = __error();
    v25 = strerror(*v24);
    v28 = 138412802;
    v29 = v22;
    v30 = 1024;
    v31 = v23;
    v32 = 2080;
    v33 = v25;
    v8 = "Could not overwrite %@: [%i] %s";
    v26 = v7;
    v27 = 28;
LABEL_26:
    _os_log_error_impl(&dword_1A2267000, v26, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v28, v27);
  }
LABEL_14:

LABEL_15:
  tmpDir = self->_tmpDir;
  if (tmpDir)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeItemAtPath:error:", self->_tmpDir, 0);

    tmpDir = self->_tmpDir;
  }
  self->_tmpDir = 0;

  v17 = self->_fd;
  if (v17 >= 1)
    close(v17);
  self->_fd = -1;
  v18 = self->_path;
  self->_path = 0;

  other = self->_other;
  self->_other = 0;

  v20 = self->_data;
  self->_data = 0;

  v21 = self->_memStore;
  self->_memStore = 0;

  if (v4)
    pthread_mutex_unlock(&v4->_lock);

}

- (id)valueForKey:(id)a3
{
  return -[SGKeyValueCacheFile valueForKey:found:](self, "valueForKey:found:", a3, 0);
}

- (void)setValue:(id)a3 forKey:(id)a4 fromRecordId:(id)a5
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  const char *v13;
  size_t v14;
  size_t v15;
  uint64_t v16;
  void *v17;
  NSMutableData *memStore;
  int v19;
  NSData *data;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  iovec v27;
  const char *v28;
  size_t v29;
  const char *v30;
  size_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (self->_fd < 0 && !self->_memStore)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheFile.m"), 377, CFSTR("Cache is read-only"));

    if (v10)
      goto LABEL_4;
  }
  else if (v10)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheFile.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

LABEL_4:
  if (!objc_msgSend(v10, "length"))
    goto LABEL_24;
  v12 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  v13 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  v14 = strlen(v12);
  if (!v13)
  {
    v15 = 0;
    if (v12)
      goto LABEL_7;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheFile.m"), 386, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyUtf8"));

    goto LABEL_7;
  }
  v15 = strlen(v13);
  if (!v12)
    goto LABEL_14;
LABEL_7:
  if (v14 >= 0xFFFF)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheFile.m"), 387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyLen < UINT16_MAX"));

  }
  if (v15 >= 0xFFFF)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheFile.m"), 388, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valLen < UINT16_MAX"));

  }
  v26 = 0;
  if (v11)
    v16 = objc_msgSend(v11, "internalEntityId");
  else
    v16 = -1;
  v25 = v16;
  LOWORD(v26) = v14;
  WORD1(v26) = v15;
  memStore = self->_memStore;
  if (memStore)
  {
    -[NSMutableData appendBytes:length:](memStore, "appendBytes:length:", &v25, 16);
    -[NSMutableData appendBytes:length:](self->_memStore, "appendBytes:length:", v12, v14);
    if (v15)
      -[NSMutableData appendBytes:length:](self->_memStore, "appendBytes:length:", v13, v15);
  }
  else
  {
    v27.iov_base = &v25;
    v27.iov_len = 16;
    v28 = v12;
    v29 = v14;
    v30 = v13;
    v31 = v15;
    pthread_mutex_lock(&self->_lock);
    if (v15)
      v19 = 3;
    else
      v19 = 2;
    writev(self->_fd, &v27, v19);
  }
  data = self->_data;
  self->_data = 0;

  pthread_mutex_unlock(&self->_lock);
LABEL_24:

}

- (void)setValueIfNotPresent:(id)a3 forKey:(id)a4 fromRecordId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  __n128 (*v17)(__n128 *, __n128 *);
  void (*v18)(uint64_t);
  const char *v19;
  __int128 v20;
  __int128 v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_retainAutorelease(v9);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  v14 = 0;
  v15 = &v14;
  v16 = 0x5012000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__16;
  v19 = "\"0";
  v20 = xmmword_1A22EAD50;
  v21 = unk_1A22EAD60;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__SGKeyValueCacheFile_setValueIfNotPresent_forKey_fromRecordId___block_invoke;
  v13[3] = &unk_1E47606E8;
  v13[4] = &v14;
  v13[5] = v12;
  v13[6] = strlen(v12);
  -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v13);
  if (!v15[8])
    -[SGKeyValueCacheFile setValue:forKey:fromRecordId:](self, "setValue:forKey:fromRecordId:", v8, v11, v10);
  _Block_object_dispose(&v14, 8);

}

- (void)setValueIfNotPresentWithDict:(id)a3 fromRecordId:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BOOL v19;
  id v20;
  SGKeyValueCacheFile *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  SGKeyValueCacheFile *v33;
  _QWORD v34[5];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self->_fd < 0 && !self->_memStore)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheFile.m"), 434, CFSTR("Cache is read-only"));

  }
  v9 = (void *)objc_opt_new();
  v10 = objc_msgSend(v8, "numericValue");
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __65__SGKeyValueCacheFile_setValueIfNotPresentWithDict_fromRecordId___block_invoke;
  v44[3] = &unk_1E4760710;
  v46 = v10;
  v11 = v9;
  v45 = v11;
  v33 = self;
  -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v44);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v12);
        objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 == 0;

        v15 |= v19;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v14);

    if ((v15 & 1) != 0)
    {
      v20 = v7;
      v21 = v33;
      -[SGKeyValueCacheFile deleteValueByRecordId:](v33, "deleteValueByRecordId:", v8);
LABEL_25:
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __65__SGKeyValueCacheFile_setValueIfNotPresentWithDict_fromRecordId___block_invoke_2;
      v34[3] = &unk_1E4760738;
      v34[4] = v21;
      v35 = v8;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v34);

      goto LABEL_26;
    }
  }
  else
  {

  }
  v32 = v8;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = v7;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v12, "objectForKeyedSubscript:", v27, v32);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "isEqual:", v29))
        {
          objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v27);
        }
        else
        {
          objc_msgSend(v22, "objectForKeyedSubscript:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, v27);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v24);
  }

  v20 = v12;
  v8 = v32;
  v21 = v33;
  if (objc_msgSend(v20, "count"))
    goto LABEL_25;
LABEL_26:

}

- (void)deleteValueByRecordId:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableData *memStore;
  NSData *data;
  _QWORD v11[2];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = v5;
  if (self->_fd < 0 && !self->_memStore)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheFile.m"), 486, CFSTR("Cache is read-only"));

    if (v6)
      goto LABEL_4;
  }
  else if (v5)
  {
LABEL_4:
    v7 = objc_msgSend(v6, "internalEntityId");
    goto LABEL_7;
  }
  v7 = -1;
LABEL_7:
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__SGKeyValueCacheFile_deleteValueByRecordId___block_invoke;
  v12[3] = &unk_1E4760760;
  v12[4] = &v13;
  v12[5] = v7;
  -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v12);
  if (*((_BYTE *)v14 + 24))
  {
    v11[0] = v7;
    v11[1] = 0;
    pthread_mutex_lock(&self->_lock);
    memStore = self->_memStore;
    if (memStore)
      -[NSMutableData appendBytes:length:](memStore, "appendBytes:length:", v11, 16);
    else
      write(self->_fd, v11, 0x10uLL);
    data = self->_data;
    self->_data = 0;

    pthread_mutex_unlock(&self->_lock);
  }
  _Block_object_dispose(&v13, 8);

}

- (void)deleteValueByRecordIdSet:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t *v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  NSMutableData *memStore;
  NSData *data;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_fd < 0 && !self->_memStore)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGKeyValueCacheFile.m"), 511, CFSTR("Cache is read-only"));

  }
  v6 = (void *)objc_opt_new();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __48__SGKeyValueCacheFile_deleteValueByRecordIdSet___block_invoke;
  v27[3] = &unk_1E4760788;
  v7 = v5;
  v28 = v7;
  v8 = v6;
  v29 = v8;
  -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v27);
  if (objc_msgSend(v8, "count"))
  {
    v9 = (uint64_t *)malloc_type_calloc(objc_msgSend(v8, "count"), 0x10uLL, 0x1000040D9A13B51uLL);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v22);
    }
    v10 = v9;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      v15 = v10;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "longLongValue", (_QWORD)v23);
          v18 = v15 + 2;
          ++v16;
          *v15 = v17;
          v15[1] = 0;
          v15 += 2;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
        v15 = v18;
      }
      while (v13);
    }

    pthread_mutex_lock(&self->_lock);
    memStore = self->_memStore;
    if (memStore)
      -[NSMutableData appendBytes:length:](memStore, "appendBytes:length:", v10, 16 * objc_msgSend(v11, "count"));
    else
      write(self->_fd, v10, 16 * objc_msgSend(v11, "count"));
    data = self->_data;
    self->_data = 0;

    pthread_mutex_unlock(&self->_lock);
    free(v10);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)objc_opt_new();
  -[SGKeyValueCacheFile _map](self, "_map");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ (size: %lu bytes)\n"), v6, objc_msgSend(v4, "length"));

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__SGKeyValueCacheFile_description__block_invoke;
  v9[3] = &unk_1E47607B0;
  v7 = v3;
  v10 = v7;
  -[SGKeyValueCacheFile enumerateRowsWithBlock:](self, v9);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_other, 0);
  objc_storeStrong((id *)&self->_memStore, 0);
  objc_storeStrong((id *)&self->_tmpDir, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

void __34__SGKeyValueCacheFile_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;

  v4 = *(void **)(a1 + 32);
  if (*(unsigned __int16 *)(a2 + 8) | *(unsigned __int16 *)(a2 + 10))
  {
    objc_msgSend(v4, "appendString:", CFSTR("  "));
    if (*(_QWORD *)a2 != -1)
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[%llu] "), *(_QWORD *)a2);
    v5 = *(void **)(a1 + 32);
    v6 = *(unsigned __int16 *)(a2 + 8);
    v7 = *(_QWORD *)(a2 + 16);
    v8 = *(id *)(a2 + 24);
    v9 = 0;
    if (v6 && v7)
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v7 + 16, v6, 4);

    v10 = *(unsigned __int16 *)(a2 + 8);
    v11 = *(unsigned __int16 *)(a2 + 10);
    v12 = *(_QWORD *)(a2 + 16);
    v13 = *(id *)(a2 + 24);
    v14 = 0;
    if (v11 && v12)
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v12 + v10 + 16, v11, 4);

    objc_msgSend(v5, "appendFormat:", CFSTR("'%@' => '%@'\n"), v9, v14);
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("  [%llu] DELETE\n"), *(_QWORD *)a2);
  }

}

void __48__SGKeyValueCacheFile_deleteValueByRecordIdSet___block_invoke(uint64_t a1, uint64_t *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = *(void **)(a1 + 32);
  +[SGRecordId recordIdWithInternalEntityId:](SGRecordId, "recordIdWithInternalEntityId:", *a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    v6 = *(void **)(a1 + 40);
    v7 = *a2;
    if (*((unsigned __int16 *)a2 + 4) | *((unsigned __int16 *)a2 + 5))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", v8);
    }

  }
}

void __45__SGKeyValueCacheFile_deleteValueByRecordId___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)a2 == *(_QWORD *)(a1 + 40))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (*(unsigned __int16 *)(a2 + 8) | *(unsigned __int16 *)(a2 + 10)) != 0;

}

void __65__SGKeyValueCacheFile_setValueIfNotPresentWithDict_fromRecordId___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;

  if (*(_QWORD *)a2 != *(_QWORD *)(a1 + 40))
    goto LABEL_16;
  v4 = *(unsigned __int16 *)(a2 + 8);
  v5 = *(unsigned __int16 *)(a2 + 10);
  if (!(v4 | v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    goto LABEL_16;
  }
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(id *)(a2 + 24);
  v8 = v7;
  if ((_DWORD)v5 && v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v6 + v4 + 16, v5, 4);

    if (v9)
    {
      v10 = 0;
      v11 = v9;
      goto LABEL_10;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 1;
LABEL_10:
  v12 = *(void **)(a1 + 32);
  v13 = *(unsigned __int16 *)(a2 + 8);
  v14 = *(_QWORD *)(a2 + 16);
  v15 = *(id *)(a2 + 24);
  v16 = 0;
  if (v13 && v14)
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v14 + 16, v13, 4);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v16);
  if (v10)

LABEL_16:
}

void __65__SGKeyValueCacheFile_setValueIfNotPresentWithDict_fromRecordId___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = (void *)MEMORY[0x1E0C99E38];
  v6 = a2;
  objc_msgSend(v5, "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
    v8 = 0;
  else
    v8 = v9;
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:fromRecordId:", v8, v6, *(_QWORD *)(a1 + 40));

}

void __64__SGKeyValueCacheFile_setValueIfNotPresent_forKey_fromRecordId___block_invoke(uint64_t a1, __int128 *a2)
{
  int v4;
  _QWORD *v5;
  void *v6;
  size_t v7;
  uint64_t v8;
  __int128 v9;

  v4 = *((unsigned __int16 *)a2 + 4);
  if (!*((_DWORD *)a2 + 2))
  {
    v5 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)a2 == v5[6])
    {
      v5[6] = -1;
      v5[7] = 0;
      v6 = (void *)v5[9];
      v5[8] = 0;
      v5[9] = 0;

      v4 = *((unsigned __int16 *)a2 + 4);
    }
    else
    {
      v4 = 0;
    }
  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 == v4 && !memcmp((const void *)(*((_QWORD *)a2 + 2) + 16), *(const void **)(a1 + 40), v7))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *a2;
    *(_QWORD *)(v8 + 64) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(v8 + 48) = v9;
    objc_storeStrong((id *)(v8 + 72), *((id *)a2 + 3));
  }

}

+ (id)pathToCache
{
  if (pathToCache__pasOnceToken2 != -1)
    dispatch_once(&pathToCache__pasOnceToken2, &__block_literal_global_1774);
  return (id)pathToCache__pasExprOnceResult;
}

+ (id)keyValueCacheForPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1772;
  v17 = __Block_byref_object_dispose__1773;
  v18 = 0;
  objc_msgSend(a1, "pathToCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__SGKeyValueCacheFile_keyValueCacheForPath___block_invoke;
  v9[3] = &unk_1E4760698;
  v6 = v4;
  v10 = v6;
  v11 = &v13;
  v12 = a1;
  objc_msgSend(v5, "runWithLockAcquired:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (void)clearCacheAtPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "pathToCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SGKeyValueCacheFile_clearCacheAtPath___block_invoke;
  v7[3] = &unk_1E4761C10;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "runWithLockAcquired:", v7);

}

+ (id)encodedStringForFullName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A8583A40]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" %@"), v3);
  objc_autoreleasePoolPop(v4);

  return v5;
}

+ (id)fullNameForEncodedContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(v3, "substringFromIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  return v5;
}

uint64_t __40__SGKeyValueCacheFile_clearCacheAtPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
}

void __44__SGKeyValueCacheFile_keyValueCacheForPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v10, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v7 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithPath:", v3);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  }

}

void __34__SGKeyValueCacheFile_pathToCache__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)pathToCache__pasExprOnceResult;
  pathToCache__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

@end
