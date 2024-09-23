@implementation NSSecurityScopedURLWrapper

- (NSSecurityScopedURLWrapper)initWithCoder:(id)a3
{
  NSSecurityScopedURLWrapper *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSSecurityScopedURLWrapper;
  v4 = -[NSSecurityScopedURLWrapper init](&v8, sel_init);
  if (v4)
  {
    v4->_readonly = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("readonly"));
    v4->_url = (NSURL *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v4->_scope = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scope"));
    v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promiseURL"));
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promiseScope"));
    if (v4->_url)
    {
      if (v4->_scope)
        MEMORY[0x186DA7CF4]();
      if (v5 && v6)
        MEMORY[0x186DA7CF4](v5, v6);
      _CFURLPromiseSetPhysicalURL();
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  NSData *scope;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(a3, "encodeBool:forKey:", self->_readonly, CFSTR("readonly"));
  url = self->_url;
  if (url)
    objc_msgSend(a3, "encodeObject:forKey:", url, CFSTR("url"));
  scope = self->_scope;
  if (scope)
    objc_msgSend(a3, "encodeObject:forKey:", scope, CFSTR("scope"));
  v7 = (id)_CFURLPromiseCopyPhysicalURL();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("promiseURL"));
    v9 = (id)MEMORY[0x186DA7DA8](v8);
    if (v9
      || (v10 = _bestReadWriteSandboxExtensionTypeForURL(v8),
          (v9 = (id)_issueSandboxExtension(v8, (uint64_t)v10, 0)) != 0))
    {
      objc_msgSend(a3, "encodeObject:forKey:", v9, CFSTR("promiseScope"));
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSSecurityScopedURLWrapper;
  -[NSSecurityScopedURLWrapper dealloc](&v3, sel_dealloc);
}

- (NSSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4 scope:(id)a5
{
  NSSecurityScopedURLWrapper *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSSecurityScopedURLWrapper;
  v8 = -[NSSecurityScopedURLWrapper init](&v10, sel_init);
  if (v8)
  {
    v8->_url = (NSURL *)objc_msgSend(a3, "copy");
    v8->_readonly = a4;
    v8->_scope = (NSData *)objc_msgSend(a5, "copy");
  }
  return v8;
}

- (NSSecurityScopedURLWrapper)initWithProviderIdentifier:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5
{
  NSSecurityScopedURLWrapper *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSSecurityScopedURLWrapper;
  v8 = -[NSSecurityScopedURLWrapper init](&v10, sel_init);
  if (v8)
  {
    v8->_providerIdentifier = (NSString *)objc_msgSend(a3, "copy");
    v8->_domainIdentifier = (NSString *)objc_msgSend(a4, "copy");
    v8->_itemIdentifier = (NSString *)objc_msgSend(a5, "copy");
    v8->_readonly = 1;
  }
  return v8;
}

- (NSSecurityScopedURLWrapper)initWithURL:(id)a3
{
  return -[NSSecurityScopedURLWrapper initWithURL:readonly:](self, "initWithURL:readonly:", a3, 0);
}

- (NSSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4
{
  return -[NSSecurityScopedURLWrapper initWithURL:readonly:extensionClass:](self, "initWithURL:readonly:extensionClass:", a3, a4, 0);
}

- (NSSecurityScopedURLWrapper)initWithURL:(id)a3 readonly:(BOOL)a4 extensionClass:(id)a5
{
  _BOOL4 v6;
  NSSecurityScopedURLWrapper *v8;
  void *OnlySandboxExtensionTypeForURL;
  NSError *v11;
  objc_super v12;
  uint64_t v13;

  v6 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)NSSecurityScopedURLWrapper;
  v8 = -[NSSecurityScopedURLWrapper init](&v12, sel_init);
  if (v8)
  {
    v8->_url = (NSURL *)objc_msgSend(a3, "copy");
    v8->_readonly = v6;
    v11 = 0;
    if (a5)
    {
      OnlySandboxExtensionTypeForURL = (void *)objc_msgSend(a5, "UTF8String");
    }
    else if (v6)
    {
      OnlySandboxExtensionTypeForURL = _bestReadOnlySandboxExtensionTypeForURL(a3);
    }
    else
    {
      OnlySandboxExtensionTypeForURL = _bestReadWriteSandboxExtensionTypeForURL(a3);
    }
    v8->_scope = (NSData *)(id)_issueSandboxExtension(a3, (uint64_t)OnlySandboxExtensionTypeForURL, &v11);
    if (v11)
      NSLog((NSString *)CFSTR("Could not create sandbox extension. Error: %@"), v11);
  }
  return v8;
}

- (id)description
{
  id v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSSecurityScopedURLWrapper;
  v3 = (id)objc_msgSend(-[NSSecurityScopedURLWrapper description](&v5, sel_description), "mutableCopy");
  objc_msgSend(v3, "appendFormat:", CFSTR("URL: %@\n"), self->_url);
  objc_msgSend(v3, "appendFormat:", CFSTR("Readonly: %d\n"), self->_readonly);
  objc_msgSend(v3, "appendFormat:", CFSTR("Has security scope: %d\n"), self->_scope != 0);
  return v3;
}

- (NSData)_scope
{
  return self->_scope;
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (BOOL)isBackedByFileProvider
{
  return self->_backedByFileProvider;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

@end
