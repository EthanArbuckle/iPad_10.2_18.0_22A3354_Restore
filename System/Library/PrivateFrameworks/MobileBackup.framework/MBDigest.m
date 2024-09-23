@implementation MBDigest

+ (id)sha1
{
  return objc_alloc_init(MBDigestSHA1);
}

+ (id)sha256
{
  return objc_alloc_init(MBDigestSHA256);
}

+ (id)sha256ForData:(id)a3
{
  return (id)objc_msgSend(+[MBDigest sha256](MBDigest, "sha256"), "digestForData:", a3);
}

+ (id)sha256ForFileAtPath:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(+[MBDigest sha256](MBDigest, "sha256"), "digestForFileAtPath:error:", a3, a4);
}

+ (id)sha1ForData:(id)a3
{
  return (id)objc_msgSend(+[MBDigest sha1](MBDigest, "sha1"), "digestForData:", a3);
}

+ (id)sha1ForFileAtPath:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(+[MBDigest sha1](MBDigest, "sha1"), "digestForFileAtPath:error:", a3, a4);
}

+ (id)sha1ForString:(id)a3
{
  return (id)objc_msgSend(+[MBDigest sha1](MBDigest, "sha1"), "digestForString:", a3);
}

+ (id)sha1HmacForString:(id)a3 key:(id)a4
{
  _BYTE v7[20];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MBDigest.m"), 64, CFSTR("No key specified to sha1HmacForString"));
  objc_msgSend(a4, "bytes");
  objc_msgSend(a4, "length");
  objc_msgSend(a3, "UTF8String");
  objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4);
  CCHmacOneShot();
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, 20);
}

+ (int64_t)simpleChecksumForString:(id)a3
{
  return MBSimpleChecksumForString(a3);
}

- (id)digestForData:(id)a3
{
  -[MBDigest updateWithData:](self, "updateWithData:", a3);
  return -[MBDigest final](self, "final");
}

- (id)digestForFileAtPath:(id)a3 error:(id *)a4
{
  if (-[MBDigest updateWithFile:error:](self, "updateWithFile:error:", a3, a4))
    return -[MBDigest final](self, "final");
  else
    return 0;
}

- (id)digestForString:(id)a3
{
  -[MBDigest updateWithString:](self, "updateWithString:", a3);
  return -[MBDigest final](self, "final");
}

- (void)updateWithInt32:(int)a3
{
  int v3;

  v3 = a3;
  -[MBDigest updateWithBytes:length:](self, "updateWithBytes:length:", &v3, 4);
}

- (void)updateWithInt64:(int64_t)a3
{
  int64_t v3;

  v3 = a3;
  -[MBDigest updateWithBytes:length:](self, "updateWithBytes:length:", &v3, 8);
}

- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4
{
  -[MBDigest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)updateWithData:(id)a3
{
  if (a3)
  {
    if (objc_msgSend(a3, "length"))
      -[MBDigest updateWithBytes:length:](self, "updateWithBytes:length:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
  }
}

- (void)updateWithDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  -[MBDigest updateWithInt64:](self, "updateWithInt64:", (uint64_t)v4);
}

- (BOOL)updateWithFile:(id)a3 error:(id *)a4
{
  int v7;
  int v8;
  int v9;
  int v10;
  MBError *v11;
  MBError *v12;
  BOOL v13;
  unint64_t v14;
  off_t st_size;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  off_t v21;
  void *v22;
  void *v23;
  size_t v24;
  stat v26;

  if (!a3)
    -[MBDigest updateWithFile:error:].cold.1();
  v7 = getpagesize();
  if (!v7)
    -[MBDigest updateWithFile:error:].cold.2();
  v8 = v7;
  v9 = open((const char *)objc_msgSend(a3, "fileSystemRepresentation"), 256);
  if (v9 != -1)
  {
    v10 = v9;
    memset(&v26, 0, sizeof(v26));
    if (fstat(v9, &v26))
    {
      v11 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", a3, CFSTR("Failed to fstat src file"));
    }
    else if ((v26.st_mode & 0xF000) == 0x8000)
    {
      v14 = v8;
      st_size = v26.st_size;
      v16 = v26.st_size % (unint64_t)v8;
      if (v16)
        v17 = v8 - v16;
      else
        v17 = 0;
      v18 = v17 + v26.st_size;
      if (v18 >= (uint64_t)v8 << 15)
        v19 = (uint64_t)v8 << 15;
      else
        v19 = v18;
      if (v19 <= v8)
        v20 = v8;
      else
        v20 = v19;
      if (v26.st_size < 1)
      {
LABEL_27:
        v12 = 0;
        v13 = 1;
        goto LABEL_31;
      }
      v21 = 0;
      while (1)
      {
        v22 = mmap(0, v20, 1, 2, v10, v21);
        if (v22 == (void *)-1)
          break;
        v23 = v22;
        if (v19 > v14)
          madvise(v22, v20, 2);
        if (st_size - v21 >= v20)
          v24 = v20;
        else
          v24 = st_size - v21;
        -[MBDigest updateWithBytes:length:](self, "updateWithBytes:length:", v23, v24);
        munmap(v23, v20);
        v21 += v24;
        if (v21 >= st_size)
          goto LABEL_27;
      }
      v11 = +[MBError posixErrorWithFormat:](MBError, "posixErrorWithFormat:", CFSTR("Failed to mmap the file at offset:%lld, mapSize:%ld"), v21, v20);
    }
    else
    {
      v11 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 1, a3, CFSTR("Not a regular file"));
    }
    v12 = v11;
    v13 = 0;
LABEL_31:
    close(v10);
    if (!a4)
      return v13;
    goto LABEL_32;
  }
  v12 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", a3, CFSTR("Failed to open src file"));
  v13 = 0;
  if (!a4)
    return v13;
LABEL_32:
  if (!v13)
    *a4 = v12;
  return v13;
}

- (void)updateWithString:(id)a3
{
  size_t v6;
  void *v7;
  uint64_t v8;

  if (a3 && objc_msgSend(a3, "length"))
  {
    v6 = objc_msgSend(a3, "maximumLengthOfBytesUsingEncoding:", 4);
    v7 = malloc_type_malloc(v6, 0x59560A4uLL);
    v8 = 0;
    if ((objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v7, v6, &v8, 4, 0, 0, objc_msgSend(a3, "length"), 0) & 1) == 0)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBDigest.m"), 205, CFSTR("Error encoding string"));
    -[MBDigest updateWithBytes:length:](self, "updateWithBytes:length:", v7, v8);
    free(v7);
  }
}

- (void)finalWithBytes:(void *)a3 length:(unint64_t)a4
{
  -[MBDigest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (id)final
{
  -[MBDigest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)updateWithFile:error:.cold.1()
{
  __assert_rtn("-[MBDigest updateWithFile:error:]", "MBDigest.m", 129, "path");
}

- (void)updateWithFile:error:.cold.2()
{
  __assert_rtn("-[MBDigest updateWithFile:error:]", "MBDigest.m", 132, "pageSize");
}

@end
