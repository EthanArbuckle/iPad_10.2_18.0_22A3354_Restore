@implementation BUTemporaryDirectory

- (BUTemporaryDirectory)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BUTemporaryDirectory init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v5, v3, v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BUTemporaryDirectory)initWithError:(id *)a3
{
  return (BUTemporaryDirectory *)MEMORY[0x24BEDD108](self, sel_initWithSignature_subdirectory_error_, &stru_24CEDBD58);
}

- (BUTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4
{
  return (BUTemporaryDirectory *)MEMORY[0x24BEDD108](self, sel_initWithSignature_subdirectory_error_, a3);
}

- (BUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BUTemporaryDirectory *v10;
  const char *v11;
  BUTemporaryDirectory *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BUTemporaryDirectory;
  v10 = -[BUTemporaryDirectory init](&v14, sel_init);
  v12 = v10;
  if (v10 && (objc_msgSend__createDirectoryWithSignature_subdirectory_error_(v10, v11, (uint64_t)v8, v9, a5) & 1) == 0)
  {

    v12 = 0;
  }

  return v12;
}

- (id)initForWritingToURL:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  BUTemporaryDirectory *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *path;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BUTemporaryDirectory;
  v9 = -[BUTemporaryDirectory init](&v18, sel_init);
  if (v9)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(v10, v11, 99, 1, v6, 1, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_path(v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    path = v9->_path;
    v9->_path = (NSString *)v15;

    if (!v12)
    {

      v9 = 0;
    }

  }
  return v9;
}

- (void)dealloc
{
  uint64_t v2;
  NSObject *v4;
  NSString *path;
  const char *v6;
  char v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  char isNoSuchFileError;
  objc_super v13;
  id v14;

  if (!self->_leak)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    path = self->_path;
    v14 = 0;
    v7 = objc_msgSend_removeItemAtPath_error_(v4, v6, (uint64_t)path, &v14);
    v8 = v14;
    v11 = v8;
    if ((v7 & 1) == 0)
    {
      isNoSuchFileError = objc_msgSend_bu_isNoSuchFileError(v8, v9, v10);

      if ((isNoSuchFileError & 1) != 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      BUZipLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_212E6BFAC((uint64_t)v11, (uint64_t *)&self->_path, v4);
    }

    goto LABEL_7;
  }
LABEL_8:
  v13.receiver = self;
  v13.super_class = (Class)BUTemporaryDirectory;
  -[BUTemporaryDirectory dealloc](&v13, sel_dealloc);
}

- (id)path
{
  return self->_path;
}

- (id)URL
{
  return (id)objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x24BDBCF48], a2, (uint64_t)self->_path, 1);
}

- (void)leakTemporaryDirectory
{
  self->_leak = 1;
}

- (BOOL)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  __CFString *v8;
  id v9;
  __CFString *v10;
  const char *v11;
  double Current;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  char v30;
  id v31;
  const char *v32;
  id v33;
  id v35;

  v8 = (__CFString *)a3;
  v9 = a4;
  if (v8)
    v10 = v8;
  else
    v10 = &stru_24CEDBD58;
  if (qword_254B69F38 != -1)
    dispatch_once(&qword_254B69F38, &unk_24CED99E8);
  Current = CFAbsoluteTimeGetCurrent();
  v13 = (void *)qword_254B69F30;
  do
  {
    v14 = __ldaxr((unsigned int *)&unk_254B69F40);
    v15 = v14 + 1;
  }
  while (__stlxr(v15, (unsigned int *)&unk_254B69F40));
  objc_msgSend_stringByAppendingFormat_(v13, v11, (uint64_t)CFSTR("_%@_%d_%d"), v10, (int)Current, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_length(v16, v17, v18) >= 0x100)
  {
    objc_msgSend_substringToIndex_(v16, v19, 255);
    v20 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v20;
  }
  NSTemporaryDirectory();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21;
  if (v9)
  {
    objc_msgSend_stringByAppendingPathComponent_(v21, v22, (uint64_t)v9);
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v24;
  }
  objc_msgSend_stringByAppendingPathComponent_(v23, v22, (uint64_t)v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v30 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v28, v29, (uint64_t)v25, 1, 0, &v35);
  v31 = v35;

  objc_storeStrong((id *)&self->_path, v25);
  if (a5 && (v30 & 1) == 0)
  {
    if (v31)
    {
      *a5 = objc_retainAutorelease(v31);
    }
    else
    {
      objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x24BDD1540], v32, 0);
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v33;

    }
  }

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
