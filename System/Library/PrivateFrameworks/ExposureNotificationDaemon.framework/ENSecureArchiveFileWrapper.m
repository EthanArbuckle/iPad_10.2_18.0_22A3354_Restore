@implementation ENSecureArchiveFileWrapper

- (BOOL)openWithError:(id *)a3
{
  BOOL result;
  int v6;
  int v7;
  void *v8;
  id v9;

  if ((self->_fileDescriptor & 0x80000000) == 0)
    return 1;
  v6 = open_dprotected_np(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), 514, 2, 0, 384);
  self->_fileDescriptor = v6;
  result = v6 >= 0;
  if (a3 && v6 < 0)
  {
    if (*__error())
    {
      v7 = *__error();
      if (v7 == 1)
      {
        ENErrorF();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v9 = v8;
        result = 0;
        *a3 = v9;
        return result;
      }
    }
    else
    {
      v7 = -6700;
    }
    objc_msgSend(MEMORY[0x1E0CB35C0], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F98], v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  return result;
}

- (ENSecureArchiveFileWrapper)initWithPath:(id)a3
{
  id v5;
  ENSecureArchiveFileWrapper *v6;
  uint64_t v7;
  NSString *path;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENSecureArchiveFileWrapper.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path.length > 0"));

  }
  v11.receiver = self;
  v11.super_class = (Class)ENSecureArchiveFileWrapper;
  v6 = -[ENSecureArchiveFileWrapper init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    path = v6->_path;
    v6->_path = (NSString *)v7;

    v6->_fileDescriptor = -1;
  }

  return v6;
}

- (void)close
{
  int fileDescriptor;

  fileDescriptor = self->_fileDescriptor;
  if ((fileDescriptor & 0x80000000) == 0)
  {
    if (close(fileDescriptor)
      && gLogCategory_ENFileWrapper <= 90
      && (gLogCategory_ENFileWrapper != -1 || _LogCategory_Initialize()))
    {
      __error();
      LogPrintF_safe();
    }
    self->_fileDescriptor = -1;
  }
}

- (BOOL)readObject:(id *)a3 ofClasses:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  int v17;
  BOOL v18;
  id v19;
  id v21;
  id v22;
  id v23;

  v8 = a4;
  if (-[ENSecureArchiveFileWrapper openWithError:](self, "openWithError:", a5))
  {
    v9 = (void *)MEMORY[0x1D17A7CB8]();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3610]), "initWithFileDescriptor:closeOnDealloc:", self->_fileDescriptor, 0);
    v23 = 0;
    v11 = objc_msgSend(v10, "seekToOffset:error:", 0, &v23);
    v12 = v23;
    if ((v11 & 1) != 0)
    {
      v22 = 0;
      objc_msgSend(v10, "readDataToEndOfFileAndReturnError:", &v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v22;

      if (v13)
      {
        if (objc_msgSend(v13, "length"))
        {
          v21 = v14;
          objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClasses:fromData:error:", v8, v13, &v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v21;

          v17 = 0;
          v14 = v16;
        }
        else
        {
          v15 = 0;
          v17 = 1;
        }
      }
      else
      {
        v15 = 0;
        v17 = 0;
      }

      objc_autoreleasePoolPop(v9);
      if (v15)
      {
        v19 = objc_retainAutorelease(v15);
        *a3 = v19;
LABEL_15:
        v18 = 1;
        goto LABEL_18;
      }
      if (v17)
      {
        v19 = 0;
        *a3 = 0;
        goto LABEL_15;
      }
      v12 = v14;
      if (!a5)
      {
LABEL_17:
        v19 = 0;
        v18 = 0;
        v14 = v12;
        goto LABEL_18;
      }
    }
    else
    {

      objc_autoreleasePoolPop(v9);
      if (!a5)
        goto LABEL_17;
    }
    v14 = objc_retainAutorelease(v12);
    v19 = 0;
    v18 = 0;
    *a5 = v14;
LABEL_18:

    goto LABEL_19;
  }
  v18 = 0;
LABEL_19:

  return v18;
}

- (BOOL)readObject:(id *)a3 ofClass:(Class)a4 error:(id *)a5
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E68], "setWithObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[ENSecureArchiveFileWrapper readObject:ofClasses:error:](self, "readObject:ofClasses:error:", a3, v8, a5);

  return (char)a5;
}

- (BOOL)saveObject:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  uint64_t fileDescriptor;
  BOOL v10;
  id v11;
  id v13;

  v6 = a3;
  v7 = -[ENSecureArchiveFileWrapper openWithError:](self, "openWithError:", a4);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17A7CB8]();
    fileDescriptor = self->_fileDescriptor;
    v13 = 0;
    v10 = -[ENSecureArchiveFileWrapper _writeObject:toFileDescriptor:error:](self, "_writeObject:toFileDescriptor:error:", v6, fileDescriptor, &v13);
    v11 = v13;
    objc_autoreleasePoolPop(v8);
    if (a4 && !v10)
      *a4 = objc_retainAutorelease(v11);

  }
  return v7;
}

- (BOOL)_writeObject:(id)a3 toFileDescriptor:(int)a4 error:(id *)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v6 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3610]), "initWithFileDescriptor:closeOnDealloc:", v6, 0);
    if (objc_msgSend(v8, "seekToOffset:error:", 0, a5)
      && objc_msgSend(v8, "truncateAtOffset:error:", 0, a5))
    {
      v9 = objc_msgSend(v8, "writeData:error:", v7, a5);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
