@implementation GEOAnalyticsDataFile

- (BOOL)writeAnalyticData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  int *v9;
  char *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_forWrite || self->_fd < 0)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  GEOGetAnalyticDataFileLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v12 = 134217984;
    v13 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_DEBUG, "will write analytic data of size %llu", (uint8_t *)&v12, 0xCu);
  }

  self->_hdr.header_len = objc_msgSend(v4, "length");
  v6 = objc_retainAutorelease(v4);
  self->_iov[1].iov_base = (void *)objc_msgSend(v6, "bytes");
  self->_iov[1].iov_len = objc_msgSend(v6, "length");
  if (writev(self->_fd, self->_iov, 2) < 0)
  {
    GEOGetAnalyticDataFileLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = __error();
      v10 = strerror(*v9);
      v12 = 136315138;
      v13 = (uint64_t)v10;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "failed to write analytic data (%s)", (uint8_t *)&v12, 0xCu);
    }

    goto LABEL_10;
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)prepareFileWithFilePath:(id)a3 isForWrite:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  const char *v10;
  int v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  int *v19;
  char *v20;
  NSString *v21;
  NSString *filePath;
  int fd;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  GEOGetAnalyticDataFileLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("read");
    if (v4)
      v8 = CFSTR("write");
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    v27 = 2112;
    v28 = (void *)v8;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "will open '%@' for %@", buf, 0x16u);
  }

  self->_forWrite = v4;
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
  if (v4)
    v11 = open(v10, 521, 384);
  else
    v11 = open(v10, 0);
  v12 = v11;
  self->_fd = v11;
  GEOGetAnalyticDataFileLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 < 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v19 = __error();
      v20 = strerror(*v19);
      *(_DWORD *)buf = 138412546;
      v26 = v9;
      v27 = 2080;
      v28 = v20;
      v16 = "could not open '%@' (%s)";
      v17 = v14;
      v18 = OS_LOG_TYPE_INFO;
LABEL_15:
      _os_log_impl(&dword_1885A9000, v17, v18, v16, buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = CFSTR("write");
    if (!self->_forWrite)
      v15 = CFSTR("read");
    *(_DWORD *)buf = 138412546;
    v26 = v9;
    v27 = 2112;
    v28 = (void *)v15;
    v16 = "opened '%@' for %@";
    v17 = v14;
    v18 = OS_LOG_TYPE_DEBUG;
    goto LABEL_15;
  }

  v21 = (NSString *)objc_msgSend(v9, "copy");
  filePath = self->_filePath;
  self->_filePath = v21;

  fd = self->_fd;
  return fd >= 0;
}

- (id)initForWriteWithFileMagic:(unsigned int)a3 filePath:(id)a4
{
  uint64_t v4;
  id v6;
  GEOAnalyticsDataFile *v7;
  GEOAnalyticsDataFile *v8;
  GEOAnalyticsDataFile *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOAnalyticsDataFile;
  v7 = -[GEOAnalyticsDataFile init](&v11, sel_init);
  v8 = v7;
  if (v7
    && (-[GEOAnalyticsDataFile commonInitWithMagic:](v7, "commonInitWithMagic:", v4),
        !-[GEOAnalyticsDataFile prepareFileWithFilePath:isForWrite:](v8, "prepareFileWithFilePath:isForWrite:", v6, 1)))
  {
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (void)commonInitWithMagic:(unsigned int)a3
{
  $5127856EA3D99C87C3BC970EB1F4D520 *p_hdr;

  self->_hdr.header_magic = a3;
  p_hdr = &self->_hdr;
  p_hdr[1] = ($5127856EA3D99C87C3BC970EB1F4D520)p_hdr;
  p_hdr[2] = ($5127856EA3D99C87C3BC970EB1F4D520)8;
}

- (void)close
{
  int fd;

  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_fd = -1;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[GEOAnalyticsDataFile close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)GEOAnalyticsDataFile;
  -[GEOAnalyticsDataFile dealloc](&v3, sel_dealloc);
}

- (id)initForReadWithFileMagic:(unsigned int)a3 fileDescriptor:(int)a4
{
  uint64_t v5;
  GEOAnalyticsDataFile *v6;
  NSObject *v7;
  uint8_t v9[16];
  objc_super v10;

  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOAnalyticsDataFile;
  v6 = -[GEOAnalyticsDataFile init](&v10, sel_init);
  if (v6)
  {
    GEOGetAnalyticDataFileLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "preparing for read from file descriptor", v9, 2u);
    }

    -[GEOAnalyticsDataFile commonInitWithMagic:](v6, "commonInitWithMagic:", v5);
    v6->_fd = a4;
    v6->_forWrite = 0;
  }
  return v6;
}

- (id)initForReadWithFileMagic:(unsigned int)a3 filePath:(id)a4
{
  uint64_t v4;
  id v6;
  GEOAnalyticsDataFile *v7;
  GEOAnalyticsDataFile *v8;
  GEOAnalyticsDataFile *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GEOAnalyticsDataFile;
  v7 = -[GEOAnalyticsDataFile init](&v11, sel_init);
  v8 = v7;
  if (v7
    && (-[GEOAnalyticsDataFile commonInitWithMagic:](v7, "commonInitWithMagic:", v4),
        !-[GEOAnalyticsDataFile prepareFileWithFilePath:isForWrite:](v8, "prepareFileWithFilePath:isForWrite:", v6, 0)))
  {
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (BOOL)unsafe_readAnalyticDataWithVisitorBlock:(id)a3
{
  void (**v4)(id, void *);
  int fd;
  unint64_t st_size;
  void *v7;
  unint64_t v8;
  BOOL v9;
  size_t v11;
  ssize_t v12;
  void *v13;
  void *v14;
  void *v15;
  size_t v16;
  stat v17;

  v4 = (void (**)(id, void *))a3;
  if (self->_forWrite
    || (fd = self->_fd, fd < 0)
    || (memset(&v17, 0, sizeof(v17)), fstat(fd, &v17) < 0)
    || (st_size = v17.st_size, lseek(self->_fd, 0, 0) < 0))
  {
    v9 = 0;
  }
  else
  {
    v7 = malloc_type_malloc(0x400uLL, 0x2560AF5FuLL);
    v16 = 0;
    if (st_size >= 8)
    {
      v11 = 1024;
      while (read(self->_fd, &v16, 8uLL) == 8)
      {
        if ((_DWORD)v16 != self->_hdr.header_magic)
          break;
        v12 = HIDWORD(v16);
        v8 = st_size - 8 - HIDWORD(v16);
        if (st_size - 8 < HIDWORD(v16))
          break;
        if (v11 < HIDWORD(v16))
        {
          v11 = (unint64_t)((double)HIDWORD(v16) * 1.2);
          v13 = malloc_type_realloc(v7, v11, 0xEFBDF82uLL);
          if (!v13)
            break;
          v7 = v13;
        }
        if (read(self->_fd, v7, v12) < v12)
          break;
        v14 = (void *)MEMORY[0x18D764E2C]();
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v12, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v15);

        objc_autoreleasePoolPop(v14);
        st_size = v8;
        if (v8 <= 7)
          goto LABEL_7;
      }
    }
    v8 = st_size;
LABEL_7:
    v9 = v8 == 0;
    if (v7)
      free(v7);
  }

  return v9;
}

- (int)unlinkAndReturnOpenFileDescriptor
{
  NSObject *v3;
  NSString *filePath;
  int *v5;
  char *v6;
  int v8;
  NSString *v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_forWrite || self->_fd < 0)
    return -1;
  if (unlink(-[NSString fileSystemRepresentation](self->_filePath, "fileSystemRepresentation")) < 0)
  {
    GEOGetAnalyticDataFileLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      filePath = self->_filePath;
      v5 = __error();
      v6 = strerror(*v5);
      v8 = 138412546;
      v9 = filePath;
      v10 = 2080;
      v11 = v6;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_ERROR, "unlink of %@ failed (%s)", (uint8_t *)&v8, 0x16u);
    }

  }
  return dup(self->_fd);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
