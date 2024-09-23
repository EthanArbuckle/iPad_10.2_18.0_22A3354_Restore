@implementation EDAttachmentFileWriter

- (EDAttachmentFileWriter)initWithFinalURL:(id)a3 queue:(id)a4 compressionQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  EDAttachmentFileWriter *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("download"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[EDAttachmentFileWriter initWithTemporaryURL:finalURL:protection:queue:compressionQueue:completion:](self, "initWithTemporaryURL:finalURL:protection:queue:compressionQueue:completion:", v14, v10, 2, v11, v12, v13);

  return v15;
}

- (EDAttachmentFileWriter)initWithTemporaryURL:(id)a3 finalURL:(id)a4 protection:(int)a5 queue:(id)a6 compressionQueue:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  EDAttachmentFileWriter *v18;
  NSObject *p_super;
  void *v20;
  uint64_t v21;
  Class isa;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  EDAttachmentFileWriter *v26;
  id v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  NSObject *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v28 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)EDAttachmentFileWriter;
  v18 = -[EDAttachmentFileWriter init](&v30, sel_init);
  p_super = &v18->super;
  if (v18)
  {
    if (CC_SHA256_Init(&v18->_digestContext) != 1
      || (objc_storeStrong((id *)&p_super[15].isa, a3),
          objc_storeStrong((id *)&p_super[16].isa, a4),
          objc_storeStrong((id *)&p_super[19].isa, a6),
          objc_storeStrong((id *)&p_super[20].isa, a7),
          -[EDAttachmentFileWriter makeTemporaryFileIOForFile:protection:callbackQueue:](p_super, v29, a5, v15),
          (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v26 = 0;
      goto LABEL_9;
    }
    objc_storeStrong((id *)&p_super[18].isa, v20);
    v21 = objc_msgSend(v17, "copy", v28);
    isa = p_super[21].isa;
    p_super[21].isa = (Class)v21;

    EDAttachmentsLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = p_super[15].isa;
      -[objc_class path](v24, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v32 = p_super;
      v33 = 2114;
      v34 = v25;
      _os_log_impl(&dword_1D2F2C000, v23, OS_LOG_TYPE_DEFAULT, "Did create EDAttachmentFileWriter %p for MIME part file \"%{public}@\".", buf, 0x16u);

    }
  }
  v26 = p_super;
LABEL_9:

  return v26;
}

- (dispatch_io_t)makeTemporaryFileIOForFile:(int)a3 protection:(void *)a4 callbackQueue:
{
  id v7;
  NSObject *v8;
  char v9;
  id v10;
  dispatch_fd_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v15;
  int v16;
  _QWORD cleanup_handler[5];
  uint8_t buf[4];
  dispatch_io_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = 0;
    HIDWORD(a1[14].isa) = -1;
    while (1)
    {
      v10 = objc_retainAutorelease(v7);
      v11 = open_dprotected_np((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 2818, a3, 0, 384);
      if ((v11 & 0x80000000) == 0)
      {
        v12 = MEMORY[0x1E0C809B0];
        HIDWORD(a1[14].isa) = v11;
        cleanup_handler[0] = v12;
        cleanup_handler[1] = 3221225472;
        cleanup_handler[2] = __78__EDAttachmentFileWriter_makeTemporaryFileIOForFile_protection_callbackQueue___block_invoke;
        cleanup_handler[3] = &unk_1E949AE90;
        cleanup_handler[4] = a1;
        a1 = dispatch_io_create(0, v11, v8, cleanup_handler);
        goto LABEL_10;
      }
      if ((v9 & 1) != 0)
        break;
      unlink((const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"));
      v9 = 1;
    }
    EDAttachmentsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *__error();
      *(_DWORD *)buf = 134218498;
      v19 = a1;
      v20 = 2114;
      v21 = v15;
      v22 = 1024;
      v23 = v16;
      _os_log_error_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_ERROR, "<%p> Failed to create temporary MIME part file \"%{public}@\": %{errno}d", buf, 0x1Cu);

    }
    a1 = 0;
  }
LABEL_10:

  return a1;
}

- (void)dealloc
{
  NSURL *v3;
  NSURL *v4;
  OS_dispatch_io *v5;
  atomic_flag *p_didClose;
  unsigned __int8 v7;
  NSObject *v8;
  NSURL *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  EDAttachmentFileWriter *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v3 = self->_tempURL;
    if (v3)
    {
      v4 = v3;
      v5 = self->_io;
      if (v5)
      {
        p_didClose = &self->_didClose;
        do
          v7 = __ldaxr((unsigned __int8 *)p_didClose);
        while (__stlxr(1u, (unsigned __int8 *)p_didClose));

        if ((v7 & 1) == 0)
        {
          EDAttachmentsLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            v9 = self->_tempURL;
            -[NSURL path](v9, "path");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v13 = self;
            v14 = 2114;
            v15 = v10;
            _os_log_error_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_ERROR, "Deallocating EDAttachmentFileWriter %p while temporary MIME part file \"%{public}@\" is still open.", buf, 0x16u);

          }
          dispatch_io_close((dispatch_io_t)self->_io, 1uLL);
        }
      }
      else
      {

      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)EDAttachmentFileWriter;
  -[EDAttachmentFileWriter dealloc](&v11, sel_dealloc);
}

- (void)writeData:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_io *v6;
  NSObject *queue;
  _QWORD io_handler[5];

  v4 = a3;
  v5 = v4;
  if (self)
    self->_byteCount += dispatch_data_get_size(v4);
  if (dispatch_data_get_size(v5))
  {
    -[EDAttachmentFileWriter updateDigestWithData:]((_BOOL8)self, v5);
    if (self)
    {
      v6 = self->_io;
      queue = self->_queue;
    }
    else
    {
      v6 = 0;
      queue = 0;
    }
    io_handler[0] = MEMORY[0x1E0C809B0];
    io_handler[1] = 3221225472;
    io_handler[2] = __36__EDAttachmentFileWriter_writeData___block_invoke;
    io_handler[3] = &unk_1E949AE40;
    io_handler[4] = self;
    dispatch_io_write((dispatch_io_t)v6, 0, v5, queue, io_handler);

  }
}

- (BOOL)updateDigestWithData:(_BOOL8)result
{
  _QWORD applier[5];

  if (result)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __47__EDAttachmentFileWriter_updateDigestWithData___block_invoke;
    applier[3] = &unk_1E949AE68;
    applier[4] = result;
    return dispatch_data_apply(data, applier);
  }
  return result;
}

void __36__EDAttachmentFileWriter_writeData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  NSObject *v5;

  if (a4)
  {
    EDAttachmentsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __36__EDAttachmentFileWriter_writeData___block_invoke_cold_1(a1);

  }
}

uint64_t __47__EDAttachmentFileWriter_updateDigestWithData___block_invoke(uint64_t a1, int a2, int a3, void *data, CC_LONG len)
{
  CC_SHA256_Update((CC_SHA256_CTX *)(*(_QWORD *)(a1 + 32) + 12), data, len);
  return 1;
}

- (void)close
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "<%p> Attempted to close temporary MIME part file multiple times.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)failAndClose
{
  atomic_flag *p_didFail;
  unsigned __int8 v4;
  atomic_flag *p_didClose;
  unsigned __int8 v6;
  NSObject *v7;
  NSObject *io;
  int v9;
  EDAttachmentFileWriter *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_didFail = &self->_didFail;
  do
    v4 = __ldaxr((unsigned __int8 *)p_didFail);
  while (__stlxr(1u, (unsigned __int8 *)p_didFail));
  if ((v4 & 1) == 0)
  {
    p_didClose = &self->_didClose;
    do
      v6 = __ldaxr((unsigned __int8 *)p_didClose);
    while (__stlxr(1u, (unsigned __int8 *)p_didClose));
    if ((v6 & 1) == 0)
    {
      EDAttachmentsLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = self;
        _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Fail and close temporary MIME part file.", (uint8_t *)&v9, 0xCu);
      }

      if (self)
        io = self->_io;
      else
        io = 0;
      dispatch_io_close(io, 1uLL);
    }
  }
}

void __78__EDAttachmentFileWriter_makeTemporaryFileIOForFile_protection_callbackQueue___block_invoke(uint64_t a1, int a2)
{
  -[EDAttachmentFileWriter ioDidRelinquishControlWithError:](*(_QWORD *)(a1 + 32), a2);
}

- (void)ioDidRelinquishControlWithError:(uint64_t)a1
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  unsigned __int8 *v12;
  unsigned __int8 v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 152));
    if (a2)
    {
      EDAttachmentsLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[EDAttachmentFileWriter ioDidRelinquishControlWithError:].cold.2(a1, v4, v5, v6, v7, v8, v9, v10);

      -[EDAttachmentFileWriter closeTemporaryFile](a1);
      if (*(_QWORD *)(a1 + 168))
      {
        v11 = *(void (**)(void))(*(_QWORD *)(a1 + 168) + 16);
LABEL_15:
        v11();
      }
    }
    else
    {
      v12 = (unsigned __int8 *)(a1 + 9);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(1u, v12));
      if ((v13 & 1) == 0)
      {
        -[EDAttachmentFileWriter makePurgeable](a1);
        return;
      }
      EDAttachmentsLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[EDAttachmentFileWriter ioDidRelinquishControlWithError:].cold.1(a1, v14, v15, v16, v17, v18, v19, v20);

      -[EDAttachmentFileWriter closeTemporaryFile](a1);
      if (*(_QWORD *)(a1 + 168))
      {
        v11 = *(void (**)(void))(*(_QWORD *)(a1 + 168) + 16);
        goto LABEL_15;
      }
    }
  }
}

- (void)closeTemporaryFile
{
  int v4;

  v4 = *a2;
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v4;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "<%p> Failed to close temporary MIME part file: %{errno}d", buf, 0x12u);
}

- (void)makePurgeable
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218240;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1D2F2C000, v1, v2, "<%p> Failed to mark file as purgeable: %{errno}d.", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)moveTemporaryFileIntoPlace
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218240;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1D2F2C000, v1, v2, "<%p> Failed to move temporary MIME part file into place: %{errno}d", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (char)finalizedDigest
{
  char *v1;
  id v2;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (CC_SHA256_Final((unsigned __int8 *)objc_msgSend(v2, "mutableBytes"), (CC_SHA256_CTX *)(v1 + 12)) == 1)
      v1 = (char *)v2;
    else
      v1 = 0;

  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_compressionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_io, 0);
  objc_storeStrong((id *)&self->_finalURL, 0);
  objc_storeStrong((id *)&self->_tempURL, 0);
}

void __36__EDAttachmentFileWriter_writeData___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218240;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1D2F2C000, v1, v2, "<%p> Failed to write data to temporary MIME part file.: %{errno}d", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)ioDidRelinquishControlWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "<%p> Failing download because -failAndClose was previously called.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)ioDidRelinquishControlWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2F2C000, a2, a3, "<%p> Failed to create dispatch IO for temporary MIME part file.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
