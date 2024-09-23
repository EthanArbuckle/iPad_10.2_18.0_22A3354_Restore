@implementation MDLMemoryMappedData

- (MDLMemoryMappedData)initWithURL:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  id v8;
  MDLMemoryMappedData *v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  FILE *file;
  off_t v18;
  unint64_t v19;
  size_t v20;
  int v21;
  char *v22;
  objc_super v24;

  v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MDLMemoryMappedData;
  v9 = -[MDLMemoryMappedData init](&v24, sel_init);
  if (v9)
  {
    v10 = sysconf(29);
    objc_msgSend_path(v8, v11, v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
    v9->_file = fopen(v16, "r");

    file = v9->_file;
    if (file)
    {
      v18 = a4 / v10 * v10;
      v19 = a4 - v18;
      v20 = a4 - v18 + a5;
      v9->_mappedFileSize = v20;
      v21 = fileno(file);
      v22 = (char *)mmap(0, v20, 1, 2, v21, v18);
      v9->_mappedAddr = v22;
      if (v22)
      {
        v9->_fileStart = &v22[v19];
        v9->_length = a5;
      }
    }
  }

  return v9;
}

- (void)dealloc
{
  char *mappedAddr;
  int v4;
  FILE *file;
  objc_super v6;

  mappedAddr = self->_mappedAddr;
  if (mappedAddr)
  {
    v4 = munmap(mappedAddr, self->_mappedFileSize);
    if (v4)
      printf("Could not unmap file - error (%d)\n", v4);
  }
  file = self->_file;
  if (file)
    fclose(file);
  v6.receiver = self;
  v6.super_class = (Class)MDLMemoryMappedData;
  -[MDLMemoryMappedData dealloc](&v6, sel_dealloc);
}

- (id)dataNoCopy
{
  char *fileStart;
  void *v3;

  fileStart = self->_fileStart;
  if (fileStart)
  {
    objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], a2, (uint64_t)fileStart, self->_length, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
