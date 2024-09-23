@implementation NTKAppleEncryptedArchiveDiskExtractionHandle

- (NTKAppleEncryptedArchiveDiskExtractionHandle)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 outputDirectoryURL:(id)a5 fileProtection:(id)a6
{
  id v10;
  id v11;
  NTKAppleEncryptedArchiveDiskExtractionHandle *v12;
  uint64_t v13;
  NSURL *outputDirectoryURL;
  uint64_t v15;
  NSString *fileProtection;
  objc_super v18;

  v10 = a5;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractionHandle;
  v12 = -[NTKAppleEncryptedArchiveHandle initWithArchiveURL:symmetricKey:](&v18, sel_initWithArchiveURL_symmetricKey_, a3, a4);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    outputDirectoryURL = v12->_outputDirectoryURL;
    v12->_outputDirectoryURL = (NSURL *)v13;

    v15 = objc_msgSend(v11, "copy");
    fileProtection = v12->_fileProtection;
    v12->_fileProtection = (NSString *)v15;

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  AAArchiveStreamClose(self->_outputStream);
  self->_outputStream = 0;
  v3.receiver = self;
  v3.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractionHandle;
  -[NTKAppleEncryptedArchiveHandle dealloc](&v3, sel_dealloc);
}

- (AAArchiveStream_impl)archiveStream
{
  return self->super._archiveStream;
}

- (AAArchiveStream_impl)outputStream
{
  return self->_outputStream;
}

- (AAArchiveStream_impl)openReturningError:(id *)a3
{
  AAArchiveStream_impl *result;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  id v11;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractionHandle;
  result = -[NTKAppleEncryptedArchiveHandle openReturningError:](&v13, sel_openReturningError_);
  if (result)
  {
    -[NSURL absoluteURL](self->_outputDirectoryURL, "absoluteURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
    -[NTKAppleEncryptedArchiveHandle archiveEntryEvent](self, "archiveEntryEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_outputStream = AAExtractArchiveOutputStreamOpen(v8, v9, (AAEntryMessageProc)invokeBlockForArchiveEvent, 0xC010000000000001, 0);

    result = self->_outputStream;
    if (!result)
    {
      v12.receiver = self;
      v12.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractionHandle;
      -[NTKAppleEncryptedArchiveHandle closeReturningError:](&v12, sel_closeReturningError_, 0);
      if (a3)
      {
        if (*a3)
        {
          v10 = objc_retainAutorelease(*a3);
          result = 0;
          *a3 = v10;
          return result;
        }
        -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 4);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a3 = v11;

      }
      return 0;
    }
  }
  return result;
}

- (BOOL)closeReturningError:(id *)a3
{
  int v5;
  BOOL v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  id v15;

  v5 = AAArchiveStreamClose(self->_outputStream);
  v6 = v5 == 0;
  if (v5)
  {
    -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  self->_outputStream = 0;
  v14.receiver = self;
  v14.super_class = (Class)NTKAppleEncryptedArchiveDiskExtractionHandle;
  v15 = 0;
  v8 = -[NTKAppleEncryptedArchiveHandle closeReturningError:](&v14, sel_closeReturningError_, &v15);
  v9 = v15;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (v7)
      v11 = v7;
    else
      v11 = v9;
    v12 = v11;

    v6 = 0;
    v7 = v12;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v7);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProtection, 0);
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
}

@end
