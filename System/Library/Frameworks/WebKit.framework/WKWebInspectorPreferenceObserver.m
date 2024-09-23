@implementation WKWebInspectorPreferenceObserver

+ (id)sharedInstance
{
  id result;

  if (_MergedGlobals_123 == 1)
    return (id)qword_1ECE732B0;
  result = objc_alloc_init((Class)objc_opt_class());
  qword_1ECE732B0 = (uint64_t)result;
  _MergedGlobals_123 = 1;
  return result;
}

- (WKWebInspectorPreferenceObserver)init
{
  WKWebInspectorPreferenceObserver *v2;
  WKWebInspectorPreferenceObserver *v3;
  void *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKWebInspectorPreferenceObserver;
  v2 = -[WKWebInspectorPreferenceObserver init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", WebKit::bundleIdentifierForSandboxBroker((WebKit *)v2));
    m_ptr = v3->m_userDefaults.m_ptr;
    v3->m_userDefaults.m_ptr = v4;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v4 = v3->m_userDefaults.m_ptr;
    }
    if (v4)
      objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v3, CFSTR("ShowDevelopMenu"), 1, 0);
    else
      WTFLogAlways();
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD *v6;
  _QWORD *v7;

  WTF::RunLoop::main((WTF::RunLoop *)self);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34F9C48;
  v7 = v6;
  WTF::RunLoop::dispatch();
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->m_userDefaults.m_ptr;
  self->m_userDefaults.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (uint64_t)observeValueForKeyPath:ofObject:change:context:
{
  void *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  unsigned int *v5;
  unsigned int *v6;
  unsigned int v7;
  uint64_t *v9;
  unsigned int v10;

  WebKit::WebProcessPool::allProcessPools((uint64_t)&v9);
  if (v10)
  {
    v1 = v9;
    v2 = &v9[v10];
    do
    {
      v3 = *v1;
      if (*(_DWORD *)(*v1 + 84))
      {
        v4 = 0;
        do
        {
          v5 = *(unsigned int **)(*(_QWORD *)(v3 + 72) + 8 * v4);
          v6 = v5 + 4;
          do
            v7 = __ldaxr(v6);
          while (__stlxr(v7 + 1, v6));
          WebKit::WebProcessProxy::enableRemoteInspectorIfNeeded((WebKit::WebProcessProxy *)v5);
          if (v5)
            WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v5 + 4);
          ++v4;
          v3 = *v1;
        }
        while (v4 < *(unsigned int *)(*v1 + 84));
      }
      ++v1;
    }
    while (v1 != v2);
  }
  return WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v9, v0);
}

@end
