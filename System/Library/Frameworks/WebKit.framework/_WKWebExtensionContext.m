@implementation _WKWebExtensionContext

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

  (**(void (***)(ObjectStorage<WebKit::WebExtensionContext> *, SEL))self->_webExtensionContext.data.__lx)(&self->_webExtensionContext, a2);
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionContext;
  -[_WKWebExtensionContext dealloc](&v3, sel_dealloc);
}

+ (id)contextForExtension:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtensionContext.mm"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[extension isKindOfClass:_WKWebExtension.class]"));

  }
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForExtension:", v5);

  return v6;
}

- (id)initForExtension:(id)a3
{
  id v5;
  _WKWebExtensionContext *v6;
  uint64_t v7;
  _WKWebExtensionContext *v8;
  uint64_t v9;
  uint64_t v10;
  _WKWebExtensionContext *v11;
  void *v13;
  objc_super v14;
  uint64_t v15;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[extension isKindOfClass:_WKWebExtension.class]"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_WKWebExtensionContext;
  v6 = -[_WKWebExtensionContext init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "_webExtension");
    v8 = v6;
    v9 = -[_WKWebExtensionContext _apiObject](v8, "_apiObject");
    CFRetain(*(CFTypeRef *)(v7 + 8));
    v15 = v7;
    WebKit::WebExtensionContext::WebExtensionContext(v9, &v15);
    v10 = v15;
    v15 = 0;
    if (v10)
      CFRelease(*(CFTypeRef *)(v10 + 8));
    *(_QWORD *)(v9 + 8) = v8;

    v11 = v8;
  }

  return v6;
}

- (_WKWebExtension)webExtension
{
  id *v2;

  v2 = *(id **)self[1]._webExtensionContext.data.__lx;
  if (v2)
    v2 = (id *)WebKit::WebExtension::wrapper(v2);
  return (_WKWebExtension *)v2;
}

- (_WKWebExtensionController)webExtensionController
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)&self[1]._webExtensionContext.data.__lx[8];
  if (v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0)
    return (_WKWebExtensionController *)WebKit::WebExtension::wrapper((id *)(v3 - 16));
  else
    return (_WKWebExtensionController *)0;
}

- (BOOL)isLoaded
{
  uint64_t v2;

  v2 = *(_QWORD *)&self[1]._webExtensionContext.data.__lx[8];
  return v2 && *(_QWORD *)(v2 + 8) != 0;
}

- (NSURL)baseURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (void)setBaseURL:(id)a3
{
  id v5;
  void *v6;
  WTF::StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  void *v11;
  _BOOL4 v12;
  WebKit::WebExtensionMatchPattern *v13;
  uint64_t *v14;
  void *v15;
  WTF::StringImpl *v16;
  const WTF::StringImpl *v17;
  uint64_t v18;
  WTF::StringImpl *v19;
  void *v20;
  void *v21;
  char v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  int i;
  int v29;
  WTF *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  WTF::StringImpl *v38;
  unsigned __int8 v39;
  WTF::StringImpl *v40;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[baseURL isKindOfClass:NSURL.class]"));

  }
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x19AEABCC8](&v40, v6);
  WTF::URLParser::maybeCanonicalizeScheme();
  v8 = v39;
  if (v39)
  {
    v9 = v38;
    v38 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v7);
      else
        *(_DWORD *)v9 -= 2;
    }
  }
  v10 = v40;
  v40 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v7);
    else
      *(_DWORD *)v10 -= 2;
  }

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 118, CFSTR("Invalid parameter: '%@' is not a valid URL scheme"), v33);

  }
  objc_msgSend(v5, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[WKWebView handlesURLScheme:](WKWebView, "handlesURLScheme:", v11);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 119, CFSTR("Invalid parameter: '%@' is a URL scheme that WKWebView handles natively and cannot be used for extensions"), v35);

  }
  v14 = WebKit::WebExtensionMatchPattern::extensionSchemes(v13);
  objc_msgSend(v5, "scheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x19AEABCC8](&v38, v15);
  v18 = *v14;
  v19 = v38;
  if (v18)
  {
    v25 = *(_DWORD *)(v18 - 8);
    v26 = *((_DWORD *)v38 + 4);
    if (v26 >= 0x100)
      v27 = v26 >> 8;
    else
      v27 = WTF::StringImpl::hashSlowCase(v38);
    for (i = 0; ; v27 = i + v29)
    {
      v29 = v27 & v25;
      v30 = *(WTF **)(v18 + 8 * (v27 & v25));
      if (v30 != (WTF *)-1)
      {
        if (!v30)
        {
          LOBYTE(v18) = 0;
          goto LABEL_42;
        }
        if ((WTF::equal(v30, v38, v17) & 1) != 0)
          break;
      }
      ++i;
    }
    LOBYTE(v18) = 1;
LABEL_42:
    v19 = v38;
  }
  v38 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy(v19, v16);
    else
      *(_DWORD *)v19 -= 2;
  }

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheme");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 120, CFSTR("Invalid parameter: '%@' is not a registered custom scheme with _WKWebExtensionMatchPattern"), v37);

  }
  objc_msgSend(v5, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    objc_msgSend(v5, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("/"));

    if ((v22 & 1) != 0)
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 121, CFSTR("Invalid parameter: a URL with a path cannot be used"));
  }

LABEL_27:
  MEMORY[0x19AEABB18](&v38, v5);
  WebKit::WebExtensionContext::setBaseURL((WTF::StringImpl *)&self->_webExtensionContext, (WTF::URL *)&v38);
  v24 = v38;
  v38 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy(v24, v23);
    else
      *(_DWORD *)v24 -= 2;
  }

}

- (NSString)uniqueIdentifier
{
  __CFString *v2;

  if (*(_QWORD *)self[2]._webExtensionContext.data.__lx)
    v2 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v2 = &stru_1E351F1B8;
  return (NSString *)v2;
}

- (void)setUniqueIdentifier:(id)a3
{
  id v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uniqueIdentifier isKindOfClass:NSString.class]"));

  }
  MEMORY[0x19AEABCC8](&v9, v5);
  WebKit::WebExtensionContext::setUniqueIdentifier((WTF::StringImpl **)&self->_webExtensionContext, (WTF::StringImpl *)&v9);
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }

}

- (BOOL)isInspectable
{
  return self[2]._webExtensionContext.data.__lx[9];
}

- (void)setInspectable:(BOOL)a3
{
  WebKit::WebExtensionContext::setInspectable((WebKit::WebExtensionContext *)&self->_webExtensionContext, a3);
}

- (NSString)inspectionName
{
  return (NSString *)WebKit::WebExtensionContext::backgroundWebViewInspectionName((WebKit::WebExtensionContext *)&self->_webExtensionContext);
}

- (void)setInspectionName:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WebKit::WebExtensionContext::setBackgroundWebViewInspectionName((WebKit::WebExtensionContext *)&self->_webExtensionContext, (const WTF::String *)&v6);
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

- (NSSet)unsupportedAPIs
{
  WTF::StringImpl *v2;
  void *v3;
  WTF::StringImpl **v5;

  WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::HashTable((uint64_t *)&v5, (_QWORD **)&self[2]._webExtensionContext.data.__lx[16]);
  WebKit::toAPI(&v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v5, v2);
  return (NSSet *)v3;
}

- (void)setUnsupportedAPIs:(id)a3
{
  WebKit *v5;
  WTF::StringImpl *v6;
  uint64_t v7;
  WTF::StringImpl **v8;
  WTF::StringImpl **v9;
  void *v10;
  WTF::StringImpl **v11;

  v5 = (WebKit *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!unsupportedAPIs || [unsupportedAPIs isKindOfClass:NSSet.class]"));

    }
  }
  WebKit::toImpl(v5, (uint64_t *)&v11);
  v7 = *(_QWORD *)&self[1]._webExtensionContext.data.__lx[8];
  if (!v7 || !*(_QWORD *)(v7 + 8))
  {
    v8 = v11;
    v11 = 0;
    v9 = *(WTF::StringImpl ***)&self[2]._webExtensionContext.data.__lx[16];
    *(_QWORD *)&self[2]._webExtensionContext.data.__lx[16] = v8;
    if (!v9)
      goto LABEL_9;
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v9, v6);
  }
  if (v11)
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v11, v6);
LABEL_9:

}

- (WKWebViewConfiguration)webViewConfiguration
{
  return (WKWebViewConfiguration *)WebKit::WebExtensionContext::webViewConfiguration((uint64_t)&self->_webExtensionContext, 4);
}

- (NSURL)optionsPageURL
{
  WTF::StringImpl *v2;
  id v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v6;

  WebKit::WebExtensionContext::optionsPageURL((WebKit::WebExtensionContext *)&self->_webExtensionContext, (WTF::URL *)&v6);
  v3 = (id)WTF::URL::operator NSURL *();
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v2);
    else
      *(_DWORD *)v4 -= 2;
  }
  return (NSURL *)v3;
}

- (NSURL)overrideNewTabPageURL
{
  WTF::StringImpl *v2;
  id v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v6;

  WebKit::WebExtensionContext::overrideNewTabPageURL((WebKit::WebExtensionContext *)&self->_webExtensionContext, (WTF::URL *)&v6);
  v3 = (id)WTF::URL::operator NSURL *();
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v2);
    else
      *(_DWORD *)v4 -= 2;
  }
  return (NSURL *)v3;
}

- (NSDictionary)grantedPermissions
{
  unsigned __int8 *v2;

  v2 = &self[2]._webExtensionContext.data.__lx[32];
  WebKit::WebExtensionContext::removeExpired((uint64_t)&self->_webExtensionContext, (uint64_t *)&self[2]._webExtensionContext.data.__lx[32], (double *)&self[3], CFSTR("_WKWebExtensionContextGrantedPermissionsWereRemoved"));
  return (NSDictionary *)toAPI((_QWORD **)v2);
}

- (void)setGrantedPermissions:(id)a3
{
  id v5;
  WTF::StringImpl *v6;
  void *v7;
  WTF::StringImpl **v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[grantedPermissions isKindOfClass:NSDictionary.class]"));

  }
  toImpl((uint64_t *)&v8, v5);
  WebKit::WebExtensionContext::setGrantedPermissions((uint64_t)&self->_webExtensionContext, (uint64_t *)&v8);
  if (v8)
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::WallTime>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::WallTime>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::WallTime,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::WallTime>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v8, v6);

}

- (NSDictionary)grantedPermissionMatchPatterns
{
  unsigned __int8 *v2;

  v2 = &self[3]._webExtensionContext.data.__lx[8];
  WebKit::WebExtensionContext::removeExpired((WebKit::WebExtensionContext *)&self->_webExtensionContext, (uint64_t *)&self[3]._webExtensionContext.data.__lx[8], (double *)&self[3]._webExtensionContext.data.__lx[24], CFSTR("_WKWebExtensionContextGrantedPermissionMatchPatternsWereRemoved"));
  return (NSDictionary *)toAPI((_QWORD **)v2);
}

- (void)setGrantedPermissionMatchPatterns:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[grantedPermissionMatchPatterns isKindOfClass:NSDictionary.class]"));

  }
  toImpl((uint64_t *)&v8, v5);
  WebKit::WebExtensionContext::setGrantedPermissionMatchPatterns((uint64_t)&self->_webExtensionContext, (uint64_t *)&v8);
  if (v8)
    WTF::HashTable<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::KeyValuePair<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::WallTime>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::WallTime>>,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>,WTF::HashMap<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::WallTime,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>,WTF::HashTraits<WTF::WallTime>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>>::deallocateTable(v8, v6);

}

- (NSDictionary)deniedPermissions
{
  unsigned __int8 *v2;

  v2 = &self[2]._webExtensionContext.data.__lx[40];
  WebKit::WebExtensionContext::removeExpired((uint64_t)&self->_webExtensionContext, (uint64_t *)&self[2]._webExtensionContext.data.__lx[40], (double *)self[3]._webExtensionContext.data.__lx, CFSTR("_WKWebExtensionContextDeniedPermissionsWereRemoved"));
  return (NSDictionary *)toAPI((_QWORD **)v2);
}

- (void)setDeniedPermissions:(id)a3
{
  id v5;
  WTF::StringImpl *v6;
  void *v7;
  WTF::StringImpl **v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[deniedPermissions isKindOfClass:NSDictionary.class]"));

  }
  toImpl((uint64_t *)&v8, v5);
  WebKit::WebExtensionContext::setDeniedPermissions((uint64_t)&self->_webExtensionContext, (uint64_t *)&v8);
  if (v8)
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::WallTime>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::WallTime>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::WallTime,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::WallTime>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v8, v6);

}

- (NSDictionary)deniedPermissionMatchPatterns
{
  unsigned __int8 *v2;

  v2 = &self[3]._webExtensionContext.data.__lx[16];
  WebKit::WebExtensionContext::removeExpired((WebKit::WebExtensionContext *)&self->_webExtensionContext, (uint64_t *)&self[3]._webExtensionContext.data.__lx[16], (double *)&self[3]._webExtensionContext.data.__lx[32], CFSTR("_WKWebExtensionContextDeniedPermissionMatchPatternsWereRemoved"));
  return (NSDictionary *)toAPI((_QWORD **)v2);
}

- (void)setDeniedPermissionMatchPatterns:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[deniedPermissionMatchPatterns isKindOfClass:NSDictionary.class]"));

  }
  toImpl((uint64_t *)&v8, v5);
  WebKit::WebExtensionContext::setDeniedPermissionMatchPatterns((uint64_t)&self->_webExtensionContext, (uint64_t *)&v8);
  if (v8)
    WTF::HashTable<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::KeyValuePair<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::WallTime>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::WallTime>>,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>,WTF::HashMap<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::WallTime,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>,WTF::HashTraits<WTF::WallTime>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>>::deallocateTable(v8, v6);

}

- (BOOL)requestedOptionalAccessToAllHosts
{
  return self[4]._webExtensionContext.data.__lx[24];
}

- (void)setRequestedOptionalAccessToAllHosts:(BOOL)a3
{
  self[4]._webExtensionContext.data.__lx[24] = a3;
}

- (BOOL)hasAccessInPrivateBrowsing
{
  return self[4]._webExtensionContext.data.__lx[25];
}

- (void)setHasAccessInPrivateBrowsing:(BOOL)a3
{
  WebKit::WebExtensionContext::setHasAccessInPrivateBrowsing(self->_webExtensionContext.data.__lx, a3);
}

- (NSSet)currentPermissions
{
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  __CFString *v6;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;

  WebKit::WebExtensionContext::currentPermissions((WebKit::WebExtensionContext *)&self->_webExtensionContext, &v9);
  if (*v9 && *(_DWORD *)(*v9 - 12))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v10;
    v4 = v12;
    if (v10 != v12)
    {
      v5 = v11;
      do
      {
        if (*v3)
          v6 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
        else
          v6 = &stru_1E351F1B8;
        objc_msgSend(v2, "addObject:", v6);

        while (1)
        {
          v3 += 2;
          if (v3 == v5)
            break;
          if ((unint64_t)(*v3 + 1) > 1)
            goto LABEL_12;
        }
        v3 = v5;
LABEL_12:
        ;
      }
      while (v3 != v4);
    }
    v8 = (void *)objc_msgSend(v2, "copy");

    return (NSSet *)v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSSet)currentPermissionMatchPatterns
{
  void *v2;
  id **v3;
  id **v4;
  id **v5;
  id v6;
  void *v7;
  _QWORD *v9;
  id **v10;
  id **v11;
  id **v12;

  WebKit::WebExtensionContext::currentPermissionMatchPatterns((WebKit::WebExtensionContext *)&self->_webExtensionContext, &v9);
  if (*v9 && *(_DWORD *)(*v9 - 12))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v10;
    v4 = v12;
    if (v10 != v12)
    {
      v5 = v11;
      do
      {
        v6 = WebKit::WebExtension::wrapper(*v3);
        objc_msgSend(v2, "addObject:", v6);

        while (1)
        {
          v3 += 2;
          if (v3 == v5)
            break;
          if ((unint64_t)*v3 + 1 > 1)
            goto LABEL_10;
        }
        v3 = v5;
LABEL_10:
        ;
      }
      while (v3 != v4);
    }
    v7 = (void *)objc_msgSend(v2, "copy");

    return (NSSet *)v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)hasPermission:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[permission isKindOfClass:NSString.class]"));

  }
  v6 = -[_WKWebExtensionContext hasPermission:inTab:](self, "hasPermission:inTab:", v5, 0);

  return v6;
}

- (BOOL)hasPermission:(id)a3 inTab:(id)a4
{
  id v7;
  id v8;
  uint64_t *p_webExtensionContext;
  id v10;
  WebKit::WebExtensionTab *v11;
  WTF::StringImpl *v12;
  int v13;
  WTF::StringImpl *v14;
  void *v16;
  void *v17;
  WTF::StringImpl *v18;
  WebKit::WebExtensionTab *v19;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 352, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[permission isKindOfClass:NSString.class]"));

    if (!v8)
      goto LABEL_5;
  }
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
LABEL_5:
  MEMORY[0x19AEABCC8](&v18, v7);
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  v10 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v10, (uint64_t)&v19);
    v11 = v19;
    if (v19)
    {
      ++*(_DWORD *)v19;
      v19 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
    }
  }
  else
  {
    v11 = 0;
  }

  v13 = WebKit::WebExtensionContext::permissionState((uint64_t)p_webExtensionContext, &v18, v11, 2);
  if (v11)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
  v14 = v18;
  v18 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v12);
    else
      *(_DWORD *)v14 -= 2;
  }

  return (v13 & 0xFFFFFFFE) == 2;
}

- (BOOL)hasAccessToURL:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 361, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[url isKindOfClass:NSURL.class]"));

  }
  v6 = -[_WKWebExtensionContext hasAccessToURL:inTab:](self, "hasAccessToURL:inTab:", v5, 0);

  return v6;
}

- (BOOL)hasAccessToURL:(id)a3 inTab:(id)a4
{
  id v7;
  id v8;
  uint64_t *p_webExtensionContext;
  id v10;
  URL *v11;
  WTF::StringImpl *v12;
  int v13;
  StringImpl *m_ptr;
  void *v16;
  void *v17;
  URL v18;
  URL *v19;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 368, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[url isKindOfClass:NSURL.class]"));

    if (!v8)
      goto LABEL_5;
  }
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
LABEL_5:
  MEMORY[0x19AEABB18](&v18, v7);
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  v10 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v10, (uint64_t)&v19);
    v11 = v19;
    if (v19)
    {
      ++LODWORD(v19->m_string.m_impl.m_ptr);
      v19 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
    }
  }
  else
  {
    v11 = 0;
  }

  v13 = WebKit::WebExtensionContext::permissionState((uint64_t)p_webExtensionContext, &v18, v11, 3);
  if (v11)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
  m_ptr = v18.m_string.m_impl.m_ptr;
  v18.m_string.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, v12);
    else
      *(_DWORD *)m_ptr -= 2;
  }

  return (v13 & 0xFFFFFFFE) == 2;
}

- (int64_t)permissionStatusForPermission:(id)a3
{
  id v5;
  int64_t v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 420, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[permission isKindOfClass:NSString.class]"));

  }
  v6 = -[_WKWebExtensionContext permissionStatusForPermission:inTab:](self, "permissionStatusForPermission:inTab:", v5, 0);

  return v6;
}

- (int64_t)permissionStatusForPermission:(id)a3 inTab:(id)a4
{
  id v7;
  id v8;
  uint64_t *p_webExtensionContext;
  id v10;
  WebKit::WebExtensionTab *v11;
  WTF::StringImpl *v12;
  int v13;
  WTF::StringImpl *v14;
  int64_t v15;
  void *v17;
  void *v18;
  WTF::StringImpl *v19;
  WebKit::WebExtensionTab *v20;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[permission isKindOfClass:NSString.class]"));

    if (!v8)
      goto LABEL_5;
  }
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
LABEL_5:
  MEMORY[0x19AEABCC8](&v19, v7);
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  v10 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v10, (uint64_t)&v20);
    v11 = v20;
    if (v20)
    {
      ++*(_DWORD *)v20;
      v20 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
    }
  }
  else
  {
    v11 = 0;
  }

  v13 = WebKit::WebExtensionContext::permissionState((uint64_t)p_webExtensionContext, &v19, v11, 0);
  if (v11)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
  v14 = v19;
  v19 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v12);
    else
      *(_DWORD *)v14 -= 2;
  }
  if ((v13 + 2) >= 6)
    v15 = -3;
  else
    v15 = (v13 + 2) - 2;

  return v15;
}

- (void)setPermissionStatus:(int64_t)a3 forPermission:(id)a4
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 436, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status == _WKWebExtensionContextPermissionStatusDeniedExplicitly || status == _WKWebExtensionContextPermissionStatusUnknown || status == _WKWebExtensionContextPermissionStatusGrantedExplicitly"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 437, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[permission isKindOfClass:NSString.class]"));

  }
  -[_WKWebExtensionContext setPermissionStatus:forPermission:expirationDate:](self, "setPermissionStatus:forPermission:expirationDate:", a3, v9, 0);

}

- (void)setPermissionStatus:(int64_t)a3 forPermission:(id)a4 expirationDate:(id)a5
{
  id v9;
  NSDate *v10;
  void *v11;
  double v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  void *v15;
  WTF::StringImpl *v16;

  v9 = a4;
  v10 = (NSDate *)a5;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 444, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status == _WKWebExtensionContextPermissionStatusDeniedExplicitly || status == _WKWebExtensionContextPermissionStatusUnknown || status == _WKWebExtensionContextPermissionStatusGrantedExplicitly"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 445, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[permission isKindOfClass:NSString.class]"));

  }
  if ((unint64_t)(a3 + 3) >= 7)
    LOBYTE(a3) = 0;
  MEMORY[0x19AEABCC8](&v16, v9);
  v12 = toImpl(v10);
  WebKit::WebExtensionContext::setPermissionState((uint64_t)&self->_webExtensionContext, (char)a3, &v16, v12);
  v14 = v16;
  v16 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v13);
    else
      *(_DWORD *)v14 -= 2;
  }

}

- (int64_t)permissionStatusForURL:(id)a3
{
  id v5;
  int64_t v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 452, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[url isKindOfClass:NSURL.class]"));

  }
  v6 = -[_WKWebExtensionContext permissionStatusForURL:inTab:](self, "permissionStatusForURL:inTab:", v5, 0);

  return v6;
}

- (int64_t)permissionStatusForURL:(id)a3 inTab:(id)a4
{
  id v7;
  id v8;
  uint64_t *p_webExtensionContext;
  id v10;
  URL *v11;
  WTF::StringImpl *v12;
  int v13;
  StringImpl *m_ptr;
  int64_t v15;
  void *v17;
  void *v18;
  URL v19;
  URL *v20;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 459, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[url isKindOfClass:NSURL.class]"));

    if (!v8)
      goto LABEL_5;
  }
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 461, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
LABEL_5:
  MEMORY[0x19AEABB18](&v19, v7);
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  v10 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v10, (uint64_t)&v20);
    v11 = v20;
    if (v20)
    {
      ++LODWORD(v20->m_string.m_impl.m_ptr);
      v20 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
    }
  }
  else
  {
    v11 = 0;
  }

  v13 = WebKit::WebExtensionContext::permissionState((uint64_t)p_webExtensionContext, &v19, v11, 1);
  if (v11)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
  m_ptr = v19.m_string.m_impl.m_ptr;
  v19.m_string.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, v12);
    else
      *(_DWORD *)m_ptr -= 2;
  }
  if ((v13 + 2) >= 6)
    v15 = -3;
  else
    v15 = (v13 + 2) - 2;

  return v15;
}

- (void)setPermissionStatus:(int64_t)a3 forURL:(id)a4
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 468, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status == _WKWebExtensionContextPermissionStatusDeniedExplicitly || status == _WKWebExtensionContextPermissionStatusUnknown || status == _WKWebExtensionContextPermissionStatusGrantedExplicitly"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[url isKindOfClass:NSURL.class]"));

  }
  -[_WKWebExtensionContext setPermissionStatus:forURL:expirationDate:](self, "setPermissionStatus:forURL:expirationDate:", a3, v9, 0);

}

- (void)setPermissionStatus:(int64_t)a3 forURL:(id)a4 expirationDate:(id)a5
{
  id v9;
  NSDate *v10;
  void *v11;
  double v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  void *v15;
  WTF::StringImpl *v16[5];

  v9 = a4;
  v10 = (NSDate *)a5;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status == _WKWebExtensionContextPermissionStatusDeniedExplicitly || status == _WKWebExtensionContextPermissionStatusUnknown || status == _WKWebExtensionContextPermissionStatusGrantedExplicitly"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 477, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[url isKindOfClass:NSURL.class]"));

  }
  if ((unint64_t)(a3 + 3) >= 7)
    LOBYTE(a3) = 0;
  MEMORY[0x19AEABB18](v16, v9);
  v12 = toImpl(v10);
  WebKit::WebExtensionContext::setPermissionState((uint64_t)&self->_webExtensionContext, (char)a3, (uint64_t)v16, v12);
  v14 = v16[0];
  v16[0] = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v13);
    else
      *(_DWORD *)v14 -= 2;
  }

}

- (int64_t)permissionStatusForMatchPattern:(id)a3
{
  id v5;
  int64_t v6;
  void *v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 484, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[pattern isKindOfClass:_WKWebExtensionMatchPattern.class]"));

  }
  v6 = -[_WKWebExtensionContext permissionStatusForMatchPattern:inTab:](self, "permissionStatusForMatchPattern:inTab:", v5, 0);

  return v6;
}

- (int64_t)permissionStatusForMatchPattern:(id)a3 inTab:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *p_webExtensionContext;
  id v11;
  WebKit::WebExtensionTab *v12;
  int v13;
  int64_t v14;
  void *v16;
  void *v17;
  WebKit::WebExtensionTab *v18;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 491, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[pattern isKindOfClass:_WKWebExtensionMatchPattern.class]"));

    if (!v8)
      goto LABEL_5;
  }
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 493, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
LABEL_5:
  v9 = objc_msgSend(v7, "_webExtensionMatchPattern");
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  v11 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v11, (uint64_t)&v18);
    v12 = v18;
    if (v18)
    {
      ++*(_DWORD *)v18;
      v18 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v12);
    }
  }
  else
  {
    v12 = 0;
  }

  v13 = WebKit::WebExtensionContext::permissionState((uint64_t)p_webExtensionContext, v9, v12, 1);
  if (v12)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v12);
  if ((v13 + 2) >= 6)
    v14 = -3;
  else
    v14 = (v13 + 2) - 2;

  return v14;
}

- (void)setPermissionStatus:(int64_t)a3 forMatchPattern:(id)a4
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 500, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status == _WKWebExtensionContextPermissionStatusDeniedExplicitly || status == _WKWebExtensionContextPermissionStatusUnknown || status == _WKWebExtensionContextPermissionStatusGrantedExplicitly"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[pattern isKindOfClass:_WKWebExtensionMatchPattern.class]"));

  }
  -[_WKWebExtensionContext setPermissionStatus:forMatchPattern:expirationDate:](self, "setPermissionStatus:forMatchPattern:expirationDate:", a3, v9, 0);

}

- (void)setPermissionStatus:(int64_t)a3 forMatchPattern:(id)a4 expirationDate:(id)a5
{
  NSDate *v9;
  void *v10;
  char v11;
  uint64_t v12;
  double v13;
  void *v14;
  id v15;

  v15 = a4;
  v9 = (NSDate *)a5;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 508, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("status == _WKWebExtensionContextPermissionStatusDeniedExplicitly || status == _WKWebExtensionContextPermissionStatusUnknown || status == _WKWebExtensionContextPermissionStatusGrantedExplicitly"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 509, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[pattern isKindOfClass:_WKWebExtensionMatchPattern.class]"));

  }
  if ((unint64_t)(a3 + 3) >= 7)
    v11 = 0;
  else
    v11 = a3;
  v12 = objc_msgSend(v15, "_webExtensionMatchPattern");
  v13 = toImpl(v9);
  WebKit::WebExtensionContext::setPermissionState((uint64_t)&self->_webExtensionContext, v11, v12, v13);

}

- (BOOL)hasAccessToAllURLs
{
  return WebKit::WebExtensionContext::hasAccessToAllURLs((WebKit::WebExtensionContext *)&self->_webExtensionContext);
}

- (BOOL)hasAccessToAllHosts
{
  return WebKit::WebExtensionContext::hasAccessToAllHosts((WebKit::WebExtensionContext *)&self->_webExtensionContext);
}

- (BOOL)hasInjectedContent
{
  BOOL v2;
  WTF::StringImpl *v3;
  _DWORD v5[4];

  WebKit::WebExtensionContext::injectedContents((WebKit::WebExtensionContext *)&self->_webExtensionContext, (uint64_t)v5);
  v2 = v5[3] != 0;
  WTF::Vector<WebKit::WebExtension::InjectedContentData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v5, v3);
  return v2;
}

- (BOOL)hasInjectedContentForURL:(id)a3
{
  id v5;
  WTF::StringImpl *v6;
  char hasInjectedContentForURL;
  WTF::StringImpl *v8;
  void *v10;
  WTF::StringImpl *v11[5];

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[url isKindOfClass:NSURL.class]"));

  }
  MEMORY[0x19AEABB18](v11, v5);
  hasInjectedContentForURL = WebKit::WebExtensionContext::hasInjectedContentForURL((WebKit::WebExtensionContext *)&self->_webExtensionContext, (const WTF::URL *)v11);
  v8 = v11[0];
  v11[0] = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
  }

  return hasInjectedContentForURL;
}

- (BOOL)hasContentModificationRules
{
  return WebKit::WebExtensionContext::hasContentModificationRules((WebKit::WebExtensionContext *)&self->_webExtensionContext);
}

- (void)loadBackgroundContentWithCompletionHandler:(id)a3
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34AABB8;
  v5[1] = v4;
  v6 = v5;
  WebKit::WebExtensionContext::loadBackgroundContent((uint64_t)&self->_webExtensionContext, (uint64_t *)&v6);
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
}

- (id)actionForTab:(id)a3
{
  id v5;
  void *v6;
  uint64_t *p_webExtensionContext;
  WebKit::WebExtensionTab *v8;
  void *v9;
  WebKit::WebExtension *v10;
  void *v12;
  WebKit::WebExtension *v13;
  WebKit::WebExtensionTab *v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 549, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

    }
    p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v6, (uint64_t)&v14);
    v8 = v14;
    if (v14)
    {
      ++*(_DWORD *)v14;
      v14 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v8);
    }
  }
  else
  {
    v8 = 0;
    p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  }

  WebKit::WebExtensionContext::getOrCreateAction((WebKit::WebExtensionContext *)p_webExtensionContext, v8, (uint64_t *)&v13);
  WebKit::WebExtension::wrapper((id *)v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  v13 = 0;
  if (v10)
    CFRelease(*((CFTypeRef *)v10 + 1));
  if (v8)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v8);

  return v9;
}

- (void)performActionForTab:(id)a3
{
  id v5;
  void *v6;
  uint64_t *p_webExtensionContext;
  WebKit::WebExtensionTab *v8;
  void *v9;
  WebKit::WebExtensionTab *v10;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 557, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

    }
    p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v6, (uint64_t)&v10);
    v8 = v10;
    if (v10)
    {
      ++*(_DWORD *)v10;
      v10 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v8);
    }
  }
  else
  {
    v8 = 0;
    p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  }

  WebKit::WebExtensionContext::performAction((WebKit::WebExtensionContext *)p_webExtensionContext, v8, 1);
  if (v8)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v8);

}

- (NSArray)commands
{
  uint64_t *v2;
  uint64_t *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  WTF *v9;
  NSMutableArray *v10;
  objc_object *v11;
  void *v12;
  CFTypeRef v13;
  CFTypeRef cf;

  WebKit::WebExtensionContext::commands((WebKit::WebExtensionContext *)&self->_webExtensionContext);
  v3 = v2;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)v2 + 3));
  v5 = v4;
  cf = v4;
  if (v4)
    CFRetain(v4);

  v6 = *((unsigned int *)v3 + 3);
  if ((_DWORD)v6)
  {
    v7 = *v3;
    v8 = 8 * v6;
    do
    {
      WTF::RetainPtr<NSMutableArray>::get((id *)&cf);
      v9 = (WTF *)objc_claimAutoreleasedReturnValue();
      v10 = (NSMutableArray *)*(id *)(*(_QWORD *)v7 + 8);
      WTF::addUnlessNil(v9, v10, v11);

      v7 += 8;
      v8 -= 8;
    }
    while (v8);
  }
  WTF::RetainPtr<NSMutableArray>::get((id *)&cf);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = cf;
  cf = 0;
  if (v13)
    CFRelease(v13);
  return (NSArray *)v12;
}

- (void)performCommand:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 571, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:_WKWebExtensionCommand.class]"));

  }
  WebKit::WebExtensionContext::performCommand((uint64_t)&self->_webExtensionContext, (WebKit::WebExtensionCommand *)objc_msgSend(v6, "_webExtensionCommand"), 1);

}

- (BOOL)performCommandForKeyCommand:(id)a3
{
  UIKeyCommand *v5;
  char v6;
  void *v8;

  v5 = (UIKeyCommand *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 579, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[keyCommand isKindOfClass:UIKeyCommand.class]"));

  }
  v6 = WebKit::WebExtensionContext::performCommand((WebKit::WebExtensionContext *)&self->_webExtensionContext, v5);

  return v6;
}

- (id)menuItemsForTab:(id)a3
{
  id v5;
  uint64_t *p_webExtensionContext;
  void *v7;
  WebKit::WebExtensionTab *v8;
  void *v10;
  WebKit::WebExtensionTab *v11;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 605, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v5, (uint64_t)&v11);
  WebKit::WebExtensionContext::platformMenuItems((WebKit::WebExtensionContext *)p_webExtensionContext, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v11 = 0;
  if (v8)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v8);

  return v7;
}

- (void)userGesturePerformedInTab:(id)a3
{
  id v5;
  uint64_t *p_webExtensionContext;
  WebKit::WebExtensionTab *v7;
  void *v8;
  WebKit::WebExtensionTab *v9;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 612, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v5, (uint64_t)&v9);
  WebKit::WebExtensionContext::userGesturePerformed((WebKit::WebExtensionContext *)p_webExtensionContext, v9);
  v7 = v9;
  v9 = 0;
  if (v7)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v7);

}

- (BOOL)hasActiveUserGestureInTab:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  void *v11;
  uint64_t v12;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 619, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  WebKit::WebExtensionContext::getOrCreateTab((uint64_t *)&self->_webExtensionContext, v5, (uint64_t)&v12);
  v6 = v12;
  v7 = *(_QWORD *)&self[1]._webExtensionContext.data.__lx[8];
  if (v7 && *(_QWORD *)(v7 + 8))
  {
    v8 = *(_DWORD *)(v12 + 50) & 1;
    v12 = 0;
LABEL_7:
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v6);
    v9 = v8;
    goto LABEL_8;
  }
  LOBYTE(v8) = 0;
  v9 = 0;
  v12 = 0;
  if (v6)
    goto LABEL_7;
LABEL_8:

  return v9;
}

- (void)clearUserGestureInTab:(id)a3
{
  id v5;
  uint64_t *p_webExtensionContext;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 626, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v5, (uint64_t)&v9);
  WebKit::WebExtensionContext::clearUserGesture((uint64_t)p_webExtensionContext, v9);
  v7 = v9;
  v9 = 0;
  if (v7)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v7);

}

- (NSArray)openWindows
{
  id v2;
  void *v3;
  _DWORD **v4;
  uint64_t v5;
  _DWORD *v6;
  _DWORD *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _DWORD **v12;
  unsigned int v13;

  WebKit::WebExtensionContext::openWindows((unsigned int *)self->_webExtensionContext.data.__lx, (void *)1, (uint64_t)&v12);
  if (v13)
  {
    v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v3 = (void *)objc_msgSend(v2, "initWithCapacity:", v13);
    if (v13)
    {
      v4 = v12;
      v5 = 8 * v13;
      do
      {
        v6 = *v4;
        v7 = *v4;
        *v7 = **v4 + 1;
        WeakRetained = objc_loadWeakRetained((id *)v7 + 4);
        if (WeakRetained)
          objc_msgSend(v3, "addObject:", WeakRetained);

        WTF::RefCounted<WebKit::WebExtensionWindow>::deref((uint64_t)v6);
        ++v4;
        v5 -= 8;
      }
      while (v5);
    }
    v9 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  WTF::Vector<WTF::Ref<WebKit::WebExtensionWindow,WTF::RawPtrTraits<WebKit::WebExtensionWindow>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionWindow>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v12, v10);
  return (NSArray *)v9;
}

- (_WKWebExtensionWindow)focusedWindow
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v5;

  if (!self[9]._webExtensionContext.data.__lx[16])
    return (_WKWebExtensionWindow *)0;
  WebKit::WebExtensionContext::getWindow((uint64_t)&self->_webExtensionContext, *(_QWORD *)&self[9]._webExtensionContext.data.__lx[8], 0, 0, 1, &v5);
  v2 = v5;
  if (!v5)
    return (_WKWebExtensionWindow *)0;
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 32));
  WTF::RefCounted<WebKit::WebExtensionWindow>::deref(v2);
  return (_WKWebExtensionWindow *)WeakRetained;
}

- (NSSet)openTabs
{
  id v2;
  void *v3;
  _DWORD **v4;
  uint64_t v5;
  _DWORD *v6;
  _DWORD *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _DWORD **v12;
  unsigned int v13;

  WebKit::WebExtensionContext::openTabs((uint64_t)&self->_webExtensionContext, (void *)1, (uint64_t)&v12);
  if (v13)
  {
    v2 = objc_alloc(MEMORY[0x1E0C99E20]);
    v3 = (void *)objc_msgSend(v2, "initWithCapacity:", v13);
    if (v13)
    {
      v4 = v12;
      v5 = 8 * v13;
      do
      {
        v6 = *v4;
        v7 = *v4;
        *v7 = **v4 + 1;
        WeakRetained = objc_loadWeakRetained((id *)v7 + 4);
        if (WeakRetained)
          objc_msgSend(v3, "addObject:", WeakRetained);

        WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v6);
        ++v4;
        v5 -= 8;
      }
      while (v5);
    }
    v9 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  WTF::Vector<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v12, v10);
  return (NSSet *)v9;
}

- (void)didOpenWindow:(id)a3
{
  id v5;
  ObjectStorage<WebKit::WebExtensionContext> *p_webExtensionContext;
  WebKit::WebExtensionWindow *v7;
  void *v8;
  WebKit::WebExtensionWindow *v9;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3C7300) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 688, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[newWindow conformsToProtocol:@protocol(_WKWebExtensionWindow)]"));

  }
  p_webExtensionContext = &self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateWindow((uint64_t)p_webExtensionContext, v5, (uint64_t)&v9);
  WebKit::WebExtensionContext::didOpenWindow((uint64_t)p_webExtensionContext, v9, 1, 0);
  v7 = v9;
  v9 = 0;
  if (v7)
    WTF::RefCounted<WebKit::WebExtensionWindow>::deref((uint64_t)v7);

}

- (void)didCloseWindow:(id)a3
{
  id v5;
  ObjectStorage<WebKit::WebExtensionContext> *p_webExtensionContext;
  WebKit::WebExtensionWindow *v7;
  void *v8;
  WebKit::WebExtensionWindow *v9;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3C7300) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 695, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[closedWindow conformsToProtocol:@protocol(_WKWebExtensionWindow)]"));

  }
  p_webExtensionContext = &self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateWindow((uint64_t)p_webExtensionContext, v5, (uint64_t)&v9);
  WebKit::WebExtensionContext::didCloseWindow((WebKit::WebExtensionContext *)p_webExtensionContext, v9);
  v7 = v9;
  v9 = 0;
  if (v7)
    WTF::RefCounted<WebKit::WebExtensionWindow>::deref((uint64_t)v7);

}

- (void)didFocusWindow:(id)a3
{
  id v5;
  void *v6;
  ObjectStorage<WebKit::WebExtensionContext> *p_webExtensionContext;
  WebKit::WebExtensionWindow *v8;
  uint64_t v9;
  void *v10;
  WebKit::WebExtensionWindow *v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3C7300) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 703, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[focusedWindow conformsToProtocol:@protocol(_WKWebExtensionWindow)]"));

    }
    p_webExtensionContext = &self->_webExtensionContext;
    WebKit::WebExtensionContext::getOrCreateWindow((uint64_t)p_webExtensionContext, v6, (uint64_t)&v11);
    v8 = v11;
  }
  else
  {
    v8 = 0;
    p_webExtensionContext = &self->_webExtensionContext;
  }
  WebKit::WebExtensionContext::didFocusWindow((uint64_t)p_webExtensionContext, v8, 0);
  if (v6)
  {
    v9 = (uint64_t)v11;
    v11 = 0;
    if (v9)
      WTF::RefCounted<WebKit::WebExtensionWindow>::deref(v9);
  }

}

- (void)didOpenTab:(id)a3
{
  id v5;
  uint64_t *p_webExtensionContext;
  WebKit::WebExtensionTab *v7;
  void *v8;
  WebKit::WebExtensionTab *v9;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 733, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[newTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v5, (uint64_t)&v9);
  WebKit::WebExtensionContext::didOpenTab((uint64_t)p_webExtensionContext, v9, 0);
  v7 = v9;
  v9 = 0;
  if (v7)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v7);

}

- (void)didCloseTab:(id)a3 windowIsClosing:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t *p_webExtensionContext;
  WebKit::WebExtensionTab *v9;
  void *v10;
  WebKit::WebExtensionTab *v11;

  v4 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 740, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[closedTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v7, (uint64_t)&v11);
  WebKit::WebExtensionContext::didCloseTab(p_webExtensionContext, v11, v4, 0);
  v9 = v11;
  v11 = 0;
  if (v9)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v9);

}

- (void)didActivateTab:(id)a3 previousActiveTab:(id)a4
{
  id v7;
  id v8;
  uint64_t *p_webExtensionContext;
  uint64_t v10;
  id v11;
  const WebKit::WebExtensionTab *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const WebKit::WebExtensionTab *v17;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE3C72A0) & 1) != 0)
  {
    if (!v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 747, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[activatedTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

    if (!v8)
      goto LABEL_5;
  }
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 749, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[previousTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
LABEL_5:
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab((uint64_t *)&self->_webExtensionContext, v7, (uint64_t)&v16);
  v10 = v16;
  v11 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v11, (uint64_t)&v17);
    v12 = v17;
    if (v17)
    {
      ++*(_DWORD *)v17;
      v17 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v12);
    }
  }
  else
  {
    v12 = 0;
  }

  WebKit::WebExtensionContext::didActivateTab((WebKit::WebExtensionContext *)p_webExtensionContext, v10, v12);
  if (v12)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v12);
  v13 = v16;
  v16 = 0;
  if (v13)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v13);

}

- (void)didSelectTabs:(id)a3
{
  id v5;
  uint64_t *p_webExtensionContext;
  void *v7;
  void *v8;
  WebKit::WebExtensionTab **v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 756, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[selectedTabs isKindOfClass:NSSet.class]"));

  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  toImpl((uint64_t *)&v9, v5, p_webExtensionContext);
  WebKit::WebExtensionContext::didSelectOrDeselectTabs((uint64_t)p_webExtensionContext, &v9);
  if (v9)
    WTF::HashTable<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>,WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>>::deallocateTable((uint64_t *)v9, v7);

}

- (void)didDeselectTabs:(id)a3
{
  id v5;
  uint64_t *p_webExtensionContext;
  void *v7;
  void *v8;
  WebKit::WebExtensionTab **v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 763, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[deselectedTabs isKindOfClass:NSSet.class]"));

  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  toImpl((uint64_t *)&v9, v5, p_webExtensionContext);
  WebKit::WebExtensionContext::didSelectOrDeselectTabs((uint64_t)p_webExtensionContext, &v9);
  if (v9)
    WTF::HashTable<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>,WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>>::deallocateTable((uint64_t *)v9, v7);

}

- (void)didMoveTab:(id)a3 fromIndex:(unint64_t)a4 inWindow:(id)a5
{
  id v9;
  id v10;
  uint64_t *p_webExtensionContext;
  WebKit::WebExtensionTab *v12;
  const WebKit::WebExtensionWindow *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const WebKit::WebExtensionWindow *v18;
  WebKit::WebExtensionTab *v19;

  v9 = a3;
  v10 = a5;
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EE3C72A0) & 1) != 0)
  {
    if (!v10)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 770, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[movedTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

    if (!v10)
      goto LABEL_5;
  }
  if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EE3C7300) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 772, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[oldWindow conformsToProtocol:@protocol(_WKWebExtensionWindow)]"));

  }
LABEL_5:
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v9, (uint64_t)&v19);
  v12 = v19;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    a4 = -1;
  if (v10)
  {
    WebKit::WebExtensionContext::getOrCreateWindow((uint64_t)p_webExtensionContext, v10, (uint64_t)&v18);
    v13 = v18;
  }
  else
  {
    v13 = 0;
  }
  WebKit::WebExtensionContext::didMoveTab((WebKit::WebExtensionContext *)p_webExtensionContext, v12, a4, v13);
  if (v10)
  {
    v14 = (uint64_t)v18;
    v18 = 0;
    if (v14)
      WTF::RefCounted<WebKit::WebExtensionWindow>::deref(v14);
  }
  v15 = (uint64_t)v19;
  v19 = 0;
  if (v15)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v15);

}

- (void)didReplaceTab:(id)a3 withTab:(id)a4
{
  id v7;
  id v8;
  uint64_t *p_webExtensionContext;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 779, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[oldTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 780, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[newTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v7, (uint64_t)&v16);
  v10 = v16;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v8, (uint64_t)&v15);
  WebKit::WebExtensionContext::didReplaceTab(p_webExtensionContext, v10, v15, 0);
  v11 = v15;
  v15 = 0;
  if (v11)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
  v12 = (uint64_t)v16;
  v16 = 0;
  if (v12)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v12);

}

- (void)didChangeTabProperties:(unint64_t)a3 forTab:(id)a4
{
  id v7;
  uint64_t *p_webExtensionContext;
  __int16 v9;
  unsigned __int16 v10;
  WebKit::WebExtensionTab *v11;
  void *v12;
  WebKit::WebExtensionTab *v13;

  v7 = a4;
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionContext.mm"), 827, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[changedTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v7, (uint64_t)&v13);
  v9 = a3 & 0x3FE;
  if (a3 == -1)
    v9 = 1022;
  if (a3)
    v10 = v9;
  else
    v10 = 0;
  WebKit::WebExtensionContext::didChangeTabProperties((uint64_t)p_webExtensionContext, v13, v10);
  v11 = v13;
  v13 = 0;
  if (v11)
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);

}

- (WKWebView)_backgroundWebView
{
  return (WKWebView *)WTF::RetainPtr<NSMutableArray>::get((id *)&self[5]._webExtensionContext.data.__lx[24]);
}

- (NSURL)_backgroundContentURL
{
  WTF::StringImpl *v2;
  id v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v6;

  WebKit::WebExtensionContext::backgroundContentURL((WebKit::WebExtension **)&self->_webExtensionContext, (WTF::URL *)&v6);
  v3 = (id)WTF::URL::operator NSURL *();
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v2);
    else
      *(_DWORD *)v4 -= 2;
  }
  return (NSURL *)v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionContext;
}

- (void)_webExtensionContext
{
  return &self->_webExtensionContext;
}

@end
