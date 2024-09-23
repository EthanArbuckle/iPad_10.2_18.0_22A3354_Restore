@implementation DCDocumentCameraViewServiceSessionRequest

- (DCDocumentCameraViewServiceSessionRequest)init
{
  DCDocumentCameraViewServiceSessionRequest *v2;
  void *v3;
  uint64_t v4;
  NSString *appName;
  DCSandboxExtension *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  DCSandboxExtension *cachesDirectorySandboxExtension;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DCDocumentCameraViewServiceSessionRequest;
  v2 = -[DCDocumentCameraViewServiceSessionRequest init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_localizedApplicationName");
    v4 = objc_claimAutoreleasedReturnValue();
    appName = v2->_appName;
    v2->_appName = (NSString *)v4;

    v6 = [DCSandboxExtension alloc];
    +[DCCachesDirectory sharedCachesDirectory](DCCachesDirectory, "sharedCachesDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachesDirectoryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DCSandboxExtension initWithFileURL:](v6, "initWithFileURL:", v8);
    cachesDirectorySandboxExtension = v2->_cachesDirectorySandboxExtension;
    v2->_cachesDirectorySandboxExtension = (DCSandboxExtension *)v9;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCDocumentCameraViewServiceSessionRequest)initWithCoder:(id)a3
{
  id v4;
  DCDocumentCameraViewServiceSessionRequest *v5;
  uint64_t v6;
  NSString *appName;
  uint64_t v8;
  DCSandboxExtension *cachesDirectorySandboxExtension;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DCDocumentCameraViewServiceSessionRequest;
  v5 = -[DCDocumentCameraViewServiceSessionRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAppNameFieldCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    appName = v5->_appName;
    v5->_appName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCachesDirectorySandboxExtensionFieldCodingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    cachesDirectorySandboxExtension = v5->_cachesDirectorySandboxExtension;
    v5->_cachesDirectorySandboxExtension = (DCSandboxExtension *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DCDocumentCameraViewServiceSessionRequest appName](self, "appName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kAppNameFieldCodingKey"));

  -[DCDocumentCameraViewServiceSessionRequest cachesDirectorySandboxExtension](self, "cachesDirectorySandboxExtension");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCachesDirectorySandboxExtensionFieldCodingKey"));

}

- (NSString)appName
{
  return self->_appName;
}

- (DCSandboxExtension)cachesDirectorySandboxExtension
{
  return self->_cachesDirectorySandboxExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachesDirectorySandboxExtension, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
