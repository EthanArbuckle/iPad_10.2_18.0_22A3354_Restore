@implementation SYCompressedFileInputStream

- (SYCompressedFileInputStream)initWithData:(id)a3
{

  return 0;
}

- (SYCompressedFileInputStream)initWithFileAtPath:(id)a3
{
  void *v4;
  SYCompressedFileInputStream *v5;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SYCompressedFileInputStream initWithURL:](self, "initWithURL:", v4);

  return v5;
}

- (SYCompressedFileInputStream)initWithURL:(id)a3
{
  id v4;
  SYCompressedFileInputStream *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  _SYStreamGuts *internal;
  SYCompressedFileInputStream *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYCompressedFileInputStream;
  v5 = -[SYCompressedFileInputStream init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = objc_opt_new();
    internal = v5->_internal;
    v5->_internal = (_SYStreamGuts *)v8;

    objc_storeWeak((id *)&v5->_internal->_delegate, v5);
    v10 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SYCompressedFileInputStream close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)SYCompressedFileInputStream;
  -[SYCompressedFileInputStream dealloc](&v3, sel_dealloc);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_internal->_delegate);
}

- (void)setDelegate:(id)a3
{
  SYCompressedFileInputStream *v4;
  SYCompressedFileInputStream *v5;

  v4 = (SYCompressedFileInputStream *)a3;
  if (!v4)
    v4 = self;
  v5 = v4;
  objc_storeWeak((id *)&self->_internal->_delegate, v4);

}

- (id)streamError
{
  return self->_internal->_error;
}

- (unint64_t)streamStatus
{
  return self->_internal->_status;
}

- (void)_SY_notifyOnQueue:(id)a3 handler:(id)a4
{
  -[_SYStreamGuts setEventHandler:queue:](self->_internal, "setEventHandler:queue:", a4, a3);
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  __CFString *v6;
  _SYStreamGuts *internal;
  __CFRunLoop *v8;
  __CFRunLoopSource *runloopSource;
  const __CFString *v10;
  id v11;

  v11 = a3;
  v6 = (__CFString *)a4;
  internal = self->_internal;
  if (!internal->_runloopSource)
    -[_SYStreamGuts createRunloopSourceForStream:](internal, "createRunloopSourceForStream:", self);
  v8 = (__CFRunLoop *)objc_msgSend(v11, "getCFRunLoop");
  runloopSource = self->_internal->_runloopSource;
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x24BDBCA90]))
    v10 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  else
    v10 = v6;
  CFRunLoopAddSource(v8, runloopSource, v10);

}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  __CFRunLoop *v6;
  __CFRunLoopSource *runloopSource;
  const __CFString *v8;
  __CFString *v9;

  v9 = (__CFString *)a4;
  if (self->_internal->_runloopSource)
  {
    v6 = (__CFRunLoop *)objc_msgSend(a3, "getCFRunLoop");
    runloopSource = self->_internal->_runloopSource;
    if (-[__CFString isEqualToString:](v9, "isEqualToString:", *MEMORY[0x24BDBCA90]))
      v8 = (const __CFString *)*MEMORY[0x24BDBD5A0];
    else
      v8 = v9;
    CFRunLoopRemoveSource(v6, runloopSource, v8);
  }

}

- (_SYStreamGuts)_internal
{
  return self->_internal;
}

- (void)_postEventToDelegate:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_internal->_delegate);
  objc_msgSend(WeakRetained, "stream:handleEvent:", self, a3);

}

- (void)open
{
  void *v3;
  id v4;
  _SYStreamGuts *internal;
  gzFile_s *file;
  unsigned __int8 *next;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  _SYStreamGuts *v12;
  NSError *error;
  uint64_t v14;

  if (!self->_internal->_status)
  {
    -[NSURL filePathURL](self->_url, "filePathURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "absoluteURL");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    self->_file = gzopen((const char *)objc_msgSend(v4, "fileSystemRepresentation"), "r");

    internal = self->_internal;
    if (self->_file)
    {
      internal->_status = 2;
      -[_SYStreamGuts postStreamEvent:forStream:](self->_internal, "postStreamEvent:forStream:", 1, self);
      file = self->_file;
      if (file->have)
      {
        --file->have;
        next = file->next;
        v8 = file->pos + 1;
        file->next = next + 1;
        file->pos = v8;
        v9 = *next;
      }
      else
      {
        v9 = gzgetc(file);
        if (v9 == -1)
        {
          if (gzeof(self->_file))
          {
            v14 = 16;
            goto LABEL_8;
          }
          v9 = -1;
        }
      }
      gzungetc(v9, self->_file);
      v14 = 2;
    }
    else
    {
      internal->_status = 7;
      v10 = objc_alloc(MEMORY[0x24BDD1540]);
      v11 = objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      v12 = self->_internal;
      error = v12->_error;
      v12->_error = (NSError *)v11;

      v14 = 8;
    }
LABEL_8:
    -[_SYStreamGuts postStreamEvent:forStream:](self->_internal, "postStreamEvent:forStream:", v14, self);
  }
}

- (void)close
{
  SYCompressedFileInputStream *v2;
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
    v2->_file = 0;
    v2->_internal->_status = 6;
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
    (*((void (**)(id, SYCompressedFileInputStream *))v7 + 2))(v7, v2);
    v5 = v7;
  }

}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  unsigned int v4;
  SYCompressedFileInputStream *v6;
  _SYStreamGuts *internal;
  int v8;
  int64_t v9;
  uint64_t v10;
  _SYStreamGuts *v11;
  NSError *error;
  NSProgress *progress;

  v4 = a4;
  v6 = self;
  objc_sync_enter(v6);
  internal = v6->_internal;
  if (internal->_status != 2)
  {
    v9 = 0;
    goto LABEL_14;
  }
  internal->_status = 3;
  v8 = gzread(v6->_file, a3, v4);
  LODWORD(v9) = v8;
  v6->_internal->_status = 2;
  if (!v8)
    goto LABEL_7;
  if (v8 == -1)
  {
    CreateGzfileError(v6->_file);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v6->_internal;
    error = v11->_error;
    v11->_error = (NSError *)v10;

    v6->_internal->_status = 7;
    -[_SYStreamGuts postStreamEvent:forStream:](v6->_internal, "postStreamEvent:forStream:", 8, v6);
    v9 = -1;
    goto LABEL_14;
  }
  if (gzeof(v6->_file) == 1)
  {
LABEL_7:
    v6->_internal->_status = 5;
    -[_SYStreamGuts postStreamEvent:forStream:](v6->_internal, "postStreamEvent:forStream:", 16, v6);
  }
  if ((int)v9 >= 1)
  {
    v6->_byteCount += v9;
    progress = v6->_progress;
    if (progress)
      -[NSProgress setCompletedUnitCount:](progress, "setCompletedUnitCount:");
  }
  if (-[SYCompressedFileInputStream hasBytesAvailable](v6, "hasBytesAvailable"))
    -[_SYStreamGuts postStreamEvent:forStream:](v6->_internal, "postStreamEvent:forStream:", 2, v6);
  v9 = (int)v9;
LABEL_14:
  objc_sync_exit(v6);

  return v9;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  SYCompressedFileInputStream *v2;
  BOOL v3;
  gzFile_s *file;
  unsigned __int8 *next;
  uint64_t v6;
  int v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_internal->_status != 2 || gzeof(v2->_file) == 1)
    goto LABEL_3;
  file = v2->_file;
  if (file->have)
  {
    --file->have;
    next = file->next;
    v6 = file->pos + 1;
    file->next = next + 1;
    file->pos = v6;
    v7 = *next;
LABEL_7:
    gzungetc(v7, v2->_file);
    v3 = 1;
    goto LABEL_8;
  }
  v7 = gzgetc(file);
  if (v7 != -1)
    goto LABEL_7;
LABEL_3:
  v3 = 0;
LABEL_8:
  objc_sync_exit(v2);

  return v3;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  SYCompressedFileInputStream *v6;
  SYCompressedFileInputStream *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = (SYCompressedFileInputStream *)a3;
  v7 = v6;
  if (v6 == self)
  {
    switch(a4)
    {
      case 1uLL:
        v8 = 160;
        goto LABEL_11;
      case 2uLL:
        v8 = 168;
        goto LABEL_11;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        v8 = 176;
        goto LABEL_11;
      case 8uLL:
        v8 = 192;
        goto LABEL_11;
      default:
        if (a4 != 16)
          break;
        v8 = 184;
LABEL_11:
        v9 = *(uint64_t *)((char *)&v6->super.super.super.isa + v8);
        if (v9)
          (*(void (**)(uint64_t, SYCompressedFileInputStream *))(v9 + 16))(v9, v7);
        break;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[SYCompressedFileInputStream stream:handleEvent:].cold.1();
  }

}

- (id)propertyForKey:(id)a3
{
  return -[_SYStreamGuts propertyForKey:](self->_internal, "propertyForKey:", a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  -[_SYStreamGuts storeProperty:forKey:](self->_internal, "storeProperty:forKey:", a3, a4);
  return 1;
}

- (id)onOpenComplete
{
  return self->_onOpenComplete;
}

- (void)setOnOpenComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)onBytesAvailable
{
  return self->_onBytesAvailable;
}

- (void)setOnBytesAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)onSpaceAvailable
{
  return self->_onSpaceAvailable;
}

- (void)setOnSpaceAvailable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)onEndOfFile
{
  return self->_onEndOfFile;
}

- (void)setOnEndOfFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)onError
{
  return self->_onError;
}

- (void)setOnError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)onClose
{
  return self->_onClose;
}

- (void)setOnClose:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
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

- (void)stream:handleEvent:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_211704000, MEMORY[0x24BDACB70], v0, "Unknown stream %{public}@ is sending me (%{public}@) delegate messages...", v1, v2, v3, v4, v5);
}

@end
