@implementation BLLockFile

+ (id)iTunesSyncLockFilePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "bu_booksRepositoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Sync/.bookSync.lock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setBackgroundTaskDelegate:(id)a3
{
  objc_storeWeak(&qword_253DB1F48, a3);
}

- (BLLockFile)initWithPath:(id)a3
{
  id v5;
  BLLockFile *v6;
  BLLockFile *v7;

  v5 = a3;
  v6 = -[BLLockFile init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v7->_fd = -1;
    v7->_locked = 0;
    v7->_hasBackgroundTask = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[BLLockFile unlock](self, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)BLLockFile;
  -[BLLockFile dealloc](&v3, sel_dealloc);
}

+ (id)iTunesSyncLockFile
{
  BLLockFile *v2;
  void *v3;
  BLLockFile *v4;

  v2 = [BLLockFile alloc];
  +[BLLockFile iTunesSyncLockFilePath](BLLockFile, "iTunesSyncLockFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BLLockFile initWithPath:](v2, "initWithPath:", v3);

  return v4;
}

+ (BLBackgroundTaskProviding)backgroundTaskDelegate
{
  return (BLBackgroundTaskProviding *)objc_loadWeakRetained(&qword_253DB1F48);
}

- (BOOL)_lock:(BOOL)a3 blocking:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  id v9;
  int fd;
  int v11;
  int v12;
  NSObject *v13;
  uint8_t buf[16];

  v4 = a4;
  v5 = a3;
  if (-[BLLockFile locked](self, "locked"))
    return -[BLLockFile locked](self, "locked");
  -[BLLockFile path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
    return -[BLLockFile locked](self, "locked");
  -[BLLockFile _registerBackgroundTask](self, "_registerBackgroundTask");
  -[BLLockFile path](self, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  self->_fd = open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 512, 438);

  fd = self->_fd;
  if (fd == -1)
  {
LABEL_15:
    -[BLLockFile _unregisterBackgroundTask](self, "_unregisterBackgroundTask");
    return -[BLLockFile locked](self, "locked");
  }
  fcntl(fd, 2, 1);
  if (v5)
    v11 = 2;
  else
    v11 = 1;
  if (v4)
    v12 = 0;
  else
    v12 = 4;
  self->_locked = flock(self->_fd, v12 | v11) != -1;
  if (!-[BLLockFile locked](self, "locked"))
  {
    close(self->_fd);
    self->_fd = -1;
    goto LABEL_15;
  }
  BLDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_DEBUG, "Taking plist lock.", buf, 2u);
  }

  return -[BLLockFile locked](self, "locked");
}

- (void)_registerBackgroundTask
{
  unint64_t v3;
  id v4;

  if (!self->_hasBackgroundTask)
  {
    +[BLLockFile backgroundTaskDelegate](BLLockFile, "backgroundTaskDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "bl_beginBackgroundTaskWithName:expirationHandler:", CFSTR("BLLockFile"), &unk_24CE8B898);
    self->_hasBackgroundTask = 1;
    self->_backgroundTaskIdentifier = v3;

  }
}

- (void)_unregisterBackgroundTask
{
  id v3;

  if (self->_hasBackgroundTask)
  {
    +[BLLockFile backgroundTaskDelegate](BLLockFile, "backgroundTaskDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bl_endBackgroundTask:", self->_backgroundTaskIdentifier);
    self->_hasBackgroundTask = 0;

  }
}

- (BOOL)lock:(BOOL)a3
{
  return MEMORY[0x24BEDD108](self, sel__lock_blocking_);
}

- (BOOL)tryLock:(BOOL)a3
{
  return MEMORY[0x24BEDD108](self, sel__lock_blocking_);
}

- (void)unlock
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[BLLockFile locked](self, "locked"))
  {
    flock(self->_fd, 8);
    close(self->_fd);
    self->_fd = -1;
    self->_locked = 0;
    BLDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_DEBUG, "Releasing plist lock.", v4, 2u);
    }

    -[BLLockFile _unregisterBackgroundTask](self, "_unregisterBackgroundTask");
  }
}

- (BOOL)lockWithBlock:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = 1;
  if (-[BLLockFile tryLock:](self, "tryLock:", 1))
  {
LABEL_8:
    v10 = MEMORY[0x2199A44E0](v6);
    v11 = (void *)v10;
    if (v10)
      (*(void (**)(uint64_t))(v10 + 16))(v10);

    -[BLLockFile unlock](self, "unlock");
  }
  else
  {
    v8 = -1;
    while (1)
    {
      BLDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_DEBUG, "Waiting for plist to get unlocked.", buf, 2u);
      }

      usleep(0x61A8u);
      if (v8 == 3)
        break;
      ++v8;
      if (-[BLLockFile tryLock:](self, "tryLock:", 1))
      {
        v7 = v8 < 4;
        goto LABEL_8;
      }
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BLLockFileErrorDomain"), -1001, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      BLDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_ERROR, "Failed to obtain plist lock.", v14, 2u);
      }

    }
    v7 = 0;
  }

  return v7;
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)locked
{
  return self->_locked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
