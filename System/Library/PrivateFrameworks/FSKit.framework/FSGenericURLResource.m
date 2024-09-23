@implementation FSGenericURLResource

- (FSGenericURLResource)initWithURL:(id)a3
{
  return -[FSGenericURLResource initWithURL:readonly:](self, "initWithURL:readonly:", a3, 0);
}

- (FSGenericURLResource)initWithURL:(id)a3 readonly:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  FSGenericURLResource *v8;
  void *v9;
  uint64_t v10;
  NSSecurityScopedURLWrapper *urlWrapper;
  objc_super v13;

  v4 = a4;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FSGenericURLResource;
  v8 = -[FSGenericURLResource init](&v13, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x23B8618C8](v7);
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:readonly:extensionClass:", v7, v4, 0);
      urlWrapper = v8->_urlWrapper;
      v8->_urlWrapper = (NSSecurityScopedURLWrapper *)v10;

    }
    objc_storeStrong((id *)&v8->_URL, a3);

  }
  return v8;
}

- (id)initAsSecureURL:(id)a3 readonly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  FSGenericURLResource *v7;
  uint64_t v8;
  NSSecurityScopedURLWrapper *urlWrapper;
  NSSecurityScopedURLWrapper *v10;
  uint64_t v11;
  void *URL;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FSGenericURLResource;
  v7 = -[FSGenericURLResource init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17B8]), "initWithURL:readonly:extensionClass:", v6, v4, 0);
    urlWrapper = v7->_urlWrapper;
    v7->_urlWrapper = (NSSecurityScopedURLWrapper *)v8;

    v10 = v7->_urlWrapper;
    if (v10)
    {
      -[NSSecurityScopedURLWrapper url](v10, "url");
      v11 = objc_claimAutoreleasedReturnValue();
      URL = v7->_URL;
      v7->_URL = (NSURL *)v11;
    }
    else
    {
      URL = v7;
      v7 = 0;
    }

  }
  return v7;
}

+ (id)resourceWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *urlWrapper;
  const __CFString *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FSGenericURLResource;
  v4 = a3;
  -[FSResource encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  urlWrapper = self->_urlWrapper;
  if (urlWrapper)
  {
    v6 = CFSTR("FSResource.Wrapper");
  }
  else
  {
    urlWrapper = self->_URL;
    v6 = CFSTR("FSResource.URL");
  }
  objc_msgSend(v4, "encodeObject:forKey:", urlWrapper, v6, v7.receiver, v7.super_class);

}

- (FSGenericURLResource)initWithCoder:(id)a3
{
  id v4;
  FSGenericURLResource *v5;
  uint64_t v6;
  NSSecurityScopedURLWrapper *urlWrapper;
  NSSecurityScopedURLWrapper *v8;
  uint64_t v9;
  NSURL *URL;
  id v12;
  objc_super v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)FSGenericURLResource;
  v5 = -[FSResource initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSResource.Wrapper"));
    v6 = objc_claimAutoreleasedReturnValue();
    urlWrapper = v5->_urlWrapper;
    v5->_urlWrapper = (NSSecurityScopedURLWrapper *)v6;

    v8 = v5->_urlWrapper;
    if (v8)
      -[NSSecurityScopedURLWrapper url](v8, "url");
    else
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSResource.URL"));
    v9 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v9;

  }
  return v5;
}

- (int64_t)kind
{
  return 2;
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  NSURL *URL;
  void *v7;
  char v8;

  +[FSResource dynamicCast:](FSGenericURLResource, "dynamicCast:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    URL = self->_URL;
    objc_msgSend(v4, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSURL isEqual:](URL, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getResourceID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[NSURL absoluteString](self->_URL, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("FSGenericURLResource:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)makeProxy
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  -[FSGenericURLResource URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)objc_msgSend(v3, "initWithURL:", v4);

  v6 = (void *)v5[3];
  v5[3] = 0;

  return v5;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSSecurityScopedURLWrapper)urlWrapper
{
  return (NSSecurityScopedURLWrapper *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUrlWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlWrapper, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (id)secureResourceWithURL:(id)a3 readonly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initAsSecureURL:readonly:", v6, v4);

  return v7;
}

@end
