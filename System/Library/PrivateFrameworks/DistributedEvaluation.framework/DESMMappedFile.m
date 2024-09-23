@implementation DESMMappedFile

- (DESMMappedFile)initWithURL:(id)a3
{
  id v4;
  DESMMappedFile *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  off_t st_size;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSData *data;
  DESMMappedFile *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  stat v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DESMMappedFile;
  v5 = -[DESMMappedFile init](&v20, sel_init);
  if (!v5)
    goto LABEL_17;
  v6 = objc_retainAutorelease(v4);
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0);
  if ((_DWORD)v7 == -1)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[DESMMappedFile initWithURL:].cold.1();

    goto LABEL_17;
  }
  v8 = v7;
  memset(&v19, 0, sizeof(v19));
  if (fstat(v7, &v19) == -1)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[DESMMappedFile initWithURL:].cold.2();
    goto LABEL_16;
  }
  if ((v19.st_mode & 0xF000) != 0x8000)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[DESMMappedFile initWithURL:].cold.4((uint64_t)v6, v16, v17);
    goto LABEL_16;
  }
  st_size = v19.st_size;
  v10 = -[DESMMappedFile _mmap:len:protectionFlags:sharenFlags:filedHandle:offset:](v5, "_mmap:len:protectionFlags:sharenFlags:filedHandle:offset:", 0, v19.st_size, 1, 2, v8, 0);
  if (v10 == -1)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[DESMMappedFile initWithURL:].cold.3();
LABEL_16:

    close(v8);
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  v11 = v10;
  close(v8);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v11, st_size, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  data = v5->_data;
  v5->_data = (NSData *)v12;

  objc_storeStrong((id *)&v5->_fileURL, v6);
  v14 = v5;
LABEL_18:

  return v14;
}

- (void)_mmap:(void *)a3 len:(unint64_t)a4 protectionFlags:(int)a5 sharenFlags:(int)a6 filedHandle:(int)a7 offset:(int64_t)a8
{
  return mmap(a3, a4, a5, a6, a7, a8);
}

- (int)_munmap:(void *)a3 len:(unint64_t)a4
{
  return munmap(a3, a4);
}

- (void)dealloc
{
  int *v2;
  uint64_t v3;
  int v4;
  char *v5;

  v2 = OUTLINED_FUNCTION_3_0();
  v4 = 136315138;
  v5 = OUTLINED_FUNCTION_4_2(v2);
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a1, v3, "Fail to munmap with error=%s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

- (NSData)data
{
  return self->_data;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithURL:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_2(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_1B96E5000, v1, v2, "Fail to open file=%@ with error=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6();
}

- (void)initWithURL:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_2(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_1B96E5000, v1, v2, "Fail to read file statistics of file=%@ with error=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6();
}

- (void)initWithURL:.cold.3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_2(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_1B96E5000, v1, v2, "Fail to mmap file=%@ with error=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_6();
}

- (void)initWithURL:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a2, a3, "%@u is not reguar file", (uint8_t *)&v3);
}

@end
