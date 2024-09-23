@implementation WKWebProcessPlugInController

- (id)parameters
{
  return WebKit::InjectedBundle::bundleParameters((WebKit::InjectedBundle *)&self->_bundle);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  return self;
}

- (void)extendClassesForParameterCoder:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  v25 = 0;
  v26 = 0;
  if (v5)
  {
    if (v5 >> 29)
    {
      __break(0xC471u);
      return;
    }
    LODWORD(v26) = v5;
    v25 = WTF::fastMalloc((WTF *)(8 * v5));
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = (void *)WKStringCreateWithCFString(v9);
          if (v10)
            v11 = objc_msgSend(v10, "_apiObject");
          else
            v11 = 0;
          v12 = HIDWORD(v26);
          if (HIDWORD(v26) == (_DWORD)v26)
          {
            v13 = HIDWORD(v26) + ((unint64_t)HIDWORD(v26) >> 2);
            if (v13 >= 0x10)
              v14 = v13 + 1;
            else
              v14 = 16;
            if (v14 <= (unint64_t)HIDWORD(v26) + 1)
              v15 = HIDWORD(v26) + 1;
            else
              v15 = v14;
            WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&v25, v15);
            v12 = HIDWORD(v26);
            v16 = (uint64_t *)(v25 + 8 * HIDWORD(v26));
          }
          else
          {
            v16 = (uint64_t *)(v25 + 8 * HIDWORD(v26));
          }
          *v16 = v11;
          HIDWORD(v26) = v12 + 1;
        }
        ++v8;
      }
      while (v6 != v8);
      v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      v6 = v17;
    }
    while (v17);
  }
  v18 = API::Object::newObject(0x20uLL, 1);
  *(_QWORD *)v18 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v18);
  *(_QWORD *)v18 = &off_1E34CC2F8;
  *(_QWORD *)(v18 + 16) = v25;
  v19 = v26;
  v25 = 0;
  v26 = 0;
  *(_QWORD *)(v18 + 24) = v19;
  WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v25, v20);
  WebKit::InjectedBundle::extendClassesForParameterCoder((WebKit::InjectedBundle *)&self->_bundle, (API::Array *)v18);
  CFRelease(*(CFTypeRef *)(v18 + 8));
}

- (void)_setPrincipalClassInstance:(id)a3
{
  void *m_ptr;
  __int128 v6;
  uint64_t (*v7)(const OpaqueWKBundle *, OpaqueWKBundlePage *, _QWORD *);
  uint64_t (*v8)(const OpaqueWKBundle *, OpaqueWKBundlePage *, _QWORD *);
  __int128 v9;
  uint64_t v10;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_principalClassInstance.m_ptr;
  self->_principalClassInstance.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
  v10 = 0;
  v9 = 0u;
  *(_QWORD *)&v6 = 1;
  *((_QWORD *)&v6 + 1) = self;
  v7 = didCreatePage;
  v8 = willDestroyPage;
  WKBundleSetClient(*(void **)&self->_bundle.data.__lx[8], &v6);
}

- (Object)_apiObject
{
  return (Object *)&self->_bundle;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::InjectedBundle> *))self->_bundle.data.__lx)(&self->_bundle);
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInController;
    -[WKWebProcessPlugInController dealloc](&v4, sel_dealloc);
  }
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_principalClassInstance.m_ptr;
  self->_principalClassInstance.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (OpaqueWKBundle)_bundleRef
{
  return *(OpaqueWKBundle **)&self->_bundle.data.__lx[8];
}

@end
