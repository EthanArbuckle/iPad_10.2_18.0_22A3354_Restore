@implementation MSVFileBufferedPipe

- (MSVFileBufferedPipe)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  dispatch_source_t v20;
  uint64_t v21;
  NSObject *v22;
  id *v23;
  void *v24;
  int v25;
  dispatch_source_t v26;
  NSObject *v27;
  dispatch_object_t *v28;
  dispatch_object_t v29;
  NSObject *v30;
  _QWORD v32[4];
  dispatch_object_t *v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  _QWORD v37[4];
  id *v38;
  _QWORD handler[4];
  NSObject *v40;
  id v41;
  id location;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)MSVFileBufferedPipe;
  v2 = -[MSVFileBufferedPipe init](&v43, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.MediaServices.MSVFileBufferedPipe.queue", 0);
    v4 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v3;

    objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v7;

    objc_msgSend(*((id *)v2 + 4), "fileHandleForReading");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v9;

    objc_msgSend(*((id *)v2 + 3), "fileHandleForWriting");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v11;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v13;

    objc_msgSend(*((id *)v2 + 4), "fileHandleForWriting");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "fileDescriptor");

    fcntl(v16, 73, 1);
    v17 = fcntl(v16, 3);
    fcntl(v16, 4, v17 | 4u);
    *((_BYTE *)v2 + 56) = 0;
    objc_initWeak(&location, v2);
    objc_msgSend(*((id *)v2 + 4), "fileHandleForWriting");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "fileDescriptor");
    v20 = dispatch_source_create(MEMORY[0x1E0C80DF0], v19, 0, *((dispatch_queue_t *)v2 + 10));

    v21 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __27__MSVFileBufferedPipe_init__block_invoke;
    handler[3] = &unk_1E43E9150;
    objc_copyWeak(&v41, &location);
    v22 = v20;
    v40 = v22;
    dispatch_source_set_event_handler(v22, handler);
    v37[0] = v21;
    v37[1] = 3221225472;
    v37[2] = __27__MSVFileBufferedPipe_init__block_invoke_2;
    v37[3] = &unk_1E43E9C88;
    v23 = (id *)v2;
    v38 = v23;
    dispatch_source_set_cancel_handler(v22, v37);
    objc_storeStrong(v23 + 5, v20);
    v23[12] = (id)1;
    dispatch_resume((dispatch_object_t)v23[5]);
    objc_msgSend(*((id *)v2 + 3), "fileHandleForReading");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "fileDescriptor");
    v26 = dispatch_source_create(MEMORY[0x1E0C80DB8], v25, 0, *((dispatch_queue_t *)v2 + 10));

    v34[0] = v21;
    v34[1] = 3221225472;
    v34[2] = __27__MSVFileBufferedPipe_init__block_invoke_3;
    v34[3] = &unk_1E43E9150;
    objc_copyWeak(&v36, &location);
    v27 = v26;
    v35 = v27;
    dispatch_source_set_event_handler(v27, v34);
    v32[0] = v21;
    v32[1] = 3221225472;
    v32[2] = __27__MSVFileBufferedPipe_init__block_invoke_2_4;
    v32[3] = &unk_1E43E9C88;
    v28 = v23;
    v33 = v28;
    dispatch_source_set_cancel_handler(v27, v32);
    v29 = v28[6];
    v28[6] = v27;
    v30 = v27;

    dispatch_resume(v28[6]);
    objc_destroyWeak(&v36);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  return (MSVFileBufferedPipe *)v2;
}

- (void)_createBufferFiles
{
  void *v3;
  void *v4;
  NSFileHandle *v5;
  id v6;
  NSFileHandle *writeBufferFileHandle;
  id v8;
  NSFileHandle *v9;
  NSFileHandle *readBufferFileHandle;
  int v11;
  NSObject *v12;
  char *v13;
  int v14;
  NSObject *v15;
  char *v16;
  NSFileHandle *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  MSVFileBufferedPipe *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("msv_tmp.XXXXXX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  MSVCreateTemporaryFileHandle(v4, &v19);
  v5 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  writeBufferFileHandle = self->_writeBufferFileHandle;
  self->_writeBufferFileHandle = v5;

  if (self->_writeBufferFileHandle)
  {
    v8 = objc_retainAutorelease(v6);
    unlink((const char *)objc_msgSend(v8, "fileSystemRepresentation"));
    v18 = v8;
    MSVCreateTemporaryFileHandle(v4, &v18);
    v9 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
    v6 = v18;

    readBufferFileHandle = self->_readBufferFileHandle;
    self->_readBufferFileHandle = v9;

    if (self->_readBufferFileHandle)
    {
      v6 = objc_retainAutorelease(v6);
      unlink((const char *)objc_msgSend(v6, "fileSystemRepresentation"));
    }
    else
    {
      v14 = *__error();
      v15 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = strerror(v14);
        *(_DWORD *)buf = 138543618;
        v21 = self;
        v22 = 2080;
        v23 = v16;
        _os_log_impl(&dword_1A077D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: failed to create tmp file for reading. err=%s", buf, 0x16u);
      }

      v17 = self->_writeBufferFileHandle;
      self->_writeBufferFileHandle = 0;

    }
  }
  else
  {
    v11 = *__error();
    v12 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = strerror(v11);
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2080;
      v23 = v13;
      _os_log_impl(&dword_1A077D000, v12, OS_LOG_TYPE_ERROR, "%{public}@: failed to create tmp file for writing. err=%s", buf, 0x16u);
    }

  }
}

- (void)_outputReadyForWriting:(unint64_t)a3
{
  if (a3)
  {
    self->_readyForData = 1;
    -[MSVFileBufferedPipe _writeBufferedData](self, "_writeBufferedData");
  }
  else
  {
    dispatch_source_cancel((dispatch_source_t)self->_writeSource);
  }
}

- (void)_inputReadyForReading:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSData *v7;
  NSData *dataPendingWrite;
  id v9;

  if (a3)
  {
    if (self->_dataPendingWrite)
    {
      if (self->_writeBufferFileHandle
        || (-[MSVFileBufferedPipe _createBufferFiles](self, "_createBufferFiles"), self->_writeBufferFileHandle))
      {
        -[NSPipe fileHandleForReading](self->_inputPipe, "fileHandleForReading");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "readDataOfLength:", a3);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        -[NSFileHandle writeData:](self->_writeBufferFileHandle, "writeData:", v9);
      }
    }
    else
    {
      -[NSPipe fileHandleForReading](self->_inputPipe, "fileHandleForReading");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "readDataOfLength:", a3);
      v7 = (NSData *)objc_claimAutoreleasedReturnValue();

      dataPendingWrite = self->_dataPendingWrite;
      self->_dataPendingWrite = v7;

      self->_dataPendingOffset = 0;
      -[MSVFileBufferedPipe _writeBufferedData](self, "_writeBufferedData");
    }
  }
  else
  {
    dispatch_source_cancel((dispatch_source_t)self->_readSource);
  }
}

- (void)_writeBufferedData
{
  __int128 v2;
  id *p_dataPendingWrite;
  NSFileHandle **p_readBufferFileHandle;
  NSFileHandle **p_writeBufferFileHandle;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  ssize_t v11;
  uint64_t v12;
  NSData *dataPendingWrite;
  uint64_t v14;
  NSMutableSet *uniqueWriteErrors;
  void *v16;
  NSMutableSet *v17;
  void *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  NSObject *v22;
  NSFileHandle *v23;
  NSFileHandle *v24;
  NSData *v25;
  NSData *v26;
  NSObject *v27;
  NSObject *v28;
  int64_t writeSourceState;
  __int128 v30;
  uint8_t buf[4];
  MSVFileBufferedPipe *v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!self->_readyForData)
    return;
  p_dataPendingWrite = (id *)&self->_dataPendingWrite;
  p_readBufferFileHandle = &self->_readBufferFileHandle;
  p_writeBufferFileHandle = &self->_writeBufferFileHandle;
  *(_QWORD *)&v2 = 138543618;
  v30 = v2;
  while (1)
  {
    v7 = (void *)MEMORY[0x1A1AFBB54]();
    if (*p_dataPendingWrite)
    {
      if (!self->_writeSourceState)
      {
        self->_writeSourceState = 1;
        dispatch_resume((dispatch_object_t)self->_writeSource);
        v8 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v32 = self;
          _os_log_impl(&dword_1A077D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Have valid _dataPendingWrite, resuming write source", buf, 0xCu);
        }

      }
      -[NSPipe fileHandleForWriting](self->_outputPipe, "fileHandleForWriting", v30);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "fileDescriptor");

      if (fcntl(v10, 3) == -1
        || (v11 = write(v10, -[NSData bytes](self->_dataPendingWrite, "bytes") + self->_dataPendingOffset, -[NSData length](self->_dataPendingWrite, "length") - self->_dataPendingOffset), v11 < 1))
      {
        v14 = *__error();
        uniqueWriteErrors = self->_uniqueWriteErrors;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(uniqueWriteErrors) = -[NSMutableSet containsObject:](uniqueWriteErrors, "containsObject:", v16);

        if ((uniqueWriteErrors & 1) == 0)
        {
          v17 = self->_uniqueWriteErrors;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet addObject:](v17, "addObject:", v18);

          v19 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = strerror(v14);
            *(_DWORD *)buf = v30;
            v32 = self;
            v33 = 2080;
            v34 = v20;
            _os_log_impl(&dword_1A077D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: write failed with err=%s, breaking out of _writeBufferedData", buf, 0x16u);
          }

        }
        self->_readyForData = 0;
      }
      else
      {
        v12 = (self->_dataPendingOffset + v11);
        self->_dataPendingOffset = v12;
        if (-[NSData length](self->_dataPendingWrite, "length") == v12)
        {
          dataPendingWrite = self->_dataPendingWrite;
          self->_dataPendingWrite = 0;

          self->_dataPendingOffset = 0;
        }
      }
      goto LABEL_24;
    }
    -[NSFileHandle readDataOfLength:](*p_readBufferFileHandle, "readDataOfLength:", 0x10000);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v21, "length"))
      break;
    objc_storeStrong(p_dataPendingWrite, v21);
    self->_dataPendingOffset = 0;
LABEL_23:

LABEL_24:
    objc_autoreleasePoolPop(v7);
    if (!self->_readyForData)
      return;
  }
  v22 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = self;
    _os_log_impl(&dword_1A077D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: No data left in the read file - swapping buffer file handles", buf, 0xCu);
  }

  v23 = *p_readBufferFileHandle;
  v24 = *p_readBufferFileHandle;
  objc_storeStrong((id *)p_readBufferFileHandle, *p_writeBufferFileHandle);
  objc_storeStrong((id *)p_writeBufferFileHandle, v23);
  -[NSFileHandle seekToFileOffset:](*p_readBufferFileHandle, "seekToFileOffset:", 0);
  -[NSFileHandle truncateFileAtOffset:](*p_writeBufferFileHandle, "truncateFileAtOffset:", 0);
  -[NSFileHandle readDataOfLength:](*p_readBufferFileHandle, "readDataOfLength:", 0x10000);
  v25 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (-[NSData length](v25, "length"))
  {
    v26 = self->_dataPendingWrite;
    self->_dataPendingWrite = v25;

    self->_dataPendingOffset = 0;
    goto LABEL_23;
  }
  if (self->_fileHandleForReading)
  {
    if (self->_writeSourceState)
    {
      self->_writeSourceState = 0;
      dispatch_suspend((dispatch_object_t)self->_writeSource);
      v27 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = self;
        _os_log_impl(&dword_1A077D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Suspending write source", buf, 0xCu);
      }

    }
  }
  else
  {
    v28 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      writeSourceState = self->_writeSourceState;
      *(_DWORD *)buf = v30;
      v32 = self;
      v33 = 1024;
      LODWORD(v34) = writeSourceState;
      _os_log_impl(&dword_1A077D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: No valid data to write, fileHandleForReading is invalid. writerSourceState=%d", buf, 0x12u);
    }

    if (!self->_writeSourceState)
    {
      self->_writeSourceState = 1;
      dispatch_resume((dispatch_object_t)self->_writeSource);
    }
    dispatch_source_cancel((dispatch_source_t)self->_writeSource);
  }

  objc_autoreleasePoolPop(v7);
}

- (NSFileHandle)fileHandleForReading
{
  return self->_fileHandleForReading;
}

- (NSFileHandle)fileHandleForWriting
{
  return self->_fileHandleForWriting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandleForWriting, 0);
  objc_storeStrong((id *)&self->_fileHandleForReading, 0);
  objc_storeStrong((id *)&self->_uniqueWriteErrors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataPendingWrite, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_outputPipe, 0);
  objc_storeStrong((id *)&self->_inputPipe, 0);
  objc_storeStrong((id *)&self->_readBufferFileHandle, 0);
  objc_storeStrong((id *)&self->_writeBufferFileHandle, 0);
}

void __27__MSVFileBufferedPipe_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_outputReadyForWriting:", dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32)));

}

void __27__MSVFileBufferedPipe_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 96);
    v10 = 138543618;
    v11 = v3;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1A077D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling write source handler, writerSourceState=%d", (uint8_t *)&v10, 0x12u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 104))
    dispatch_source_cancel(*(dispatch_source_t *)(v9 + 48));
}

void __27__MSVFileBufferedPipe_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_inputReadyForReading:", dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32)));

}

void __27__MSVFileBufferedPipe_init__block_invoke_2_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.MediaServices", "StreamBufferedPipe");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 96);
    v10 = 138543618;
    v11 = v3;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1A077D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling read source handler, writerSourceState=%d", (uint8_t *)&v10, 0x12u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v9 + 96))
  {
    *(_QWORD *)(v9 + 96) = 1;
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  }
}

+ (id)pipe
{
  return objc_alloc_init((Class)objc_opt_class());
}

@end
