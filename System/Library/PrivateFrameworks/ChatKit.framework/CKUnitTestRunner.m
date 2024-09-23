@implementation CKUnitTestRunner

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_98);
  return (id)sharedInstance_sRunner;
}

void __34__CKUnitTestRunner_sharedInstance__block_invoke()
{
  CKUnitTestRunner *v0;
  void *v1;

  v0 = objc_alloc_init(CKUnitTestRunner);
  v1 = (void *)sharedInstance_sRunner;
  sharedInstance_sRunner = (uint64_t)v0;

}

- (void)runUnitTestBundleAtPath:(id)a3 writeToFile:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;

  v4 = a4;
  v6 = a3;
  -[CKUnitTestRunner setShouldWrite:](self, "setShouldWrite:", v4);
  v7 = objc_alloc_init(MEMORY[0x1E0D39B68]);
  objc_msgSend(v7, "setDelegate:", self);
  -[CKUnitTestRunner setRunner:](self, "setRunner:", v7);
  if (v4)
  {
    objc_msgSend(v6, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Results.log"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/tmp/"), "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeItemAtPath:error:", v11, 0);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MobileSMS invoking App test for %@\n"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v15, "writeToFile:atomically:encoding:error:", v11, 1, 4, &v23);
    v16 = v23;
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || v16)
      NSLog(CFSTR("|--ERROR: Failed to generate file handle at path %@. %@--|"), v11, v16);
    -[CKUnitTestRunner setFileHandle:](self, "setFileHandle:", v17);

  }
  v22 = 0;
  objc_msgSend(v7, "runTestsInBundleAtPath:error:", v6, &v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v22;
  -[CKUnitTestRunner _dumpResults:](self, "_dumpResults:", v18);
  -[CKUnitTestRunner fileHandle](self, "fileHandle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[CKUnitTestRunner fileHandle](self, "fileHandle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "closeFile");

  }
  if ((objc_msgSend(v18, "hasSucceeded") & 1) != 0)
    exit(0);
  exit(objc_msgSend(v18, "failureCount"));
}

- (void)_dumpResults:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = objc_msgSend(v5, "testCaseCount");
  v7 = objc_msgSend(v5, "failureCount");
  v8 = objc_msgSend(v5, "hasSucceeded");

  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\n|-----------------Testing Complete--------------------|\n|>>> Test Cases %tu\n|>>> Failed Tests %lu\n|>>> Suite Passed %@\n|-----------------------------------------------------|"), v6, v7, v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CKUnitTestRunner fileHandle](self, "fileHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "seekToEndOfFile");

  objc_msgSend(v13, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKUnitTestRunner fileHandle](self, "fileHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "writeData:", v11);

}

- (void)unitTestRunner:(id)a3 didReceiveOutput:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (-[CKUnitTestRunner shouldWrite](self, "shouldWrite")
    && (-[CKUnitTestRunner fileHandle](self, "fileHandle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[CKUnitTestRunner fileHandle](self, "fileHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "seekToEndOfFile");

    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKUnitTestRunner fileHandle](self, "fileHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);

  }
  else
  {
    NSLog(CFSTR("%@"), v9);
  }

}

- (IMUnitTestRunner)runner
{
  return self->_runner;
}

- (void)setRunner:(id)a3
{
  objc_storeStrong((id *)&self->_runner, a3);
}

- (BOOL)shouldWrite
{
  return self->_shouldWrite;
}

- (void)setShouldWrite:(BOOL)a3
{
  self->_shouldWrite = a3;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_runner, 0);
}

@end
