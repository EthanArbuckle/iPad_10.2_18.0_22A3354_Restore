@implementation _WKWebExtensionMatchPattern

+ (void)registerCustomURLScheme:(id)a3
{
  id v5;
  WTF::StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  void *v12;
  void *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  unsigned __int8 v17;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtensionMatchPattern.mm"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[urlScheme isKindOfClass:NSString.class]"));

  }
  MEMORY[0x19AEABCC8](&v15, v5);
  WTF::URLParser::maybeCanonicalizeScheme();
  v7 = v17;
  if (v17)
  {
    v8 = v16;
    v16 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, v6);
      else
        *(_DWORD *)v8 -= 2;
    }
  }
  v9 = v15;
  v15 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v6);
      if (v7)
        goto LABEL_14;
      goto LABEL_19;
    }
    *(_DWORD *)v9 -= 2;
  }
  if (v7)
    goto LABEL_14;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtensionMatchPattern.mm"), 56, CFSTR("Invalid parameter: '%@' is not a valid URL scheme"), v5);

LABEL_14:
  MEMORY[0x19AEABCC8](&v14, v5);
  WebKit::WebExtensionMatchPattern::registerCustomURLScheme((uint64_t *)&v14);
  v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }

}

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

  (**(void (***)(ObjectStorage<WebKit::WebExtensionMatchPattern> *, SEL))self->_webExtensionMatchPattern.data.__lx)(&self->_webExtensionMatchPattern, a2);
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionMatchPattern;
  -[_WKWebExtensionMatchPattern dealloc](&v3, sel_dealloc);
}

+ (id)allURLsMatchPattern
{
  WebKit::WebExtension *v2;
  id v3;
  WebKit::WebExtension *v5;
  id v6;

  WebKit::WebExtensionMatchPattern::allURLsMatchPattern(&v5);
  v2 = v5;
  WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v6, (id *)v5);
  v3 = v6;
  if (v2)
    CFRelease(*((CFTypeRef *)v2 + 1));
  return v3;
}

+ (id)allHostsAndSchemesMatchPattern
{
  WebKit::WebExtension *v2;
  id v3;
  WebKit::WebExtension *v5;
  id v6;

  WebKit::WebExtensionMatchPattern::allHostsAndSchemesMatchPattern(&v5);
  v2 = v5;
  WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v6, (id *)v5);
  v3 = v6;
  if (v2)
    CFRelease(*((CFTypeRef *)v2 + 1));
  return v3;
}

+ (id)matchPatternWithString:(id)a3
{
  id v5;
  const WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WebKit::WebExtension *v8;
  WebKit::WebExtension *v9;
  void *v10;
  WTF::StringImpl *v11;
  void *v13;
  WTF::StringImpl *v14;
  WebKit::WebExtension *v15;
  void *v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtensionMatchPattern.mm"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[patternString isKindOfClass:NSString.class]"));

  }
  MEMORY[0x19AEABCC8](&v14, v5);
  WebKit::WebExtensionMatchPattern::getOrCreate(&v14, v6, &v15);
  v8 = v15;
  if (v15)
  {
    v15 = 0;
    WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v16, (id *)v8);
    CFRelease(*((CFTypeRef *)v8 + 1));
    v9 = v15;
    v10 = v16;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  v15 = 0;
  if (v9)
    CFRelease(*((CFTypeRef *)v9 + 1));
  v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v7);
    else
      *(_DWORD *)v11 -= 2;
  }

  return v10;
}

+ (id)matchPatternWithScheme:(id)a3 host:(id)a4 path:(id)a5
{
  id v9;
  id v10;
  id v11;
  WTF::StringImpl *v12;
  WebKit::WebExtension *v13;
  WebKit::WebExtension *v14;
  void *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  void *v20;
  void *v21;
  void *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WebKit::WebExtension *v26;
  void *v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtensionMatchPattern.mm"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[scheme isKindOfClass:NSString.class]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtensionMatchPattern.mm"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[host isKindOfClass:NSString.class]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_WKWebExtensionMatchPattern.mm"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[path isKindOfClass:NSString.class]"));

  }
  MEMORY[0x19AEABCC8](&v25, v9);
  MEMORY[0x19AEABCC8](&v24, v10);
  MEMORY[0x19AEABCC8](&v23, v11);
  WebKit::WebExtensionMatchPattern::getOrCreate(&v25, &v24, &v23, &v26);
  v13 = v26;
  if (v26)
  {
    v26 = 0;
    WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v27, (id *)v13);
    CFRelease(*((CFTypeRef *)v13 + 1));
    v14 = v26;
    v15 = v27;
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  v26 = 0;
  if (v14)
    CFRelease(*((CFTypeRef *)v14 + 1));
  v16 = v23;
  v23 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy(v16, v12);
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v24;
  v24 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy(v17, v12);
    else
      *(_DWORD *)v17 -= 2;
  }
  v18 = v25;
  v25 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v12);
    else
      *(_DWORD *)v18 -= 2;
  }

  return v15;
}

- (_WKWebExtensionMatchPattern)initWithString:(id)a3 error:(id *)a4
{
  id v7;
  _WKWebExtensionMatchPattern *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  _WKWebExtensionMatchPattern *v12;
  _WKWebExtensionMatchPattern *v13;
  void *v14;
  const WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WebKit::WebExtension *v17;
  WebKit::WebExtension *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v21;
  WebKit::WebExtension *v22;
  WTF::StringImpl *v23;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a4)
    {
LABEL_3:
      v8 = self;
      v9 = -[_WKWebExtensionMatchPattern _apiObject](v8, "_apiObject");
      MEMORY[0x19AEABCC8](&v23, v7);
      WebKit::WebExtensionMatchPattern::WebExtensionMatchPattern(v9, &v23, a4);
      v11 = v23;
      v23 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2)
          WTF::StringImpl::destroy(v11, v10);
        else
          *(_DWORD *)v11 -= 2;
      }
      *(_QWORD *)(v9 + 8) = v8;

      if (BYTE1(v8[1].super.isa))
        v12 = v8;
      else
        v12 = 0;
      v13 = v12;
      goto LABEL_21;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionMatchPattern.mm"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[string isKindOfClass:NSString.class]"));

    if (a4)
      goto LABEL_3;
  }
  API::Object::constructInWrapper<WebKit::WebExtensionMatchPattern>(self);
  MEMORY[0x19AEABCC8](&v21, v7);
  WebKit::WebExtensionMatchPattern::getOrCreate(&v21, v15, &v22);
  v17 = v22;
  if (v22)
  {
    v22 = 0;
    WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v23, (id *)v17);
    CFRelease(*((CFTypeRef *)v17 + 1));
    v18 = v22;
    v13 = (_WKWebExtensionMatchPattern *)v23;
  }
  else
  {
    v13 = 0;
    v18 = 0;
  }
  v22 = 0;
  if (v18)
    CFRelease(*((CFTypeRef *)v18 + 1));
  v19 = v21;
  v21 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy(v19, v16);
    else
      *(_DWORD *)v19 -= 2;
  }
LABEL_21:

  return v13;
}

- (_WKWebExtensionMatchPattern)initWithScheme:(id)a3 host:(id)a4 path:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  _WKWebExtensionMatchPattern *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  _WKWebExtensionMatchPattern *v20;
  _WKWebExtensionMatchPattern *v21;
  void *v22;
  void *v23;
  void *v24;
  WTF::StringImpl *v25;
  WebKit::WebExtension *v26;
  WebKit::WebExtension *v27;
  WTF::StringImpl *v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;
  WebKit::WebExtension *v35;
  WTF::StringImpl *v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionMatchPattern.mm"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[scheme isKindOfClass:NSString.class]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionMatchPattern.mm"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[host isKindOfClass:NSString.class]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a6)
    {
LABEL_7:
      v14 = self;
      v15 = -[_WKWebExtensionMatchPattern _apiObject](v14, "_apiObject");
      MEMORY[0x19AEABCC8](&v36, v11);
      MEMORY[0x19AEABCC8](&v35, v12);
      MEMORY[0x19AEABCC8](&v34, v13);
      WebKit::WebExtensionMatchPattern::WebExtensionMatchPattern(v15, &v36, (uint64_t *)&v35, (uint64_t *)&v34, a6);
      v17 = v34;
      v34 = 0;
      if (v17)
      {
        if (*(_DWORD *)v17 == 2)
          WTF::StringImpl::destroy(v17, v16);
        else
          *(_DWORD *)v17 -= 2;
      }
      v18 = v35;
      v35 = 0;
      if (v18)
      {
        if (*(_DWORD *)v18 == 2)
          WTF::StringImpl::destroy(v18, v16);
        else
          *(_DWORD *)v18 -= 2;
      }
      v19 = v36;
      v36 = 0;
      if (v19)
      {
        if (*(_DWORD *)v19 == 2)
          WTF::StringImpl::destroy(v19, v16);
        else
          *(_DWORD *)v19 -= 2;
      }
      *(_QWORD *)(v15 + 8) = v14;

      if (BYTE1(v14[1].super.isa))
        v20 = v14;
      else
        v20 = 0;
      v21 = v20;
      goto LABEL_41;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionMatchPattern.mm"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[path isKindOfClass:NSString.class]"));

    if (a6)
      goto LABEL_7;
  }
  API::Object::constructInWrapper<WebKit::WebExtensionMatchPattern>(self);
  MEMORY[0x19AEABCC8](&v34, v11);
  MEMORY[0x19AEABCC8](&v33, v12);
  MEMORY[0x19AEABCC8](&v32, v13);
  WebKit::WebExtensionMatchPattern::getOrCreate(&v34, &v33, &v32, &v35);
  v26 = v35;
  if (v35)
  {
    v35 = 0;
    WebKit::wrapper<WebKit::WebExtensionMatchPattern>(&v36, (id *)v26);
    CFRelease(*((CFTypeRef *)v26 + 1));
    v27 = v35;
    v21 = (_WKWebExtensionMatchPattern *)v36;
  }
  else
  {
    v21 = 0;
    v27 = 0;
  }
  v35 = 0;
  if (v27)
    CFRelease(*((CFTypeRef *)v27 + 1));
  v28 = v32;
  v32 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2)
      WTF::StringImpl::destroy(v28, v25);
    else
      *(_DWORD *)v28 -= 2;
  }
  v29 = v33;
  v33 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 2)
      WTF::StringImpl::destroy(v29, v25);
    else
      *(_DWORD *)v29 -= 2;
  }
  v30 = v34;
  v34 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 2)
      WTF::StringImpl::destroy(v30, v25);
    else
      *(_DWORD *)v30 -= 2;
  }
LABEL_41:

  return v21;
}

- (_WKWebExtensionMatchPattern)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  _WKWebExtensionMatchPattern *v7;
  void *v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionMatchPattern.mm"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder isKindOfClass:NSCoder.class]"));

  }
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_WKWebExtensionMatchPattern initWithString:error:](self, "initWithString:error:", v6, 0);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionMatchPattern.mm"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder isKindOfClass:NSCoder.class]"));

  }
  -[_WKWebExtensionMatchPattern string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("string"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_WKWebExtensionMatchPattern string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _WKWebExtensionMatchPattern *v4;
  void *v5;
  char v6;

  v4 = (_WKWebExtensionMatchPattern *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    WTF::dynamic_objc_cast<_WKWebExtensionMatchPattern>(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = WebKit::WebExtensionMatchPattern::operator==((uint64_t)&self->_webExtensionMatchPattern, (uint64_t)v5 + 8);
    else
      v6 = 0;

  }
  return v6;
}

- (NSString)debugDescription
{
  _BOOL4 v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[_WKWebExtensionMatchPattern matchesAllURLs](self, "matchesAllURLs");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; matchesAllURLs = YES>"), v6, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_WKWebExtensionMatchPattern scheme](self, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKWebExtensionMatchPattern host](self, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKWebExtensionMatchPattern path](self, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; scheme = %@; host = %@; path = %@>"), v7, self, v9, v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

- (NSString)scheme
{
  int v3;
  WTF::StringImpl **v4;
  WTF::StringImpl *v5;
  int v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  __CFString *v9;
  __CFString *v11;
  __CFString *v12;

  v3 = BYTE1(self[1].super.isa);
  v4 = (WTF::StringImpl **)MEMORY[0x1E0CBF6F0];
  if (!BYTE1(self[1].super.isa) || LOBYTE(self[1].super.isa))
  {
    v5 = (WTF::StringImpl *)*MEMORY[0x1E0CBF6F0];
    if (*MEMORY[0x1E0CBF6F0])
      goto LABEL_4;
LABEL_15:
    v9 = 0;
    return (NSString *)v9;
  }
  v5 = *(WTF::StringImpl **)&self->_webExtensionMatchPattern.data.__lx[16];
  if (!v5)
    goto LABEL_15;
LABEL_4:
  v6 = *(_DWORD *)v5;
  *(_DWORD *)v5 += 2;
  if (v6)
  {
    *(_DWORD *)v5 = v6;
    if (!v3)
    {
LABEL_9:
      v7 = *v4;
      if (*v4)
        goto LABEL_10;
LABEL_17:
      v9 = &stru_1E351F1B8;
      v11 = &stru_1E351F1B8;
      v12 = &stru_1E351F1B8;
      return (NSString *)v9;
    }
  }
  else
  {
    WTF::StringImpl::destroy(v5, (WTF::StringImpl *)a2);
    if (!BYTE1(self[1].super.isa))
      goto LABEL_9;
  }
  if (LOBYTE(self[1].super.isa))
    goto LABEL_9;
  v7 = *(WTF::StringImpl **)&self->_webExtensionMatchPattern.data.__lx[16];
  if (!v7)
    goto LABEL_17;
LABEL_10:
  *(_DWORD *)v7 += 2;
  v9 = (__CFString *)objc_retainAutorelease((id)WTF::StringImpl::operator NSString *());
  if (*(_DWORD *)v7 == 2)
    WTF::StringImpl::destroy(v7, v8);
  else
    *(_DWORD *)v7 -= 2;
  return (NSString *)v9;
}

- (NSString)host
{
  ObjectStorage<WebKit::WebExtensionMatchPattern> *p_webExtensionMatchPattern;
  WTF::StringImpl *v3;
  WTF::StringImpl *v4;
  __CFString *v5;
  WTF::StringImpl *v6;
  __CFString *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v10;

  p_webExtensionMatchPattern = &self->_webExtensionMatchPattern;
  WebKit::WebExtensionMatchPattern::host(self->_webExtensionMatchPattern.data.__lx, &v10);
  v4 = v10;
  v10 = 0;
  if (!v4)
    return (NSString *)0;
  if (*(_DWORD *)v4 == 2)
    WTF::StringImpl::destroy(v4, v3);
  else
    *(_DWORD *)v4 -= 2;
  WebKit::WebExtensionMatchPattern::host(p_webExtensionMatchPattern, &v10);
  if (v10)
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_1E351F1B8;
  v7 = v5;
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
  }
  return (NSString *)v7;
}

- (NSString)path
{
  int v3;
  WTF::StringImpl **v4;
  WTF::StringImpl *v5;
  int v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  __CFString *v9;
  __CFString *v11;
  __CFString *v12;

  v3 = BYTE1(self[1].super.isa);
  v4 = (WTF::StringImpl **)MEMORY[0x1E0CBF6F0];
  if (!BYTE1(self[1].super.isa) || LOBYTE(self[1].super.isa))
  {
    v5 = (WTF::StringImpl *)*MEMORY[0x1E0CBF6F0];
    if (*MEMORY[0x1E0CBF6F0])
      goto LABEL_4;
LABEL_15:
    v9 = 0;
    return (NSString *)v9;
  }
  v5 = *(WTF::StringImpl **)&self->_webExtensionMatchPattern.data.__lx[32];
  if (!v5)
    goto LABEL_15;
LABEL_4:
  v6 = *(_DWORD *)v5;
  *(_DWORD *)v5 += 2;
  if (v6)
  {
    *(_DWORD *)v5 = v6;
    if (!v3)
    {
LABEL_9:
      v7 = *v4;
      if (*v4)
        goto LABEL_10;
LABEL_17:
      v9 = &stru_1E351F1B8;
      v11 = &stru_1E351F1B8;
      v12 = &stru_1E351F1B8;
      return (NSString *)v9;
    }
  }
  else
  {
    WTF::StringImpl::destroy(v5, (WTF::StringImpl *)a2);
    if (!BYTE1(self[1].super.isa))
      goto LABEL_9;
  }
  if (LOBYTE(self[1].super.isa))
    goto LABEL_9;
  v7 = *(WTF::StringImpl **)&self->_webExtensionMatchPattern.data.__lx[32];
  if (!v7)
    goto LABEL_17;
LABEL_10:
  *(_DWORD *)v7 += 2;
  v9 = (__CFString *)objc_retainAutorelease((id)WTF::StringImpl::operator NSString *());
  if (*(_DWORD *)v7 == 2)
    WTF::StringImpl::destroy(v7, v8);
  else
    *(_DWORD *)v7 -= 2;
  return (NSString *)v9;
}

- (NSString)string
{
  id v2;
  WTF::StringImpl *v3;
  WTF::StringImpl *v4;
  __CFString *v5;
  __CFString *v7;
  __CFString *v8;
  WTF::StringImpl *v9;

  WebKit::WebExtensionMatchPattern::stringWithScheme((WTF::StringImpl *)&self->_webExtensionMatchPattern, MEMORY[0x1E0CBF6F0], &v9);
  if (v9)
  {
    v2 = (id)WTF::StringImpl::operator NSString *();
    v3 = v9;
    v5 = (__CFString *)v2;
    v9 = 0;
    if (v3)
    {
      if (*(_DWORD *)v3 == 2)
        WTF::StringImpl::destroy(v3, v4);
      else
        *(_DWORD *)v3 -= 2;
    }
  }
  else
  {
    v5 = &stru_1E351F1B8;
    v7 = &stru_1E351F1B8;
    v8 = &stru_1E351F1B8;
  }
  return (NSString *)v5;
}

- (BOOL)matchesAllURLs
{
  return (BOOL)self[1].super.isa;
}

- (BOOL)matchesAllHosts
{
  uint64_t v3;

  if (!BYTE1(self[1].super.isa))
    return 0;
  if (LOBYTE(self[1].super.isa))
    return 1;
  if (!self->_webExtensionMatchPattern.data.__lx[41])
    return 0;
  v3 = *(_QWORD *)&self->_webExtensionMatchPattern.data.__lx[24];
  if (!v3)
    return 1;
  return *(_DWORD *)(v3 + 4) == 0;
}

- (BOOL)matchesURL:(id)a3
{
  return -[_WKWebExtensionMatchPattern matchesURL:options:](self, "matchesURL:options:", a3, 0);
}

- (BOOL)matchesURL:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v7;
  void *v8;
  WTF::StringImpl *v9;
  char v10;
  WTF::StringImpl *v11;
  void *v12;
  void *v14;
  WTF::StringImpl *v15[5];

  v4 = a4;
  v7 = a3;
  v8 = v7;
  if ((v4 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionMatchPattern.mm"), 231, CFSTR("Invalid parameter: WKWebExtensionMatchPatternOptionsMatchBidirectionally is not valid when matching a URL"));

    if (v8)
      goto LABEL_3;
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if (!v7)
    goto LABEL_10;
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionMatchPattern.mm"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[urlToMatch isKindOfClass:NSURL.class]"));

  }
  MEMORY[0x19AEABB18](v15, v8);
  v10 = WebKit::WebExtensionMatchPattern::matchesURL(self->_webExtensionMatchPattern.data.__lx, (WTF::URL *)v15, v4 & 7);
  v11 = v15[0];
  v15[0] = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v9);
    else
      *(_DWORD *)v11 -= 2;
  }
LABEL_11:

  return v10;
}

- (BOOL)matchesPattern:(id)a3
{
  return -[_WKWebExtensionMatchPattern matchesPattern:options:](self, "matchesPattern:options:", a3, 0);
}

- (BOOL)matchesPattern:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v7;
  char v8;
  void *v10;

  v4 = a4;
  v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionMatchPattern.mm"), 251, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[patternToMatch isKindOfClass:_WKWebExtensionMatchPattern.class]"));

    }
    v8 = WebKit::WebExtensionMatchPattern::matchesPattern(self->_webExtensionMatchPattern.data.__lx, (unsigned __int8 *)objc_msgSend(v7, "_webExtensionMatchPattern"), v4 & 7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionMatchPattern;
}

- (void)_webExtensionMatchPattern
{
  return &self->_webExtensionMatchPattern;
}

@end
