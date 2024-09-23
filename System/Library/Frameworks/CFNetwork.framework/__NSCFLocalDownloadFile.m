@implementation __NSCFLocalDownloadFile

- (void)markPurgeable
{
  NSObject *v1;
  dispatch_fd_t descriptor;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = *(NSObject **)(a1 + 152);
    if (v1)
    {
      descriptor = dispatch_io_get_descriptor(v1);
      v5 = 65541;
      if (ffsctl(descriptor, 0xC0084A44uLL, &v5, 0))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v3 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
        {
          v4 = *__error();
          *(_DWORD *)buf = 67109120;
          v7 = v4;
          _os_log_impl(&dword_183ECA000, v3, OS_LOG_TYPE_INFO, "Failed to make file purgeable: %{errno}d", buf, 8u);
        }
      }
    }
  }
}

- (void)finishOnQueue:(void *)a3 completion:
{
  uint64_t v6;
  NSObject *v7;
  SEL v8;
  _QWORD v9[6];

  if (a1)
  {
    v6 = -[__NSCFLocalDownloadFile ioChannel]((uint64_t)a1);
    if (v6)
    {
      v7 = v6;
      dispatch_retain(a2);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __52____NSCFLocalDownloadFile_finishOnQueue_completion___block_invoke;
      v9[3] = &unk_1E14FDF00;
      v9[4] = a2;
      v9[5] = a3;
      objc_setProperty_atomic_copy(a1, v8, v9, 200);
      dispatch_io_close(v7, 0);
    }
    else
    {
      a1[168] = 1;
      dispatch_async(a2, a3);
    }
  }
}

- (void)setFileDataProtection
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v11 = *MEMORY[0x1E0CB2AD8];
  v12[0] = objc_getProperty(a1, a2, 208, 1);
  v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "setAttributes:ofItemAtPath:error:", v3, objc_msgSend(a1, "path"), &v6) & 1) == 0)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(a1, "path");
      *(_DWORD *)buf = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "LocalDownloadFile: couldn't set data protection class of %@, error: %@", buf, 0x16u);
    }
  }
}

- (uint64_t)ioChannel
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  dispatch_fd_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  _QWORD cleanup_handler[5];
  dispatch_fd_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 152))
    return *(_QWORD *)(a1 + 152);
  result = objc_msgSend((id)a1, "path");
  if (result)
  {
    if (!*(_QWORD *)(a1 + 152))
    {
      if (*(_BYTE *)(a1 + 186))
      {
        *(_BYTE *)(a1 + 186) = 0;
        v3 = 1025;
      }
      else
      {
        v3 = 9;
      }
      v4 = *(void **)(a1 + 192);
      if (v4)
        v5 = objc_msgSend(v4, "openItemForPath:mode:", objc_msgSend((id)a1, "path"), v3);
      else
        v5 = open((const char *)objc_msgSend((id)objc_msgSend((id)a1, "path"), "UTF8String"), v3, 438);
      if (v5 < 0)
      {
        *(_DWORD *)(a1 + 188) = *__error();
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v8 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          v9 = *(_DWORD *)(a1 + 188);
          *(_DWORD *)buf = 67109378;
          v13 = v9;
          v14 = 2112;
          v15 = objc_msgSend((id)a1, "path");
          _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, "__NSCFLocalDownloadFile: error %d opening for ioChannel, file: %@", buf, 0x12u);
        }
      }
      else
      {
        v6 = *(NSObject **)(a1 + 160);
        cleanup_handler[0] = MEMORY[0x1E0C809B0];
        cleanup_handler[1] = 3221225472;
        cleanup_handler[2] = __36____NSCFLocalDownloadFile_ioChannel__block_invoke;
        cleanup_handler[3] = &unk_1E14FA1E8;
        cleanup_handler[4] = a1;
        v11 = v5;
        v7 = dispatch_io_create(0, v5, v6, cleanup_handler);
        dispatch_io_set_low_water(v7, 0xFFFFFFFFFFFFFFFFLL);
        *(_QWORD *)(a1 + 152) = v7;
      }
    }
    return *(_QWORD *)(a1 + 152);
  }
  return result;
}

- (void)dealloc
{
  NSObject *writeIO;
  NSObject *workQueue;
  SEL v5;
  SEL v6;
  objc_super v7;

  if (-[__NSCFLocalDownloadFile path](self, "path") && (!self || !self->_skipUnlink))
    unlink(-[NSString UTF8String](-[__NSCFLocalDownloadFile path](self, "path"), "UTF8String"));
  writeIO = self->_writeIO;
  if (writeIO)
  {
    dispatch_release(writeIO);
    self->_writeIO = 0;
  }
  workQueue = self->_workQueue;
  if (workQueue)
  {
    dispatch_release(workQueue);
    self->_workQueue = 0;
  }
  -[__NSCFLocalDownloadFile setPath:](self, "setPath:", 0);
  objc_setProperty_atomic_copy(self, v5, 0, 200);
  objc_setProperty_atomic_copy(self, v6, 0, 208);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFLocalDownloadFile;
  -[__NSCFLocalDownloadFile dealloc](&v7, sel_dealloc);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (_QWORD)initQueues
{
  _QWORD *v1;
  NSObject *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)__NSCFLocalDownloadFile;
  v1 = objc_msgSendSuper2(&v4, sel_init);
  if (v1)
  {
    v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v1[20] = dispatch_queue_create("com.apple.__NSCFLocalDownloadFile", v2);
  }
  return v1;
}

- (_QWORD)initWithFullPath:(void *)a3 protectionType:
{
  _QWORD *v5;
  const char *v6;
  _QWORD *v7;
  int v8;
  int v9;
  const char *v10;
  int *v11;
  int v12;
  NSObject *v13;
  int v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  char *v19;
  char __str[1024];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = -[__NSCFLocalDownloadFile initQueues](a1);
  v7 = v5;
  if (v5)
  {
    objc_setProperty_atomic_copy(v5, v6, a3, 208);
    snprintf(__str, 0x400uLL, "%s", (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "UTF8String"));
    v8 = open(__str, 2561, 438);
    if (v8 < 0)
    {
      v11 = __error();
      v12 = *v11;
      *((_DWORD *)v7 + 47) = *v11;
      if (v12 != 17)
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v13 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          v15 = *((_DWORD *)v7 + 47);
          *(_DWORD *)buf = 67109378;
          v17 = v15;
          v18 = 2080;
          v19 = __str;
          _os_log_error_impl(&dword_183ECA000, v13, OS_LOG_TYPE_ERROR, "__NSCFLocalDownloadFile: error %d creating download file: %s", buf, 0x12u);
        }
      }
    }
    else
    {
      v9 = v8;
      objc_msgSend(v7, "setPath:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", __str));
      -[__NSCFLocalDownloadFile setFileDataProtection](v7, v10);
      close(v9);
      *((_BYTE *)v7 + 184) = 1;
    }
  }
  return v7;
}

- (void)truncate
{
  NSObject *v1;
  uint64_t v2;
  _QWORD barrier[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 152);
    if (v1)
    {
      v2 = MEMORY[0x1E0C809B0];
      *(_BYTE *)(a1 + 186) = 0;
      barrier[0] = v2;
      barrier[1] = 3221225472;
      barrier[2] = __35____NSCFLocalDownloadFile_truncate__block_invoke;
      barrier[3] = &unk_1E14FE118;
      barrier[4] = a1;
      dispatch_io_barrier(v1, barrier);
    }
    else
    {
      *(_BYTE *)(a1 + 186) = 1;
    }
  }
}

@end
