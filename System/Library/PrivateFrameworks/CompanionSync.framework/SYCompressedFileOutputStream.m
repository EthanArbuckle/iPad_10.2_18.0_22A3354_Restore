@implementation SYCompressedFileOutputStream

- (id)initToFileAtPath:(id)a3 append:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  SYCompressedFileOutputStream *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a3, "stringByStandardizingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SYCompressedFileOutputStream initWithURL:append:](self, "initWithURL:append:", v8, v4);

  return v9;
}

- (SYCompressedFileOutputStream)initWithURL:(id)a3 append:(BOOL)a4
{
  id v6;
  SYCompressedFileOutputStream *v7;
  SYCompressedFileOutputStream *v8;
  uint64_t v9;
  NSURL *url;
  uint64_t v11;
  _SYStreamGuts *internal;
  SYCompressedFileOutputStream *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SYCompressedFileOutputStream;
  v7 = -[SYCompressedFileOutputStream init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_fd = -1;
    v9 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    v8->_append = a4;
    v8->_level = -1;
    v8->_internalLock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v8->_internalLock);
    v11 = objc_opt_new();
    internal = v8->_internal;
    v8->_internal = (_SYStreamGuts *)v11;

    objc_storeWeak((id *)&v8->_internal->_delegate, v8);
    os_unfair_lock_unlock(&v8->_internalLock);
    v13 = v8;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[SYCompressedFileOutputStream close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)SYCompressedFileOutputStream;
  -[SYCompressedFileOutputStream dealloc](&v3, sel_dealloc);
}

- (_SYStreamGuts)_internal
{
  return self->_internal;
}

- (void)_postEventToDelegate:(unint64_t)a3
{
  os_unfair_lock_s *p_internalLock;
  id WeakRetained;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_internal->_delegate);
  objc_msgSend(WeakRetained, "stream:handleEvent:", self, a3);

  os_unfair_lock_unlock(p_internalLock);
}

- (id)delegate
{
  os_unfair_lock_s *p_internalLock;
  id WeakRetained;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_internal->_delegate);
  os_unfair_lock_unlock(p_internalLock);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
  SYCompressedFileOutputStream *v4;
  SYCompressedFileOutputStream *obj;

  v4 = (SYCompressedFileOutputStream *)a3;
  if (!v4)
    v4 = self;
  obj = v4;
  os_unfair_lock_lock(&self->_internalLock);
  objc_storeWeak((id *)&self->_internal->_delegate, obj);
  os_unfair_lock_unlock(&self->_internalLock);

}

- (id)streamError
{
  os_unfair_lock_s *p_internalLock;
  NSError *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_internal->_error;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (unint64_t)streamStatus
{
  os_unfair_lock_s *p_internalLock;
  unint64_t status;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  status = self->_internal->_status;
  os_unfair_lock_unlock(p_internalLock);
  return status;
}

- (void)_SY_notifyOnQueue:(id)a3 handler:(id)a4
{
  os_unfair_lock_s *p_internalLock;
  id v7;
  id v8;

  p_internalLock = &self->_internalLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_internalLock);
  -[_SYStreamGuts setEventHandler:queue:](self->_internal, "setEventHandler:queue:", v7, v8);

  os_unfair_lock_unlock(p_internalLock);
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  __CFString *v6;
  os_unfair_lock_s *p_internalLock;
  _SYStreamGuts *internal;
  __CFRunLoop *v9;
  __CFRunLoopSource *runloopSource;
  const __CFString *v11;
  id v12;

  v12 = a3;
  v6 = (__CFString *)a4;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  internal = self->_internal;
  if (!internal->_runloopSource)
    -[_SYStreamGuts createRunloopSourceForStream:](internal, "createRunloopSourceForStream:", self);
  v9 = (__CFRunLoop *)objc_msgSend(v12, "getCFRunLoop");
  runloopSource = self->_internal->_runloopSource;
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x24BDBCA90]))
    v11 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  else
    v11 = v6;
  CFRunLoopAddSource(v9, runloopSource, v11);
  os_unfair_lock_unlock(p_internalLock);

}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  __CFString *v6;
  os_unfair_lock_s *p_internalLock;
  __CFRunLoop *v8;
  __CFRunLoopSource *runloopSource;
  const __CFString *v10;
  id v11;

  v11 = a3;
  v6 = (__CFString *)a4;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  if (self->_internal->_runloopSource)
  {
    v8 = (__CFRunLoop *)objc_msgSend(v11, "getCFRunLoop");
    runloopSource = self->_internal->_runloopSource;
    if (-[__CFString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x24BDBCA90]))
      v10 = (const __CFString *)*MEMORY[0x24BDBD5A0];
    else
      v10 = v6;
    CFRunLoopRemoveSource(v8, runloopSource, v10);
    os_unfair_lock_unlock(p_internalLock);
  }

}

- (void)open
{
  id v3;
  const __CFString *v4;
  void *v5;
  int64_t level;
  void *v7;
  id v8;
  const char *v9;
  int v10;
  int v11;
  void *v12;
  id v13;
  int fd;
  gzFile_s *v15;
  _SYStreamGuts **p_internal;
  _SYStreamGuts *internal;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSError *error;
  id v22;

  if (!-[SYCompressedFileOutputStream streamStatus](self, "streamStatus"))
  {
    v3 = objc_alloc(MEMORY[0x24BDD16A8]);
    if (self->_append)
      v4 = CFSTR("a");
    else
      v4 = CFSTR("w");
    v5 = (void *)objc_msgSend(v3, "initWithString:", v4);
    level = self->_level;
    v22 = v5;
    if (level != -1)
      objc_msgSend(v5, "appendFormat:", CFSTR("%ld"), level);
    -[NSURL filePathURL](self->_url, "filePathURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteURL");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentation");

    if (self->_append)
      v10 = 522;
    else
      v10 = 514;
    v11 = self->_class;
    if (v11)
    {
      self->_fd = open_dprotected_np(v9, v10, v11, 0, 436);
    }
    else
    {
      -[NSURL filePathURL](self->_url, "filePathURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteURL");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      self->_fd = open((const char *)objc_msgSend(v13, "fileSystemRepresentation"), v10, 436);

    }
    os_unfair_lock_lock(&self->_internalLock);
    fd = self->_fd;
    if (fd == -1)
    {
      p_internal = &self->_internal;
      internal = self->_internal;
    }
    else
    {
      v15 = gzdopen(fd, (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"));
      self->_file = v15;
      p_internal = &self->_internal;
      internal = self->_internal;
      if (v15)
      {
        internal->_status = 2;
        -[_SYStreamGuts postStreamEvent:forStream:](*p_internal, "postStreamEvent:forStream:", 1, self);
        v18 = 4;
LABEL_18:
        -[_SYStreamGuts postStreamEvent:forStream:](*p_internal, "postStreamEvent:forStream:", v18, self);
        os_unfair_lock_unlock(&self->_internalLock);

        return;
      }
    }
    internal->_status = 7;
    v19 = objc_alloc(MEMORY[0x24BDD1540]);
    v20 = objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    error = (*p_internal)->_error;
    (*p_internal)->_error = (NSError *)v20;

    v18 = 8;
    goto LABEL_18;
  }
}

- (void)close
{
  SYCompressedFileOutputStream *v2;
  gzFile_s *file;
  id onClose;
  void *v5;
  BOOL v6;
  id v7;

  v2 = self;
  objc_sync_enter(v2);
  file = v2->_file;
  if (file)
  {
    gzclose(v2->_file);
    v2->_fd = -1;
    v2->_file = 0;
    os_unfair_lock_lock(&v2->_internalLock);
    v2->_internal->_status = 6;
    os_unfair_lock_unlock(&v2->_internalLock);
    v7 = (id)MEMORY[0x212BE0F2C](v2->_onClose);
    onClose = v2->_onClose;
    v2->_onClose = 0;

  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v2);

  v5 = v7;
  if (file)
    v6 = v7 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    (*((void (**)(id, SYCompressedFileOutputStream *))v7 + 2))(v7, v2);
    v5 = v7;
  }

}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  unsigned int v4;
  os_unfair_lock_s *p_internalLock;
  _SYStreamGuts *internal;
  int v9;
  int v10;
  NSProgress *progress;
  int64_t v12;
  uint64_t v13;
  _SYStreamGuts *v14;
  NSError *error;

  v4 = a4;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  internal = self->_internal;
  if (internal->_status == 2)
  {
    internal->_status = 4;
    v9 = gzwrite(self->_file, a3, v4);
    self->_internal->_status = 2;
    if (v9)
    {
      v10 = v9;
      if (-[SYCompressedFileOutputStream hasSpaceAvailable](self, "hasSpaceAvailable"))
        -[_SYStreamGuts postStreamEvent:forStream:](self->_internal, "postStreamEvent:forStream:", 4, self);
      if (v10 >= 1)
      {
        self->_byteCount += v10;
        progress = self->_progress;
        if (progress)
          -[NSProgress setCompletedUnitCount:](progress, "setCompletedUnitCount:");
      }
      v12 = v10;
    }
    else
    {
      CreateGzfileError(self->_file);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = self->_internal;
      error = v14->_error;
      v14->_error = (NSError *)v13;

      self->_internal->_status = 7;
      -[_SYStreamGuts postStreamEvent:forStream:](self->_internal, "postStreamEvent:forStream:", 8, self);
      v12 = -1;
    }
  }
  else
  {
    v12 = 0;
  }
  os_unfair_lock_unlock(p_internalLock);
  return v12;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  int fd;
  int v6;
  os_unfair_lock_s *p_internalLock;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  int v12;
  unsigned int v13;
  int v15;
  uint64_t v16;
  _QWORD v17[3];

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("protection-class")))
  {
    v15 = -1;
    fd = self->_fd;
    if (fd == -1)
    {
      -[NSURL filePathURL](self->_url, "filePathURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteURL");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");

      v16 = 0;
      v17[1] = 0;
      v17[2] = 0;
      v17[0] = 0x4000000000000005;
      v12 = getattrlist(v11, v17, &v16, 8uLL, 1u);
      v6 = HIDWORD(v16);
      if (v12)
        v6 = -1;
      v15 = v6;
    }
    else
    {
      fcntl(fd, 63, &v15);
      v6 = v15;
    }
    v13 = v6 - 1;
    if (v13 > 3)
      v8 = 0;
    else
      v8 = **((id **)&unk_24CC65488 + (int)v13);
  }
  else
  {
    p_internalLock = &self->_internalLock;
    os_unfair_lock_lock(&self->_internalLock);
    -[_SYStreamGuts propertyForKey:](self->_internal, "propertyForKey:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_internalLock);
  }

  return v8;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("protection-class")))
  {
    os_unfair_lock_lock(&self->_internalLock);
    -[_SYStreamGuts storeProperty:forKey:](self->_internal, "storeProperty:forKey:", v6, v7);
    os_unfair_lock_unlock(&self->_internalLock);
LABEL_7:
    v9 = 1;
    goto LABEL_9;
  }
  if (!objc_msgSend(v6, "isNSString"))
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  if (self->_fd == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDD0CF0];
    v16[0] = v6;
    v9 = 1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_url, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "setAttributes:ofItemAtPath:error:", v12, v13, 0);

    if ((v14 & 1) != 0)
      goto LABEL_9;
    self->_class = _SYProtectionClassFromString(v6);
    goto LABEL_7;
  }
  v8 = _SYProtectionClassFromString(v6);
  if (!(_DWORD)v8)
    goto LABEL_8;
  v9 = fcntl(self->_fd, 64, v8) == 0;
LABEL_9:

  return v9;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  SYCompressedFileOutputStream *v6;
  SYCompressedFileOutputStream *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = (SYCompressedFileOutputStream *)a3;
  v7 = v6;
  if (v6 == self)
  {
    switch(a4)
    {
      case 1uLL:
        v8 = 192;
        goto LABEL_11;
      case 2uLL:
        v8 = 200;
        goto LABEL_11;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        v8 = 208;
        goto LABEL_11;
      case 8uLL:
        v8 = 224;
        goto LABEL_11;
      default:
        if (a4 != 16)
          break;
        v8 = 216;
LABEL_11:
        v9 = *(uint64_t *)((char *)&v6->super.super.super.isa + v8);
        if (v9)
          (*(void (**)(uint64_t, SYCompressedFileOutputStream *))(v9 + 16))(v9, v7);
        break;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[SYCompressedFileInputStream stream:handleEvent:].cold.1();
  }

}

- (id)onOpenComplete
{
  return self->_onOpenComplete;
}

- (void)setOnOpenComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)onBytesAvailable
{
  return self->_onBytesAvailable;
}

- (void)setOnBytesAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)onSpaceAvailable
{
  return self->_onSpaceAvailable;
}

- (void)setOnSpaceAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)onEndOfFile
{
  return self->_onEndOfFile;
}

- (void)setOnEndOfFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)onError
{
  return self->_onError;
}

- (void)setOnError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)onClose
{
  return self->_onClose;
}

- (void)setOnClose:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (unint64_t)bytesThroughput
{
  return self->_byteCount;
}

- (int64_t)compressionLevel
{
  return self->_level;
}

- (void)setCompressionLevel:(int64_t)a3
{
  self->_level = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_onClose, 0);
  objc_storeStrong(&self->_onError, 0);
  objc_storeStrong(&self->_onEndOfFile, 0);
  objc_storeStrong(&self->_onSpaceAvailable, 0);
  objc_storeStrong(&self->_onBytesAvailable, 0);
  objc_storeStrong(&self->_onOpenComplete, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
