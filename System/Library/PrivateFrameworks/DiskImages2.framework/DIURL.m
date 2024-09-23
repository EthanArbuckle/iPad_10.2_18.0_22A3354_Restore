@implementation DIURL

+ (id)newDIURLWithNSURL:(id)a3
{
  id v3;
  DIURL *v4;
  DIURL *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (DIURL *)objc_msgSend(v3, "copy");
  }
  else
  {
    v5 = [DIURL alloc];
    objc_msgSend(v3, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[DIURL initWithString:](v5, "initWithString:", v6);

  }
  return v4;
}

+ (id)newDIURLWithPluginName:(id)a3 params:(id)a4
{
  id v5;
  id v6;
  DIURL *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[DIURL initWithPluginName:params:]([DIURL alloc], "initWithPluginName:params:", v5, v6);

  return v7;
}

- (DIURL)initWithPluginName:(id)a3 params:(id)a4
{
  id v7;
  void *v8;
  DIURL *v9;
  objc_super v11;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("plugin://%@/"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)DIURL;
  v9 = -[DIURL initWithString:](&v11, sel_initWithString_, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_pluginParams, a4);

  return v9;
}

- (BOOL)isPlugin
{
  void *v2;
  char v3;

  -[DIURL scheme](self, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("plugin"));

  return v3;
}

- (NSString)pluginName
{
  void *v3;

  if (-[DIURL isPlugin](self, "isPlugin"))
  {
    -[DIURL host](self, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (id)path
{
  void *v3;
  objc_super v5;

  if (-[DIURL isPlugin](self, "isPlugin"))
  {
    -[DIURL description](self, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DIURL;
    -[DIURL path](&v5, sel_path);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)description
{
  PluginsManager *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *__p[2];
  char v18;

  v3 = (PluginsManager *)-[DIURL isPlugin](self, "isPlugin");
  if ((_DWORD)v3)
  {
    v4 = PluginsManager::get(v3);
    -[DIURL pluginName](self, "pluginName");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
    -[DIURL pluginParams](self, "pluginParams");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)PluginsManager::copy_plugin_description(v4, (uint64_t)__p, (uint64_t)v6);

    if (v18 < 0)
      operator delete(__p[0]);

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("plugin://%@"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLWithString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    objc_msgSend(v8, "absoluteString");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", self, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIURL password](self, "password");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v7, "setPassword:", 0);
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v13;

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)initWithCoder:(id)a3
{
  id v4;
  DIURL *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *pluginParams;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DIURL;
  v5 = -[DIURL initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v19 = (void *)MEMORY[0x24BDBCF20];
    v18 = objc_opt_class();
    v17 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v18, v17, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("pluginParams"));
    v14 = objc_claimAutoreleasedReturnValue();
    pluginParams = v5->_pluginParams;
    v5->_pluginParams = (NSDictionary *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DIURL;
  -[DIURL encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DIURL pluginParams](self, "pluginParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("pluginParams"));

}

- (NSDictionary)pluginParams
{
  return self->_pluginParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginParams, 0);
}

@end
