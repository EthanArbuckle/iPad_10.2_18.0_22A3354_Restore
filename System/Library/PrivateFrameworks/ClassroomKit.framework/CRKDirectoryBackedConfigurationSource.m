@implementation CRKDirectoryBackedConfigurationSource

- (CRKDirectoryBackedConfigurationSource)init
{
  void *v3;
  void *v4;
  void *v5;
  CRKDirectoryBackedConfigurationSource *v6;

  objc_msgSend(MEMORY[0x24BDBCF48], "crk_uniqueTemporaryFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRKDirectoryBackedConfigurationSource initWithDirectoryURL:fileName:](self, "initWithDirectoryURL:fileName:", v4, v5);

  return v6;
}

- (CRKDirectoryBackedConfigurationSource)initWithDirectoryURL:(id)a3 fileName:(id)a4
{
  return -[CRKDirectoryBackedConfigurationSource initWithDirectoryURL:fileName:callbackQueue:](self, "initWithDirectoryURL:fileName:callbackQueue:", a3, a4, MEMORY[0x24BDAC9B8]);
}

- (CRKDirectoryBackedConfigurationSource)initWithDirectoryURL:(id)a3 fileName:(id)a4 callbackQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKDirectoryBackedConfigurationSource *v12;
  CRKDirectoryBackedConfigurationSource *v13;
  void *v14;
  CRKFileBackedConfigurationSource *v15;
  CRKFileBackedConfigurationSource *mFileBackedSource;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRKDirectoryBackedConfigurationSource;
  v12 = -[CRKDirectoryBackedConfigurationSource init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mDirectoryURL, a3);
    -[NSURL URLByAppendingPathComponent:](v13->mDirectoryURL, "URLByAppendingPathComponent:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CRKFileBackedConfigurationSource initWithFileURL:callbackQueue:]([CRKFileBackedConfigurationSource alloc], "initWithFileURL:callbackQueue:", v14, v11);
    mFileBackedSource = v13->mFileBackedSource;
    v13->mFileBackedSource = v15;

    -[CRKFileBackedConfigurationSource setDelegate:](v13->mFileBackedSource, "setDelegate:", v13);
  }

  return v13;
}

- (void)fetchConfiguration:(id)a3
{
  -[CRKFileBackedConfigurationSource fetchConfiguration:](self->mFileBackedSource, "fetchConfiguration:", a3);
}

- (void)setConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  CRKFileBackedConfigurationSource *mFileBackedSource;
  id v8;
  CRKFileBackedConfigurationSource *v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  mFileBackedSource = self->mFileBackedSource;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__CRKDirectoryBackedConfigurationSource_setConfiguration_completion___block_invoke;
  v10[3] = &unk_24D9C7DA0;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  v9 = mFileBackedSource;
  -[CRKFileBackedConfigurationSource setConfiguration:completion:](v9, "setConfiguration:completion:", a3, v10);

}

void __69__CRKDirectoryBackedConfigurationSource_setConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = *(id *)(a1 + 32);
  v5 = a2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fileBackedConfigurationSource:(id)a3 didDeleteConfigurationAtURL:(id)a4 inDirectory:(id)a5
{
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;

  v6 = a5;
  if (-[CRKDirectoryBackedConfigurationSource isDirectoryEmpty:](self, "isDirectoryEmpty:", v6))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v8 = objc_msgSend(v7, "crk_safeRemoveItemAtURL:error:", v6, &v11);
    v9 = v11;

    if ((v8 & 1) == 0)
    {
      _CRKLogGeneral_18();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CRKDirectoryBackedConfigurationSource fileBackedConfigurationSource:didDeleteConfigurationAtURL:inDirectory:].cold.1(v9);

    }
  }

}

- (BOOL)isDirectoryEmpty:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  id v11;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, MEMORY[0x24BDBD1A8], 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  if (!v6)
  {
    _CRKLogGeneral_18();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CRKDirectoryBackedConfigurationSource isDirectoryEmpty:].cold.1(v7);

  }
  v9 = objc_msgSend(v6, "count") == 0;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFileBackedSource, 0);
  objc_storeStrong((id *)&self->mDirectoryURL, 0);
}

- (void)fileBackedConfigurationSource:(void *)a1 didDeleteConfigurationAtURL:inDirectory:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Failed to delete directory after configuration was removed: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)isDirectoryEmpty:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Failed to check if directory is empty: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
