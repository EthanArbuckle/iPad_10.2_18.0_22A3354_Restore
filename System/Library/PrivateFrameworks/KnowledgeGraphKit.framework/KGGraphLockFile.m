@implementation KGGraphLockFile

- (KGGraphLockFile)initWithDatabaseURL:(id)a3
{
  id v4;
  KGGraphLockFile *v5;
  uint64_t v6;
  NSURL *fileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGGraphLockFile;
  v5 = -[KGGraphLockFile init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("lock"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    v5->_fd = -1;
    v5->_locked = 0;
  }

  return v5;
}

- (BOOL)lock
{
  int v3;
  int v4;
  int *v5;
  char *v6;
  int v7;
  int *v9;
  char *v10;
  int v11;
  uint8_t buf[4];
  char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_locked)
    __assert_rtn("-[KGGraphLockFile lock]", "KGGraphLockFile.m", 28, "_locked == NO");
  v3 = open(-[NSURL fileSystemRepresentation](self->_fileURL, "fileSystemRepresentation"), 514, 384);
  if (v3 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = __error();
      v6 = strerror(*v5);
      v7 = *__error();
      *(_DWORD *)buf = 136315394;
      v13 = v6;
      v14 = 1024;
      v15 = v7;
      _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed opening lock file: %s %d", buf, 0x12u);
    }
  }
  else
  {
    v4 = v3;
    if (flock(v3, 6))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v9 = __error();
        v10 = strerror(*v9);
        v11 = *__error();
        *(_DWORD *)buf = 136315394;
        v13 = v10;
        v14 = 1024;
        v15 = v11;
        _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "flock failed: %s %d", buf, 0x12u);
      }
      close(v4);
    }
    else
    {
      self->_locked = 1;
      self->_fd = v4;
    }
  }
  return self->_locked;
}

- (void)unlock
{
  int fd;
  int *v4;
  char *v5;
  int v6;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_locked)
  {
    fd = self->_fd;
    if ((fd & 0x80000000) == 0)
    {
      if (flock(fd, 8))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v4 = __error();
          v5 = strerror(*v4);
          v6 = *__error();
          v7 = 136315394;
          v8 = v5;
          v9 = 1024;
          v10 = v6;
          _os_log_error_impl(&dword_1CA0A5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed unflocking: %s %d", (uint8_t *)&v7, 0x12u);
        }
      }
      else
      {
        close(self->_fd);
        self->_fd = -1;
        self->_locked = 0;
      }
    }
  }
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
