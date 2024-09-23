@implementation HMCameraClipFetchAssetContextOperationDataSource

- (id)dataTaskWithURL:(id)a3 httpHeaderFields:(id)a4
{
  id v5;
  id v6;
  HMCameraClipDownloadAssetDataTask *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMCameraClipDownloadAssetDataTask initWithURL:httpHeaderFields:]([HMCameraClipDownloadAssetDataTask alloc], "initWithURL:httpHeaderFields:", v6, v5);

  return v7;
}

- (id)dataFromEncryptedDataContext:(id)a3 usingDecryptionManager:(id)a4
{
  return (id)objc_msgSend(a4, "dataFromEncryptedDataContext:", a3);
}

- (BOOL)writeData:(id)a3 toFileURL:(id)a4 error:(id *)a5
{
  return objc_msgSend(a3, "writeToURL:options:error:", a4, 0, a5);
}

- (id)outputStreamToFileAtURL:(id)a3 shouldAppend:(BOOL)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamWithURL:append:", a3, a4);
}

- (id)createTemporaryDirectoryAppropriateForURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v6, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CB3620];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "removeItemAtURL:error:", v6, a4);

  return (char)a4;
}

- (id)createVideoFileCombinerWithVideoFileURLs:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  HMCameraClipVideoFileCombiner *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMCameraClipVideoFileCombiner initWithVideoFileURLs:queue:]([HMCameraClipVideoFileCombiner alloc], "initWithVideoFileURLs:queue:", v6, v5);

  return v7;
}

@end
