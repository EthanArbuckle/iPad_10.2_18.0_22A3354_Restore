@implementation _WKWebExtensionControllerConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  if (WTF::isMainRunLoop((WTF *)self))
    _objc_deallocOnMainThreadHelper();
  else
    dispatch_async_f(MEMORY[0x1E0C80D38], self, (dispatch_function_t)MEMORY[0x1E0DE7980]);
}

- (void)dealloc
{
  objc_super v3;

  (**(void (***)(ObjectStorage<WebKit::WebExtensionControllerConfiguration> *, SEL))self->_webExtensionControllerConfiguration.data.__lx)(&self->_webExtensionControllerConfiguration, a2);
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionControllerConfiguration;
  -[_WKWebExtensionControllerConfiguration dealloc](&v3, sel_dealloc);
}

+ (id)defaultConfiguration
{
  void *v2;
  WebKit::WebExtension *v3;
  WebKit::WebExtension *v5;

  WebKit::WebExtensionControllerConfiguration::createDefault((uint64_t *)&v5);
  WebKit::WebExtension::wrapper((id *)v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5;
  v5 = 0;
  if (v3)
    CFRelease(*((CFTypeRef *)v3 + 1));
  return v2;
}

+ (id)nonPersistentConfiguration
{
  uint64_t v2;
  id *v3;
  void *v4;

  v2 = API::Object::newObject(0x40uLL, 115);
  v3 = (id *)WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration(v2, 0);
  WebKit::WebExtension::wrapper(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
  return v4;
}

+ (_WKWebExtensionControllerConfiguration)configurationWithIdentifier:(id)a3
{
  WTF::UUID *v5;
  NSUUID *v6;
  void *v7;
  WebKit::WebExtension *v8;
  void *v10;
  WebKit::WebExtension *v11;
  _BYTE v12[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (WTF::UUID *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtensionControllerConfiguration.mm"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[identifier isKindOfClass:NSUUID.class]"));

  }
  WTF::UUID::fromNSUUID(v5, v6);
  if (!v12[16])
  {
    __break(0xC471u);
    JUMPOUT(0x196DA43F0);
  }
  WebKit::WebExtensionControllerConfiguration::create((WebKit::WebExtensionControllerConfiguration *)v12, (uint64_t *)&v11);
  WebKit::WebExtension::wrapper((id *)v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v11 = 0;
  if (v8)
    CFRelease(*((CFTypeRef *)v8 + 1));

  return (_WKWebExtensionControllerConfiguration *)v7;
}

+ (id)_temporaryConfiguration
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  void *v5;

  v2 = API::Object::newObject(0x40uLL, 115);
  v4 = (id *)WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration(v2, v3, MEMORY[0x1E0CBF6F0]);
  WebKit::WebExtension::wrapper(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionControllerConfiguration.mm"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder isKindOfClass:NSCoder.class]"));

  }
  -[_WKWebExtensionControllerConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v10, "encodeBool:forKey:", -[_WKWebExtensionControllerConfiguration isPersistent](self, "isPersistent"), CFSTR("persistent"));
  -[_WKWebExtensionControllerConfiguration webViewConfiguration](self, "webViewConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("webViewConfiguration"));

  -[_WKWebExtensionControllerConfiguration defaultWebsiteDataStore](self, "defaultWebsiteDataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("defaultWebsiteDataStore"));

  if (-[_WKWebExtensionControllerConfiguration _isTemporary](self, "_isTemporary"))
  {
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("temporary"));
    -[_WKWebExtensionControllerConfiguration _storageDirectoryPath](self, "_storageDirectoryPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("temporaryDirectory"));

  }
}

- (_WKWebExtensionControllerConfiguration)initWithCoder:(id)a3
{
  id v5;
  _WKWebExtensionControllerConfiguration *v6;
  WTF::UUID *v7;
  _WKWebExtensionControllerConfiguration *v8;
  uint64_t v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  int v13;
  NSUUID *v14;
  int v15;
  _WKWebExtensionControllerConfiguration *v16;
  _WKWebExtensionControllerConfiguration *v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  void *v21;
  const WTF::String *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  void *v25;
  _WKWebExtensionControllerConfiguration *v26;
  void *v28;
  objc_super v29;
  __int128 v30;
  unsigned __int8 v31;
  WTF::StringImpl *v32[2];
  char v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionControllerConfiguration.mm"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder isKindOfClass:NSCoder.class]"));

  }
  v29.receiver = self;
  v29.super_class = (Class)_WKWebExtensionControllerConfiguration;
  v6 = -[_WKWebExtensionControllerConfiguration init](&v29, sel_init);
  if (v6)
  {
    if (objc_msgSend(v5, "containsValueForKey:", CFSTR("temporary")))
    {
      if ((objc_msgSend(v5, "decodeBoolForKey:", CFSTR("temporary")) & 1) == 0)
      {
        __break(0xC471u);
        JUMPOUT(0x196DA4AC4);
      }
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("temporaryDirectory"));
      v7 = (WTF::UUID *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = -[_WKWebExtensionControllerConfiguration _apiObject](v8, "_apiObject");
      MEMORY[0x19AEABCC8](v32, v7);
      WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration(v9, v10, (_DWORD **)v32);
      v12 = v32[0];
      v32[0] = 0;
      if (v12)
      {
        if (*(_DWORD *)v12 == 2)
          WTF::StringImpl::destroy(v12, v11);
        else
          *(_DWORD *)v12 -= 2;
      }
      *(_QWORD *)(v9 + 8) = v8;

      MEMORY[0x19AEABCC8](v32, v7);
      WTF::FileSystemImpl::makeAllDirectories((WTF::FileSystemImpl *)v32, v22);
      v24 = v32[0];
      v32[0] = 0;
      if (v24)
      {
        if (*(_DWORD *)v24 == 2)
          WTF::StringImpl::destroy(v24, v23);
        else
          *(_DWORD *)v24 -= 2;
      }
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webViewConfiguration"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WKWebExtensionControllerConfiguration setWebViewConfiguration:](v8, "setWebViewConfiguration:", v25);

      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultWebsiteDataStore"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WKWebExtensionControllerConfiguration setDefaultWebsiteDataStore:](v8, "setDefaultWebsiteDataStore:", v21);
    }
    else
    {
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v7 = (WTF::UUID *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("persistent"));
      WTF::UUID::fromNSUUID(v7, v14);
      v15 = v31;
      v16 = v6;
      v17 = v16;
      if (v15)
      {
        v18 = -[_WKWebExtensionControllerConfiguration _apiObject](v16, "_apiObject");
        *(_QWORD *)v18 = off_1E34CC2A8;
        WebKit::InitializeWebKit2((WebKit *)v18);
        *(_QWORD *)v18 = &off_1E34DC9C8;
        v19 = v30;
        *(_OWORD *)(v18 + 16) = v30;
        *(_BYTE *)(v18 + 32) = 0;
        *(_OWORD *)v32 = v19;
        v33 = 1;
        WebKit::WebExtensionControllerConfiguration::createStorageDirectoryPath((WTF::UUID *)v32);
        *(_QWORD *)(v18 + 48) = 0;
        *(_QWORD *)(v18 + 56) = 0;
      }
      else
      {
        v18 = -[_WKWebExtensionControllerConfiguration _apiObject](v16, "_apiObject");
        WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration(v18, v13);
      }
      *(_QWORD *)(v18 + 8) = v17;

      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webViewConfiguration"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WKWebExtensionControllerConfiguration setWebViewConfiguration:](v17, "setWebViewConfiguration:", v20);

      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultWebsiteDataStore"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_WKWebExtensionControllerConfiguration setDefaultWebsiteDataStore:](v17, "setDefaultWebsiteDataStore:", v21);
    }

    v26 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WebKit::WebExtension *v3;
  void *v4;
  WebKit::WebExtension *v6;

  WebKit::WebExtensionControllerConfiguration::copy((WebKit::WebExtensionControllerConfiguration *)&self->_webExtensionControllerConfiguration, (uint64_t *)&v6);
  v3 = v6;
  WebKit::WebExtension::wrapper((id *)v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    CFRelease(*((CFTypeRef *)v3 + 1));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _WKWebExtensionControllerConfiguration *v4;
  _WKWebExtensionControllerConfiguration *v5;
  _WKWebExtensionControllerConfiguration *v6;
  const WTF::StringImpl *v7;
  char v8;

  v4 = (_WKWebExtensionControllerConfiguration *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;

      if (v6)
      {
        v8 = WebKit::WebExtensionControllerConfiguration::operator==((uint64_t)&self->_webExtensionControllerConfiguration, (uint64_t)&v6->_webExtensionControllerConfiguration, v7);
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

      v6 = 0;
    }
    v8 = 0;
    goto LABEL_8;
  }
  v8 = 1;
LABEL_9:

  return v8;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_WKWebExtensionControllerConfiguration isPersistent](self, "isPersistent"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = -[_WKWebExtensionControllerConfiguration _isTemporary](self, "_isTemporary");
  -[_WKWebExtensionControllerConfiguration identifier](self, "identifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; persistent = %@; temporary = %@; identifier = %@>"),
    v5,
    self,
    v6,
    v10,
    v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSUUID)identifier
{
  if (*(_OWORD *)&self->_webExtensionControllerConfiguration.data.__lx[16] == 0)
    return (NSUUID *)0;
  else
    return (NSUUID *)(id)WTF::UUID::operator NSUUID *();
}

- (BOOL)isPersistent
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->_webExtensionControllerConfiguration.data.__lx[40];
  return v2 && *(_DWORD *)(v2 + 4) != 0;
}

- (WKWebViewConfiguration)webViewConfiguration
{
  return (WKWebViewConfiguration *)WebKit::WebExtensionControllerConfiguration::webViewConfiguration((WebKit::WebExtensionControllerConfiguration *)&self->_webExtensionControllerConfiguration);
}

- (void)setWebViewConfiguration:(id)a3
{
  WTF::RetainPtr<WKWebViewConfiguration>::operator=((const void **)&self[1].super.isa, a3);
}

- (WKWebsiteDataStore)defaultWebsiteDataStore
{
  return (WKWebsiteDataStore *)(id)WebKit::WebExtensionControllerConfiguration::defaultWebsiteDataStore((WebKit::WebExtensionControllerConfiguration *)&self->_webExtensionControllerConfiguration)[1];
}

- (void)setDefaultWebsiteDataStore:(id)a3
{
  CFTypeRef *v4;
  CFTypeRef *v5;
  CFTypeRef *v6;

  v4 = (CFTypeRef *)a3;
  v6 = v4;
  if (v4)
    v5 = v4 + 1;
  else
    v5 = 0;
  WebKit::WebExtensionControllerConfiguration::setDefaultWebsiteDataStore((WebKit::WebExtensionControllerConfiguration *)&self->_webExtensionControllerConfiguration, v5);

}

- (BOOL)_isTemporary
{
  return self->_webExtensionControllerConfiguration.data.__lx[32];
}

- (NSString)_storageDirectoryPath
{
  _DWORD *v2;

  v2 = *(_DWORD **)&self->_webExtensionControllerConfiguration.data.__lx[40];
  if (v2)
  {
    if (v2[1])
      return (NSString *)(id)WTF::StringImpl::operator NSString *();
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)_setStorageDirectoryPath:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self->_webExtensionControllerConfiguration.data.__lx[40], (WTF::StringImpl *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionControllerConfiguration;
}

- (void)_webExtensionControllerConfiguration
{
  return &self->_webExtensionControllerConfiguration;
}

@end
