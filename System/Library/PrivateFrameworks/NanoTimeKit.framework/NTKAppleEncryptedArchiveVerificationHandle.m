@implementation NTKAppleEncryptedArchiveVerificationHandle

- (NTKAppleEncryptedArchiveVerificationHandle)initWithArchiveURL:(id)a3 symmetricKey:(id)a4 outputDirectoryURL:(id)a5 excludeFields:(id)a6
{
  id v10;
  id v11;
  NTKAppleEncryptedArchiveVerificationHandle *v12;
  uint64_t v13;
  NSURL *outputDirectoryURL;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)NTKAppleEncryptedArchiveVerificationHandle;
  v12 = -[NTKAppleEncryptedArchiveHandle initWithArchiveURL:symmetricKey:](&v19, sel_initWithArchiveURL_symmetricKey_, a3, a4);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    outputDirectoryURL = v12->_outputDirectoryURL;
    v12->_outputDirectoryURL = (NSURL *)v13;

    objc_msgSend(v11, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(","));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v16);
    v12->_excludeFields = AAFieldKeySetCreateWithString((const char *)objc_msgSend(v17, "fileSystemRepresentation"));

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  AAArchiveStreamClose(self->_verificationStream);
  AAFieldKeySetDestroy(self->_excludeFields);
  v3.receiver = self;
  v3.super_class = (Class)NTKAppleEncryptedArchiveVerificationHandle;
  -[NTKAppleEncryptedArchiveHandle dealloc](&v3, sel_dealloc);
}

- (AAArchiveStream_impl)archiveStream
{
  return self->_archiveStream;
}

- (AAArchiveStream_impl)verificationStream
{
  return self->_verificationStream;
}

- (AAArchiveStream_impl)openReturningError:(id *)a3
{
  AAArchiveStream_impl *result;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKAppleEncryptedArchiveVerificationHandle;
  result = -[NTKAppleEncryptedArchiveHandle openReturningError:](&v12, sel_openReturningError_);
  self->_archiveStream = result;
  if (result)
  {
    -[NSURL absoluteURL](self->_outputDirectoryURL, "absoluteURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "fileSystemRepresentation");
    -[NTKAppleEncryptedArchiveHandle archiveEntryEvent](self, "archiveEntryEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_verificationStream = (AAArchiveStream_impl *)AAVerifyDirectoryArchiveOutputStreamOpen();

    result = self->_verificationStream;
    if (!result)
    {
      v11.receiver = self;
      v11.super_class = (Class)NTKAppleEncryptedArchiveVerificationHandle;
      -[NTKAppleEncryptedArchiveHandle closeReturningError:](&v11, sel_closeReturningError_, 0);
      if (a3)
      {
        if (*a3)
        {
          v9 = objc_retainAutorelease(*a3);
          result = 0;
          *a3 = v9;
          return result;
        }
        -[NTKAppleEncryptedArchiveHandle errorWithCode:](self, 4);
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a3 = v10;

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

  v5 = AAArchiveStreamClose(self->_verificationStream);
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
  self->_verificationStream = 0;
  AAFieldKeySetDestroy(self->_excludeFields);
  self->_excludeFields = 0;
  v14.receiver = self;
  v14.super_class = (Class)NTKAppleEncryptedArchiveVerificationHandle;
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
  objc_storeStrong((id *)&self->_outputDirectoryURL, 0);
}

@end
