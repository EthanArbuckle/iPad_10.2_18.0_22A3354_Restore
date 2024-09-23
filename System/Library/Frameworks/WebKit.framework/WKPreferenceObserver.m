@implementation WKPreferenceObserver

- (WKPreferenceObserver)init
{
  WKPreferenceObserver *v2;
  WKPreferenceObserver *v3;
  uint64_t v4;
  Vector<WTF::RetainPtr<WKUserDefaults>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_m_userDefaults;
  __CFString *v6;
  WKUserDefaults *v7;
  uint64_t m_size;
  CFTypeRef *v9;
  CFTypeRef v10;
  void *v11;
  WTF *v12;
  WTF::StringImpl *v13;
  CFTypeRef v14;
  WTF::StringImpl *v16;
  WTF *v17;
  CFTypeRef cf;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WKPreferenceObserver;
  v2 = -[WKPreferenceObserver init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = 0;
    p_m_userDefaults = &v2->m_userDefaults;
    do
    {
      v6 = off_1E34B28D8[v4];
      v7 = -[WKUserDefaults initWithSuiteName:]([WKUserDefaults alloc], "initWithSuiteName:", v6);
      cf = v7;
      if (!v7)
      {
        MEMORY[0x19AEABCC8](&v16, v6);
        WTF::String::utf8();
        WTFLogAlways();
        v12 = v17;
        v17 = 0;
        if (v12)
        {
          if (*(_DWORD *)v12 == 1)
            WTF::fastFree(v12, v11);
          else
            --*(_DWORD *)v12;
        }
        v13 = v16;
        v16 = 0;
        if (v13)
        {
          if (*(_DWORD *)v13 == 2)
            WTF::StringImpl::destroy(v13, (WTF::StringImpl *)v11);
          else
            *(_DWORD *)v13 -= 2;
        }
        goto LABEL_18;
      }
      objc_storeWeak(&v7->m_observer.m_weakReference, v3);
      objc_msgSend((id)cf, "addObserver:forKeyPath:options:context:", cf, CFSTR("testkey"), 1, 0);
      m_size = v3->m_userDefaults.m_size;
      if ((_DWORD)m_size == v3->m_userDefaults.m_capacity)
      {
        v9 = (CFTypeRef *)WTF::Vector<WTF::RetainPtr<WKUserDefaults>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v3->m_userDefaults, m_size + 1, (unint64_t)&cf);
        m_size = v3->m_userDefaults.m_size;
        v10 = *v9;
        *((_QWORD *)v3->m_userDefaults.m_buffer + m_size) = v10;
        if (v10)
          goto LABEL_11;
      }
      else
      {
        v10 = cf;
        *((_QWORD *)p_m_userDefaults->m_buffer + m_size) = cf;
        if (v10)
        {
LABEL_11:
          CFRetain(v10);
          LODWORD(m_size) = v3->m_userDefaults.m_size;
        }
      }
      v3->m_userDefaults.m_size = m_size + 1;
LABEL_18:
      v14 = cf;
      cf = 0;
      if (v14)
        CFRelease(v14);
      ++v4;
    }
    while (v4 != 11);
  }
  return v3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (id)sharedInstance
{
  id result;

  if (_MergedGlobals_17 == 1)
    return (id)qword_1EE341370;
  result = objc_alloc_init((Class)objc_opt_class());
  qword_1EE341370 = (uint64_t)result;
  _MergedGlobals_17 = 1;
  return result;
}

- (void)preferenceDidChange:(id)a3 key:(id)a4 encodedValue:(id)a5
{
  _QWORD *v8;
  _QWORD *v9;

  WTF::RunLoop::main((WTF::RunLoop *)self);
  if (a3)
    CFRetain(a3);
  if (a4)
    CFRetain(a4);
  if (a5)
    CFRetain(a5);
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v8 = &off_1E34B2940;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  v9 = v8;
  WTF::RunLoop::dispatch();
  if (v9)
    (*(void (**)(_QWORD *))(*v9 + 8))(v9);
}

- (void).cxx_destruct
{
  uint64_t m_size;
  const void **m_buffer;
  uint64_t v5;
  const void *v6;
  WTF *v7;

  m_size = self->m_userDefaults.m_size;
  if ((_DWORD)m_size)
  {
    m_buffer = (const void **)self->m_userDefaults.m_buffer;
    v5 = 8 * m_size;
    do
    {
      v6 = *m_buffer;
      *m_buffer = 0;
      if (v6)
        CFRelease(v6);
      ++m_buffer;
      v5 -= 8;
    }
    while (v5);
  }
  v7 = (WTF *)self->m_userDefaults.m_buffer;
  if (v7)
  {
    self->m_userDefaults.m_buffer = 0;
    self->m_userDefaults.m_capacity = 0;
    WTF::fastFree(v7, (void *)a2);
  }
}

- (_QWORD)preferenceDidChange:(_QWORD *)a1 key:encodedValue:
{
  const void *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_1E34B2940;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4)
    CFRelease(v4);
  return a1;
}

- (uint64_t)preferenceDidChange:(WTF *)this key:(void *)a2 encodedValue:
{
  const void *v3;
  const void *v4;
  const void *v5;

  *(_QWORD *)this = &off_1E34B2940;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    CFRelease(v5);
  return WTF::fastFree(this, a2);
}

- (WTF::StringImpl)preferenceDidChange:(_QWORD *)a1 key:encodedValue:
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  WTF::StringImpl *v4;
  int v5;
  WTF::StringImpl *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *result;
  WTF::StringImpl *v19;
  unsigned int v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  char v24;

  LOBYTE(v23) = 0;
  v24 = 0;
  if (a1[3])
  {
    MEMORY[0x19AEABCC8](&v19);
    v3 = v19;
    if (v24)
    {
      v19 = 0;
      v4 = v23;
      v23 = v3;
      if (!v4)
        goto LABEL_9;
      v5 = *(_DWORD *)v4 - 2;
      if (*(_DWORD *)v4 != 2)
        goto LABEL_7;
      WTF::StringImpl::destroy(v4, v2);
      v4 = v19;
      v19 = 0;
      if (!v4)
        goto LABEL_9;
      v5 = *(_DWORD *)v4 - 2;
      if (*(_DWORD *)v4 == 2)
        WTF::StringImpl::destroy(v4, v6);
      else
LABEL_7:
        *(_DWORD *)v4 = v5;
    }
    else
    {
      v23 = v19;
      v24 = 1;
    }
  }
LABEL_9:
  MEMORY[0x19AEABCC8](&v22, a1[1]);
  MEMORY[0x19AEABCC8](&v21, a1[2]);
  {
    if (WebKit::singleton(void)::singleton)
    {
      v7 = *(_QWORD *)(WebKit::singleton(void)::singleton + 8);
      if (v7)
      {
        v8 = (unsigned int *)(v7 + 16);
        do
          v9 = __ldaxr(v8);
        while (__stlxr(v9 + 1, v8));
        WebKit::AuxiliaryProcessProxy::notifyPreferencesChanged(v7, &v22, &v21, (WTF::StringImpl *)&v23);
        WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v8);
      }
    }
  }
  else
  {
    WebKit::singleton(void)::singleton = 0;
  }
  {
    if (WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess)
    {
      v10 = *(_QWORD *)(WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess + 8);
      if (v10)
      {
        v11 = (unsigned int *)(v10 + 16);
        do
          v12 = __ldaxr(v11);
        while (__stlxr(v12 + 1, v11));
        WebKit::AuxiliaryProcessProxy::notifyPreferencesChanged(v10, &v22, &v21, (WTF::StringImpl *)&v23);
        WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v11);
      }
    }
  }
  else
  {
    WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess = 0;
  }
  WebKit::WebProcessPool::allProcessPools((uint64_t)&v19);
  if (v20)
  {
    v14 = (uint64_t *)v19;
    v15 = 8 * v20;
    do
    {
      WebKit::WebProcessPool::notifyPreferencesChanged(*v14++, &v22, &v21, (WTF::StringImpl *)&v23);
      v15 -= 8;
    }
    while (v15);
  }
  WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v19, v13);
  v17 = v21;
  v21 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy(v17, v16);
    else
      *(_DWORD *)v17 -= 2;
  }
  result = v22;
  v22 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      result = (WTF::StringImpl *)WTF::StringImpl::destroy(result, v16);
    else
      *(_DWORD *)result -= 2;
  }
  if (v24)
  {
    result = v23;
    v23 = 0;
    if (result)
    {
      if (*(_DWORD *)result == 2)
        return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v16);
      else
        *(_DWORD *)result -= 2;
    }
  }
  return result;
}

@end
