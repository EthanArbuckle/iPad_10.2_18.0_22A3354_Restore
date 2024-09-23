@implementation WFSecurityScopedFileCoder

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)archiveFileAtURL:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL)a4 withCoder:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v13 = 0;
  objc_msgSend(getFPSandboxingURLWrapperClass(), "wrapperWithURL:readonly:error:", v7, 0, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (!v9)
  {
    getWFFilesLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[WFSecurityScopedFileCoder archiveFileAtURL:fileShouldBeDeletedOnDeallocation:withCoder:]";
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_ERROR, "%s Failed to archive file %@ with error %@", buf, 0x20u);
    }

  }
  objc_msgSend(v8, "encodeObject:forKey:", v9, CFSTR("wrapper"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v12, CFSTR("fileShouldBeDeletedOnDeallocation"));

}

- (id)decodeFileWithCoder:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL *)a4 fileIsSecurityScoped:(BOOL *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  *a5 = 1;
  v6 = a3;
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileShouldBeDeletedOnDeallocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v6, "decodeObjectOfClass:forKey:", getFPSandboxingURLWrapperClass(), CFSTR("wrapper"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)waitForFileAvailabilityWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)sharedDirectory
{
  return 0;
}

- (id)sharedTemporaryDirectory
{
  return +[WFTemporaryFileManager temporaryDirectoryURL](WFTemporaryFileManager, "temporaryDirectoryURL");
}

@end
