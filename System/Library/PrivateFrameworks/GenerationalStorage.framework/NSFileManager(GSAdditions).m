@implementation NSFileManager(GSAdditions)

- (id)gs_createTemporarySubdirectoryOfItem:()GSAdditions withTemplate:error:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  char v16[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = open(".", 256);
  if ((v9 & 0x80000000) != 0 && *__error() != 1)
  {
    v14 = 0;
    v12 = -1;
    if (!a5)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = objc_retainAutorelease(v7);
  v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0);
  v12 = v11;
  if ((v11 & 0x80000000) == 0 && (MEMORY[0x1D82589EC](v11) & 0x80000000) == 0)
  {
    if ((objc_msgSend(v8, "getFileSystemRepresentation:maxLength:", v16, 1024) & 1) == 0)
    {
      v14 = 0;
      *__error() = 63;
      if (a5)
        goto LABEL_12;
      goto LABEL_13;
    }
    if (mkdtemp(v16))
    {
      MEMORY[0x1D82589EC](v9);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingPathComponent:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!a5)
        goto LABEL_13;
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  v14 = 0;
  if (a5)
    goto LABEL_12;
LABEL_13:
  if (v12 >= 1)
    close(v12);
  if ((int)v9 >= 1)
    close(v9);

  return v14;
}

@end
