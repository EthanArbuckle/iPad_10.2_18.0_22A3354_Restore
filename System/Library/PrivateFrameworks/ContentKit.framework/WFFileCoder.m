@implementation WFFileCoder

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)archiveFileAtURL:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL)a4 withCoder:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  objc_msgSend(v7, "encodeObject:forKey:", a3, CFSTR("fileURL"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v8, CFSTR("fileShouldBeDeletedOnDeallocation"));

}

- (id)decodeFileWithCoder:(id)a3 fileShouldBeDeletedOnDeallocation:(BOOL *)a4 fileIsSecurityScoped:(BOOL *)a5
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileShouldBeDeletedOnDeallocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    getWFWorkflowExecutionLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[WFFileCoder decodeFileWithCoder:fileShouldBeDeletedOnDeallocation:fileIsSecurityScoped:]";
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_20BBAD000, v9, OS_LOG_TYPE_ERROR, "%s Failed to decode file with error: %@", (uint8_t *)&v12, 0x16u);

    }
  }

  return v8;
}

- (void)waitForFileAvailabilityWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSURL *sharedDirectory;
  NSURL *sharedTemporaryDirectory;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_deletionResponsibility);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("deletionResponsibility"));

  sharedDirectory = self->_sharedDirectory;
  if (sharedDirectory)
    objc_msgSend(v7, "encodeObject:forKey:", sharedDirectory, CFSTR("sharedDirectory"));
  sharedTemporaryDirectory = self->_sharedTemporaryDirectory;
  if (sharedTemporaryDirectory)
    objc_msgSend(v7, "encodeObject:forKey:", sharedTemporaryDirectory, CFSTR("sharedTemporaryDirectory"));

}

- (WFFileCoder)initWithCoder:(id)a3
{
  id v4;
  WFFileCoder *v5;
  void *v6;
  uint64_t v7;
  NSURL *sharedDirectory;
  uint64_t v9;
  NSURL *sharedTemporaryDirectory;
  WFFileCoder *v11;

  v4 = a3;
  v5 = -[WFFileCoder init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deletionResponsibility"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deletionResponsibility = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedDirectory"));
    v7 = objc_claimAutoreleasedReturnValue();
    sharedDirectory = v5->_sharedDirectory;
    v5->_sharedDirectory = (NSURL *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedTemporaryDirectory"));
    v9 = objc_claimAutoreleasedReturnValue();
    sharedTemporaryDirectory = v5->_sharedTemporaryDirectory;
    v5->_sharedTemporaryDirectory = (NSURL *)v9;

    v11 = v5;
  }

  return v5;
}

- (NSURL)sharedDirectory
{
  return self->_sharedDirectory;
}

- (void)setSharedDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)sharedTemporaryDirectory
{
  return self->_sharedTemporaryDirectory;
}

- (void)setSharedTemporaryDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)deletionResponsibility
{
  return self->_deletionResponsibility;
}

- (void)setDeletionResponsibility:(int64_t)a3
{
  self->_deletionResponsibility = a3;
}

- (int64_t)targetPlatform
{
  return self->_targetPlatform;
}

- (void)setTargetPlatform:(int64_t)a3
{
  self->_targetPlatform = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTemporaryDirectory, 0);
  objc_storeStrong((id *)&self->_sharedDirectory, 0);
}

@end
