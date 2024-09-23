@implementation WKHTTPCookieStore

- (void)setCookie:(NSHTTPCookie *)cookie completionHandler:(void *)completionHandler
{
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11[2];
  _BYTE v12[136];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MEMORY[0x19AEB4AC4](v12, cookie);
  WTF::Vector<WebCore::Cookie,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v11, (const WebCore::Cookie *)v12, 1uLL);
  v6 = objc_msgSend(completionHandler, "copy");
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = &off_1E34BC1C8;
  v7[1] = v6;
  v10 = v7;
  API::HTTPCookieStore::setCookies((uint64_t)&self->_cookieStore, v11, (uint64_t *)&v10);
  if (v10)
    (*(void (**)(_QWORD *))(*v10 + 8))(v10);
  WTF::Vector<WebCore::Cookie,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v11, v8);
  WebCore::Cookie::~Cookie((WebCore::Cookie *)v12, v9);
}

- (Object)_apiObject
{
  return (Object *)&self->_cookieStore;
}

- (uint64_t)setCookie:(WTF *)this completionHandler:(void *)a2
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34BC1C8;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)setCookie:(uint64_t)a1 completionHandler:
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
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
  if ((v3 & 1) == 0 && (+[WKHTTPCookieStore accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKHTTPCookieStore accessInstanceVariablesDirectly]::didLogFault = 1;
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
  void *v4;
  unsigned int *m_tableForLLDB;
  uint64_t v6;
  char *v7;
  char *m_table;
  uint64_t v9;
  char *v10;
  char *v11;
  objc_super v12;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) != 0)
    return;
  m_tableForLLDB = self->_observers.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v6 = *(m_tableForLLDB - 1);
    v7 = (char *)&m_tableForLLDB[4 * v6];
    if (*(m_tableForLLDB - 3))
    {
      m_table = (char *)self->_observers.m_impl.var0.m_table;
      if ((_DWORD)v6)
      {
        v9 = 16 * v6;
        m_table = (char *)self->_observers.m_impl.var0.m_table;
        while ((unint64_t)(*(_QWORD *)m_table + 1) <= 1)
        {
          m_table += 16;
          v9 -= 16;
          if (!v9)
          {
            m_table = v7;
            goto LABEL_9;
          }
        }
      }
      goto LABEL_9;
    }
    m_table = (char *)&m_tableForLLDB[4 * v6];
  }
  else
  {
    m_table = 0;
    v6 = 0;
  }
  v7 = (char *)&m_tableForLLDB[4 * v6];
  if (!m_tableForLLDB)
  {
    v10 = 0;
    goto LABEL_14;
  }
LABEL_9:
  v10 = (char *)&m_tableForLLDB[4 * *(m_tableForLLDB - 1)];
LABEL_14:
  while (m_table != v10)
  {
    API::HTTPCookieStore::unregisterObserver((uint64_t)&self->_cookieStore, *((_QWORD **)m_table + 1));
    v11 = m_table + 16;
    m_table = v7;
    if (v11 != v7)
    {
      m_table = v11;
      while ((unint64_t)(*(_QWORD *)m_table + 1) <= 1)
      {
        m_table += 16;
        if (m_table == v7)
        {
          m_table = v7;
          break;
        }
      }
    }
  }
  API::HTTPCookieStore::~HTTPCookieStore((API::HTTPCookieStore *)&self->_cookieStore, v4);
  v12.receiver = self;
  v12.super_class = (Class)WKHTTPCookieStore;
  -[WKHTTPCookieStore dealloc](&v12, sel_dealloc);
}

- (void)getAllCookies:(void *)completionHandler
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = objc_msgSend(completionHandler, "copy");
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = &off_1E34BC1A0;
  v5[1] = v4;
  v6 = v5;
  API::HTTPCookieStore::cookies((uint64_t)&self->_cookieStore, (uint64_t *)&v6);
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
}

- (void)deleteCookie:(NSHTTPCookie *)cookie completionHandler:(void *)completionHandler
{
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11[17];

  MEMORY[0x19AEB4AC4](v11, cookie);
  v6 = objc_msgSend(completionHandler, "copy");
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = &off_1E34BC1F0;
  v7[1] = v6;
  v10 = v7;
  API::HTTPCookieStore::deleteCookie((uint64_t)&self->_cookieStore, v11, (uint64_t *)&v10);
  v9 = (uint64_t)v10;
  v10 = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  WebCore::Cookie::~Cookie((WebCore::Cookie *)v11, v8);
}

- (void)addObserver:(id)observer
{
  _DWORD *m_tableForLLDB;
  uint64_t *p_observers;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t *v12;
  id v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;

  p_observers = (uint64_t *)&self->_observers;
  m_tableForLLDB = self->_observers.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB
    || (WTF::HashTable<void const*,WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>>,WTF::DefaultHash<void const*>,WTF::HashMap<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<void const*>>::expand((uint64_t *)&self->_observers, 0), (m_tableForLLDB = (_DWORD *)*p_observers) != 0))
  {
    v7 = *(m_tableForLLDB - 2);
  }
  else
  {
    v7 = 0;
  }
  v8 = ((unint64_t)observer + ~((_QWORD)observer << 32)) ^ (((unint64_t)observer
                                                                  + ~((_QWORD)observer << 32)) >> 22);
  v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
  v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
  v11 = v7 & ((v10 >> 31) ^ v10);
  v12 = (uint64_t *)&m_tableForLLDB[4 * v11];
  v13 = (id)*v12;
  if (!*v12)
  {
LABEL_12:
    v16 = v12[1];
    *v12 = (uint64_t)observer;
    v12[1] = 0;
    if (v16)
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v16 + 8))(v16, a2);
    v17 = *p_observers;
    if (*p_observers)
      v18 = *(_DWORD *)(v17 - 12) + 1;
    else
      v18 = 1;
    *(_DWORD *)(v17 - 12) = v18;
    v19 = *p_observers;
    if (*p_observers)
      v20 = *(_DWORD *)(v19 - 12);
    else
      v20 = 0;
    v21 = (*(_DWORD *)(v19 - 16) + v20);
    v22 = *(unsigned int *)(v19 - 4);
    if (v22 > 0x400)
    {
      if (v22 > 2 * v21)
        goto LABEL_24;
    }
    else if (3 * v22 > 4 * v21)
    {
LABEL_24:
      v23 = WTF::fastMalloc((WTF *)0x18);
      *(_QWORD *)(v23 + 8) = 0;
      *(_QWORD *)v23 = off_1E34BC178;
      *(_QWORD *)(v23 + 16) = 0;
      objc_initWeak((id *)(v23 + 16), observer);
      v24 = v12[1];
      v12[1] = v23;
      if (v24)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
        v23 = v12[1];
      }
      API::HTTPCookieStore::registerObserver((uint64_t)&self->_cookieStore, (_QWORD *)v23);
      return;
    }
    v12 = WTF::HashTable<void const*,WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>>,WTF::DefaultHash<void const*>,WTF::HashMap<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<void const*>>::expand(p_observers, v12);
    goto LABEL_24;
  }
  v14 = 0;
  v15 = 1;
  while (v13 != observer)
  {
    if (v13 == (id)-1)
      v14 = v12;
    v11 = (v11 + v15) & v7;
    v12 = (uint64_t *)&m_tableForLLDB[4 * v11];
    v13 = (id)*v12;
    ++v15;
    if (!*v12)
    {
      if (v14)
      {
        *v14 = 0;
        v14[1] = 0;
        --*(_DWORD *)(*p_observers - 16);
        v12 = v14;
      }
      goto LABEL_12;
    }
  }
}

- (void)removeObserver:(id)observer
{
  uint64_t *p_observers;
  unsigned int *v5;
  unsigned int *m_tableForLLDB;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  unsigned int *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;

  m_tableForLLDB = self->_observers.m_impl.var0.m_tableForLLDB;
  p_observers = (uint64_t *)&self->_observers;
  v5 = m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v7 = *(v5 - 2);
    v8 = ((unint64_t)observer + ~((_QWORD)observer << 32)) ^ (((unint64_t)observer
                                                                    + ~((_QWORD)observer << 32)) >> 22);
    v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
    v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
    v11 = v7 & ((v10 >> 31) ^ v10);
    v12 = *(id *)&v5[4 * v11];
    if (v12 != observer)
    {
      v13 = 1;
      while (v12)
      {
        v11 = ((_DWORD)v11 + v13) & v7;
        v12 = *(id *)&v5[4 * v11];
        ++v13;
        if (v12 == observer)
          goto LABEL_8;
      }
      v11 = *(v5 - 1);
    }
LABEL_8:
    if (v11 != *(v5 - 1))
    {
      v14 = &v5[4 * v11];
      v15 = (_QWORD *)*((_QWORD *)v14 + 1);
      *((_QWORD *)v14 + 1) = 0;
      v16 = *p_observers;
      if (!*p_observers || (v16 += 16 * *(unsigned int *)(v16 - 4), (unsigned int *)v16 != v14))
      {
        if ((unsigned int *)v16 != v14)
        {
          *(_QWORD *)v14 = -1;
          *((_QWORD *)v14 + 1) = 0;
          ++*(_DWORD *)(*p_observers - 16);
          v17 = *p_observers;
          v18 = *p_observers ? *(_DWORD *)(v17 - 12) - 1 : -1;
          *(_DWORD *)(v17 - 12) = v18;
          v19 = *p_observers;
          if (*p_observers)
          {
            v20 = 6 * *(_DWORD *)(v19 - 12);
            v21 = *(_DWORD *)(v19 - 4);
            if (v20 < v21 && v21 >= 9)
              WTF::HashTable<void const*,WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>>>,WTF::DefaultHash<void const*>,WTF::HashMap<void const*,std::unique_ptr<WKHTTPCookieStoreObserver>,WTF::DefaultHash<void const*>,WTF::HashTraits<void const*>,WTF::HashTraits<std::unique_ptr<WKHTTPCookieStoreObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<void const*>>::rehash(p_observers, v21 >> 1, 0);
          }
        }
      }
      if (v15)
      {
        API::HTTPCookieStore::unregisterObserver((uint64_t)&self->_cookieStore, v15);
        (*(void (**)(_QWORD *))(*v15 + 8))(v15);
      }
    }
  }
}

- (void)setCookiePolicy:(WKCookiePolicy)policy completionHandler:(void *)completionHandler
{
  void *v6;
  _QWORD *v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = _Block_copy(completionHandler);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BC218;
  v7[1] = v6;
  v10 = v7;
  if (policy)
    v8 = 1;
  else
    v8 = 2;
  API::HTTPCookieStore::setHTTPCookieAcceptPolicy((uint64_t)&self->_cookieStore, v8, (uint64_t *)&v10);
  v9 = (uint64_t)v10;
  v10 = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  _Block_release(0);
}

- (void)getCookiePolicy:(void *)completionHandler
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(completionHandler);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BC240;
  v5[1] = v4;
  v7 = v5;
  API::HTTPCookieStore::getHTTPCookieAcceptPolicy((uint64_t)&self->_cookieStore, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void).cxx_destruct
{
  unsigned int *m_tableForLLDB;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  m_tableForLLDB = self->_observers.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v3 = *(m_tableForLLDB - 1);
    if ((_DWORD)v3)
    {
      v4 = (uint64_t *)(m_tableForLLDB + 2);
      do
      {
        if (*(v4 - 1) != -1)
        {
          v5 = *v4;
          *v4 = 0;
          if (v5)
            (*(void (**)(uint64_t, SEL))(*(_QWORD *)v5 + 8))(v5, a2);
        }
        v4 += 2;
        --v3;
      }
      while (v3);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
}

- (void)_getCookiesForURL:(id)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  _QWORD *v10;
  WTF::StringImpl *v11[5];

  MEMORY[0x19AEABB18](v11, a3);
  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BC268;
  v7[1] = v6;
  v10 = v7;
  API::HTTPCookieStore::cookiesForURL((uint64_t)&self->_cookieStore, (uint64_t *)v11, (uint64_t *)&v10);
  if (v10)
    (*(void (**)(_QWORD *))(*v10 + 8))(v10);
  _Block_release(0);
  v9 = v11[0];
  v11[0] = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v8);
    else
      *(_DWORD *)v9 -= 2;
  }
}

- (void)_setCookieAcceptPolicy:(unint64_t)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  if (a3 >= 4)
    v8 = 1;
  else
    v8 = a3;
  *v7 = off_1E34BC290;
  v7[1] = v6;
  v10 = v7;
  API::HTTPCookieStore::setHTTPCookieAcceptPolicy((uint64_t)&self->_cookieStore, v8, (uint64_t *)&v10);
  v9 = (uint64_t)v10;
  v10 = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  _Block_release(0);
}

- (void)_flushCookiesToDiskWithCompletionHandler:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BC2B8;
  v5[1] = v4;
  v7 = v5;
  API::HTTPCookieStore::flushCookies((uint64_t)&self->_cookieStore, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (_QWORD)getAllCookies:(_QWORD *)a1
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34BC1A0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)getAllCookies:(WTF *)this
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34BC1A0;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)getAllCookies:(uint64_t)a1
{
  uint64_t v2;
  CFTypeRef v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = coreCookiesToNSCookies(a2);
  return (*(uint64_t (**)(uint64_t, CFTypeRef))(v2 + 16))(v2, v3);
}

- (_QWORD)setCookie:(_QWORD *)a1 completionHandler:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34BC1C8;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (_QWORD)deleteCookie:(_QWORD *)a1 completionHandler:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34BC1F0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)deleteCookie:(WTF *)this completionHandler:(void *)a2
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34BC1F0;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)deleteCookie:(uint64_t)a1 completionHandler:
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (uint64_t)setCookiePolicy:(uint64_t)a1 completionHandler:
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (uint64_t)setCookiePolicy:(const void *)a1 completionHandler:
{
  void *v2;

  *a1 = off_1E34BC218;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)getCookiePolicy:(uint64_t)a1
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)getCookiePolicy:(const void *)a1
{
  void *v2;

  *a1 = off_1E34BC240;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

@end
