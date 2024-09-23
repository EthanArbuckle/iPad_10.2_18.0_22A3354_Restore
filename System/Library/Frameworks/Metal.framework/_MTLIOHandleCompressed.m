@implementation _MTLIOHandleCompressed

- (_MTLIOHandleCompressed)initWithDevice:(id)a3 path:(const char *)a4 compressionType:(int64_t)a5 error:(id *)a6 uncached:(BOOL)a7
{
  _BOOL4 v7;
  _MTLIOHandleCompressed *v12;
  int v13;
  _DWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int *v18;
  void *v19;
  const __CFString **v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t *v27;
  uint64_t *v28;
  stat v30;
  objc_super v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  v7 = a7;
  v39[1] = *MEMORY[0x1E0C80C00];
  if (a6)
    *a6 = 0;
  v31.receiver = self;
  v31.super_class = (Class)_MTLIOHandleCompressed;
  v12 = -[_MTLObjectWithLabel init](&v31, sel_init);
  if (v12)
  {
    v12->_device = (MTLDevice *)a3;
    v13 = open(a4, 0);
    v12->_fd = v13;
    if ((v13 & 0x80000000) == 0)
    {
      if (fstat(v13, &v30) < 0)
      {
        if (!a6)
          goto LABEL_22;
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v36 = *MEMORY[0x1E0CB2D50];
        v37 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Internal Error");
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = &v37;
        v28 = &v36;
      }
      else
      {
        if ((v30.st_mode & 0xF000) == 0x8000)
        {
          if (v7)
            fcntl(v12->_fd, 48, 1);
          v14 = MTLIOCreateDecompressionContext(v12->_fd, a5);
          v12->_handle = v14;
          if (v14)
          {
            if (MTLTraceEnabled())
            {
              kdebug_trace_string();
              if (MTLTraceEnabled())
              {
                -[_MTLIOHandleCompressed globalTraceObjectID](v12, "globalTraceObjectID");
                objc_msgSend(a3, "registryID");
                kdebug_trace();
              }
            }
            return v12;
          }
          if (a6)
          {
            v15 = (void *)MEMORY[0x1E0CB35C8];
            v16 = *__error();
            v32 = *MEMORY[0x1E0CB2D50];
            v33 = CFSTR("Failed to create compression context because file was not compressed with MTLIOCompressionContext");
            v19 = (void *)MEMORY[0x1E0C99D80];
            v20 = &v33;
            v21 = &v32;
            goto LABEL_15;
          }
          goto LABEL_22;
        }
        if (!a6)
          goto LABEL_22;
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB2D50];
        v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Not a regular file");
        v26 = (void *)MEMORY[0x1E0C99D80];
        v27 = &v35;
        v28 = &v34;
      }
      v22 = objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
      v23 = v25;
      v24 = 2;
      goto LABEL_21;
    }
    if (a6)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *__error();
      v38 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = __error();
      v39[0] = objc_msgSend(v17, "stringWithFormat:", CFSTR("%s"), strerror(*v18));
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = (const __CFString **)v39;
      v21 = &v38;
LABEL_15:
      v22 = objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
      v23 = v15;
      v24 = v16;
LABEL_21:
      *a6 = (id)objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("MTLIOError"), v24, v22);
    }
LABEL_22:

    return 0;
  }
  return v12;
}

- (void)dealloc
{
  int fd;
  void *handle;
  objc_super v5;

  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
    close(fd);
  handle = self->_handle;
  if (handle)
    MTLIODestroyDecompressionContext((uint64_t)handle);

  v5.receiver = self;
  v5.super_class = (Class)_MTLIOHandleCompressed;
  -[_MTLObjectWithLabel dealloc](&v5, sel_dealloc);
}

- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7
{
  size_t v12;

  v12 = MTLIODecompressionContextStagingBufferSize((uint64_t)self->_handle, a4, a5);
  return MTLIODecompressionContextRead((uint64_t)self->_handle, (uint8_t *)a3, (uint8_t *)a6, v12, a4, a5, 1);
}

- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6
{
  size_t v11;

  v11 = MTLIODecompressionContextStagingBufferSize((uint64_t)self->_handle, a3, a4);
  if (MTLIODecompressionContextRead((uint64_t)self->_handle, (uint8_t *)a5, (uint8_t *)a5 + a6 - v11, v11, a3, a4, 1) == a3)
    return a5;
  else
    return 0;
}

- (int64_t)read:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7 needsDecompress:(BOOL *)a8
{
  size_t v12;
  off_t v13;

  *a8 = 1;
  v12 = MTLIODecompressionContextStagingBufferSize((uint64_t)self->_handle, a4, a5);
  v13 = MTLIODecompressionContextOffset((uint64_t)self->_handle, a4, a5);
  return pread(self->_fd, a6, v12, v13);
}

- (void)readIntoStagingBuffer:(unint64_t)a3 offset:(unint64_t)a4 stagingBuffer:(void *)a5 stagingBufferSize:(unint64_t)a6 needsDecompress:(BOOL *)a7
{
  size_t v12;
  off_t v13;
  char *v14;

  *a7 = 1;
  v12 = MTLIODecompressionContextStagingBufferSize((uint64_t)self->_handle, a3, a4);
  v13 = MTLIODecompressionContextOffset((uint64_t)self->_handle, a3, a4);
  v14 = (char *)a5 + a6 - v12;
  if (pread(self->_fd, v14, v12, v13) >= v12)
    return v14;
  else
    return 0;
}

- (unint64_t)stagingBufferSize:(unint64_t)a3 offset:(unint64_t)a4
{
  return MTLIODecompressionContextStagingBufferSize((uint64_t)self->_handle, a3, a4);
}

- (unint64_t)getHandleOffset:(unint64_t)a3 offset:(unint64_t)a4
{
  return MTLIODecompressionContextOffset((uint64_t)self->_handle, a3, a4);
}

- (int64_t)decompress:(void *)a3 size:(unint64_t)a4 offset:(unint64_t)a5 stagingBuffer:(void *)a6 stagingBufferSize:(unint64_t)a7
{
  return MTLIODecompressionContextRead((uint64_t)self->_handle, (uint8_t *)a3, (uint8_t *)a6, a7, a4, a5, 0);
}

- (unint64_t)length
{
  uint64_t v2;

  v2 = MTLIODecompressionContextSize((uint64_t)self->_handle);
  return v2 & ~(v2 >> 63);
}

@end
