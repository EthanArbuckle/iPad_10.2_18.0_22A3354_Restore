@implementation SGDatabaseJournalFile

- (SGDatabaseJournalFile)initWithPath:(id)a3
{
  id v5;
  SGDatabaseJournalFile *v6;
  SGDatabaseJournalFile *v7;
  NSString **p_path;
  int v9;
  NSObject *v10;
  NSObject *v11;
  SGDatabaseJournalFile *v12;
  NSString *v14;
  int v15;
  int *v16;
  char *v17;
  NSString *v18;
  int v19;
  int *v20;
  char *v21;
  objc_super v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  char *v28;
  stat v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SGDatabaseJournalFile;
  v6 = -[SGDatabaseJournalFile init](&v22, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_12;
  p_path = &v6->_path;
  objc_storeStrong((id *)&v6->_path, a3);
  v9 = open_dprotected_np((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), 514, 2, 0, 384);
  v7->_fd = v9;
  if (v9 < 0)
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = *p_path;
      v19 = *__error();
      v20 = __error();
      v21 = strerror(*v20);
      v29.st_dev = 138412802;
      *(_QWORD *)&v29.st_mode = v18;
      WORD2(v29.st_ino) = 1024;
      *(_DWORD *)((char *)&v29.st_ino + 6) = v19;
      HIWORD(v29.st_uid) = 2080;
      *(_QWORD *)&v29.st_gid = v21;
      _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "Could not open %@: errno=%i: %s", (uint8_t *)&v29, 0x1Cu);
    }

    goto LABEL_10;
  }
  memset(&v29, 0, sizeof(v29));
  if (!fstat(v9, &v29))
  {
    v7->_len = v29.st_size;
LABEL_12:
    v12 = v7;
    goto LABEL_13;
  }
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v14 = *p_path;
    v15 = *__error();
    v16 = __error();
    v17 = strerror(*v16);
    *(_DWORD *)buf = 138412802;
    v24 = v14;
    v25 = 1024;
    v26 = v15;
    v27 = 2080;
    v28 = v17;
    _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "Could not fstat %@: errno=%i: %s", buf, 0x1Cu);
  }

  close(v7->_fd);
LABEL_10:
  v12 = 0;
LABEL_13:

  return v12;
}

- (void)destroy
{
  int fd;

  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
    close(fd);
  self->_dead = 1;
}

- (void)destroyAndUnlinkIfEmpty
{
  if (!self->_len)
    -[SGDatabaseJournalFile unlink](self, "unlink");
  -[SGDatabaseJournalFile destroy](self, "destroy");
}

- (void)dealloc
{
  objc_super v3;

  -[SGDatabaseJournalFile destroy](self, "destroy");
  v3.receiver = self;
  v3.super_class = (Class)SGDatabaseJournalFile;
  -[SGDatabaseJournalFile dealloc](&v3, sel_dealloc);
}

- (void)write:(id)a3
{
  id v5;
  id v6;
  int v7;
  id v8;
  NSObject *v9;
  NSString *path;
  int v11;
  int *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  _DWORD v17[3];
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  char *v23;
  iovec v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_len)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDatabaseJournalFile.m"), 81, CFSTR("Can not overwrite journal file"));

  }
  if ((unint64_t)objc_msgSend(v5, "length") >> 32)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDatabaseJournalFile.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data.length <= UINT32_MAX"));

  }
  if (self->_dead)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDatabaseJournalFile.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_dead"));

  }
  v6 = objc_retainAutorelease(v5);
  v7 = adler32(0, (const Bytef *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  v17[0] = -1347426410;
  v17[1] = objc_msgSend(v6, "length");
  v17[2] = v7;
  v24.iov_base = v17;
  v24.iov_len = 12;
  v8 = objc_retainAutorelease(v6);
  v25 = objc_msgSend(v8, "bytes");
  v26 = objc_msgSend(v8, "length");
  if (writev(self->_fd, &v24, 2) < 0)
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      v11 = *__error();
      v12 = __error();
      v13 = strerror(*v12);
      *(_DWORD *)buf = 138412802;
      v19 = path;
      v20 = 1024;
      v21 = v11;
      v22 = 2080;
      v23 = v13;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "Could not write to journal file %@: errno=%i: %s", buf, 0x1Cu);
    }

  }
  else
  {
    self->_len = objc_msgSend(v8, "length") + 12;
    self->_written = 1;
  }

}

- (id)read
{
  void *len;
  int *v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSString *path;
  int v9;
  int *v10;
  char *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSString *v15;
  int v16;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;
  NSString *v22;
  NSString *v23;
  NSString *v25;
  int v26;
  void *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  _BYTE v31[10];
  _DWORD v32[6];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_dead)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDatabaseJournalFile.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_dead"));

  }
  len = (void *)self->_len;
  if (len)
  {
    if (!self->_written)
    {
      fcntl(self->_fd, 48, 1);
      len = (void *)self->_len;
    }
    v4 = (int *)malloc_type_malloc((size_t)len, 0xC031879CuLL);
    v5 = pread(self->_fd, v4, self->_len, 0);
    v6 = self->_len;
    if (v5 < v6)
    {
      sgLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        path = self->_path;
        v9 = *__error();
        v10 = __error();
        v11 = strerror(*v10);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v31 = path;
        *(_WORD *)&v31[8] = 1024;
        v32[0] = v9;
        LOWORD(v32[1]) = 2080;
        *(_QWORD *)((char *)&v32[1] + 2) = v11;
        v12 = "Could not read from journal file %@: errno=%i: %s";
        v13 = v7;
        v14 = 28;
LABEL_13:
        _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      }
LABEL_28:

LABEL_29:
      free(v4);
      len = 0;
      return len;
    }
    if (v6 <= 0xB)
    {
      sgLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      v15 = self->_path;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v31 = v15;
      v12 = "Journal file truncated: %@";
LABEL_12:
      v13 = v7;
      v14 = 12;
      goto LABEL_13;
    }
    v16 = *v4;
    if (*v4 == -1347426410)
    {
      v17 = v4[1];
      if (v6 - 12 != v17)
      {
        sgLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_28;
        v23 = self->_path;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v31 = v23;
        v12 = "Journal file truncated: %@";
        goto LABEL_12;
      }
      v18 = adler32(0, (const Bytef *)v4 + 12, v17);
      if (v4[2] != v18)
      {
        sgLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_28;
        v25 = self->_path;
        v26 = v4[2];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v31 = v25;
        *(_WORD *)&v31[8] = 1024;
        v32[0] = v18;
        LOWORD(v32[1]) = 1024;
        *(_DWORD *)((char *)&v32[1] + 2) = v26;
        v12 = "Journal file checksum mismatch: %@: %u / %u";
        v13 = v7;
        v14 = 24;
        goto LABEL_13;
      }
      v19 = objc_alloc(MEMORY[0x1E0C99D50]);
      v20 = v4[1];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __29__SGDatabaseJournalFile_read__block_invoke;
      v29[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
      v29[4] = v4;
      len = (void *)objc_msgSend(v19, "initWithBytesNoCopy:length:deallocator:", v4 + 3, v20, v29);
    }
    else
    {
      if (*v4 != 1768714338 || *(int *)((char *)v4 + 3) != 812938089)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v22 = self->_path;
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v31 = -1347426410;
          *(_WORD *)&v31[4] = 1024;
          *(_DWORD *)&v31[6] = v16;
          LOWORD(v32[0]) = 2112;
          *(_QWORD *)((char *)v32 + 2) = v22;
          _os_log_error_impl(&dword_1C3607000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Journal file has invalid magic number: expected 0x%x, got 0x%x: %@", buf, 0x18u);
        }
        goto LABEL_29;
      }
      len = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v4, self->_len, 1);
    }
  }
  return len;
}

- (void)clear
{
  void *v4;

  if (self->_dead)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDatabaseJournalFile.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_dead"));

  }
  if (self->_len)
  {
    lseek(self->_fd, 0, 0);
    ftruncate(self->_fd, 0);
    self->_len = 0;
  }
}

- (void)unlink
{
  int fd;
  NSObject *v4;
  NSString *path;
  int v6;
  int *v7;
  char *v8;
  void *v10;
  uint8_t buf[4];
  NSString *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_dead)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDatabaseJournalFile.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_dead"));

  }
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_fd = -1;
  }
  if (unlink(-[NSString UTF8String](self->_path, "UTF8String")))
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      v6 = *__error();
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 138412802;
      v12 = path;
      v13 = 1024;
      v14 = v6;
      v15 = 2080;
      v16 = v8;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "Could not remove %@: errno=%i: %s", buf, 0x1Cu);
    }

  }
  else
  {
    self->_dead = 1;
  }
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGDatabaseJournalFile %@>"), self->_path);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

void __29__SGDatabaseJournalFile_read__block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

@end
