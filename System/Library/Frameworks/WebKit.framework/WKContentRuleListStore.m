@implementation WKContentRuleListStore

- (Object)_apiObject
{
  return (Object *)&self->_contentRuleListStore;
}

+ (WKContentRuleListStore)storeWithURL:(NSURL *)url
{
  CFTypeRef *v3;
  API::ContentRuleListStore *v4;
  const void *v5;
  WKContentRuleListStore *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v10;

  MEMORY[0x19AEABCC8](&v10, -[NSURL path](-[NSURL absoluteURL](url, "absoluteURL"), "path"));
  v3 = (CFTypeRef *)API::Object::newObject(0x30uLL, 49);
  v4 = API::ContentRuleListStore::ContentRuleListStore((API::ContentRuleListStore *)v3, (const WTF::String *)&v10);
  v5 = (const void *)*((_QWORD *)v4 + 1);
  if (v5)
    CFRetain(*((CFTypeRef *)v4 + 1));
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(v3[1]);
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v7);
    else
      *(_DWORD *)v8 -= 2;
  }
  return v6;
}

- (void)lookUpContentRuleListForIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  void *v6;
  _QWORD *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  _QWORD *v10;
  WTF::StringImpl *v11;

  MEMORY[0x19AEABCC8](&v11, identifier);
  v6 = _Block_copy(completionHandler);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BBB00;
  v7[1] = v6;
  v10 = v7;
  API::ContentRuleListStore::lookupContentRuleList((uint64_t)&self->_contentRuleListStore, (const WTF::String *)&v11, (const WTF::String *)&v10);
  if (v10)
    (*(void (**)(_QWORD *))(*v10 + 8))(v10);
  _Block_release(0);
  v9 = v11;
  v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v8);
    else
      *(_DWORD *)v9 -= 2;
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKContentRuleListStore accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKContentRuleListStore accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  objc_class *v3;
  WTF::StringImpl *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ContentRuleListStore::~ContentRuleListStore((API::ContentRuleListStore *)&self->_contentRuleListStore, v4);
    v5.receiver = self;
    v5.super_class = (Class)WKContentRuleListStore;
    -[WKContentRuleListStore dealloc](&v5, sel_dealloc);
  }
}

+ (WKContentRuleListStore)defaultStore
{
  return (WKContentRuleListStore *)*((_QWORD *)API::ContentRuleListStore::defaultStore((API::ContentRuleListStore *)a1)
                                   + 1);
}

- (void)compileContentRuleListForIdentifier:(NSString *)identifier encodedContentRuleList:(NSString *)encodedContentRuleList completionHandler:(void *)completionHandler
{
  void *v8;
  _QWORD *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  _QWORD *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;

  MEMORY[0x19AEABCC8](&v15, identifier);
  MEMORY[0x19AEABCC8](&v14, encodedContentRuleList);
  v8 = _Block_copy(completionHandler);
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BBAD8;
  v9[1] = v8;
  v13 = v9;
  API::ContentRuleListStore::compileContentRuleList((CFTypeRef *)&self->_contentRuleListStore, (const WTF::String *)&v15, (const WTF::String *)&v14, (uint64_t *)&v13);
  if (v13)
    (*(void (**)(_QWORD *))(*v13 + 8))(v13);
  _Block_release(0);
  v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }
  v12 = v15;
  v15 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v10);
    else
      *(_DWORD *)v12 -= 2;
  }
}

- (void)getAvailableContentRuleListIdentifiers:(void *)completionHandler
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = _Block_copy(completionHandler);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BBB28;
  v5[1] = v4;
  v6 = v5;
  API::ContentRuleListStore::getAvailableContentRuleListIdentifiers((uint64_t)&self->_contentRuleListStore, (uint64_t *)&v6);
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
}

- (void)removeContentRuleListForIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  void *v6;
  _QWORD *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  _QWORD *v10;
  WTF::StringImpl *v11;

  MEMORY[0x19AEABCC8](&v11, identifier);
  v6 = _Block_copy(completionHandler);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BBB50;
  v7[1] = v6;
  v10 = v7;
  API::ContentRuleListStore::removeContentRuleList((uint64_t)&self->_contentRuleListStore, (const WTF::String *)&v11, (const WTF::String *)&v10);
  if (v10)
    (*(void (**)(_QWORD *))(*v10 + 8))(v10);
  _Block_release(0);
  v9 = v11;
  v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v8);
    else
      *(_DWORD *)v9 -= 2;
  }
}

- (void)_removeAllContentRuleLists
{
  API::ContentRuleListStore::synchronousRemoveAllContentRuleLists((API::ContentRuleListStore *)&self->_contentRuleListStore, (const WTF::String *)a2);
}

- (void)_invalidateContentRuleListVersionForIdentifier:(id)a3
{
  ObjectStorage<API::ContentRuleListStore> *p_contentRuleListStore;
  const WTF::String *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  p_contentRuleListStore = &self->_contentRuleListStore;
  MEMORY[0x19AEABCC8](&v7, a3);
  API::ContentRuleListStore::invalidateContentRuleListVersion((API::ContentRuleListStore *)p_contentRuleListStore, (const WTF::String *)&v7, v4);
  v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (void)_getContentRuleListSourceForIdentifier:(id)a3 completionHandler:(id)a4
{
  const void *v6;
  _QWORD *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  _QWORD *v10;
  WTF::StringImpl *v11;

  v6 = (const void *)objc_msgSend(a4, "copy");
  MEMORY[0x19AEABCC8](&v11, a3);
  if (v6)
    CFRetain(v6);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = &off_1E34BBB78;
  v7[1] = v6;
  v10 = v7;
  API::ContentRuleListStore::getContentRuleListSource((uint64_t)&self->_contentRuleListStore, (const WTF::String *)&v11, (uint64_t *)&v10);
  if (v10)
    (*(void (**)(_QWORD *))(*v10 + 8))(v10);
  v9 = v11;
  v11 = 0;
  if (!v9)
  {
LABEL_8:
    if (!v6)
      return;
    goto LABEL_9;
  }
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v9, v8);
  if (!v6)
    return;
LABEL_9:
  CFRelease(v6);
}

+ (id)defaultStoreWithLegacyFilename
{
  return (id)*((_QWORD *)API::ContentRuleListStore::defaultStore((API::ContentRuleListStore *)a1) + 1);
}

+ (WKContentRuleListStore)storeWithURLAndLegacyFilename:(id)a3
{
  CFTypeRef *v3;
  API::ContentRuleListStore *v4;
  const void *v5;
  WKContentRuleListStore *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v10;

  MEMORY[0x19AEABCC8](&v10, objc_msgSend((id)objc_msgSend(a3, "absoluteURL"), "path"));
  v3 = (CFTypeRef *)API::Object::newObject(0x30uLL, 49);
  v4 = API::ContentRuleListStore::ContentRuleListStore((API::ContentRuleListStore *)v3, (const WTF::String *)&v10);
  v5 = (const void *)*((_QWORD *)v4 + 1);
  if (v5)
    CFRetain(*((CFTypeRef *)v4 + 1));
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(v3[1]);
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v7);
    else
      *(_DWORD *)v8 -= 2;
  }
  return v6;
}

- (uint64_t)compileContentRuleListForIdentifier:(uint64_t)a1 encodedContentRuleList:completionHandler:
{
  *(_QWORD *)a1 = off_1E34BBAD8;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)compileContentRuleListForIdentifier:(const void *)a1 encodedContentRuleList:completionHandler:
{
  void *v2;

  *a1 = off_1E34BBAD8;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)compileContentRuleListForIdentifier:(uint64_t)a3 encodedContentRuleList:(const std::error_category *)a4 completionHandler:
{
  uint64_t v5;
  void *v6;
  std::string *v7;
  uint64_t v8;
  std::string v9;
  std::error_code v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)&v10.__val_ = a3;
  v10.__cat_ = a4;
  if (!(_DWORD)a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
LABEL_10:
    CFRelease(*(CFTypeRef *)(v5 + 8));
    return;
  }
  v11 = *MEMORY[0x1E0CB2BF8];
  v6 = (void *)MEMORY[0x1E0CB3940];
  std::error_code::message(&v9, &v10);
  if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v9;
  else
    v7 = (std::string *)v9.__r_.__value_.__r.__words[0];
  v12[0] = objc_msgSend(v6, "stringWithFormat:", CFSTR("Rule list compilation failed: %s"), v7);
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 6, v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v5)
    goto LABEL_10;
}

- (uint64_t)lookUpContentRuleListForIdentifier:(uint64_t)a1 completionHandler:
{
  *(_QWORD *)a1 = off_1E34BBB00;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)lookUpContentRuleListForIdentifier:(const void *)a1 completionHandler:
{
  void *v2;

  *a1 = off_1E34BBB00;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)lookUpContentRuleListForIdentifier:(uint64_t)a3 completionHandler:(const std::error_category *)a4
{
  uint64_t v5;
  void *v6;
  std::string *v7;
  uint64_t v8;
  uint64_t v9;
  std::string v10;
  std::error_code v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = *a2;
  *a2 = 0;
  *(_QWORD *)&v11.__val_ = a3;
  v11.__cat_ = a4;
  if (!(_DWORD)a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
LABEL_12:
    CFRelease(*(CFTypeRef *)(v5 + 8));
    return;
  }
  v12 = *MEMORY[0x1E0CB2BF8];
  v6 = (void *)MEMORY[0x1E0CB3940];
  std::error_code::message(&v10, &v11);
  if ((v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v10;
  else
    v7 = (std::string *)v10.__r_.__value_.__r.__words[0];
  v13[0] = objc_msgSend(v6, "stringWithFormat:", CFSTR("Rule list lookup failed: %s"), v7);
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
  if ((v11.__val_ - 1) > 3)
    v9 = 1;
  else
    v9 = qword_1978CF510[v11.__val_ - 1];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), v9, v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v5)
    goto LABEL_12;
}

- (uint64_t)getAvailableContentRuleListIdentifiers:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  CFTypeRef v5;
  _QWORD v7[2];
  CFTypeRef cf;

  v7[0] = *a2;
  v3 = a2[1];
  *a2 = 0;
  a2[1] = 0;
  v7[1] = v3;
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &>((uint64_t)v7, (uint64_t *)&cf);
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  v5 = cf;
  cf = 0;
  if (v5)
    CFRelease(v5);
  return WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v7, v4);
}

- (uint64_t)getAvailableContentRuleListIdentifiers:(const void *)a1
{
  void *v2;

  *a1 = off_1E34BBB28;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)removeContentRuleListForIdentifier:(uint64_t)a1 completionHandler:
{
  *(_QWORD *)a1 = off_1E34BBB50;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)removeContentRuleListForIdentifier:(const void *)a1 completionHandler:
{
  void *v2;

  *a1 = off_1E34BBB50;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)removeContentRuleListForIdentifier:(const std::error_category *)a3 completionHandler:
{
  void *v4;
  std::string *v5;
  uint64_t v6;
  std::string v8;
  std::error_code v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v9.__val_ = a2;
  v9.__cat_ = a3;
  if (!(_DWORD)a2)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), 0);
  v10 = *MEMORY[0x1E0CB2BF8];
  v4 = (void *)MEMORY[0x1E0CB3940];
  std::error_code::message(&v8, &v9);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v8;
  else
    v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
  v11[0] = objc_msgSend(v4, "stringWithFormat:", CFSTR("Rule list removal failed: %s"), v5);
  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 8, v6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

@end
