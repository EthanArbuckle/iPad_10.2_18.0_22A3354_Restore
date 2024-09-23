@implementation DMCFileAccessRepairTool

- (BOOL)fileNeedsRepairAtPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DMCFileAccessRepairTool fileManager](self, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (v6)
  {
    v7 = -[DMCFileAccessRepairTool fileManagerThinksFileNeedsRepairAtPath:](self, "fileManagerThinksFileNeedsRepairAtPath:", v4);
    v8 = -[DMCFileAccessRepairTool posixThinksFileNeedsRepairAtPath:](self, "posixThinksFileNeedsRepairAtPath:", v4);
    if (v7 != v8)
    {
      v9 = DMCLogObjects()[3];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        DMCStringForBool(v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        DMCStringForBool(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = v11;
        v17 = 2114;
        v18 = v12;
        v19 = 2114;
        v20 = v4;
        _os_log_impl(&dword_1A4951000, v10, OS_LOG_TYPE_INFO, "File Manager (%{public}@) and POSIX (%{public}@) disagree on whether a file (%{public}@) needs repair.", (uint8_t *)&v15, 0x20u);

      }
    }
    v13 = v7 | v8;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)fileManagerThinksFileNeedsRepairAtPath:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[DMCFileAccessRepairTool fileManager](self, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReadableFileAtPath:", v4);

  return v6 ^ 1;
}

- (NSFileManager)fileManager
{
  NSFileManager *fileManager;
  NSFileManager *v4;
  NSFileManager *v5;

  fileManager = self->_fileManager;
  if (!fileManager)
  {
    -[DMCFileAccessRepairTool createFileManager](self, "createFileManager");
    v4 = (NSFileManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fileManager;
    self->_fileManager = v4;

    fileManager = self->_fileManager;
  }
  return fileManager;
}

- (BOOL)posixThinksFileNeedsRepairAtPath:(id)a3
{
  int v5;

  v5 = 0;
  return -[DMCFileAccessRepairTool accessAtPath:mode:error:](self, "accessAtPath:mode:error:", objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), 4, &v5) < 0&& v5 == 13;
}

- (BOOL)repairFileAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v6 = a3;
  if (-[DMCFileAccessRepairTool changePermissions:ofFileAtPath:](self, "changePermissions:ofFileAtPath:", 420, v6))
  {
    -[DMCFileAccessRepairTool contentsOfFileAtPath:](self, "contentsOfFileAtPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = -[DMCFileAccessRepairTool writeData:toFileAtPath:](self, "writeData:toFileAtPath:", v7, v6);
      v9 = v8;
      if (!a4 || v8)
        goto LABEL_13;
      v10 = 3;
    }
    else
    {
      if (!a4)
      {
        v9 = 0;
        goto LABEL_13;
      }
      v10 = 2;
    }
    -[DMCFileAccessRepairTool createRepairToolErrorWithCode:](self, "createRepairToolErrorWithCode:", v10);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  if (a4)
  {
    -[DMCFileAccessRepairTool createRepairToolErrorWithCode:](self, "createRepairToolErrorWithCode:", 1);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (id)createRepairToolErrorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCFileAccessRepairToolErrorDomain"), a3, 0);
}

- (id)createFileManager
{
  return objc_alloc_init(MEMORY[0x1E0CB3620]);
}

- (int)accessAtPath:(const char *)a3 mode:(int)a4 error:(int *)a5
{
  int v8;

  *__error() = 0;
  v8 = access(a3, a4);
  if (v8 < 0)
    *a5 = *__error();
  return v8;
}

- (BOOL)changePermissions:(unsigned __int16)a3 ofFileAtPath:(id)a4
{
  return chmod((const char *)objc_msgSend(objc_retainAutorelease(a4), "fileSystemRepresentation"), a3) == 0;
}

- (id)contentsOfFileAtPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", a3);
}

- (BOOL)writeData:(id)a3 toFileAtPath:(id)a4
{
  return objc_msgSend(a3, "DMCAtomicWriteToPath:error:", a4, 0);
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
