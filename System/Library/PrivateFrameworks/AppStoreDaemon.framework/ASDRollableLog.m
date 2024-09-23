@implementation ASDRollableLog

- (ASDRollableLog)initWithLogOptions:(id)a3
{
  id v4;
  ASDRollableLog *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v9;
  ASDLogFileOptions *options;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDRollableLog;
  v5 = -[ASDRollableLog init](&v12, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.appstoredaemon.ASFRollableLog", v6);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v7;

    v5->_lastFileStatTime = -1.79769313e308;
    v9 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (ASDLogFileOptions *)v9;

    -[ASDRollableLog _openLogFile]((uint64_t)v5);
  }

  return v5;
}

- (void)_openLogFile
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  dispatch_source_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  int v15;
  _QWORD handler[5];

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(*(id *)(a1 + 40), "logDirectoryPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

    -[ASDRollableLog _activeLogFilePath](a1);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = open((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 522, 384);

    if ((v5 & 0x80000000) == 0)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v5, 1);
      v7 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v6;

      objc_msgSend(*(id *)(a1 + 24), "seekToEndOfFile");
      v8 = dup(v5);
      v9 = dispatch_source_create(MEMORY[0x1E0C80DE8], v8, 0x61uLL, *(dispatch_queue_t *)(a1 + 8));
      v10 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v9;

      v11 = MEMORY[0x1E0C809B0];
      v12 = *(NSObject **)(a1 + 32);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __30__ASDRollableLog__openLogFile__block_invoke;
      handler[3] = &unk_1E37BDD60;
      handler[4] = a1;
      dispatch_source_set_event_handler(v12, handler);
      v13 = *(NSObject **)(a1 + 32);
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __30__ASDRollableLog__openLogFile__block_invoke_2;
      v14[3] = &__block_descriptor_36_e5_v8__0l;
      v15 = v8;
      dispatch_source_set_cancel_handler(v13, v14);
      dispatch_resume(*(dispatch_object_t *)(a1 + 32));
    }

  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ASDRollableLog;
  -[ASDRollableLog dealloc](&v2, sel_dealloc);
}

- (ASDLogFileOptions)logOptions
{
  return (ASDLogFileOptions *)(id)-[ASDLogFileOptions copy](self->_options, "copy");
}

- (void)writeString:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__ASDRollableLog_writeString___block_invoke;
  v7[3] = &unk_1E37BDC98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __30__ASDRollableLog_writeString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  stat v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24) || (-[ASDRollableLog _openLogFile](*(_QWORD *)(a1 + 32)), (v2 = *(_QWORD *)(a1 + 32)) != 0))
  {
    v3 = objc_msgSend(*(id *)(v2 + 40), "maxLogFileSize");
    if (v3)
    {
      v4 = v3;
      if (objc_msgSend(*(id *)(v2 + 40), "maxNumberOfLogFiles") >= 2
        && CFAbsoluteTimeGetCurrent() - *(double *)(v2 + 16) >= 60.0)
      {
        memset(&v15, 0, sizeof(v15));
        -[ASDRollableLog _activeLogFilePath](v2);
        v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v6 = stat((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &v15);

        if (!v6 && v15.st_size >= v4)
        {
          v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
          -[ASDRollableLog _closeLogFile](v2);
          v8 = objc_msgSend(*(id *)(v2 + 40), "maxNumberOfLogFiles");
          -[ASDRollableLog _logFilePathWithIndex:](v2, v8 - 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeItemAtPath:error:", v9, 0);

          v10 = v8 - 2;
          if (v8 >= 2)
          {
            do
            {
              v11 = v10;
              -[ASDRollableLog _logFilePathWithIndex:](v2, v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[ASDRollableLog _logFilePathWithIndex:](v2, v11 + 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "moveItemAtPath:toPath:error:", v12, v13, 0);

              v10 = v11 - 1;
            }
            while (v11);
          }
          -[ASDRollableLog _openLogFile](v2);

        }
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "dataUsingEncoding:", 4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "writeData:", v14);

}

- (void)_closeLogFile
{
  NSObject *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 32);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

    }
    v4 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

- (id)_activeLogFilePath
{
  -[ASDRollableLog _logFilePathWithIndex:](a1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_logFilePathWithIndex:(uint64_t)a1
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(*(id *)(a1 + 40), "logFileBaseName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v5, "length"))
  {
    if (a2 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingPathExtension:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }
    v9 = CFSTR("log");
    v8 = v4;
    goto LABEL_7;
  }
  if (a2 >= 1)
  {
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathExtension:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v4;
    v9 = v5;
LABEL_7:
    objc_msgSend(v8, "stringByAppendingPathExtension:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v12;
  }
  objc_msgSend(*(id *)(a1 + 40), "logDirectoryPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __30__ASDRollableLog__openLogFile__block_invoke(uint64_t a1)
{
  -[ASDRollableLog _closeLogFile](*(_QWORD *)(a1 + 32));
  return -[ASDRollableLog _openLogFile](*(_QWORD *)(a1 + 32));
}

uint64_t __30__ASDRollableLog__openLogFile__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_fileObserverSource, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
