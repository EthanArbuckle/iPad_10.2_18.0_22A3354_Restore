@implementation MFMutableData

- (MFMutableData)init
{
  MFMutableData *v2;
  MFMutableData *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMutableData;
  v2 = -[MFMutableData init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_threshold = sDefaultThreshold;
    v2->_fd = -1;
    v2->_capacity = 8;
    v2->_bytes = malloc_type_malloc(8uLL, 0xB5671A5BuLL);
    __memset_chk();
    v3->_length = 0;
  }
  return v3;
}

- (MFMutableData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  MFMutableData *v6;
  unint64_t v7;
  size_t v8;
  void *v9;
  void *v10;
  const char *v11;
  char *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MFMutableData;
  v6 = -[MFMutableData init](&v23, sel_init);
  if (!v6)
    return v6;
  if ((a4 & 0x8000000000000000) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem(), "length", a4, 0x7FFFFFFFFFFFFFFFLL);
  v7 = sDefaultThreshold;
  v6->_threshold = sDefaultThreshold;
  v6->_fd = -1;
  if (v7 <= a4)
  {
    pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (const char *)objc_msgSend((id)objc_msgSend(v10, "mf_makeUniqueFileInDirectory:", sMFDataPath), "fileSystemRepresentation");
    if (v11)
    {
      v12 = strdup(v11);
      v6->_path = v12;
      if (v12)
      {
        v13 = open(v12, 1538, 438);
        v6->_fd = v13;
        if (v13 != -1)
        {
          MFProtectFileDescriptor(v13, 3);
          v6->_capacity = a4;
          v6->_length = a4;
          if (write(v6->_fd, a3, a4) == -1)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error occured in write: (%d)"), *__error());
          v6->_flush = 1;
          v14 = 64;
          goto LABEL_18;
        }
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = *MEMORY[0x1E0C99768];
        v21 = sMFDataPath;
        v22 = *__error();
        v17 = CFSTR("Could not create mutable cache file at %@ (%d).");
        v15 = v18;
        v16 = v19;
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99850];
        v17 = CFSTR("Failed to allocate path for mutable cache file.");
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = *MEMORY[0x1E0C99768];
      v17 = CFSTR("Failed to create temporary mutable cache file path.");
    }
    objc_msgSend(v15, "raise:format:", v16, v17, v21, v22);
    goto LABEL_23;
  }
  if (a4 <= 8)
    v8 = 8;
  else
    v8 = a4;
  v6->_capacity = v8;
  v9 = malloc_type_malloc(v8, 0xAA0AFF14uLL);
  v6->_bytes = v9;
  if (a4)
    memmove(v9, a3, a4);
  else
    bzero(v9, v6->_capacity);
  v14 = 16;
LABEL_18:
  *(Class *)((char *)&v6->super.super.super.isa + v14) = (Class)a4;
LABEL_23:
  if (!v6->_bytes && !v6->_path)
  {

    return 0;
  }
  return v6;
}

- (MFMutableData)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  _BOOL4 v5;
  MFMutableData *v7;

  v5 = a5;
  v7 = -[MFMutableData initWithBytes:length:](self, "initWithBytes:length:", a3, a4);
  if (v5)
    free(a3);
  return v7;
}

- (MFMutableData)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (objc_msgSend(a3, "isFileURL"))
    return -[MFMutableData initWithContentsOfFile:options:error:](self, "initWithContentsOfFile:options:error:", objc_msgSend(a3, "path"), a4, a5);

  return 0;
}

- (MFMutableData)initWithContentsOfURL:(id)a3
{
  return -[MFMutableData initWithContentsOfURL:options:error:](self, "initWithContentsOfURL:options:error:", a3, 0, 0);
}

- (MFMutableData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  MFMutableData *v7;
  MFMutableData *v8;
  objc_super v10;

  pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
  v10.receiver = self;
  v10.super_class = (Class)MFMutableData;
  v7 = -[MFMutableData init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_threshold = sDefaultThreshold;
    v7->_fd = -1;
    v7->_path = (char *)objc_msgSend(a3, "fileSystemRepresentation");
    -[MFMutableData _mapMutableData:](v8, "_mapMutableData:", 1);
    v8->_path = 0;
  }
  return v8;
}

- (MFMutableData)initWithContentsOfFile:(id)a3
{
  return -[MFMutableData initWithContentsOfFile:options:error:](self, "initWithContentsOfFile:options:error:", a3, 0, 0);
}

- (MFMutableData)initWithData:(id)a3
{
  return -[MFMutableData initWithBytes:length:](self, "initWithBytes:length:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
}

- (MFMutableData)initWithCapacity:(unint64_t)a3
{
  MFMutableData *v4;
  NSUInteger v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMutableData;
  v4 = -[MFMutableData init](&v7, sel_init);
  if (v4)
  {
    if ((a3 & 0x8000000000000000) != 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem(), "capacity", a3, 0x7FFFFFFFFFFFFFFFLL);
    v4->_threshold = sDefaultThreshold;
    v4->_fd = -1;
    if (a3 >> 30)
      v5 = a3;
    else
      v5 = ((_DWORD)a3 + (a3 >> 2) + 3) & 0xFFFFFFFC;
    v4->_capacity = v5;
    if (v5 >= 0x80000)
      v4->_capacity = NSRoundUpToMultipleOfPageSize(v5);
  }
  return v4;
}

- (MFMutableData)initWithLength:(unint64_t)a3
{
  MFMutableData *v4;
  MFMutableData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMutableData;
  v4 = -[MFMutableData init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_threshold = sDefaultThreshold;
    v4->_fd = -1;
    -[MFMutableData setLength:](v4, "setLength:", a3);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MFData initWithData:](+[MFData allocWithZone:](MFData, "allocWithZone:", a3), "initWithData:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithData:", self);
}

- (void)dealloc
{
  void *bytes;
  char *path;
  int fd;
  objc_super v6;

  bytes = self->_bytes;
  if (bytes)
  {
    if (self->_vm)
    {
      if (bytes != (void *)-1)
        NSDeallocateMemoryPages(bytes, self->_mappedLength);
    }
    else
    {
      free(bytes);
    }
  }
  path = self->_path;
  if (path)
  {
    unlink(path);
    free(self->_path);
  }
  fd = self->_fd;
  if (fd != -1)
    close(fd);
  v6.receiver = self;
  v6.super_class = (Class)MFMutableData;
  -[MFMutableData dealloc](&v6, sel_dealloc);
}

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  if (!self->_bytes)
  {
    if (self->_path || (-[MFMutableData setLength:](self, "setLength:", self->_capacity), self->_path))
      -[MFMutableData _mapMutableData:](self, "_mapMutableData:", 0);
  }
  return self->_bytes;
}

- (void)mutableBytes
{
  if (self->_immutable)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFData.m"), 665, CFSTR("Attempting to get mutableBytes on an immutable MFMutableData."));
  -[MFMutableData bytes](self, "bytes");
  self->_flush = 1;
  self->_flushFrom = 0;
  return self->_bytes;
}

- (void)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *bytes;
  BOOL v13;
  char *v14;
  int v15;
  void *v16;
  char *v17;
  NSRange v18;

  if (a4)
  {
    v8 = -[MFMutableData length](self, "length");
    if (__CFADD__(a4, v8))
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99858];
      v11 = _NSMethodExceptionProem();
      v18.location = v8;
      v18.length = a4;
      objc_msgSend(v9, "raise:format:", v10, CFSTR("%@: range %@ causes integer overflow"), v11, NSStringFromRange(v18));
    }
    bytes = self->_bytes;
    if (bytes)
      v13 = bytes > a3;
    else
      v13 = 1;
    if (v13 || &bytes[v8] <= a3)
    {
      v15 = 0;
      v14 = 0;
    }
    else
    {
      if ((char *)a3 + a4 > &bytes[v8])
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFData.m"), 686, CFSTR("bytes being copied start but don't end within our own bytes"));
        bytes = self->_bytes;
      }
      v14 = (char *)((_BYTE *)a3 - bytes);
      v15 = 1;
    }
    -[MFMutableData setLength:](self, "setLength:", v8 + a4);
    if (!self->_flush)
    {
      self->_flush = 1;
      self->_flushFrom = v8;
    }
    if (v8 + a4 > self->_capacity)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Not enough capacity to append bytes. Capacity: (%lu). New length: (%lu):"), self->_capacity, v8 + a4);
    v16 = self->_bytes;
    if (!v16)
    {
      -[MFMutableData _mapMutableData:](self, "_mapMutableData:", 0);
      v16 = self->_bytes;
      if (!v16)
        -[MFMutableData appendBytes:length:].cold.1();
    }
    if (v15)
      v17 = &v14[(_QWORD)v16];
    else
      v17 = (char *)a3;
    memmove((char *)v16 + v8, v17, a4);
  }
}

- (void)appendData:(id)a3
{
  -[MFMutableData appendBytes:length:](self, "appendBytes:length:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
}

- (id)subdataWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  MFData *v6;
  NSUInteger v7;
  NSUInteger v8;
  MFMutableData *v9;
  uint64_t v10;

  length = a3.length;
  location = a3.location;
  if (sDefaultThreshold <= a3.length && self->_immutable)
  {
    v6 = [MFData alloc];
    v7 = location;
    v8 = length;
    v9 = self;
    v10 = 1;
  }
  else
  {
    v6 = [MFData alloc];
    v7 = location;
    v8 = length;
    v9 = self;
    v10 = 0;
  }
  return -[MFData _initWithRange:from:retainingParent:](v6, "_initWithRange:from:retainingParent:", v7, v8, v9, v10);
}

- (void)setLength:(unint64_t)a3
{
  unint64_t capacity;
  unint64_t threshold;
  char v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *bytes;
  uint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  size_t mappedLength;
  unint64_t length;
  char *path;
  int fd;

  if (self->_immutable)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFData.m"), 738, CFSTR("Attempting to setLength: on an immutable MFMutableData."));
  if ((a3 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@: absurd %s: %lu, maximum size: %llu bytes"), _NSMethodExceptionProem(), "length", a3, 0x7FFFFFFFFFFFFFFFLL);
  }
  else if (!a3)
  {
    goto LABEL_46;
  }
  capacity = self->_capacity;
  if (capacity < a3 || !self->_bytes)
  {
    threshold = self->_threshold;
    if (threshold <= a3)
    {
      v13 = 0x100000;
      if (a3 >= 0xA00000)
        v13 = 0x200000;
      if (a3 >> 19)
        v14 = 2;
      else
        v14 = 1;
      v15 = a3 >> v14;
      if (a3 >> 20 <= 4)
        v16 = v15;
      else
        v16 = v13;
      if (capacity != v16 + a3 || !self->_path)
      {
        self->_flush = 1;
        -[MFMutableData _flushToDisk:capacity:](self, "_flushToDisk:capacity:", -[MFMutableData length](self, "length"), v16 + a3);
      }
    }
    else
    {
      v7 = 1;
      if (a3 >> 19)
        v7 = 2;
      v8 = (a3 >> v7) + a3;
      if (capacity > v8)
        v8 = self->_capacity;
      if (threshold >= v8)
        threshold = v8;
      if (threshold <= 8)
        v9 = 8;
      else
        v9 = threshold;
      self->_capacity = v9;
      if (capacity != v9 || !self->_bytes)
      {
        if (self->_vm)
        {
          v10 = -[MFMutableData mutableBytes](self, "mutableBytes");
          if (!v10)
            -[MFMutableData setLength:].cold.2();
          v11 = v10;
          bytes = 0;
          self->_bytes = 0;
          v9 = self->_capacity;
        }
        else
        {
          v11 = 0;
          bytes = self->_bytes;
        }
        v17 = (char *)reallocf(bytes, v9);
        self->_bytes = v17;
        if (!v17)
          -[MFMutableData setLength:].cold.1();
        if (self->_vm)
        {
          mappedLength = self->_mappedLength;
          memmove(v17, v11, mappedLength);
          NSDeallocateMemoryPages(v11, mappedLength);
        }
        else
        {
          length = self->_length;
          if (length < a3)
            bzero(&v17[length], self->_capacity - length);
        }
        path = self->_path;
        if (path)
        {
          unlink(path);
          free(self->_path);
          self->_path = 0;
        }
        fd = self->_fd;
        if (fd != -1)
        {
          close(fd);
          self->_fd = -1;
        }
        self->_flush = 0;
        self->_vm = 0;
      }
    }
  }
LABEL_46:
  self->_length = a3;
}

- (void)setMappingThreshold:(unsigned int)a3
{
  self->_threshold = a3;
  if (-[MFMutableData length](self, "length") > a3)
    -[MFMutableData _flushToDisk:capacity:](self, "_flushToDisk:capacity:", -[MFMutableData length](self, "length"), -[MFMutableData length](self, "length"));
}

- (void)mf_makeImmutable
{
  unint64_t threshold;

  if (!self->_immutable)
  {
    self->_immutable = 1;
    threshold = self->_threshold;
    if (threshold < -[MFMutableData length](self, "length"))
      -[MFMutableData _flushToDisk:capacity:](self, "_flushToDisk:capacity:", -[MFMutableData length](self, "length"), -[MFMutableData length](self, "length"));
  }
}

- (BOOL)writeToFile:(id)a3 atomically:(BOOL)a4
{
  return -[MFMutableData writeToFile:options:error:](self, "writeToFile:options:error:", a3, a4, 0);
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4
{
  return -[MFMutableData writeToURL:options:error:](self, "writeToURL:options:error:", a3, a4, 0);
}

- (BOOL)writeToFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  int fd;
  unint64_t v11;
  char *path;
  unint64_t v13;
  unint64_t v14;
  objc_super v16;

  if (!self->_immutable || !self->_path)
    goto LABEL_15;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  MFRemoveItemAtPath(a3);
  if (!self->_bytes)
    -[MFMutableData _mapMutableData:](self, "_mapMutableData:", 1);
  fd = self->_fd;
  if (fd == -1)
  {
    path = self->_path;
    v13 = -[MFMutableData length](self, "length");
    self->_capacity = v13;
    if (truncate(path, v13) == -1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to truncate file: (%d)"), *__error());
  }
  else
  {
    v11 = -[MFMutableData length](self, "length");
    self->_capacity = v11;
    if (ftruncate(fd, v11) == -1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to truncate file: (%d)"), *__error());
    close(self->_fd);
    self->_fd = -1;
  }
  if (objc_msgSend(v9, "moveItemAtPath:toPath:error:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->_path), a3, 0))
  {
    v14 = (a4 & 0xF0000000) - 0x10000000;
    if (!(v14 >> 30))
      objc_msgSend(v9, "mf_protectFileAtPath:withClass:error:", a3, *(_QWORD *)((char *)&unk_1ABB4D550 + (v14 >> 25)), 0);
    free(self->_path);
    self->_path = 0;
    return 1;
  }
  else
  {
LABEL_15:
    v16.receiver = self;
    v16.super_class = (Class)MFMutableData;
    return -[MFMutableData writeToFile:options:error:](&v16, sel_writeToFile_options_error_, a3, a4, a5);
  }
}

- (BOOL)writeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  objc_super v10;

  if (objc_msgSend(a3, "isFileURL"))
    return -[MFMutableData writeToFile:options:error:](self, "writeToFile:options:error:", objc_msgSend(a3, "path"), a4, a5);
  v10.receiver = self;
  v10.super_class = (Class)MFMutableData;
  return -[MFMutableData writeToURL:options:error:](&v10, sel_writeToURL_options_error_, a3, a4, a5);
}

- (void)_flushToDisk:(unint64_t)a3 capacity:(unint64_t)a4
{
  char *path;
  void *v8;
  const char *v9;
  char *v10;
  int fd;
  unint64_t flushFrom;
  BOOL v13;
  size_t v14;
  size_t v15;
  void *bytes;

  path = self->_path;
  if (!path)
  {
    pthread_once(&sMFDataOnce, (void (*)(void))_MFDataInit);
    self->_flush = 1;
    self->_flushFrom = 0;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "mf_makeUniqueFileInDirectory:", sMFDataPath), "fileSystemRepresentation");
    if (v9)
    {
      v10 = strdup(v9);
      self->_path = v10;
      if (v10)
        goto LABEL_5;
      goto LABEL_4;
    }
    if (!self->_path)
LABEL_4:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to create or copy temporary cache file path."));
  }
LABEL_5:
  if (self->_flush)
  {
    fd = self->_fd;
    if (fd == -1 && (fd = open(self->_path, 514, 438), self->_fd = fd, fd == -1))
    {
      if (!path)
      {
        free(self->_path);
        self->_path = 0;
      }
    }
    else
    {
      MFProtectFileDescriptor(fd, 3);
      if (self->_length)
      {
        if (lseek(self->_fd, self->_flushFrom, 0) == -1)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error occured during lseek while flushing to disk: (%d)"), *__error());
        flushFrom = self->_flushFrom;
        v13 = a3 >= flushFrom;
        v14 = a3 - flushFrom;
        if (v13)
          v15 = v14;
        else
          v15 = 0;
        if (write(self->_fd, -[MFMutableData bytes](self, "bytes") + self->_flushFrom, v15) == -1)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error occured writing while flushing to disk: (%d)"), *__error());
      }
      if (a3 != a4 && self->_capacity != a4 && ftruncate(self->_fd, a4) == -1)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error occured in truncate while flushing to disk: (%d)"), *__error());
      bytes = self->_bytes;
      if (bytes)
      {
        if (self->_vm)
          NSDeallocateMemoryPages(bytes, self->_mappedLength);
        else
          free(bytes);
        self->_bytes = 0;
        self->_vm = 0;
      }
      self->_capacity = a4;
      self->_flush = 0;
    }
  }
}

- (void)_mapMutableData:(BOOL)a3
{
  _BOOL4 v3;
  int fd;
  timespec v6;
  unint64_t st_size;
  off_t capacity;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  char *v15;
  stat v16;

  v3 = a3;
  fd = self->_fd;
  if (fd != -1 || (fd = open(self->_path, 0, 438), fd != -1))
  {
    v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v16.st_blksize = v6;
    *(timespec *)v16.st_qspare = v6;
    v16.st_birthtimespec = v6;
    *(timespec *)&v16.st_size = v6;
    v16.st_mtimespec = v6;
    v16.st_ctimespec = v6;
    *(timespec *)&v16.st_uid = v6;
    v16.st_atimespec = v6;
    *(timespec *)&v16.st_dev = v6;
    if (fstat(fd, &v16) || (v16.st_mode & 0xF000) != 0x8000)
      goto LABEL_22;
    st_size = v16.st_size;
    if (v16.st_size <= 0 && self->_threshold > self->_capacity)
    {
      self->_vm = 0;
      self->_length = 0;
      self->_capacity = 8;
      self->_bytes = malloc_type_calloc(8uLL, 1uLL, 0x52DC1BBAuLL);
LABEL_22:
      if (self->_fd != fd)
        close(fd);
      return;
    }
    self->_vm = 1;
    if (v3)
      self->_length = st_size;
    if (st_size)
    {
      self->_capacity = st_size;
    }
    else
    {
      capacity = self->_capacity;
      if (!capacity)
      {
        st_size = self->_mappedLength;
        goto LABEL_17;
      }
      if (ftruncate(self->_fd, capacity) == -1)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error occured in truncate while mapping data with capacity: (%lu) : (%d)"), self->_capacity, *__error());
      st_size = self->_capacity;
    }
    self->_mappedLength = st_size;
LABEL_17:
    if (self->_immutable)
      v9 = 1;
    else
      v9 = 3;
    v10 = mmap(0, st_size, v9, 2, fd, 0);
    self->_bytes = v10;
    if (v10 == (void *)-1)
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99768];
      v13 = *__error();
      v14 = __error();
      v15 = strerror(*v14);
      objc_msgSend(v11, "raise:format:", v12, CFSTR("mmap() failed with error %d - %s (File Size: %lu | Protection Class: %d)"), v13, v15, self->_mappedLength, fcntl(fd, 63));
    }
    goto LABEL_22;
  }
}

- (BOOL)mf_immutable
{
  return self->_immutable;
}

- (void)appendBytes:length:.cold.1()
{
  __assert_rtn("-[MFMutableData appendBytes:length:]", "MFData.m", 711, "NULL != _bytes");
}

- (void)setLength:.cold.1()
{
  __assert_rtn("-[MFMutableData setLength:]", "MFData.m", 761, "NULL != _bytes");
}

- (void)setLength:.cold.2()
{
  __assert_rtn("-[MFMutableData setLength:]", "MFData.m", 756, "NULL != bytes");
}

@end
