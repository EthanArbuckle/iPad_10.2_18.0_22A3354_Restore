@implementation _WKWebExtension

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

  (**(void (***)(ObjectStorage<WebKit::WebExtension> *, SEL))self->_webExtension.data.__lx)(&self->_webExtension, a2);
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtension;
  -[_WKWebExtension dealloc](&v3, sel_dealloc);
}

+ (void)extensionWithAppExtensionBundle:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtension.mm"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[appExtensionBundle isKindOfClass:NSBundle.class]"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69___WKWebExtension_extensionWithAppExtensionBundle_completionHandler___block_invoke;
  block[3] = &unk_1E34AAB20;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

+ (void)extensionWithResourceBaseURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtension.mm"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[resourceBaseURL isKindOfClass:NSURL.class]"));

  }
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtension.mm"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[resourceBaseURL isFileURL]"));

  }
  if ((objc_msgSend(v7, "hasDirectoryPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtension.mm"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[resourceBaseURL hasDirectoryPath]"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___WKWebExtension_extensionWithResourceBaseURL_completionHandler___block_invoke;
  block[3] = &unk_1E34AAB20;
  v15 = v7;
  v16 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)_initWithAppExtensionBundle:(id)a3 error:(id *)a4
{
  id v7;
  _WKWebExtension *v8;
  _WKWebExtension *v9;
  _WKWebExtension *v10;
  _WKWebExtension *v11;
  void *v13;
  id v14;
  objc_super v15;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtension.mm"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[appExtensionBundle isKindOfClass:NSBundle.class]"));

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a4)
LABEL_3:
    *a4 = 0;
LABEL_4:
  v15.receiver = self;
  v15.super_class = (Class)_WKWebExtension;
  v8 = -[_WKWebExtension init](&v15, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_8;
  v14 = 0;
  v10 = v8;
  *(_QWORD *)(WebKit::WebExtension::WebExtension((uint64_t)-[_WKWebExtension _apiObject](v10, "_apiObject"), v7, &v14) + 8) = v10;

  if (!v14)
  {
    v11 = v10;
    goto LABEL_10;
  }
  if (a4)
  {
    v11 = 0;
    *a4 = objc_retainAutorelease(v14);
  }
  else
  {
LABEL_8:
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (id)_initWithResourceBaseURL:(id)a3 error:(id *)a4
{
  id v7;
  _WKWebExtension *v8;
  _WKWebExtension *v9;
  _WKWebExtension *v10;
  _WKWebExtension *v11;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v17;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtension.mm"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[resourceBaseURL isKindOfClass:NSURL.class]"));

  }
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtension.mm"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[resourceBaseURL isFileURL]"));

  }
  if ((objc_msgSend(v7, "hasDirectoryPath") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtension.mm"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[resourceBaseURL hasDirectoryPath]"));

    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (a4)
LABEL_7:
    *a4 = 0;
LABEL_8:
  v17.receiver = self;
  v17.super_class = (Class)_WKWebExtension;
  v8 = -[_WKWebExtension init](&v17, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_12;
  v16 = 0;
  v10 = v8;
  *(_QWORD *)(WebKit::WebExtension::WebExtension((uint64_t)-[_WKWebExtension _apiObject](v10, "_apiObject"), v7, &v16) + 8) = v10;

  if (!v16)
  {
    v11 = v10;
    goto LABEL_14;
  }
  if (a4)
  {
    v11 = 0;
    *a4 = objc_retainAutorelease(v16);
  }
  else
  {
LABEL_12:
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)_initWithManifestDictionary:(id)a3
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtension.mm"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[manifest isKindOfClass:NSDictionary.class]"));

  }
  v6 = -[_WKWebExtension _initWithManifestDictionary:resources:](self, "_initWithManifestDictionary:resources:", v5, 0);

  return v6;
}

- (id)_initWithManifestDictionary:(id)a3 resources:(id)a4
{
  NSDictionary *v7;
  NSDictionary *v8;
  _WKWebExtension *v9;
  _WKWebExtension *v10;
  _WKWebExtension *v11;
  _WKWebExtension *v12;
  void *v14;
  objc_super v15;

  v7 = (NSDictionary *)a3;
  v8 = (NSDictionary *)a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtension.mm"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[manifest isKindOfClass:NSDictionary.class]"));

  }
  v15.receiver = self;
  v15.super_class = (Class)_WKWebExtension;
  v9 = -[_WKWebExtension init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    *(_QWORD *)(WebKit::WebExtension::WebExtension((WebKit::WebExtension *)-[_WKWebExtension _apiObject](v11, "_apiObject"), v7, v8)+ 8) = v11;

    v12 = v11;
  }

  return v10;
}

- (id)_initWithResources:(id)a3
{
  NSDictionary *v5;
  _WKWebExtension *v6;
  _WKWebExtension *v7;
  _WKWebExtension *v8;
  _WKWebExtension *v9;
  void *v11;
  objc_super v12;

  v5 = (NSDictionary *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtension.mm"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[resources isKindOfClass:NSDictionary.class]"));

  }
  v12.receiver = self;
  v12.super_class = (Class)_WKWebExtension;
  v6 = -[_WKWebExtension init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    *((_QWORD *)WebKit::WebExtension::WebExtension((WebKit::WebExtension *)-[_WKWebExtension _apiObject](v8, "_apiObject"), v5)+ 1) = v8;

    v9 = v8;
  }

  return v7;
}

- (NSDictionary)manifest
{
  return (NSDictionary *)WebKit::WebExtension::manifest((WebKit::WebExtension *)&self->_webExtension);
}

- (double)manifestVersion
{
  return WebKit::WebExtension::manifestVersion((WebKit::WebExtension *)&self->_webExtension);
}

- (BOOL)supportsManifestVersion:(double)a3
{
  return WebKit::WebExtension::manifestVersion((WebKit::WebExtension *)&self->_webExtension) >= a3;
}

- (NSLocale)defaultLocale
{
  return (NSLocale *)WebKit::WebExtension::defaultLocale((id *)&self->_webExtension);
}

- (NSString)displayName
{
  WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return (NSString *)WTF::RetainPtr<__IOHIDDevice *>::get((uint64_t *)&self[3]._webExtension.data.__lx[24]);
}

- (NSString)displayShortName
{
  WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return (NSString *)WTF::RetainPtr<__IOHIDDevice *>::get((uint64_t *)&self[3]._webExtension.data.__lx[32]);
}

- (NSString)displayVersion
{
  WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return (NSString *)WTF::RetainPtr<__IOHIDDevice *>::get((uint64_t *)&self[3]._webExtension.data.__lx[40]);
}

- (NSString)displayDescription
{
  WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return (NSString *)WTF::RetainPtr<__IOHIDDevice *>::get((uint64_t *)&self[4]);
}

- (NSString)displayActionLabel
{
  WebKit::WebExtension::populateActionPropertiesIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return (NSString *)WTF::RetainPtr<__IOHIDDevice *>::get((uint64_t *)&self[4]._webExtension.data.__lx[32]);
}

- (NSString)version
{
  WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return (NSString *)WTF::RetainPtr<__IOHIDDevice *>::get((uint64_t *)&self[4]._webExtension);
}

- (id)iconForSize:(CGSize)a3
{
  return WebKit::WebExtension::icon((WebKit::WebExtension *)&self->_webExtension, a3);
}

- (id)actionIconForSize:(CGSize)a3
{
  return WebKit::WebExtension::actionIcon((WebKit::WebExtension *)&self->_webExtension, a3);
}

- (NSSet)requestedPermissions
{
  WebKit::WebExtension::populatePermissionsPropertiesIfNeeded((id *)&self->_webExtension);
  return (NSSet *)WebKit::toAPI(&self[2]);
}

- (NSSet)optionalPermissions
{
  WebKit::WebExtension::populatePermissionsPropertiesIfNeeded((id *)&self->_webExtension);
  return (NSSet *)WebKit::toAPI(&self[2]._webExtension);
}

- (NSSet)requestedPermissionMatchPatterns
{
  WebKit::WebExtension::populatePermissionsPropertiesIfNeeded((id *)&self->_webExtension);
  return (NSSet *)WebKit::toAPI((_QWORD **)&self[1]._webExtension.data.__lx[32]);
}

- (NSSet)optionalPermissionMatchPatterns
{
  WebKit::WebExtension::populatePermissionsPropertiesIfNeeded((id *)&self->_webExtension);
  return (NSSet *)WebKit::toAPI((_QWORD **)&self[1]._webExtension.data.__lx[40]);
}

- (NSSet)allRequestedMatchPatterns
{
  void *v2;
  void *v3;
  uint64_t *v5;

  WebKit::WebExtension::allRequestedMatchPatterns((id *)&self->_webExtension, (uint64_t *)&v5);
  WebKit::toAPI(&v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    WTF::HashTable<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>>::deallocateTable(v5, v2);
  return (NSSet *)v3;
}

- (NSArray)errors
{
  return (NSArray *)WebKit::WebExtension::errors((id *)&self->_webExtension);
}

- (BOOL)hasBackgroundContent
{
  return WebKit::WebExtension::hasBackgroundContent((WebKit::WebExtension *)&self->_webExtension);
}

- (BOOL)backgroundContentIsPersistent
{
  return WebKit::WebExtension::backgroundContentIsPersistent((id *)&self->_webExtension);
}

- (BOOL)hasInjectedContent
{
  WebKit::WebExtension::populateContentScriptPropertiesIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return *(_DWORD *)&self->_webExtension.data.__lx[36] != 0;
}

- (BOOL)hasOptionsPage
{
  WebKit::WebExtension::populatePagePropertiesIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return self[6].super.isa != 0;
}

- (BOOL)hasOverrideNewTabPage
{
  WebKit::WebExtension::populatePagePropertiesIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return *(_QWORD *)self[6]._webExtension.data.__lx != 0;
}

- (BOOL)hasCommands
{
  WebKit::WebExtension::populateCommandsIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return *(_DWORD *)&self[1]._webExtension.data.__lx[12] != 0;
}

- (BOOL)hasContentModificationRules
{
  WebKit::WebExtension::populateDeclarativeNetRequestPropertiesIfNeeded((WebKit::WebExtension *)&self->_webExtension);
  return *(_DWORD *)&self[1]._webExtension.data.__lx[28] != 0;
}

- (BOOL)_backgroundContentIsServiceWorker
{
  WebKit::WebExtension::populateBackgroundPropertiesIfNeeded((id *)&self->_webExtension);
  return self[5]._webExtension.data.__lx[32];
}

- (BOOL)_backgroundContentUsesModules
{
  return WebKit::WebExtension::backgroundContentUsesModules((id *)&self->_webExtension);
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtension;
}

- (void)_webExtension
{
  return &self->_webExtension;
}

@end
