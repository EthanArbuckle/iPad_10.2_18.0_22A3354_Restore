@implementation NSURL(CRKAdditions)

+ (id)crk_uniqueTemporaryDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)crk_uniqueTemporaryFileURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "crk_uniqueTemporaryDirectoryURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)crk_escapedPath
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)crk_isBundle
{
  uint64_t v2;
  int v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v9;
  id v10;

  v10 = 0;
  v2 = *MEMORY[0x24BDBCC60];
  v9 = 0;
  v3 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v10, v2, &v9);
  v4 = v10;
  v5 = v9;
  if (v3)
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    if (_CRKLogGeneral_onceToken_20 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_20, &__block_literal_global_62);
    v7 = (void *)_CRKLogGeneral_logObj_20;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_20, OS_LOG_TYPE_ERROR))
      -[NSURL(CRKAdditions) crk_isBundle].cold.1(v7, a1, (uint64_t)v5);
    v6 = 0;
  }

  return v6;
}

- (void)crk_isBundle
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a3;
  _os_log_error_impl(&dword_218C99000, v5, OS_LOG_TYPE_ERROR, "Failed to check if %{public}@ is a directory. Error: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
