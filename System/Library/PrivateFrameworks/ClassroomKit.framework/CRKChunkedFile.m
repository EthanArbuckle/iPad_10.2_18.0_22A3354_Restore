@implementation CRKChunkedFile

+ (void)assertFileDescriptorIsValid:(int)a3
{
  id v5;

  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKChunkedFile.m"), 25, CFSTR("Negative file descriptor"));

  }
}

+ (int64_t)preferredChunkSizeForFileDescriptor:(int)a3
{
  blksize_t st_blksize;
  stat v6;
  statfs v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "assertFileDescriptorIsValid:");
  memset(&v7, 0, 512);
  memset(&v6, 0, sizeof(v6));
  if (fstatfs(a3, &v7) == -1)
  {
    if (fstat(a3, &v6) == -1)
      return -1;
    st_blksize = v6.st_blksize;
  }
  else
  {
    st_blksize = v7.f_iosize;
  }
  if (st_blksize > 0)
    return st_blksize;
  return -1;
}

- (CRKChunkedFile)init
{
  return -[CRKChunkedFile initWithFileDescriptor:](self, "initWithFileDescriptor:", 0);
}

- (CRKChunkedFile)initWithFileDescriptor:(int)a3
{
  CRKChunkedFile *result;
  objc_super v6;

  objc_msgSend((id)objc_opt_class(), "assertFileDescriptorIsValid:", *(_QWORD *)&a3);
  v6.receiver = self;
  v6.super_class = (Class)CRKChunkedFile;
  result = -[CRKChunkedFile init](&v6, sel_init);
  if (result)
    result->mFileDescriptor = a3;
  return result;
}

- (int64_t)readNextChunkIntoBuffer:(id)a3 error:(id *)a4
{
  id v7;
  unint64_t v8;
  id v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  unint64_t v14;
  int64_t v15;
  void *v17;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKChunkedFile.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("buffer"));

  }
  v8 = objc_msgSend(v7, "length");
  v9 = objc_retainAutorelease(v7);
  v10 = (char *)objc_msgSend(v9, "mutableBytes");
  v11 = objc_msgSend(v9, "length");
  while (2)
  {
    if (v11)
    {
      if (v8 >= v11)
        v12 = v11;
      else
        v12 = v8;
      if (v12 >= 0x7FFFFFFF)
        v13 = 0x7FFFFFFFLL;
      else
        v13 = v12;
      while (1)
      {
        v14 = read(self->mFileDescriptor, v10, v13);
        if ((v14 & 0x8000000000000000) == 0)
          break;
        if (*__error() != 4)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          v15 = -1;
          goto LABEL_20;
        }
      }
      if (v14)
      {
        v11 -= v14;
        v10 += v14;
        if (v14 >= v13)
          continue;
      }
    }
    break;
  }
  v15 = v8 - v11;
LABEL_20:

  return v15;
}

@end
