@implementation DDSServerConfiguration

- (DDSServerConfiguration)initWithXPCServiceName:(id)a3 assertionStorageDirectoryURL:(id)a4
{
  id v6;
  id v7;
  DDSServerConfiguration *v8;
  uint64_t v9;
  NSString *xpcServiceName;
  uint64_t v11;
  NSURL *assertionStorageDirectoryURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DDSServerConfiguration;
  v8 = -[DDSServerConfiguration init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    xpcServiceName = v8->_xpcServiceName;
    v8->_xpcServiceName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    assertionStorageDirectoryURL = v8->_assertionStorageDirectoryURL;
    v8->_assertionStorageDirectoryURL = (NSURL *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[DDSServerConfiguration xpcServiceName](self, "xpcServiceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "xpcServiceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[DDSServerConfiguration assertionStorageDirectoryURL](self, "assertionStorageDirectoryURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assertionStorageDirectoryURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DDSServerConfiguration;
  v3 = -[DDSServerConfiguration hash](&v9, sel_hash);
  -[DDSServerConfiguration xpcServiceName](self, "xpcServiceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[DDSServerConfiguration assertionStorageDirectoryURL](self, "assertionStorageDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (NSString)xpcServiceName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)assertionStorageDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionStorageDirectoryURL, 0);
  objc_storeStrong((id *)&self->_xpcServiceName, 0);
}

@end
