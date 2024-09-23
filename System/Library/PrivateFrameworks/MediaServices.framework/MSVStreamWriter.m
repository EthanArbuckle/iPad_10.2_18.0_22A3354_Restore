@implementation MSVStreamWriter

- (MSVStreamWriter)init
{
  return -[MSVStreamWriter initWithQueue:](self, "initWithQueue:", 0);
}

- (MSVStreamWriter)initWithQueue:(id)a3
{
  id v4;
  MSVStreamWriter *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  dispatch_queue_t v10;
  objc_class *v11;
  const char *Name;
  OS_dispatch_queue *queue;
  id v15;
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MSVStreamWriter;
  v5 = -[MSVStreamWriter init](&v17, sel_init);
  if (v5)
  {
    v15 = 0;
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0C99E70], "getBoundStreamsWithBufferSize:inputStream:outputStream:", 35840, &v16, &v15);
    v6 = v16;
    v7 = v16;
    v8 = v15;
    v9 = v15;
    objc_storeStrong((id *)&v5->_inputStream, v6);
    objc_storeStrong((id *)&v5->_outputStream, v8);
    if (v4)
    {
      v10 = (dispatch_queue_t)v4;
    }
    else
    {
      v11 = (objc_class *)objc_opt_class();
      Name = class_getName(v11);
      v10 = dispatch_queue_create(Name, 0);
    }
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    *(_WORD *)&v5->_stopped = 0;
  }

  return v5;
}

- (MSVStreamWriter)initWithOutputStream:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  MSVStreamWriter *v9;
  MSVStreamWriter *v10;
  dispatch_queue_t v11;
  objc_class *v12;
  const char *Name;
  OS_dispatch_queue *queue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSVStreamWriter;
  v9 = -[MSVStreamWriter init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputStream, a3);
    if (v8)
    {
      v11 = (dispatch_queue_t)v8;
    }
    else
    {
      v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      v11 = dispatch_queue_create(Name, 0);
    }
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    v10->_maximumBufferSize = 35840;
    v10->_closeOnStop = 0;
  }

  return v10;
}

- (void)start
{
  NSObject *v3;
  uint64_t v4;
  NSOutputStream *outputStream;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  MSVStreamWriter *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl(&dword_1A077D000, v3, OS_LOG_TYPE_DEFAULT, "%p starting stream writer", buf, 0xCu);
  }

  MEMORY[0x1A1AFB050](self->_outputStream, self->_queue);
  -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", self);
  self->_timestamp = CFAbsoluteTimeGetCurrent();
  v4 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus");
  outputStream = self->_outputStream;
  if (v4)
  {
    if (-[NSOutputStream hasSpaceAvailable](outputStream, "hasSpaceAvailable"))
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __24__MSVStreamWriter_start__block_invoke;
      block[3] = &unk_1E43E9C88;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
  else
  {
    -[NSOutputStream open](outputStream, "open");
    self->_closeOnStop = 1;
  }
}

- (void)stop
{
  -[MSVStreamWriter stopWithCompletion:](self, "stopWithCompletion:", 0);
}

- (void)stopWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MSVStreamWriter_stopWithCompletion___block_invoke;
  v7[3] = &unk_1E43E9EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)writeAllData:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  id v20[2];
  _QWORD v21[3];
  char v22;
  _QWORD v23[4];
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke;
  v27[3] = &unk_1E43E9CB0;
  objc_copyWeak(&v29, &location);
  v9 = v7;
  v28 = v9;
  -[MSVStreamWriter setDidFinishWritingBlock:](self, "setDidFinishWritingBlock:", v27);
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_2;
  v24[3] = &unk_1E43E9CD8;
  objc_copyWeak(&v26, &location);
  v10 = v9;
  v25 = v10;
  -[MSVStreamWriter setDidEncounterErrorBlock:](self, "setDidEncounterErrorBlock:", v24);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v11 = (void *)objc_msgSend(v6, "length");
  v13 = v8;
  v14 = 3221225472;
  v15 = __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_4;
  v16 = &unk_1E43E9D00;
  objc_copyWeak(v20, &location);
  v18 = v21;
  v19 = v23;
  v20[1] = v11;
  v12 = v6;
  v17 = v12;
  -[MSVStreamWriter setCanWriteDataBlock:](self, "setCanWriteDataBlock:", &v13);
  -[MSVStreamWriter start](self, "start", v13, v14, v15, v16);

  objc_destroyWeak(v20);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)writeData:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *pendingWriteDataList;
  NSMutableArray *v9;
  NSMutableArray *v10;
  _MSVStreamWriterPendingData *v11;

  v6 = a4;
  v7 = a3;
  v11 = objc_alloc_init(_MSVStreamWriterPendingData);
  -[_MSVStreamWriterPendingData setData:](v11, "setData:", v7);

  -[_MSVStreamWriterPendingData setCompletionHandler:](v11, "setCompletionHandler:", v6);
  pendingWriteDataList = self->_pendingWriteDataList;
  if (!pendingWriteDataList)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = self->_pendingWriteDataList;
    self->_pendingWriteDataList = v9;

    pendingWriteDataList = self->_pendingWriteDataList;
  }
  -[NSMutableArray addObject:](pendingWriteDataList, "addObject:", v11);
  -[MSVStreamWriter _writeAvailablePendingData](self, "_writeAvailablePendingData");

}

- (BOOL)writeAllData:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  BOOL v14;
  unint64_t v15;
  int v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  NSOutputStream *outputStream;
  id v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v33;
  uint8_t buf[4];
  MSVStreamWriter *v35;
  __int16 v36;
  _BYTE v37[10];
  uint64_t v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[MSVStreamWriter isCompressed](self, "isCompressed"))
  {
    v9 = 0;
    v10 = v6;
LABEL_5:
    if (self->_stopped)
    {
      v11 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v35 = self;
        _os_log_impl(&dword_1A077D000, v11, OS_LOG_TYPE_DEFAULT, "StreamWriter %p is stopped", buf, 0xCu);
      }

      if (a4)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = CFSTR("Stream writer is already stopped");
LABEL_10:
        objc_msgSend(v12, "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVStreamWriter"), -1, v13);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_49;
      }
      goto LABEL_48;
    }
    if (!v10 || !objc_msgSend(v10, "length"))
    {
      v20 = 1;
      goto LABEL_44;
    }
    if (self->_stopped)
    {
      v15 = 0;
LABEL_15:
      v16 = 1;
    }
    else
    {
      v15 = 0;
      while (1)
      {
        if (v15 >= objc_msgSend(v10, "length"))
        {
          v16 = 1;
          goto LABEL_42;
        }
        outputStream = self->_outputStream;
        v22 = objc_retainAutorelease(v10);
        v23 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", objc_msgSend(v22, "bytes") + v15, objc_msgSend(v22, "length") - v15);
        v24 = v23;
        if (v23 < 0)
          break;
        v15 += v23;
        if (self->_stopped)
          goto LABEL_15;
      }
      _MSVLogCategoryStreamWriter();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        -[NSOutputStream streamError](self->_outputStream, "streamError");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus");
        *(_DWORD *)buf = 134218754;
        v35 = self;
        v36 = 2114;
        *(_QWORD *)v37 = v26;
        *(_WORD *)&v37[8] = 2048;
        v38 = v27;
        v39 = 1024;
        v40 = v24;
        _os_log_impl(&dword_1A077D000, v25, OS_LOG_TYPE_DEFAULT, "%p error while writing to data stream: err=%{public}@, status=%lu, bytesWritten:%d", buf, 0x26u);

      }
      if (a4)
      {
        -[NSOutputStream streamError](self->_outputStream, "streamError");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          *a4 = objc_retainAutorelease(v28);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MSVStreamWriter"), -1, 0);
          v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *a4 = v30;

        }
      }
      v16 = 0;
LABEL_42:
      if (!self->_stopped)
      {
LABEL_43:
        self->_bytesWritten += v15;
        v20 = v16 != 0;
LABEL_44:
        v31 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          v35 = self;
          v36 = 2048;
          *(_QWORD *)v37 = v10;
          *(_WORD *)&v37[8] = 1024;
          LODWORD(v38) = v20;
          _os_log_impl(&dword_1A077D000, v31, OS_LOG_TYPE_DEFAULT, "%p Finished writing data (%p), success=%{BOOL}u", buf, 0x1Cu);
        }

        if (v20)
        {
          v14 = !self->_stopped;
          goto LABEL_49;
        }
        goto LABEL_48;
      }
    }
    if (v15 < objc_msgSend(v10, "length"))
    {
      v17 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v10, "length");
        *(_DWORD *)buf = 134218496;
        v35 = self;
        v36 = 1024;
        *(_DWORD *)v37 = v15;
        *(_WORD *)&v37[4] = 1024;
        *(_DWORD *)&v37[6] = v18;
        _os_log_impl(&dword_1A077D000, v17, OS_LOG_TYPE_DEFAULT, "StreamWriter %p is stopped, totalBytesWritten=%d, dataLen=%d", buf, 0x18u);
      }

      if (a4)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = CFSTR("Stream writer was stopped before flushing all data");
        goto LABEL_10;
      }
LABEL_48:
      v14 = 0;
      goto LABEL_49;
    }
    goto LABEL_43;
  }
  v33 = 0;
  v7 = -[MSVStreamWriter _processInput:generatingDecompressedData:](self, "_processInput:generatingDecompressedData:", v6, &v33);
  v8 = v33;
  v9 = v8;
  if (v7)
  {
    v9 = v8;

    v10 = v9;
    goto LABEL_5;
  }
  v19 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = self;
    _os_log_impl(&dword_1A077D000, v19, OS_LOG_TYPE_DEFAULT, "%p Could not decompress input data", buf, 0xCu);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVStreamWriter"), -1, CFSTR("Could not decompress input data"));
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v10 = v6;
LABEL_49:

  return v14;
}

- (void)writeStreamError:(id)a3
{
  CFReadStreamSignalEvent();
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  NSOutputStream *v7;
  NSObject *v8;
  void (**canWriteDataBlock)(void);
  void (**didEncounterErrorBlock)(id, void *);
  void *v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  int v15;
  MSVStreamWriter *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (NSOutputStream *)a3;
  if (self->_outputStream != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVStreamWriter.m"), 243, CFSTR("unexpected stream"));

  }
  if (self->_stopped)
  {
    v8 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134218240;
      v16 = self;
      v17 = 2048;
      v18 = a4;
      _os_log_impl(&dword_1A077D000, v8, OS_LOG_TYPE_DEFAULT, "%p Writer is already stopped - not handling event %lu", (uint8_t *)&v15, 0x16u);
    }

  }
  else
  {
    switch(a4)
    {
      case 0x10uLL:
        -[MSVStreamWriter _onQueue_stop](self, "_onQueue_stop");
        didEncounterErrorBlock = (void (**)(id, void *))self->_didEncounterErrorBlock;
        if (didEncounterErrorBlock)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MSVStreamWriter"), -1, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          didEncounterErrorBlock[2](didEncounterErrorBlock, v11);

        }
        break;
      case 8uLL:
        -[MSVStreamWriter _onQueue_stop](self, "_onQueue_stop");
        v12 = (void (**)(id, void *))self->_didEncounterErrorBlock;
        if (v12)
        {
          -[NSOutputStream streamError](self->_outputStream, "streamError");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v12[2](v12, v13);

        }
        break;
      case 4uLL:
        canWriteDataBlock = (void (**)(void))self->_canWriteDataBlock;
        if (canWriteDataBlock)
          canWriteDataBlock[2]();
        -[MSVStreamWriter _writeAvailablePendingData](self, "_writeAvailablePendingData");
        break;
    }
  }

}

- (BOOL)_processInput:(id)a3 generatingDecompressedData:(id *)a4
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  id v23;
  int v24;
  uint64_t v25;
  z_stream *v26;
  uint64_t v27;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  NSObject *v35;
  NSObject *v36;
  int v37;
  int v38;
  uint8_t v40[4];
  uint64_t v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  _BYTE v53[10];
  _BYTE v54[6];
  uint64_t v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v4 = MEMORY[0x1E0C80A78](self, a2, a3);
  v6 = v5;
  v8 = v7;
  v9 = v4;
  v58 = *MEMORY[0x1E0C80C00];
  v11 = v10;
  v12 = (void *)objc_opt_new();
  v13 = 4 * (objc_msgSend(v11, "length") == 0);
  v14 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v11, "length");
    v16 = *(_QWORD *)(v9 + 24);
    *(_DWORD *)buf = 134219008;
    v51 = v9;
    v52 = 2048;
    *(_QWORD *)v53 = v11;
    *(_WORD *)&v53[8] = 1024;
    *(_DWORD *)v54 = v15;
    *(_WORD *)&v54[4] = 2048;
    v55 = v16;
    v56 = 1024;
    v57 = v13;
    _os_log_impl(&dword_1A077D000, v14, OS_LOG_TYPE_DEFAULT, "%p starting to decompress input data (%p) len=%d, _zstreamp=%p, inflateOption=%d", buf, 0x2Cu);
  }

  v17 = *(_QWORD *)(v9 + 24);
  if (v11)
  {
    if (!v17)
    {
      v18 = malloc_type_malloc(0x70uLL, 0x10B0040E8CA615DuLL);
      *(_QWORD *)(v9 + 24) = v18;
      v18[8] = 0;
      *(_QWORD *)(*(_QWORD *)(v9 + 24) + 72) = 0;
      *(_QWORD *)(*(_QWORD *)(v9 + 24) + 80) = 0;
      v19 = inflateInit_(*(z_streamp *)(v9 + 24), "1.2.12", 112);
      v20 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          *(_DWORD *)buf = 134217984;
          v51 = v9;
          _os_log_impl(&dword_1A077D000, v20, OS_LOG_TYPE_DEFAULT, "%p inflateInit failed", buf, 0xCu);
        }

        free(*(void **)(v9 + 24));
        LOBYTE(v22) = 0;
        *(_QWORD *)(v9 + 24) = 0;
        goto LABEL_40;
      }
      if (v21)
      {
        *(_DWORD *)buf = 134217984;
        v51 = v9;
        _os_log_impl(&dword_1A077D000, v20, OS_LOG_TYPE_DEFAULT, "%p Created _zstreamp", buf, 0xCu);
      }

    }
    goto LABEL_14;
  }
  if (v17)
  {
LABEL_14:
    v23 = objc_retainAutorelease(v11);
    **(_QWORD **)(v9 + 24) = objc_msgSend(v23, "bytes");
    v24 = objc_msgSend(v23, "length");
    v25 = *(_QWORD *)(v9 + 24);
    *(_DWORD *)(v25 + 8) = v24;
    while (1)
    {
      *(_QWORD *)(v25 + 24) = buf;
      v26 = *(z_stream **)(v9 + 24);
      v26->avail_out = 35840;
      v27 = inflate(v26, v13);
      if ((v27 & 0x80000000) != 0)
        break;
      objc_msgSend(v12, "appendBytes:length:", buf, 35840 - *(unsigned int *)(*(_QWORD *)(v9 + 24) + 32));
      v25 = *(_QWORD *)(v9 + 24);
      if (*(_DWORD *)(v25 + 32))
        goto LABEL_26;
    }
    objc_msgSend(v12, "setLength:", 0);
    if ((_DWORD)v27 != -5 && *(_BYTE *)(v9 + 16) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = objc_claimAutoreleasedReturnValue();
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v29, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("MSVStreamWriter.m"), 339, CFSTR("zlib inflate failed. ret=%d. in_len = %lu, _zstreamp->avail_out=%lu"), v27, objc_msgSend(v23, "length"), *(unsigned int *)(*(_QWORD *)(v9 + 24) + 32));
    }
    else
    {
      v29 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *(_QWORD *)(v9 + 24);
        v31 = *(unsigned int *)(v30 + 8);
        v32 = *(unsigned int *)(v30 + 32);
        *(_DWORD *)v40 = 134219008;
        v41 = v9;
        v42 = 1024;
        v43 = v27;
        v44 = 2048;
        v45 = v31;
        v46 = 2048;
        v47 = v32;
        v48 = 2048;
        v49 = objc_msgSend(v23, "length");
        _os_log_impl(&dword_1A077D000, v29, OS_LOG_TYPE_DEFAULT, "%p - Inflate failed (ignoring inflate failure). ret=%d, _zstreamp->avail_in=%lu, _zstreamp->avail_out=%lu, in_len=%lu", v40, 0x30u);
      }
    }

    v25 = *(_QWORD *)(v9 + 24);
LABEL_26:
    v33 = *(_DWORD *)(v25 + 8);
    if (v33)
    {
      if ((_DWORD)v27 != -5 && *(_BYTE *)(v9 + 16) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = objc_claimAutoreleasedReturnValue();
        -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v35, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("MSVStreamWriter.m"), 354, CFSTR("_zstreamp->avail_in = %d"), *(unsigned int *)(*(_QWORD *)(v9 + 24) + 8));
      }
      else
      {
        v35 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v40 = 134218240;
          v41 = v9;
          v42 = 1024;
          v43 = v33;
          _os_log_impl(&dword_1A077D000, v35, OS_LOG_TYPE_DEFAULT, "%p Ignoring inflate failure, availableInLength=%u", v40, 0x12u);
        }
      }

    }
    v22 = (int)v27 >= 0;
    if (v6)
      *v6 = objc_retainAutorelease(v12);
    goto LABEL_37;
  }
  v22 = 1;
LABEL_37:
  v36 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = objc_msgSend(v11, "length");
    v38 = objc_msgSend(v12, "length");
    *(_DWORD *)buf = 134218752;
    v51 = v9;
    v52 = 1024;
    *(_DWORD *)v53 = v22;
    *(_WORD *)&v53[4] = 1024;
    *(_DWORD *)&v53[6] = v37;
    *(_WORD *)v54 = 1024;
    *(_DWORD *)&v54[2] = v38;
    _os_log_impl(&dword_1A077D000, v36, OS_LOG_TYPE_DEFAULT, "%p finished _decompressData with status=%{BOOL}u, input data length=%d, decompressed data length=%d", buf, 0x1Eu);
  }

LABEL_40:
  return v22;
}

- (void)_writeAvailablePendingData
{
  __int128 v3;
  void *v4;
  void *v5;
  unint64_t v6;
  NSOutputStream *outputStream;
  id v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  uint8_t buf[4];
  MSVStreamWriter *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_pendingWriteDataList, "count"))
  {
    *(_QWORD *)&v3 = 134218754;
    v21 = v3;
    do
    {
      if (!-[NSOutputStream hasSpaceAvailable](self->_outputStream, "hasSpaceAvailable", v21))
        break;
      -[NSMutableArray firstObject](self->_pendingWriteDataList, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "bytesWritten");
      do
      {
        if (v6 >= objc_msgSend(v5, "length")
          || !-[NSOutputStream hasSpaceAvailable](self->_outputStream, "hasSpaceAvailable"))
        {
          break;
        }
        outputStream = self->_outputStream;
        v8 = objc_retainAutorelease(v5);
        v9 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", objc_msgSend(v8, "bytes") + v6, objc_msgSend(v8, "length") - v6);
        v10 = v9;
        if (v9 < 0)
        {
          v13 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            -[NSOutputStream streamError](self->_outputStream, "streamError");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[NSOutputStream streamStatus](self->_outputStream, "streamStatus");
            *(_DWORD *)buf = v21;
            v23 = self;
            v24 = 2114;
            v25 = v14;
            v26 = 2048;
            v27 = v15;
            v28 = 1024;
            v29 = v10;
            _os_log_impl(&dword_1A077D000, v13, OS_LOG_TYPE_DEFAULT, "%p - error while writing to data stream: err=%{public}@, status=%lu, bytesWritten:%d", buf, 0x26u);

          }
          -[NSOutputStream streamError](self->_outputStream, "streamError");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = v16;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MSVStreamWriter"), -1, 0);
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          v11 = v18;

          objc_msgSend(v8, "length");
          v12 = 0;
          goto LABEL_18;
        }
        v6 += v9;
      }
      while (v9);
      if (v6 != objc_msgSend(v5, "length"))
      {
        objc_msgSend(v4, "setBytesWritten:", v6);
        goto LABEL_21;
      }
      v11 = 0;
      v12 = 1;
LABEL_18:
      -[NSMutableArray removeObject:](self->_pendingWriteDataList, "removeObject:", v4);
      objc_msgSend(v4, "completionHandler");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        (*(void (**)(uint64_t, uint64_t, void *))(v19 + 16))(v19, v12, v11);

LABEL_21:
    }
    while (-[NSMutableArray count](self->_pendingWriteDataList, "count"));
  }
}

- (void)_onQueue_stop
{
  _BOOL4 stopped;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  _BOOL4 compressed;
  NSObject *v10;
  NSObject *v11;
  z_stream *zstreamp;
  int v13;
  int v14;
  MSVStreamWriter *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  stopped = self->_stopped;
  v4 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (stopped)
  {
    if (v5)
    {
      v14 = 134217984;
      v15 = self;
      v6 = "%p - stream writer is already stopped";
      v7 = v4;
      v8 = 12;
LABEL_18:
      _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, v8);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (v5)
  {
    compressed = self->_compressed;
    v14 = 134218240;
    v15 = self;
    v16 = 1024;
    v17 = compressed;
    _os_log_impl(&dword_1A077D000, v4, OS_LOG_TYPE_DEFAULT, "%p - stopping stream writer, isCompressed=%d", (uint8_t *)&v14, 0x12u);
  }

  self->_stopped = 1;
  MEMORY[0x1A1AFB050](self->_outputStream, 0);
  -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", 0);
  if (-[MSVStreamWriter isCompressed](self, "isCompressed") && self->_zstreamp)
  {
    v10 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = self;
      _os_log_impl(&dword_1A077D000, v10, OS_LOG_TYPE_DEFAULT, "%p - Finishing pending data in _zstreamp", (uint8_t *)&v14, 0xCu);
    }

    -[MSVStreamWriter writeAllData:error:](self, "writeAllData:error:", 0, 0);
  }
  if (self->_closeOnStop)
  {
    self->_closeOnStop = 0;
    -[NSOutputStream close](self->_outputStream, "close");
    v11 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = self;
      _os_log_impl(&dword_1A077D000, v11, OS_LOG_TYPE_DEFAULT, "%p - Closing _outputStream", (uint8_t *)&v14, 0xCu);
    }

  }
  zstreamp = self->_zstreamp;
  if (zstreamp)
  {
    v13 = inflateEnd(zstreamp);
    free(self->_zstreamp);
    self->_zstreamp = 0;
    v4 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218240;
      v15 = self;
      v16 = 1024;
      v17 = v13;
      v6 = "%p - Releasing _zstreamp finished with code=%d";
      v7 = v4;
      v8 = 18;
      goto LABEL_18;
    }
LABEL_19:

  }
}

- (unint64_t)maximumBufferSize
{
  return self->_maximumBufferSize;
}

- (void)setMaximumBufferSize:(unint64_t)a3
{
  self->_maximumBufferSize = a3;
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritten = a3;
}

- (id)canWriteDataBlock
{
  return self->_canWriteDataBlock;
}

- (void)setCanWriteDataBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)didFinishWritingBlock
{
  return self->_didFinishWritingBlock;
}

- (void)setDidFinishWritingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)didEncounterErrorBlock
{
  return self->_didEncounterErrorBlock;
}

- (void)setDidEncounterErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setOutputStream:(id)a3
{
  objc_storeStrong((id *)&self->_outputStream, a3);
}

- (void)setInputStream:(id)a3
{
  objc_storeStrong((id *)&self->_inputStream, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong(&self->_didEncounterErrorBlock, 0);
  objc_storeStrong(&self->_didFinishWritingBlock, 0);
  objc_storeStrong(&self->_canWriteDataBlock, 0);
  objc_storeStrong((id *)&self->_pendingWriteDataList, 0);
}

void __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = WeakRetained;
    _os_log_impl(&dword_1A077D000, v3, OS_LOG_TYPE_DEFAULT, "%p didFinishWritingBlock, enqueuing stop", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(WeakRetained, "_onQueue_stop");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

}

void __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = WeakRetained;
    _os_log_impl(&dword_1A077D000, v5, OS_LOG_TYPE_DEFAULT, "%p didEncounterErrorBlock, enqueuing stop", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(WeakRetained, "_onQueue_stop");
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

void __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(WeakRetained, "outputStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v7 = objc_msgSend(v4, "write:maxLength:", v5 + v6, *(_QWORD *)(a1 + 64) - v6);

      if (v7 < 1)
      {
        v8 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          *(_DWORD *)buf = 134218752;
          v17 = v3;
          v18 = 1024;
          v19 = v7;
          v20 = 1024;
          v21 = v9;
          v22 = 1024;
          v23 = objc_msgSend(v3, "bytesWritten");
          _os_log_impl(&dword_1A077D000, v8, OS_LOG_TYPE_DEFAULT, "%p write error,  bytesWritten=%d, totalBytesWritten=%d, strongSelf.bytesWritten=%d", buf, 0x1Eu);
        }

      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v7;
        objc_msgSend(v3, "setBytesWritten:", objc_msgSend(v3, "bytesWritten") + v7);
      }
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 64))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      v10 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v12 = objc_msgSend(*(id *)(a1 + 32), "length");
        *(_DWORD *)buf = 134218496;
        v17 = v3;
        v18 = 1024;
        v19 = v11;
        v20 = 1024;
        v21 = v12;
        _os_log_impl(&dword_1A077D000, v10, OS_LOG_TYPE_DEFAULT, "%p finished writing, totalBytesWritten=%d, dataLen=%d", buf, 0x18u);
      }

      objc_msgSend(v3, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_5;
      block[3] = &unk_1E43E9C88;
      v15 = v3;
      dispatch_async(v13, block);

    }
  }

}

void __47__MSVStreamWriter_writeAllData_withCompletion___block_invoke_5(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "didFinishWritingBlock");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

void __38__MSVStreamWriter_stopWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_stop");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__MSVStreamWriter_stopWithCompletion___block_invoke_2;
    block[3] = &unk_1E43E9ED0;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __38__MSVStreamWriter_stopWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __24__MSVStreamWriter_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stream:handleEvent:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), 4);
}

@end
