@implementation _OSLogChunkFile

- (void)dealloc
{
  void *ptr;
  objc_super v4;

  ptr = (void *)self->super._ptr;
  if (ptr && munmap(ptr, self->super._sz) == -1)
  {
    __error();
    _os_assumes_log();
  }
  v4.receiver = self;
  v4.super_class = (Class)_OSLogChunkFile;
  -[_OSLogChunkFile dealloc](&v4, sel_dealloc);
}

- (_OSLogChunkFile)initWithFileDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  _OSLogChunkFile *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _OSLogChunkFile *v20;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[129];

  v24[128] = *MEMORY[0x1E0C80C00];
  v24[0] = 0;
  v7 = _os_trace_mmap();
  if (v7)
  {
    v8 = v7;
    v9 = v24[0];
    if (fcntl(a3, 50, v24, 1024) == -1)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathComponents");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      v13 = v12 - 1;
      if (v12 > 1)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v12 - 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB3940];
        v23[0] = v16;
        v23[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "pathWithComponents:", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("filePathAssemblerError"), -1, 0);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }

      if (v14)
      {
        v22.receiver = self;
        v22.super_class = (Class)_OSLogChunkFile;
        v20 = -[_OSLogChunkStore initWithBytes:size:](&v22, sel_initWithBytes_size_, v8, v9);
        self = v20;
        if (v20)
        {
          -[_OSLogChunkStore setFileName:](v20, "setFileName:", v14);
          self = self;
          v15 = self;
LABEL_18:

          goto LABEL_19;
        }
      }
    }
    v15 = 0;
    goto LABEL_18;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = 0;
LABEL_19:

  return v15;
}

@end
