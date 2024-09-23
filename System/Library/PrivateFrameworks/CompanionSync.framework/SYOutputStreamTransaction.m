@implementation SYOutputStreamTransaction

- (SYOutputStreamTransaction)initWithMetadata:(id)a3
{
  id v4;
  SYOutputStreamTransaction *v5;
  uint64_t v6;
  NSDictionary *metadata;
  SYStreamEventHandlerBlocks *stream;
  NSURL *fileURL;
  SYOutputStreamTransaction *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYOutputStreamTransaction;
  v5 = -[SYOutputStreamTransaction init](&v12, sel_init);
  if (v5
    && (v6 = objc_msgSend(v4, "copy"),
        metadata = v5->_metadata,
        v5->_metadata = (NSDictionary *)v6,
        metadata,
        stream = v5->_stream,
        v5->_stream = 0,
        stream,
        v5->_stream))
  {
    fileURL = v5->_fileURL;
    v5->_fileURL = 0;

    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = a2;
  _SYObfuscate(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_211704000, v5, OS_LOG_TYPE_ERROR, "SYOutputStreamTransaction failed to clean up a temporary file at URL %@: %{public}@", (uint8_t *)&v7, 0x16u);

}

- (int64_t)type
{
  return 1;
}

- (BOOL)prepare:(id *)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  uint64_t v10;
  NSURL *fileURL;
  void *v12;
  uint64_t v13;
  NSProgress *v14;
  NSProgress *progress;
  uint64_t v17;
  uint64_t v18;
  intptr_t (*v19)(uint64_t);
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = dispatch_semaphore_create(0);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __37__SYOutputStreamTransaction_prepare___block_invoke;
  v20 = &unk_24CC66BE8;
  v6 = v5;
  v21 = v6;
  -[SYStreamEventHandlerBlocks setOnOpenComplete:](self->_stream, "setOnOpenComplete:", &v17);
  -[SYStreamEventHandlerBlocks onOpenComplete](self->_stream, "onOpenComplete", v17, v18, v19, v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYStreamEventHandlerBlocks setOnError:](self->_stream, "setOnError:", v7);

  -[SYStreamEventHandlerBlocks open](self->_stream, "open");
  v8 = dispatch_walltime(0, 30000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    -[SYStreamEventHandlerBlocks close](self->_stream, "close");
    if (a3)
    {
      v9 = objc_alloc(MEMORY[0x24BDD1540]);
      v10 = *MEMORY[0x24BDD1308];
      fileURL = self->_fileURL;
      v22 = *MEMORY[0x24BDD1310];
      v23[0] = fileURL;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, -1001, v12);

    }
  }
  v13 = -[SYStreamEventHandlerBlocks streamStatus](self->_stream, "streamStatus");
  if (v13 == 7)
  {
    if (a3)
    {
      -[SYStreamEventHandlerBlocks streamError](self->_stream, "streamError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = (NSProgress *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1768]), "initWithParent:userInfo:", 0, 0);
    progress = self->_progress;
    self->_progress = v14;

    -[NSProgress setTotalUnitCount:](self->_progress, "setTotalUnitCount:", 1000);
  }

  return v13 != 7;
}

intptr_t __37__SYOutputStreamTransaction_prepare___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)finalizeOutput:(id *)a3
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v5 = -[SYStreamEventHandlerBlocks streamStatus](self->_stream, "streamStatus");
  if (v5 != 6)
  {
    if (v5 == 7)
    {
      if (a3)
      {
        -[SYStreamEventHandlerBlocks streamError](self->_stream, "streamError");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      return 0;
    }
    -[SYStreamEventHandlerBlocks close](self->_stream, "close");
  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDecompressedFileSize:", -[SYStreamEventHandlerBlocks bytesThroughput](self->_stream, "bytesThroughput"));
  if (_MakeFileTransferAnchor_onceToken != -1)
    dispatch_once(&_MakeFileTransferAnchor_onceToken, &__block_literal_global_12);
  v8 = (void *)_MakeFileTransferAnchor___formatter;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setEndAnchor:", v10);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setFileURL:", self->_fileURL);
  objc_msgSend(v11, "setMetadata:", self->_metadata);
  objc_msgSend(v11, "setPbHeaderInfo:", v7);
  v12 = *MEMORY[0x24BE4FA80];
  v14[0] = *MEMORY[0x24BE4FA88];
  v14[1] = v12;
  v15[0] = MEMORY[0x24BDBD1C8];
  v15[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setExtraIDSOptions:", v13);

  return v11;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)self->_stream;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
