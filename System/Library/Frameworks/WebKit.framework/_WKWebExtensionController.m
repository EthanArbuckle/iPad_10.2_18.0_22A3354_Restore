@implementation _WKWebExtensionController

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

  (**(void (***)(ObjectStorage<WebKit::WebExtensionController> *, SEL))self->_webExtensionController.data.__lx)(&self->_webExtensionController, a2);
  v3.receiver = self;
  v3.super_class = (Class)_WKWebExtensionController;
  -[_WKWebExtensionController dealloc](&v3, sel_dealloc);
}

- (_WKWebExtensionController)init
{
  _WKWebExtensionController *v2;
  uint64_t v3;
  _WKWebExtensionController *v4;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKWebExtensionController;
  v2 = -[_WKWebExtensionController init](&v7, sel_init);
  if (v2)
  {
    WebKit::WebExtensionControllerConfiguration::createDefault(&v6);
    API::Object::constructInWrapper<WebKit::WebExtensionController,WTF::Ref<WebKit::WebExtensionControllerConfiguration,WTF::RawPtrTraits<WebKit::WebExtensionControllerConfiguration>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionControllerConfiguration>>>(v2, &v6);
    v3 = v6;
    v6 = 0;
    if (v3)
      CFRelease(*(CFTypeRef *)(v3 + 8));
    v4 = v2;
  }

  return v2;
}

- (_WKWebExtensionController)initWithConfiguration:(id)a3
{
  id v5;
  _WKWebExtensionController *v6;
  _WKWebExtensionController *v7;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[configuration isKindOfClass:_WKWebExtensionControllerConfiguration.class]"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_WKWebExtensionController;
  v6 = -[_WKWebExtensionController init](&v11, sel_init);
  if (v6)
  {
    WebKit::WebExtensionControllerConfiguration::copy((WebKit::WebExtensionControllerConfiguration *)objc_msgSend(v5, "_webExtensionControllerConfiguration"), &v10);
    API::Object::constructInWrapper<WebKit::WebExtensionController,WTF::Ref<WebKit::WebExtensionControllerConfiguration,WTF::RawPtrTraits<WebKit::WebExtensionControllerConfiguration>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionControllerConfiguration>>>(v6, &v10);
    if (v10)
      CFRelease(*(CFTypeRef *)(v10 + 8));
    v7 = v6;
  }

  return v6;
}

- (_WKWebExtensionControllerConfiguration)configuration
{
  WebKit::WebExtension *v2;
  void *v3;
  WebKit::WebExtension *v5;

  WebKit::WebExtensionControllerConfiguration::copy(*(WebKit::WebExtensionControllerConfiguration **)&self->_webExtensionController.data.__lx[40], (uint64_t *)&v5);
  v2 = v5;
  WebKit::WebExtension::wrapper((id *)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    CFRelease(*((CFTypeRef *)v2 + 1));
  return (_WKWebExtensionControllerConfiguration *)v3;
}

- (BOOL)loadExtensionContext:(id)a3 error:(id *)a4
{
  id v7;
  char v8;
  void *v10;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[extensionContext isKindOfClass:_WKWebExtensionContext.class]"));

  }
  v8 = WebKit::WebExtensionController::load((uint64_t)&self->_webExtensionController, objc_msgSend(v7, "_webExtensionContext"), a4);

  return v8;
}

- (BOOL)unloadExtensionContext:(id)a3 error:(id *)a4
{
  id v7;
  char v8;
  void *v10;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[extensionContext isKindOfClass:_WKWebExtensionContext.class]"));

  }
  v8 = WebKit::WebExtensionController::unload(self->_webExtensionController.data.__lx, objc_msgSend(v7, "_webExtensionContext"), a4);

  return v8;
}

- (id)extensionContextForExtension:(id)a3
{
  id v5;
  WebKit::WebExtension *v6;
  void *v7;
  void *v9;
  WebKit::WebExtension *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[extension isKindOfClass:_WKWebExtension.class]"));

  }
  WebKit::WebExtensionController::extensionContext((WebKit::WebExtensionController *)&self->_webExtensionController, (const WebKit::WebExtension *)objc_msgSend(v5, "_webExtension"), &v10);
  v6 = v10;
  if (v10)
  {
    WebKit::WebExtension::wrapper((id *)v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(*((CFTypeRef *)v6 + 1));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)extensionContextForURL:(id)a3
{
  id v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  id *v8;
  void *v9;
  void *v11;
  WTF::StringImpl *v12[5];
  id *v13;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[url isKindOfClass:NSURL.class]"));

  }
  MEMORY[0x19AEABB18](v12, v5);
  WebKit::WebExtensionController::extensionContext((WebKit::WebExtensionController *)&self->_webExtensionController, (const WTF::URL *)v12, (WTF **)&v13);
  v7 = v12[0];
  v12[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
  v8 = v13;
  if (v13)
  {
    WebKit::WebExtension::wrapper(v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v8[1]);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSSet)extensions
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  void *v12;
  uint64_t *v13;
  uint64_t *v15;

  WebKit::WebExtensionController::extensions((WebKit::WebExtensionController *)&self->_webExtensionController, (uint64_t *)&v15);
  if (!v15 || !*((_DWORD *)v15 - 3))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  if (v15)
    v3 = *((unsigned int *)v15 - 3);
  else
    v3 = 0;
  v6 = (void *)objc_msgSend(v2, "initWithCapacity:", v3);
  if (v15)
  {
    v7 = *((unsigned int *)v15 - 1);
    v8 = &v15[v7];
    if (*((_DWORD *)v15 - 3))
    {
      v9 = v15;
      if ((_DWORD)v7)
      {
        v10 = 8 * v7;
        v9 = v15;
        while ((unint64_t)(*v9 + 1) <= 1)
        {
          ++v9;
          v10 -= 8;
          if (!v10)
          {
            v9 = v8;
            goto LABEL_14;
          }
        }
      }
      goto LABEL_14;
    }
    v9 = &v15[v7];
  }
  else
  {
    v9 = 0;
    v7 = 0;
  }
  v8 = &v15[v7];
  if (!v15)
  {
    v11 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v11 = &v15[*((unsigned int *)v15 - 1)];
LABEL_19:
  while (v9 != v11)
  {
    WebKit::WebExtension::wrapper((id *)*v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

    v13 = v9 + 1;
    v9 = v8;
    if (v13 != v8)
    {
      v9 = v13;
      while ((unint64_t)(*v9 + 1) <= 1)
      {
        if (++v9 == v8)
        {
          v9 = v8;
          break;
        }
      }
    }
  }
  v5 = (void *)objc_msgSend(v6, "copy");

LABEL_27:
  if (v15)
    WTF::HashTable<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionMatchPattern,WTF::RawPtrTraits<WebKit::WebExtensionMatchPattern>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionMatchPattern>>>>::deallocateTable(v15, v4);
  return (NSSet *)v5;
}

- (NSSet)extensionContexts
{
  uint64_t v2;
  unsigned __int8 *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id **v8;
  id **v9;
  id **v10;
  id **v11;
  uint64_t v12;
  void *v13;

  v3 = &self->_anon_38[8];
  v2 = *(_QWORD *)&self->_anon_38[8];
  if (v2 && *(_DWORD *)(v2 - 12))
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E20]);
    if (*(_QWORD *)v3)
      v5 = *(unsigned int *)(*(_QWORD *)v3 - 12);
    else
      v5 = 0;
    v7 = (void *)objc_msgSend(v4, "initWithCapacity:", v5);
    v8 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)v3);
    v9 = v8;
    v11 = v10;
    if (*(_QWORD *)v3)
      v12 = *(_QWORD *)v3 + 8 * *(unsigned int *)(*(_QWORD *)v3 - 4);
    else
      v12 = 0;
    if ((id **)v12 != v8)
    {
      do
      {
        WebKit::WebExtension::wrapper(*v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        while (++v9 != v11)
        {
          if ((unint64_t)*v9 + 1 > 1)
            goto LABEL_16;
        }
        v9 = v11;
LABEL_16:
        ;
      }
      while (v9 != (id **)v12);
    }
    v6 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v6;
}

+ (NSSet)allExtensionDataTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("local"), CFSTR("session"), CFSTR("sync"), 0);
}

- (void)fetchDataRecordsOfTypes:(id)a3 completionHandler:(id)a4
{
  WebKit *v7;
  id v8;
  NSSet *v9;
  unsigned __int8 v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD *v16;

  v7 = (WebKit *)a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dataTypes isKindOfClass:NSSet.class]"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  v10 = WebKit::toWebExtensionDataTypes(v7, v9);
  v11 = _Block_copy(v8);
  v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v12 = off_1E34AAC38;
  v12[1] = v11;
  v16 = v12;
  WebKit::WebExtensionController::getDataRecords((WebKit::WebExtensionController *)&self->_webExtensionController, v10, (uint64_t *)&v16);
  v13 = (uint64_t)v16;
  v16 = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);

}

- (void)fetchDataRecordOfTypes:(id)a3 forExtensionContext:(id)a4 completionHandler:(id)a5
{
  WebKit *v9;
  id v10;
  id v11;
  NSSet *v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;

  v9 = (WebKit *)a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dataTypes isKindOfClass:NSSet.class]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v11)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[extensionContext isKindOfClass:_WKWebExtensionContext.class]"));

    if (v11)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_5:
  v13 = WebKit::toWebExtensionDataTypes(v9, v12);
  v14 = objc_msgSend(v10, "_webExtensionContext");
  v15 = _Block_copy(v11);
  v16 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v16 = off_1E34AAC60;
  v16[1] = v15;
  v21 = v16;
  WebKit::WebExtensionController::getDataRecord((WebKit::WebExtensionController *)&self->_webExtensionController, (const WTF::String *)v13, v14, (uint64_t *)&v21);
  v17 = (uint64_t)v21;
  v21 = 0;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);

}

- (void)removeDataOfTypes:(id)a3 forDataRecords:(id)a4 completionHandler:(id)a5
{
  WebKit *v9;
  id v10;
  id v11;
  NSSet *v12;
  unsigned __int8 v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  _BYTE v22[16];

  v9 = (WebKit *)a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dataTypes isKindOfClass:NSSet.class]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v11)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dataRecords isKindOfClass:NSArray.class]"));

    if (v11)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_5:
  v13 = WebKit::toWebExtensionDataTypes(v9, v12);
  WTF::makeVector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>>(v10, (uint64_t)v22);
  v14 = _Block_copy(v11);
  v15 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v15 = off_1E34AAC88;
  v15[1] = v14;
  v21 = v15;
  WebKit::WebExtensionController::removeData((WebKit::WebExtensionController *)&self->_webExtensionController, v13, (uint64_t)v22, (uint64_t *)&v21);
  v17 = (uint64_t)v21;
  v21 = 0;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v22, v16);

}

- (void)didOpenWindow:(id)a3
{
  unsigned __int8 *v5;
  id **v6;
  id **v7;
  id **v8;
  id **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((objc_msgSend(v13, "conformsToProtocol:", &unk_1EE3C7300) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[newWindow conformsToProtocol:@protocol(_WKWebExtensionWindow)]"));

  }
  v5 = &self->_anon_38[8];
  v6 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v7 = v6;
  v9 = v8;
  if (*(_QWORD *)v5)
    v10 = *(_QWORD *)v5 + 8 * *(unsigned int *)(*(_QWORD *)v5 - 4);
  else
    v10 = 0;
  if ((id **)v10 != v6)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didOpenWindow:", v13);

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1)
          goto LABEL_12;
      }
      v7 = v9;
LABEL_12:
      ;
    }
    while (v7 != (id **)v10);
  }

}

- (void)didCloseWindow:(id)a3
{
  unsigned __int8 *v5;
  id **v6;
  id **v7;
  id **v8;
  id **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((objc_msgSend(v13, "conformsToProtocol:", &unk_1EE3C7300) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[closedWindow conformsToProtocol:@protocol(_WKWebExtensionWindow)]"));

  }
  v5 = &self->_anon_38[8];
  v6 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v7 = v6;
  v9 = v8;
  if (*(_QWORD *)v5)
    v10 = *(_QWORD *)v5 + 8 * *(unsigned int *)(*(_QWORD *)v5 - 4);
  else
    v10 = 0;
  if ((id **)v10 != v6)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didCloseWindow:", v13);

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1)
          goto LABEL_12;
      }
      v7 = v9;
LABEL_12:
      ;
    }
    while (v7 != (id **)v10);
  }

}

- (void)didFocusWindow:(id)a3
{
  unsigned __int8 *v5;
  id **v6;
  id **v7;
  id **v8;
  id **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (v13 && (objc_msgSend(v13, "conformsToProtocol:", &unk_1EE3C7300) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[focusedWindow conformsToProtocol:@protocol(_WKWebExtensionWindow)]"));

  }
  v5 = &self->_anon_38[8];
  v6 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v7 = v6;
  v9 = v8;
  if (*(_QWORD *)v5)
    v10 = *(_QWORD *)v5 + 8 * *(unsigned int *)(*(_QWORD *)v5 - 4);
  else
    v10 = 0;
  if ((id **)v10 != v6)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didFocusWindow:", v13);

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1)
          goto LABEL_13;
      }
      v7 = v9;
LABEL_13:
      ;
    }
    while (v7 != (id **)v10);
  }

}

- (void)didOpenTab:(id)a3
{
  unsigned __int8 *v5;
  id **v6;
  id **v7;
  id **v8;
  id **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((objc_msgSend(v13, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[newTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  v5 = &self->_anon_38[8];
  v6 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v7 = v6;
  v9 = v8;
  if (*(_QWORD *)v5)
    v10 = *(_QWORD *)v5 + 8 * *(unsigned int *)(*(_QWORD *)v5 - 4);
  else
    v10 = 0;
  if ((id **)v10 != v6)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didOpenTab:", v13);

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1)
          goto LABEL_12;
      }
      v7 = v9;
LABEL_12:
      ;
    }
    while (v7 != (id **)v10);
  }

}

- (void)didCloseTab:(id)a3 windowIsClosing:(BOOL)a4
{
  _BOOL8 v4;
  unsigned __int8 *v7;
  id **v8;
  id **v9;
  id **v10;
  id **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[closedTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  v7 = &self->_anon_38[8];
  v8 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v9 = v8;
  v11 = v10;
  if (*(_QWORD *)v7)
    v12 = *(_QWORD *)v7 + 8 * *(unsigned int *)(*(_QWORD *)v7 - 4);
  else
    v12 = 0;
  if ((id **)v12 != v8)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didCloseTab:windowIsClosing:", v15, v4);

      while (++v9 != v11)
      {
        if ((unint64_t)*v9 + 1 > 1)
          goto LABEL_12;
      }
      v9 = v11;
LABEL_12:
      ;
    }
    while (v9 != (id **)v12);
  }

}

- (void)didActivateTab:(id)a3 previousActiveTab:(id)a4
{
  id v7;
  unsigned __int8 *v8;
  id **v9;
  id **v10;
  id **v11;
  id **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  if ((objc_msgSend(v17, "conformsToProtocol:", &unk_1EE3C72A0) & 1) != 0)
  {
    if (!v7)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[activatedTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

    if (!v7)
      goto LABEL_5;
  }
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[previousTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
LABEL_5:
  v8 = &self->_anon_38[8];
  v9 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v10 = v9;
  v12 = v11;
  if (*(_QWORD *)v8)
    v13 = *(_QWORD *)v8 + 8 * *(unsigned int *)(*(_QWORD *)v8 - 4);
  else
    v13 = 0;
  if ((id **)v13 != v9)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "didActivateTab:previousActiveTab:", v17, v7);

      while (++v10 != v12)
      {
        if ((unint64_t)*v10 + 1 > 1)
          goto LABEL_14;
      }
      v10 = v12;
LABEL_14:
      ;
    }
    while (v10 != (id **)v13);
  }

}

- (void)didSelectTabs:(id)a3
{
  unsigned __int8 *v5;
  id **v6;
  id **v7;
  id **v8;
  id **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[selectedTabs isKindOfClass:NSSet.class]"));

  }
  v5 = &self->_anon_38[8];
  v6 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v7 = v6;
  v9 = v8;
  if (*(_QWORD *)v5)
    v10 = *(_QWORD *)v5 + 8 * *(unsigned int *)(*(_QWORD *)v5 - 4);
  else
    v10 = 0;
  if ((id **)v10 != v6)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didSelectTabs:", v13);

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1)
          goto LABEL_12;
      }
      v7 = v9;
LABEL_12:
      ;
    }
    while (v7 != (id **)v10);
  }

}

- (void)didDeselectTabs:(id)a3
{
  unsigned __int8 *v5;
  id **v6;
  id **v7;
  id **v8;
  id **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[deselectedTabs isKindOfClass:NSSet.class]"));

  }
  v5 = &self->_anon_38[8];
  v6 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v7 = v6;
  v9 = v8;
  if (*(_QWORD *)v5)
    v10 = *(_QWORD *)v5 + 8 * *(unsigned int *)(*(_QWORD *)v5 - 4);
  else
    v10 = 0;
  if ((id **)v10 != v6)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didDeselectTabs:", v13);

      while (++v7 != v9)
      {
        if ((unint64_t)*v7 + 1 > 1)
          goto LABEL_12;
      }
      v7 = v9;
LABEL_12:
      ;
    }
    while (v7 != (id **)v10);
  }

}

- (void)didMoveTab:(id)a3 fromIndex:(unint64_t)a4 inWindow:(id)a5
{
  id v9;
  unsigned __int8 *v10;
  id **v11;
  id **v12;
  id **v13;
  id **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v9 = a5;
  if ((objc_msgSend(v19, "conformsToProtocol:", &unk_1EE3C72A0) & 1) != 0)
  {
    if (!v9)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[movedTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

    if (!v9)
      goto LABEL_5;
  }
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EE3C7300) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[oldWindow conformsToProtocol:@protocol(_WKWebExtensionWindow)]"));

  }
LABEL_5:
  v10 = &self->_anon_38[8];
  v11 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v12 = v11;
  v14 = v13;
  if (*(_QWORD *)v10)
    v15 = *(_QWORD *)v10 + 8 * *(unsigned int *)(*(_QWORD *)v10 - 4);
  else
    v15 = 0;
  if ((id **)v15 != v11)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "didMoveTab:fromIndex:inWindow:", v19, a4, v9);

      while (++v12 != v14)
      {
        if ((unint64_t)*v12 + 1 > 1)
          goto LABEL_14;
      }
      v12 = v14;
LABEL_14:
      ;
    }
    while (v12 != (id **)v15);
  }

}

- (void)didReplaceTab:(id)a3 withTab:(id)a4
{
  id v7;
  unsigned __int8 *v8;
  id **v9;
  id **v10;
  id **v11;
  id **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  if ((objc_msgSend(v17, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[oldTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[newTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  v8 = &self->_anon_38[8];
  v9 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v10 = v9;
  v12 = v11;
  if (*(_QWORD *)v8)
    v13 = *(_QWORD *)v8 + 8 * *(unsigned int *)(*(_QWORD *)v8 - 4);
  else
    v13 = 0;
  if ((id **)v13 != v9)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "didReplaceTab:withTab:", v17, v7);

      while (++v10 != v12)
      {
        if ((unint64_t)*v10 + 1 > 1)
          goto LABEL_14;
      }
      v10 = v12;
LABEL_14:
      ;
    }
    while (v10 != (id **)v13);
  }

}

- (void)didChangeTabProperties:(unint64_t)a3 forTab:(id)a4
{
  unsigned __int8 *v7;
  id **v8;
  id **v9;
  id **v10;
  id **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EE3C72A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_WKWebExtensionController.mm"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[changedTab conformsToProtocol:@protocol(_WKWebExtensionTab)]"));

  }
  v7 = &self->_anon_38[8];
  v8 = (id **)WTF::HashTable<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionContext,WTF::RawPtrTraits<WebKit::WebExtensionContext>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionContext>>>>::begin((_QWORD **)&self->_anon_38[8]);
  v9 = v8;
  v11 = v10;
  if (*(_QWORD *)v7)
    v12 = *(_QWORD *)v7 + 8 * *(unsigned int *)(*(_QWORD *)v7 - 4);
  else
    v12 = 0;
  if ((id **)v12 != v8)
  {
    do
    {
      WebKit::WebExtension::wrapper(*v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didChangeTabProperties:forTab:", a3, v15);

      while (++v9 != v11)
      {
        if ((unint64_t)*v9 + 1 > 1)
          goto LABEL_12;
      }
      v9 = v11;
LABEL_12:
      ;
    }
    while (v9 != (id **)v12);
  }

}

- (BOOL)_inTestingMode
{
  return (self->_anon_38[128] >> 1) & 1;
}

- (void)_setTestingMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_anon_38[128] = self->_anon_38[128] & 0xFD | v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionController;
}

- (void)_webExtensionController
{
  return &self->_webExtensionController;
}

- (_WKWebExtensionControllerDelegate)delegate
{
  return (_WKWebExtensionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (uint64_t)fetchDataRecordsOfTypes:(uint64_t)a1 completionHandler:
{

  return a1;
}

- (uint64_t)fetchDataRecordsOfTypes:(id *)a1 completionHandler:
{
  void *v2;

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)fetchDataRecordsOfTypes:(uint64_t)a1 completionHandler:(_QWORD *)a2
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[0] = *a2;
  v3 = a2[1];
  *a2 = 0;
  a2[1] = 0;
  v7[1] = v3;
  WebKit::toAPI((uint64_t)v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();

  return WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v7, v5);
}

- (uint64_t)fetchDataRecordOfTypes:(uint64_t)a1 forExtensionContext:completionHandler:
{

  return a1;
}

- (uint64_t)fetchDataRecordOfTypes:(id *)a1 forExtensionContext:completionHandler:
{
  void *v2;

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)fetchDataRecordOfTypes:(uint64_t)a1 forExtensionContext:(uint64_t *)a2 completionHandler:
{
  uint64_t v3;
  void *v4;

  v3 = *a2;
  *a2 = 0;
  if (v3)
  {
    WebKit::WebExtension::wrapper((id *)v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();

    CFRelease(*(CFTypeRef *)(v3 + 8));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }
}

- (uint64_t)removeDataOfTypes:(uint64_t)a1 forDataRecords:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)removeDataOfTypes:(id *)a1 forDataRecords:completionHandler:
{
  void *v2;

  return WTF::fastFree((WTF *)a1, v2);
}

@end
