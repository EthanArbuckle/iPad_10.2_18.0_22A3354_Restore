@implementation MSVStreamReader

- (MSVStreamReader)initWithInputStream:(id)a3 queue:(id)a4
{
  id v8;
  id v9;
  MSVStreamReader *v10;
  MSVStreamReader *v11;
  dispatch_queue_t v12;
  objc_class *v13;
  const char *Name;
  OS_dispatch_queue *queue;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVStreamReader.m"), 31, CFSTR("inputStream cannot be nil"));

  }
  v18.receiver = self;
  v18.super_class = (Class)MSVStreamReader;
  v10 = -[MSVStreamReader init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_stream, a3);
    if (v9)
    {
      v12 = (dispatch_queue_t)v9;
    }
    else
    {
      v13 = (objc_class *)objc_opt_class();
      Name = class_getName(v13);
      v12 = dispatch_queue_create(Name, 0);
    }
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v11->_maximumBufferSize = 10240;
    *(_WORD *)&v11->_closeOnStop = 0;
  }

  return v11;
}

- (void)start
{
  NSObject *v3;
  double Current;
  NSInputStream *stream;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *queue;
  id *v11;
  _QWORD *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[5];
  uint8_t buf[4];
  MSVStreamReader *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = self;
    _os_log_impl(&dword_1A077D000, v3, OS_LOG_TYPE_DEFAULT, "Reader=%p starting stream reader", buf, 0xCu);
  }

  Current = CFAbsoluteTimeGetCurrent();
  stream = self->_stream;
  self->_timestamp = Current;
  MEMORY[0x1A1AFAEF4](stream, self->_queue);
  -[NSInputStream setDelegate:](self->_stream, "setDelegate:", self);
  v6 = -[NSInputStream streamStatus](self->_stream, "streamStatus");
  v7 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = -[NSInputStream streamStatus](self->_stream, "streamStatus");
      *(_DWORD *)buf = 134218240;
      v22 = self;
      v23 = 2048;
      v24 = v9;
      _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_DEFAULT, "Reader=%p InputStream status %lu - streamreader will not open stream", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    if (-[NSInputStream hasBytesAvailable](self->_stream, "hasBytesAvailable"))
    {
      queue = self->_queue;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __24__MSVStreamReader_start__block_invoke_6;
      v18[3] = &unk_1E43E9150;
      v11 = &v19;
      objc_copyWeak(&v19, (id *)buf);
      v18[4] = self;
      v12 = v18;
    }
    else if (-[NSInputStream streamStatus](self->_stream, "streamStatus") == 5
           || -[NSInputStream streamStatus](self->_stream, "streamStatus") == 6)
    {
      queue = self->_queue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __24__MSVStreamReader_start__block_invoke_2;
      v16[3] = &unk_1E43E9150;
      v11 = &v17;
      objc_copyWeak(&v17, (id *)buf);
      v16[4] = self;
      v12 = v16;
    }
    else
    {
      if (-[NSInputStream streamStatus](self->_stream, "streamStatus") != 7)
        goto LABEL_15;
      queue = self->_queue;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __24__MSVStreamReader_start__block_invoke_3;
      v14[3] = &unk_1E43E9150;
      v11 = &v15;
      objc_copyWeak(&v15, (id *)buf);
      v14[4] = self;
      v12 = v14;
    }
    dispatch_async(queue, v12);
    objc_destroyWeak(v11);
LABEL_15:
    objc_destroyWeak((id *)buf);
    return;
  }
  if (v8)
  {
    *(_DWORD *)buf = 134217984;
    v22 = self;
    _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_DEFAULT, "Reader=%p InputStream status is NSStreamStatusNotOpen - streamreader will open stream", buf, 0xCu);
  }

  v13 = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__MSVStreamReader_start__block_invoke;
  block[3] = &unk_1E43E9C88;
  block[4] = self;
  dispatch_async(v13, block);
}

- (void)dealloc
{
  NSObject *v3;
  z_stream *zstreamp;
  objc_super v5;
  uint8_t buf[4];
  MSVStreamReader *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1A077D000, v3, OS_LOG_TYPE_DEFAULT, "Reader=%p stream reader dealloced", buf, 0xCu);
  }

  zstreamp = self->_zstreamp;
  if (zstreamp)
  {
    deflateEnd(zstreamp);
    free(self->_zstreamp);
    self->_zstreamp = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MSVStreamReader;
  -[MSVStreamReader dealloc](&v5, sel_dealloc);
}

- (void)stop
{
  -[MSVStreamReader stopWithCompletion:](self, "stopWithCompletion:", 0);
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
  v7[2] = __38__MSVStreamReader_stopWithCompletion___block_invoke;
  v7[3] = &unk_1E43E9EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)readAllDataWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2578;
  v23 = __Block_byref_object_dispose__2579;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2578;
  v17 = __Block_byref_object_dispose__2579;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__MSVStreamReader_readAllDataWithError___block_invoke;
  v9[3] = &unk_1E43E9178;
  v11 = &v19;
  v12 = &v13;
  v6 = v5;
  v10 = v6;
  -[MSVStreamReader readAllDataWithCompletion:](self, "readAllDataWithCompletion:", v9);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v7 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

- (void)readAllDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id location[2];

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[MSVStreamReader didFinishReadingBlock](self, "didFinishReadingBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __45__MSVStreamReader_readAllDataWithCompletion___block_invoke;
  v29[3] = &unk_1E43E91A0;
  objc_copyWeak(&v33, location);
  v8 = v4;
  v31 = v8;
  v9 = v5;
  v30 = v9;
  v10 = v6;
  v32 = v10;
  -[MSVStreamReader setDidFinishReadingBlock:](self, "setDidFinishReadingBlock:", v29);
  -[MSVStreamReader didEncounterErrorBlock](self, "didEncounterErrorBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __45__MSVStreamReader_readAllDataWithCompletion___block_invoke_2;
  v24[3] = &unk_1E43E91C8;
  objc_copyWeak(&v28, location);
  v12 = v8;
  v26 = v12;
  v13 = v9;
  v25 = v13;
  v14 = v11;
  v27 = v14;
  -[MSVStreamReader setDidEncounterErrorBlock:](self, "setDidEncounterErrorBlock:", v24);
  -[MSVStreamReader didReadDataBlock](self, "didReadDataBlock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v7;
  v19 = 3221225472;
  v20 = __45__MSVStreamReader_readAllDataWithCompletion___block_invoke_3;
  v21 = &unk_1E43E9390;
  v16 = v13;
  v22 = v16;
  v17 = v15;
  v23 = v17;
  -[MSVStreamReader setDidReadDataBlock:](self, "setDidReadDataBlock:", &v18);
  -[MSVStreamReader start](self, "start", v18, v19, v20, v21);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v33);
  objc_destroyWeak(location);

}

- (void)readAllDataIntoFileHandle:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id location;

  v6 = a3;
  v7 = a4;
  -[MSVStreamReader didFinishReadingBlock](self, "didFinishReadingBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke;
  v29[3] = &unk_1E43E91F0;
  objc_copyWeak(&v32, &location);
  v10 = v7;
  v30 = v10;
  v11 = v8;
  v31 = v11;
  -[MSVStreamReader setDidFinishReadingBlock:](self, "setDidFinishReadingBlock:", v29);
  -[MSVStreamReader didEncounterErrorBlock](self, "didEncounterErrorBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke_2;
  v25[3] = &unk_1E43E9218;
  objc_copyWeak(&v28, &location);
  v13 = v10;
  v26 = v13;
  v14 = v12;
  v27 = v14;
  -[MSVStreamReader setDidEncounterErrorBlock:](self, "setDidEncounterErrorBlock:", v25);
  -[MSVStreamReader didReadDataBlock](self, "didReadDataBlock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  v19 = 3221225472;
  v20 = __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke_3;
  v21 = &unk_1E43E9240;
  objc_copyWeak(&v24, &location);
  v16 = v6;
  v22 = v16;
  v17 = v15;
  v23 = v17;
  -[MSVStreamReader setDidReadDataBlock:](self, "setDidReadDataBlock:", &v18);
  -[MSVStreamReader start](self, "start", v18, v19, v20, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  NSInputStream *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void (**v14)(id, void *);
  void (**didFinishReadingBlock)(void);
  NSObject *v16;
  void (**didEncounterErrorBlock)(id, void *);
  void *v18;
  void (**didReadDataBlock)(id, void *);
  void *v20;
  int v21;
  MSVStreamReader *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = (NSInputStream *)a3;
  if (self->_stream != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVStreamReader.m"), 215, CFSTR("unexpected stream"));

  }
  self->_timestamp = CFAbsoluteTimeGetCurrent();
  if (a4 - 1 <= 1 && -[NSInputStream hasBytesAvailable](self->_stream, "hasBytesAvailable"))
  {
    v8 = malloc_type_malloc(self->_maximumBufferSize, 0xAF374A77uLL);
    v9 = -[NSInputStream read:maxLength:](self->_stream, "read:maxLength:", v8, self->_maximumBufferSize);
    if (v9 < 1)
    {
      free(v8);
      goto LABEL_33;
    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v8, v9, 1);
    if (!-[MSVStreamReader shouldCompress](self, "shouldCompress"))
      goto LABEL_30;
    -[MSVStreamReader _compressedDataForData:](self, "_compressedDataForData:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v10 = 0;
      goto LABEL_30;
    }
    if (-[NSObject length](v11, "length"))
    {
      v10 = v11;
LABEL_30:
      didReadDataBlock = (void (**)(id, void *))self->_didReadDataBlock;
      if (didReadDataBlock)
        didReadDataBlock[2](didReadDataBlock, v10);

      goto LABEL_33;
    }
LABEL_27:

    goto LABEL_33;
  }
  if (a4 == 8)
  {
    v16 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 134217984;
      v22 = self;
      _os_log_impl(&dword_1A077D000, v16, OS_LOG_TYPE_DEFAULT, "Reader=%p Encountered error event", (uint8_t *)&v21, 0xCu);
    }

    -[MSVStreamReader _stop](self, "_stop");
    didEncounterErrorBlock = (void (**)(id, void *))self->_didEncounterErrorBlock;
    if (didEncounterErrorBlock)
    {
      -[NSInputStream streamError](self->_stream, "streamError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      didEncounterErrorBlock[2](didEncounterErrorBlock, v18);

    }
  }
  else
  {
    if (a4 != 16)
    {
      v11 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v21 = 134218240;
        v22 = self;
        v23 = 2048;
        v24 = a4;
        _os_log_impl(&dword_1A077D000, v11, OS_LOG_TYPE_ERROR, "Reader=%p unexpected stream event %lu", (uint8_t *)&v21, 0x16u);
      }
      goto LABEL_27;
    }
    v12 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 134217984;
      v22 = self;
      _os_log_impl(&dword_1A077D000, v12, OS_LOG_TYPE_DEFAULT, "Reader=%p Encountered end event", (uint8_t *)&v21, 0xCu);
    }

    -[MSVStreamReader _stop](self, "_stop");
    if (-[MSVStreamReader shouldCompress](self, "shouldCompress"))
    {
      -[MSVStreamReader _compressedDataForData:](self, "_compressedDataForData:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        v14 = (void (**)(id, void *))self->_didReadDataBlock;
        if (v14)
          v14[2](v14, v13);
      }

    }
    didFinishReadingBlock = (void (**)(void))self->_didFinishReadingBlock;
    if (didFinishReadingBlock)
      didFinishReadingBlock[2]();
  }
LABEL_33:

}

- (id)_compressedDataForData:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  NSObject *v12;
  uint8_t v14[20488];
  uint64_t v15;

  v3 = MEMORY[0x1E0C80A78](self, a2, a3);
  v15 = *MEMORY[0x1E0C80C00];
  v5 = v4;
  if (*(_QWORD *)(v3 + 16)
    || (v11 = malloc_type_malloc(0x70uLL, 0x10B0040E8CA615DuLL),
        *(_QWORD *)(v3 + 16) = v11,
        v11[8] = 0,
        *(_QWORD *)(*(_QWORD *)(v3 + 16) + 72) = 0,
        *(_QWORD *)(*(_QWORD *)(v3 + 16) + 80) = 0,
        !deflateInit_(*(z_streamp *)(v3 + 16), -1, "1.2.12", 112)))
  {
    v6 = (void *)objc_opt_new();
    v7 = objc_retainAutorelease(v5);
    **(_QWORD **)(v3 + 16) = objc_msgSend(v7, "bytes");
    v8 = objc_msgSend(v7, "length");
    v9 = *(_QWORD *)(v3 + 16);
    *(_DWORD *)(v9 + 8) = v8;
    v10 = 4 * (v7 == 0);
    do
    {
      *(_DWORD *)(v9 + 32) = 20480;
      *(_QWORD *)(v9 + 24) = v14;
      if (deflate(*(z_streamp *)(v3 + 16), v10) == -2)
        __assert_rtn("-[MSVStreamReader _compressedDataForData:]", "MSVStreamReader.m", 280, "ret != Z_STREAM_ERROR");
      objc_msgSend(v6, "appendBytes:length:", v14, 20480 - *(unsigned int *)(*(_QWORD *)(v3 + 16) + 32));
      v9 = *(_QWORD *)(v3 + 16);
    }
    while (!*(_DWORD *)(v9 + 32));
    if (*(_DWORD *)(v9 + 8))
      __assert_rtn("-[MSVStreamReader _compressedDataForData:]", "MSVStreamReader.m", 284, "_zstreamp->avail_in == 0");
  }
  else
  {
    v12 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A077D000, v12, OS_LOG_TYPE_ERROR, "deflateInit failed", v14, 2u);
    }

    free(*(void **)(v3 + 16));
    v6 = 0;
    *(_QWORD *)(v3 + 16) = 0;
  }

  return v6;
}

- (BOOL)_shouldHandleEvent
{
  return !self->_stopped;
}

- (void)_stop
{
  _BOOL4 stopped;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  MSVStreamReader *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  stopped = self->_stopped;
  v4 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (stopped)
  {
    if (v5)
    {
      v6 = 134217984;
      v7 = self;
      _os_log_impl(&dword_1A077D000, v4, OS_LOG_TYPE_DEFAULT, "Reader=%p stream reader already stopped", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      v6 = 134217984;
      v7 = self;
      _os_log_impl(&dword_1A077D000, v4, OS_LOG_TYPE_DEFAULT, "Reader=%p stopping stream reader", (uint8_t *)&v6, 0xCu);
    }

    self->_stopped = 1;
    MEMORY[0x1A1AFAEF4](self->_stream, 0);
    -[NSInputStream setDelegate:](self->_stream, "setDelegate:", 0);
    -[NSInputStream close](self->_stream, "close");
  }
}

- (id)didReadDataBlock
{
  return self->_didReadDataBlock;
}

- (void)setDidReadDataBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)didFinishReadingBlock
{
  return self->_didFinishReadingBlock;
}

- (void)setDidFinishReadingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)didEncounterErrorBlock
{
  return self->_didEncounterErrorBlock;
}

- (void)setDidEncounterErrorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)maximumBufferSize
{
  return self->_maximumBufferSize;
}

- (void)setMaximumBufferSize:(unint64_t)a3
{
  self->_maximumBufferSize = a3;
}

- (BOOL)shouldCompress
{
  return self->_compress;
}

- (void)setCompress:(BOOL)a3
{
  self->_compress = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSInputStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
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
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong(&self->_didEncounterErrorBlock, 0);
  objc_storeStrong(&self->_didFinishReadingBlock, 0);
  objc_storeStrong(&self->_didReadDataBlock, 0);
}

void __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_stop");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

void __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_stop");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  int v5;
  void *v6;
  char *v7;
  int v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  void (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_msgSend(*(id *)(a1 + 32), "fileDescriptor");
  if (fcntl(v5, 3) == -1)
  {
    v8 = *__error();
    v9 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v16 = WeakRetained;
      v17 = 2082;
      v18 = strerror(v8);
      _os_log_impl(&dword_1A077D000, v9, OS_LOG_TYPE_ERROR, "Reader=%p readAllDataIntoFileHandle bad fileHandle err=%{public}s", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MSVStreamReader"), -1, 0);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    fcntl(v5, 73, 1);
    v6 = *(void **)(a1 + 32);
    v14 = 0;
    objc_msgSend(v6, "writeData:error:", v3, &v14);
    v7 = (char *)v14;
  }
  v10 = v7;
  if (v7)
  {
    v11 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v16 = WeakRetained;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1A077D000, v11, OS_LOG_TYPE_ERROR, "Reader=%p readAllDataIntoFileHandle encountered error. error=%{public}@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "didEncounterErrorBlock");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, char *))v12)[2](v12, v10);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }

}

void __45__MSVStreamReader_readAllDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_stop");
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), 0);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

void __45__MSVStreamReader_readAllDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_stop");
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, *(_QWORD *)(a1 + 32), v6);
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __45__MSVStreamReader_readAllDataWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendData:");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __40__MSVStreamReader_readAllDataWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __38__MSVStreamReader_stopWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_stop");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__MSVStreamReader_stopWithCompletion___block_invoke_2;
    block[3] = &unk_1E43E9ED0;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __38__MSVStreamReader_stopWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __24__MSVStreamReader_start__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "open");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return result;
}

void __24__MSVStreamReader_start__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_shouldHandleEvent");
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "stream:handleEvent:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), 2);
      v3 = v5;
    }
  }

}

void __24__MSVStreamReader_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_shouldHandleEvent");
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "stream:handleEvent:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), 16);
      v3 = v5;
    }
  }

}

void __24__MSVStreamReader_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_shouldHandleEvent");
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "stream:handleEvent:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), 8);
      v3 = v5;
    }
  }

}

@end
