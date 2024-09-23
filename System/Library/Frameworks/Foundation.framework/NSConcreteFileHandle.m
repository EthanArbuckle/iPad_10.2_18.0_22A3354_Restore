@implementation NSConcreteFileHandle

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  -[NSConcreteFileHandle writeData:](self, "writeData:", a3);
  return 1;
}

- (void)writeData:(id)a3
{
  char v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
  {
    v6 = atomic_load(&self->_flags);
    if ((v6 & 4) != 0)
      _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 1;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__NSConcreteFileHandle_writeData___block_invoke;
    v7[3] = &unk_1E0F4D150;
    v7[4] = self;
    v7[5] = &v8;
    objc_msgSend(a3, "enumerateByteRangesUsingBlock:", v7);
    if (!*((_BYTE *)v9 + 24))
      _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    _Block_object_dispose(&v8, 8);
  }
}

- (void)waitForDataInBackgroundAndNotify
{
  -[NSConcreteFileHandle waitForDataInBackgroundAndNotifyForModes:](self, "waitForDataInBackgroundAndNotifyForModes:", 0);
}

- (void)waitForDataInBackgroundAndNotifyForModes:(id)a3
{
  -[NSConcreteFileHandle performActivity:modes:](self, "performActivity:modes:", 20, a3);
}

- (NSConcreteFileHandle)initWithFileDescriptor:(int)a3 closeOnDealloc:(BOOL)a4
{
  unsigned __int16 *p_flags;
  unsigned __int16 v7;
  unsigned __int16 *v8;
  unsigned __int16 v9;

  self->_fd = a3;
  self->_fhQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSFileHandle.1", 0);
  if (!a4)
  {
    p_flags = &self->_flags;
    do
      v7 = __ldaxr(p_flags);
    while (__stlxr(v7 | 2, p_flags));
  }
  self->_lock._os_unfair_lock_opaque = 0;
  v8 = &self->_flags;
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 | 1, v8));
  return self;
}

- (NSConcreteFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
    return -[NSConcreteFileHandle initWithURL:flags:createMode:error:](self, "initWithURL:flags:createMode:error:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3), a4, a5, a6);
  v12.receiver = self;
  v12.super_class = (Class)NSConcreteFileHandle;
  -[NSConcreteFileHandle dealloc](&v12, sel_dealloc);
  return 0;
}

- (NSConcreteFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5
{
  return -[NSConcreteFileHandle initWithPath:flags:createMode:error:](self, "initWithPath:flags:createMode:error:", a3, a4, a5, 0);
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_4(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  close(*(_DWORD *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

uint64_t __34__NSConcreteFileHandle_writeData___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _BYTE *a5)
{
  uint64_t v8;
  unint64_t v9;

  if (a4)
  {
    v8 = result;
    v9 = 0;
    while (1)
    {
      result = _NSWriteToFileDescriptorWithProgress(*(_DWORD *)(*(_QWORD *)(v8 + 32) + 96), (char *)(a2 + v9), a4 - v9, 0);
      if (result < 0)
        break;
      v9 += result;
      if (v9 >= a4)
        return result;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v8 + 40) + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

- (NSConcreteFileHandle)initWithURL:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  int v8;
  NSConcreteFileHandle *v10;
  int v11;
  unsigned __int16 *p_flags;
  unsigned __int16 v13;
  uint64_t v14;
  objc_super v16;
  objc_super v17;
  char v18[1026];
  uint64_t v19;

  v8 = a4;
  v10 = self;
  v19 = *MEMORY[0x1E0C80C00];
  self->_fd = -1;
  if ((objc_msgSend(a3, "getFileSystemRepresentation:maxLength:", v18, 1026) & 1) == 0)
  {
    -[NSConcreteFileHandle dealloc](&v17, sel_dealloc, v16.receiver, v16.super_class, v10, NSConcreteFileHandle);
    return 0;
  }
  v11 = _NSOpenFileDescriptor(v18, v8, a5);
  v10->_fd = v11;
  if (v11 < 0)
  {
    if (a6)
    {
      v14 = *__error();
      *a6 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v14, objc_msgSend(a3, "path"), 0, 0, 0);
    }
    -[NSConcreteFileHandle dealloc](&v16, sel_dealloc, v10, NSConcreteFileHandle, v17.receiver, v17.super_class);
    return 0;
  }
  p_flags = &v10->_flags;
  do
    v13 = __ldaxr(p_flags);
  while (__stlxr(v13 | 1, p_flags));
  v10->_fhQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSFileHandle.2", 0);
  v10->_lock._os_unfair_lock_opaque = 0;
  return v10;
}

- (BOOL)closeAndReturnError:(id *)a3
{
  if (a3)
    *a3 = 0;
  -[NSConcreteFileHandle closeFile](self, "closeFile");
  return 1;
}

- (void)closeFile
{
  char v2;
  NSObject *monitoringQueue;
  unsigned __int16 *p_flags;
  unsigned __int16 v6;
  _QWORD v7[4];
  NSConcreteFileHandle *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = atomic_load(&self->_flags);
  if ((v2 & 4) == 0)
  {
    -[NSConcreteFileHandle _cancelDispatchSources](self, "_cancelDispatchSources");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__NSConcreteFileHandle_closeFile__block_invoke;
    v7[3] = &unk_1E0F4D2D8;
    v8 = self;
    monitoringQueue = self->_monitoringQueue;
    if (monitoringQueue)
    {
      dispatch_async(monitoringQueue, v7);
    }
    else
    {
      p_flags = &self->_flags;
      do
        v6 = __ldaxr(p_flags);
      while (__stlxr(v6 | 4, p_flags));
      close(v8->_fd);
    }
  }
}

- (void)dealloc
{
  char v3;
  char v4;
  char v5;
  NSObject *fhQueue;
  NSObject *monitoringQueue;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSConcreteFileHandle _cancelDispatchSources](self, "_cancelDispatchSources");
  if ((self->_fd & 0x80000000) == 0)
  {
    v3 = atomic_load(&self->_flags);
    if ((v3 & 4) == 0)
    {
      v4 = atomic_load(&self->_flags);
      if ((v4 & 2) == 0)
      {
        v5 = atomic_load(&self->_flags);
        if ((v5 & 1) != 0)
          close(self->_fd);
      }
    }
  }
  fhQueue = self->_fhQueue;
  if (fhQueue)
    dispatch_release(fhQueue);
  monitoringQueue = self->_monitoringQueue;
  if (monitoringQueue)
    dispatch_release(monitoringQueue);
  v8.receiver = self;
  v8.super_class = (Class)NSConcreteFileHandle;
  -[NSConcreteFileHandle dealloc](&v8, sel_dealloc);
}

- (void)_cancelDispatchSources
{
  os_unfair_lock_s *p_lock;
  NSObject *dsrc;
  NSObject *readChannel;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dsrc = self->_dsrc;
  self->_dsrc = 0;
  -[NSConcreteFileHandle _locked_clearHandler:forSource:](self, "_locked_clearHandler:forSource:", &self->_readabilityHandler, &self->_readMonitoringSource);
  -[NSConcreteFileHandle _locked_clearHandler:forSource:](self, "_locked_clearHandler:forSource:", &self->_writeabilityHandler, &self->_writeMonitoringSource);
  readChannel = self->_readChannel;
  if (readChannel)
    dispatch_io_close(readChannel, 1uLL);
  os_unfair_lock_unlock(p_lock);
  if (dsrc)
    dispatch_source_cancel(dsrc);
}

- (void)_locked_clearHandler:(id *)a3 forSource:(id *)a4
{
  NSObject *v5;

  v5 = *a4;
  *a4 = 0;
  if (v5)
    dispatch_source_cancel(v5);

  *a3 = 0;
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  unsigned int v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 8));
  v3 = *(NSObject **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  if (v3)
    dispatch_source_cancel(v3);
  if (*(_WORD *)(a1 + 60) == 12)
  {
    v4 = accept(*(_DWORD *)(a1 + 56), 0, 0);
    if ((v4 & 0x80000000) != 0)
      atomic_store(*__error(), (unsigned int *)(v2 + 12));
    atomic_store(v4, (unsigned int *)(v2 + 16));
  }
  CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 40));
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 48));
}

- (void)encodeWithCoder:(id)a3
{
  char v6;
  xpc_object_t v7;
  void *v8;

  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("This object may only be encoded by an NSXPCCoder."), 0));
  v6 = atomic_load(&self->_flags);
  if ((v6 & 4) != 0)
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
  v7 = xpc_fd_create(self->_fd);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(a3, "encodeXPCObject:forKey:", v7, CFSTR("NS.fd"));
    xpc_release(v8);
  }
}

- (id)availableData
{
  char v4;
  id result;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  stat v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(&v9, 0, sizeof(v9));
  v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || fstat(self->_fd, &v9) < 0)
    goto LABEL_11;
  if ((v9.st_mode & 0xF000) == 0x8000)
  {
    result = -[NSConcreteFileHandle readDataToEndOfFile](self, "readDataToEndOfFile", *(_OWORD *)&v9.st_dev, *(_OWORD *)&v9.st_uid, *(_OWORD *)&v9.st_atimespec, *(_OWORD *)&v9.st_mtimespec, *(_OWORD *)&v9.st_ctimespec, *(_OWORD *)&v9.st_birthtimespec, *(_OWORD *)&v9.st_size, *(_OWORD *)&v9.st_blksize, *(_OWORD *)v9.st_qspare);
    if (result)
      return result;
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", *(_QWORD *)&v9.st_dev);
  }
  v6 = *MEMORY[0x1E0C85AD8];
  v7 = (char *)malloc_type_malloc(*MEMORY[0x1E0C85AD8], 0x94C4F996uLL);
  v8 = _NSReadFromFileDescriptorWithProgress(self->_fd, v7, v6, 0, 0);
  if (v8 > 0)
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v7, v8, *(_OWORD *)&v9.st_dev, *(_OWORD *)&v9.st_uid, *(_OWORD *)&v9.st_atimespec, *(_OWORD *)&v9.st_mtimespec, *(_OWORD *)&v9.st_ctimespec, *(_OWORD *)&v9.st_birthtimespec, *(_OWORD *)&v9.st_size, *(_OWORD *)&v9.st_blksize, *(_OWORD *)v9.st_qspare);
  free(v7);
  if (v8 < 0)
LABEL_11:
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", *(_QWORD *)&v9.st_dev);
}

- (BOOL)truncateAtOffset:(unint64_t)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  -[NSConcreteFileHandle truncateFileAtOffset:](self, "truncateFileAtOffset:", a3);
  return 1;
}

- (void)truncateFileAtOffset:(unint64_t)a3
{
  char v5;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 4) != 0 || lseek(self->_fd, a3, 0) < 0 || ftruncate(self->_fd, a3) < 0)
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
}

- (BOOL)seekToOffset:(unint64_t)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  -[NSConcreteFileHandle seekToFileOffset:](self, "seekToFileOffset:", a3);
  return 1;
}

- (void)seekToFileOffset:(unint64_t)a3
{
  char v5;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 4) != 0 || lseek(self->_fd, a3, 0) < 0)
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
}

- (id)readDataToEndOfFileAndReturnError:(id *)a3
{
  if (a3)
    *a3 = 0;
  return -[NSConcreteFileHandle readDataToEndOfFile](self, "readDataToEndOfFile");
}

- (id)readDataOfLength:(unint64_t)a3
{
  char v5;
  off_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  size_t v11;
  uint64_t v12;
  BOOL v13;
  size_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  stat v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  memset(&v21, 0, sizeof(v21));
  v5 = atomic_load(&self->_flags);
  if ((v5 & 4) != 0 || fstat(self->_fd, &v21) < 0)
    goto LABEL_40;
  if ((v21.st_mode & 0xF000) != 0x8000)
  {
    v10 = malloc_type_malloc(0x2000uLL, 0x3D3E13BAuLL);
    v11 = 0;
    v14 = 0x2000;
    v15 = a3;
    while (v15)
    {
      if (v15 >= 0x2000)
        v16 = 0x2000;
      else
        v16 = v15;
      if (v14 - v11 < v16)
      {
        v14 *= 2;
        v17 = reallocf(v10, v14);
        if (!v17)
          goto LABEL_40;
        v10 = v17;
      }
      v18 = _NSReadFromFileDescriptorWithProgress(self->_fd, (char *)v10 + v11, v16, 0, 0);
      if (v18 < 0)
        goto LABEL_39;
      v11 += v18;
      v15 -= v18;
      if (v18)
        v19 = v11 == a3;
      else
        v19 = 1;
      if (v19)
        break;
    }
LABEL_31:
    if (a3 == -1 && v11)
    {
      v10 = reallocf(v10, v11);
    }
    else if (!v11)
    {
      goto LABEL_36;
    }
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v10, v11, *(_OWORD *)&v21.st_dev, *(_OWORD *)&v21.st_uid, *(_OWORD *)&v21.st_atimespec, *(_OWORD *)&v21.st_mtimespec, *(_OWORD *)&v21.st_ctimespec, *(_OWORD *)&v21.st_birthtimespec);
  }
  v7 = lseek(self->_fd, 0, 1);
  if (v7 < 0)
    goto LABEL_40;
  if (v21.st_size <= v7)
    return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", *(_OWORD *)&v21.st_dev, *(_OWORD *)&v21.st_uid, *(_OWORD *)&v21.st_atimespec, *(_OWORD *)&v21.st_mtimespec, *(_OWORD *)&v21.st_ctimespec, *(_OWORD *)&v21.st_birthtimespec);
  if (v21.st_size - v7 >= a3)
    v8 = a3;
  else
    v8 = v21.st_size - v7;
  v9 = malloc_type_malloc(v8, 0xA20D19F0uLL);
  if (!v9)
    goto LABEL_40;
  v10 = v9;
  if (v8 >= 1)
  {
    v11 = 0;
    while (1)
    {
      v12 = _NSReadFromFileDescriptorWithProgress(self->_fd, (char *)v10 + v11, v8, 0, 0);
      if (v12 < 0)
        break;
      if (v12)
      {
        v11 += v12;
        v13 = v8 <= v12;
        v8 -= v12;
        if (!v13)
          continue;
      }
      goto LABEL_31;
    }
LABEL_39:
    free(v10);
LABEL_40:
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
  }
LABEL_36:
  free(v10);
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", *(_OWORD *)&v21.st_dev, *(_OWORD *)&v21.st_uid, *(_OWORD *)&v21.st_atimespec, *(_OWORD *)&v21.st_mtimespec, *(_OWORD *)&v21.st_ctimespec, *(_OWORD *)&v21.st_birthtimespec);
}

- (id)readDataToEndOfFile
{
  return -[NSConcreteFileHandle readDataOfLength:](self, "readDataOfLength:", -1);
}

- (BOOL)seekToEndReturningOffset:(unint64_t *)a3 error:(id *)a4
{
  unint64_t v5;

  if (a4)
    *a4 = 0;
  v5 = -[NSConcreteFileHandle seekToEndOfFile](self, "seekToEndOfFile");
  if (a3)
    *a3 = v5;
  return 1;
}

- (unint64_t)seekToEndOfFile
{
  char v4;
  unint64_t result;

  v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || (result = lseek(self->_fd, 0, 2), (result & 0x8000000000000000) != 0))
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
  return result;
}

- (void)performActivity:(int64_t)a3 modes:(id)a4
{
  __int16 v5;
  unsigned int *v7;
  id v8;
  id v9;
  CFRunLoopSourceRef v10;
  CFRunLoopRef Current;
  int v12;
  dispatch_fd_t v13;
  NSObject *v14;
  uint64_t v15;
  size_t v16;
  NSObject *fhQueue;
  NSObject *v18;
  uint64_t v19;
  OS_dispatch_io *v20;
  NSObject *v21;
  uint64_t v22;
  CFIndex i;
  const __CFString *ValueAtIndex;
  __CFRunLoop *v25;
  _QWORD v26[7];
  int v27;
  __int16 v28;
  _QWORD handler[7];
  dispatch_fd_t v30;
  _QWORD v31[8];
  dispatch_fd_t v32;
  _QWORD io_handler[8];
  _QWORD cleanup_handler[4];
  dispatch_fd_t v35;
  _QWORD v36[6];
  CFRunLoopSourceContext context;
  uint64_t v38;

  v5 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v7 = (unsigned int *)malloc_type_malloc(0x20uLL, 0x10A0040D4BD8B5AuLL);
  atomic_store(0, v7);
  *((_QWORD *)v7 + 1) = self;
  *((_WORD *)v7 + 8) = v5;
  context.version = 0;
  context.info = v7;
  context.retain = (const void *(__cdecl *)(const void *))_NSFileHandlePerformSourceContextRetain;
  context.release = (void (__cdecl *)(const void *))_NSFileHandlePerformSourceContextRelease;
  memset(&context.copyDescription, 0, 40);
  context.perform = (void (__cdecl *)(void *))_performFileHandleSource;
  if (a4)
  {
    v8 = a4;
  }
  else
  {
    v9 = objc_allocWithZone(MEMORY[0x1E0C99D20]);
    a4 = (id)objc_msgSend(v9, "initWithObjects:", *MEMORY[0x1E0C9B280], 0);
  }
  CFRetain(self);
  v10 = CFRunLoopSourceCreate(0, 50, &context);
  *((_QWORD *)v7 + 3) = v10;
  Current = CFRunLoopGetCurrent();
  CFRetain(Current);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3052000000;
  v36[3] = __Block_byref_object_copy__2;
  v36[4] = __Block_byref_object_dispose__2;
  v36[5] = self;
  v12 = -[NSConcreteFileHandle fileDescriptor](self, "fileDescriptor");
  v13 = dup(v12);
  atomic_store(0, (unsigned int *)&self->_error);
  CFRetain(v10);
  switch(v5)
  {
    case 12:
    case 20:
      v14 = dispatch_source_create(MEMORY[0x1E0C80DB8], v13, 0, (dispatch_queue_t)self->_fhQueue);
      v15 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_4;
      handler[3] = &unk_1E0F4DB90;
      v30 = v13;
      handler[4] = v14;
      handler[5] = v10;
      handler[6] = Current;
      dispatch_source_set_cancel_handler(v14, handler);
      v26[0] = v15;
      v26[1] = 3221225472;
      v26[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_5;
      v26[3] = &unk_1E0F4DBB8;
      v28 = v5;
      v27 = v12;
      v26[4] = v36;
      v26[5] = v10;
      v26[6] = Current;
      dispatch_source_set_event_handler(v14, v26);
      os_unfair_lock_lock(&self->_lock);
      self->_dsrc = (OS_dispatch_source *)v14;
      os_unfair_lock_unlock(&self->_lock);
      dispatch_resume(v14);
      break;
    case 14:
      v16 = 16 * *MEMORY[0x1E0C85AD8];
      fhQueue = self->_fhQueue;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_3;
      v31[3] = &unk_1E0F4DB68;
      v31[4] = self;
      v31[5] = v36;
      v31[6] = v10;
      v31[7] = Current;
      v32 = v13;
      dispatch_read(v13, v16, fhQueue, v31);
      break;
    case 16:
      v18 = self->_fhQueue;
      v19 = MEMORY[0x1E0C809B0];
      cleanup_handler[0] = MEMORY[0x1E0C809B0];
      cleanup_handler[1] = 3221225472;
      cleanup_handler[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke;
      cleanup_handler[3] = &__block_descriptor_36_e8_v12__0i8l;
      v35 = v13;
      v20 = (OS_dispatch_io *)dispatch_io_create(0, v13, v18, cleanup_handler);
      os_unfair_lock_lock(&self->_lock);
      self->_readChannel = v20;
      os_unfair_lock_unlock(&self->_lock);
      dispatch_io_set_low_water((dispatch_io_t)v20, 0xFFFFFFFFFFFFFFFFLL);
      v21 = self->_fhQueue;
      io_handler[0] = v19;
      io_handler[1] = 3221225472;
      io_handler[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_2;
      io_handler[3] = &unk_1E0F4DB40;
      io_handler[4] = self;
      io_handler[5] = v36;
      io_handler[6] = v10;
      io_handler[7] = Current;
      dispatch_io_read((dispatch_io_t)v20, 0, 0xFFFFFFFFFFFFFFFFLL, v21, io_handler);
      break;
    default:
      break;
  }
  v22 = objc_msgSend(a4, "count");
  if (v22 >= 1)
  {
    for (i = 0; i != v22; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)a4, i);
      v25 = CFRunLoopGetCurrent();
      CFRunLoopAddSource(v25, v10, ValueAtIndex);
    }
  }

  _Block_object_dispose(v36, 8);
}

- (int)fileDescriptor
{
  char v2;

  v2 = atomic_load(&self->_flags);
  if ((v2 & 4) != 0)
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
  return self->_fd;
}

- (NSConcreteFileHandle)initWithFileDescriptor:(int)a3
{
  return -[NSConcreteFileHandle initWithFileDescriptor:closeOnDealloc:](self, "initWithFileDescriptor:closeOnDealloc:", *(_QWORD *)&a3, 0);
}

- (BOOL)synchronizeAndReturnError:(id *)a3
{
  if (a3)
    *a3 = 0;
  -[NSConcreteFileHandle synchronizeFile](self, "synchronizeFile");
  return 1;
}

- (void)synchronizeFile
{
  char v4;

  v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || fsync(self->_fd) < 0)
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
}

- (NSConcreteFileHandle)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSConcreteFileHandle;
  -[NSConcreteFileHandle dealloc](&v3, sel_dealloc);
  return 0;
}

- (unint64_t)readDataOfLength:(unint64_t)a3 buffer:(char *)a4
{
  char v6;
  off_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  stat v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memset(&v16, 0, sizeof(v16));
  v6 = atomic_load(&self->_flags);
  if ((v6 & 4) != 0 || fstat(self->_fd, &v16) < 0)
    goto LABEL_13;
  if ((v16.st_mode & 0xF000) != 0x8000)
  {
    if (a3)
    {
      v12 = 0;
      if (a3 >= 0x1000)
        v13 = 4096;
      else
        v13 = a3;
      while (1)
      {
        v14 = _NSReadFromFileDescriptorWithProgress(self->_fd, &a4[v12], v13, 0, 0);
        if (v14 < 0)
          break;
        if (v14)
        {
          v12 += v14;
          a3 -= v14;
          v13 = a3 >= 0x1000 ? 4096 : a3;
          if (a3)
            continue;
        }
        return v12;
      }
LABEL_13:
      _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    }
    return 0;
  }
  v9 = lseek(self->_fd, 0, 1);
  if (v9 < 0)
    goto LABEL_13;
  v10 = v16.st_size - v9;
  if (v16.st_size <= v9)
    return 0;
  if (v10 >= a3)
    v10 = a3;
  if (v10 < 1)
    return 0;
  if (v10 >= 0x80000000)
    v11 = 0x80000000;
  else
    v11 = v10;
  v12 = _NSReadFromFileDescriptorWithProgress(self->_fd, a4, v11, 0, 0);
  if ((v12 & 0x8000000000000000) != 0)
    goto LABEL_13;
  return v12;
}

- (id)readDataUpToLength:(unint64_t)a3 error:(id *)a4
{
  if (a4)
    *a4 = 0;
  return -[NSConcreteFileHandle readDataOfLength:](self, "readDataOfLength:", a3);
}

- (unint64_t)offsetInFile
{
  char v4;
  unint64_t result;

  v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || (result = lseek(self->_fd, 0, 1), (result & 0x8000000000000000) != 0))
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
  return result;
}

- (BOOL)getOffset:(unint64_t *)a3 error:(id *)a4
{
  unint64_t v5;

  if (a4)
    *a4 = 0;
  v5 = -[NSConcreteFileHandle offsetInFile](self, "offsetInFile");
  if (a3)
    *a3 = v5;
  return 1;
}

uint64_t __33__NSConcreteFileHandle_closeFile__block_invoke(uint64_t a1)
{
  unsigned __int16 *v1;
  unsigned __int16 v2;

  v1 = (unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 100);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(v2 | 4, v1));
  return close(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 96));
}

- (id)port
{
  return 0;
}

uint64_t __46__NSConcreteFileHandle_performActivity_modes___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_2(uint64_t a1, int a2, NSObject *a3, unsigned int a4)
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;

  if (a4)
    atomic_store(a4, (unsigned int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 12));
  if (a3 && a3 != MEMORY[0x1E0C80D00])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = *(NSObject **)(v7 + 32);
    if (v8)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 32) = dispatch_data_create_concat(*(dispatch_data_t *)(v7 + 32), a3);
      dispatch_release(v8);
    }
    else
    {
      *(_QWORD *)(v7 + 32) = a3;
      dispatch_retain(a3);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = *(NSObject **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    if (v10)
      dispatch_release(v10);
    CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 48));
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
    CFRelease(*(CFTypeRef *)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 56));
  }
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_3(uint64_t a1, NSObject *a2, unsigned int a3)
{
  if (a3)
    atomic_store(a3, (unsigned int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 12));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 32) = a2;
  dispatch_retain(a2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 48));
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
  close(*(_DWORD *)(a1 + 64));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

- (void)readInBackgroundAndNotifyForModes:(id)a3
{
  -[NSConcreteFileHandle performActivity:modes:](self, "performActivity:modes:", 14, a3);
}

- (void)readInBackgroundAndNotify
{
  -[NSConcreteFileHandle readInBackgroundAndNotifyForModes:](self, "readInBackgroundAndNotifyForModes:", 0);
}

- (void)readToEndOfFileInBackgroundAndNotifyForModes:(id)a3
{
  -[NSConcreteFileHandle performActivity:modes:](self, "performActivity:modes:", 16, a3);
}

- (void)readToEndOfFileInBackgroundAndNotify
{
  -[NSConcreteFileHandle readToEndOfFileInBackgroundAndNotifyForModes:](self, "readToEndOfFileInBackgroundAndNotifyForModes:", 0);
}

- (void)acceptConnectionInBackgroundAndNotifyForModes:(id)a3
{
  -[NSConcreteFileHandle performActivity:modes:](self, "performActivity:modes:", 12, a3);
}

- (void)acceptConnectionInBackgroundAndNotify
{
  -[NSConcreteFileHandle acceptConnectionInBackgroundAndNotifyForModes:](self, "acceptConnectionInBackgroundAndNotifyForModes:", 0);
}

- (id)_monitor:(int)a3
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  OS_dispatch_queue *monitoringQueue;
  const dispatch_source_type_s *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v13[5];
  int v14;
  _QWORD handler[5];
  id v16;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = 7;
  if (!a3)
    v5 = 5;
  v6 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___NSConcreteFileHandle__flags[v5]);
  v7 = dup(self->_fd);
  monitoringQueue = self->_monitoringQueue;
  if (!monitoringQueue)
  {
    monitoringQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSFileHandle.fd_monitoring", 0);
    self->_monitoringQueue = monitoringQueue;
  }
  if (a3)
    v9 = (const dispatch_source_type_s *)MEMORY[0x1E0C80DF0];
  else
    v9 = (const dispatch_source_type_s *)MEMORY[0x1E0C80DB8];
  v10 = dispatch_source_create(v9, v7, 0, (dispatch_queue_t)monitoringQueue);
  objc_initWeak(location, self);
  v11 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __33__NSConcreteFileHandle__monitor___block_invoke;
  handler[3] = &unk_1E0F4DBE0;
  objc_copyWeak(&v16, location);
  handler[4] = v6;
  dispatch_source_set_event_handler(v10, handler);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __33__NSConcreteFileHandle__monitor___block_invoke_2;
  v13[3] = &unk_1E0F4DC08;
  v14 = v7;
  v13[4] = v10;
  dispatch_source_set_cancel_handler(v10, v13);
  dispatch_resume(v10);
  objc_destroyWeak(&v16);
  objc_destroyWeak(location);
  return v10;
}

uint64_t __33__NSConcreteFileHandle__monitor___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  _CFAutoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  return _CFAutoreleasePoolPop();
}

void __33__NSConcreteFileHandle__monitor___block_invoke_2(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (id)readabilityHandler
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_readabilityHandler;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setReadabilityHandler:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock(&self->_lock);
  -[NSConcreteFileHandle _locked_clearHandler:forSource:](self, "_locked_clearHandler:forSource:", &self->_readabilityHandler, &self->_readMonitoringSource);
  self->_readabilityHandler = v4;
  if (v4)
    self->_readMonitoringSource = (OS_dispatch_source *)-[NSConcreteFileHandle _monitor:](self, "_monitor:", 0);
  os_unfair_lock_unlock(&self->_lock);
}

- (id)writeabilityHandler
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_writeabilityHandler;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setWriteabilityHandler:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock(&self->_lock);
  -[NSConcreteFileHandle _locked_clearHandler:forSource:](self, "_locked_clearHandler:forSource:", &self->_writeabilityHandler, &self->_writeMonitoringSource);
  self->_writeabilityHandler = v4;
  if (v4)
    self->_writeMonitoringSource = (OS_dispatch_source *)-[NSConcreteFileHandle _monitor:](self, "_monitor:", 1);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_closeOnDealloc
{
  unsigned __int16 *p_flags;
  unsigned __int16 v3;

  p_flags = &self->_flags;
  do
    v3 = __ldaxr(p_flags);
  while (__stlxr(v3 & 0xFFFD, p_flags));
}

@end
