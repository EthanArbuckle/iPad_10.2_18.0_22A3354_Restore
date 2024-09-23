@implementation CDMClientSetup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSLocale *localeIdentifier;
  id v5;

  localeIdentifier = self->_localeIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localeIdentifier, CFSTR("localeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sandboxId, CFSTR("sandboxId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeServiceGraph, CFSTR("activeServiceGraph"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetDirPath, CFSTR("assetDirPath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invocationSource, CFSTR("invocationSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_overrideSiriVocabSpans, CFSTR("overrideSiriVocabSpans"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceStateDirectory, CFSTR("serviceStateDirectory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_embeddingVersion, CFSTR("embeddingVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceStateDirectorySandboxExtension, CFSTR("serviceStateDirectorySandboxExtension"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nlSetupId, CFSTR("nlSetupId"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPerformWarmup, CFSTR("shouldPerformWarmup"));

}

- (NSString)serviceStateDirectorySandboxExtension
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (CDMClientSetup)initWithCoder:(id)a3
{
  id v4;
  CDMClientSetup *v5;
  uint64_t v6;
  NSLocale *localeIdentifier;
  uint64_t v8;
  NSString *sandboxId;
  uint64_t v10;
  NSString *activeServiceGraph;
  uint64_t v12;
  NSString *assetDirPath;
  uint64_t v14;
  NSString *invocationSource;
  uint64_t v16;
  NSUUID *nlSetupId;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *overrideSiriVocabSpans;
  uint64_t v23;
  NSString *serviceStateDirectory;
  uint64_t v25;
  NSString *embeddingVersion;
  uint64_t v27;
  NSString *serviceStateDirectorySandboxExtension;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CDMClientSetup;
  v5 = -[CDMClientSetup init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSLocale *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxId"));
    v8 = objc_claimAutoreleasedReturnValue();
    sandboxId = v5->_sandboxId;
    v5->_sandboxId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeServiceGraph"));
    v10 = objc_claimAutoreleasedReturnValue();
    activeServiceGraph = v5->_activeServiceGraph;
    v5->_activeServiceGraph = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetDirPath"));
    v12 = objc_claimAutoreleasedReturnValue();
    assetDirPath = v5->_assetDirPath;
    v5->_assetDirPath = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invocationSource"));
    v14 = objc_claimAutoreleasedReturnValue();
    invocationSource = v5->_invocationSource;
    v5->_invocationSource = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nlSetupId"));
    v16 = objc_claimAutoreleasedReturnValue();
    nlSetupId = v5->_nlSetupId;
    v5->_nlSetupId = (NSUUID *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("overrideSiriVocabSpans"));
    v21 = objc_claimAutoreleasedReturnValue();
    overrideSiriVocabSpans = v5->_overrideSiriVocabSpans;
    v5->_overrideSiriVocabSpans = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceStateDirectory"));
    v23 = objc_claimAutoreleasedReturnValue();
    serviceStateDirectory = v5->_serviceStateDirectory;
    v5->_serviceStateDirectory = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("embeddingVersion"));
    v25 = objc_claimAutoreleasedReturnValue();
    embeddingVersion = v5->_embeddingVersion;
    v5->_embeddingVersion = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceStateDirectorySandboxExtension"));
    v27 = objc_claimAutoreleasedReturnValue();
    serviceStateDirectorySandboxExtension = v5->_serviceStateDirectorySandboxExtension;
    v5->_serviceStateDirectorySandboxExtension = (NSString *)v27;

    v5->_shouldPerformWarmup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldPerformWarmup"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceStateDirectorySandboxExtension, 0);
  objc_storeStrong((id *)&self->_serviceStateDirectory, 0);
  objc_storeStrong((id *)&self->_overrideSiriVocabSpans, 0);
  objc_storeStrong((id *)&self->_nlSetupId, 0);
  objc_storeStrong((id *)&self->_invocationSource, 0);
  objc_storeStrong((id *)&self->_assetDirPath, 0);
  objc_storeStrong((id *)&self->_activeServiceGraph, 0);
  objc_storeStrong((id *)&self->_sandboxId, 0);
  objc_storeStrong((id *)&self->_embeddingVersion, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

- (NSString)activeServiceGraph
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)shouldPerformWarmup
{
  return self->_shouldPerformWarmup;
}

- (NSString)serviceStateDirectory
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)sandboxId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)overrideSiriVocabSpans
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)nlSetupId
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSLocale)localeIdentifier
{
  return (NSLocale *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)invocationSource
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)embeddingVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)assetDirPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 embeddingVersion:(id)a4 sandboxId:(id)a5 activeServiceGraph:(id)a6
{
  return -[CDMClientSetup initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:](self, "initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:", a3, a5, a6, 0, 0, 0, a4, 0, 0);
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 serviceStateDirectory:(id)a8 embeddingVersion:(id)a9 nlSetupId:(id)a10 invocationSource:(id)a11
{
  uint64_t v12;

  LOBYTE(v12) = 1;
  return -[CDMClientSetup initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:shouldPerformWarmup:](self, "initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:shouldPerformWarmup:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v12);
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 serviceStateDirectory:(id)a8 embeddingVersion:(id)a9 nlSetupId:(id)a10 invocationSource:(id)a11 shouldPerformWarmup:(BOOL)a12
{
  id v19;
  CDMClientSetup *v20;
  CDMClientSetup *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v24 = a9;
  v23 = a10;
  v19 = a11;
  v31.receiver = self;
  v31.super_class = (Class)CDMClientSetup;
  v20 = -[CDMClientSetup init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_localeIdentifier, a3);
    objc_storeStrong((id *)&v21->_sandboxId, a4);
    objc_storeStrong((id *)&v21->_activeServiceGraph, a5);
    objc_storeStrong((id *)&v21->_assetDirPath, a6);
    objc_storeStrong((id *)&v21->_overrideSiriVocabSpans, a7);
    objc_storeStrong((id *)&v21->_embeddingVersion, a9);
    objc_storeStrong((id *)&v21->_serviceStateDirectory, a8);
    objc_storeStrong((id *)&v21->_invocationSource, a11);
    objc_storeStrong((id *)&v21->_nlSetupId, a10);
    v21->_shouldPerformWarmup = a12;
  }

  return v21;
}

- (void)createSandboxExtensionForXPC
{
  NSString *serviceStateDirectory;
  uint64_t v4;
  NSString *v5;
  NSString *serviceStateDirectorySandboxExtension;
  NSObject *v7;
  NSString *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  serviceStateDirectory = self->_serviceStateDirectory;
  if (serviceStateDirectory && !self->_serviceStateDirectorySandboxExtension)
  {
    -[NSString fileSystemRepresentation](serviceStateDirectory, "fileSystemRepresentation");
    v4 = sandbox_extension_issue_file();
    if (v4)
    {
      v5 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", v4, 4);
      serviceStateDirectorySandboxExtension = self->_serviceStateDirectorySandboxExtension;
      self->_serviceStateDirectorySandboxExtension = v5;

    }
    else
    {
      CDMOSLoggerForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = self->_serviceStateDirectory;
        *(_DWORD *)buf = 136315394;
        v10 = "-[CDMClientSetup createSandboxExtensionForXPC]";
        v11 = 2112;
        v12 = v8;
        _os_log_error_impl(&dword_21A2A0000, v7, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to create sandbox extension for \"%@\", buf, 0x16u);
      }

        self->_serviceStateDirectory);
    }
  }
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4
{
  return -[CDMClientSetup initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:](self, "initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:", a3, a4, 0, 0, 0, 0, 0, 0, 0);
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5
{
  return -[CDMClientSetup initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:](self, "initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:", a3, a4, a5, 0, 0, 0, 0, 0, 0);
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7
{
  return -[CDMClientSetup initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:](self, "initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:", a3, a4, a5, a6, a7, 0, 0, 0, 0);
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 serviceStateDirectory:(id)a8
{
  return -[CDMClientSetup initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:](self, "initWithLocaleIdentifier:sandboxId:activeServiceGraph:assetDirPath:overrideSiriVocabSpans:serviceStateDirectory:embeddingVersion:nlSetupId:invocationSource:", a3, a4, a5, a6, a7, a8, 0, 0, 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NSUUID UUIDString](self->_nlSetupId, "UUIDString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("YES");
  if (self->_serviceStateDirectorySandboxExtension)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (!self->_shouldPerformWarmup)
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CDMClientSetup] - nlSetupId: %@, Language identifier: %@,Sandbox ID: %@, Graph Name: %@, Asset Dir Path: %@, Override Siri Vocabulary Spans: %@, Service State Directory: %@, Has Sandbox Extension: %@, Should Perform Warmup: %@"), v4, self->_localeIdentifier, self->_sandboxId, self->_activeServiceGraph, self->_assetDirPath, self->_overrideSiriVocabSpans, self->_serviceStateDirectory, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
