@implementation WKUIWindowSceneObserver

- (WKUIWindowSceneObserver)initWithParent:(void *)a3
{
  WKUIWindowSceneObserver *v4;
  void *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int *m_ptr;
  unsigned int v9;
  unsigned int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WKUIWindowSceneObserver;
  v4 = -[WKUIWindowSceneObserver init](&v12, sel_init);
  if (v4)
  {
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3, (uint64_t)a3);
    v6 = *(unsigned int **)a3;
    if (*(_QWORD *)a3)
    {
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 + 1, v6));
    }
    m_ptr = (unsigned int *)v4->_parent.m_impl.m_ptr;
    v4->_parent.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr)
    {
      do
      {
        v9 = __ldaxr(m_ptr);
        v10 = v9 - 1;
      }
      while (__stlxr(v10, m_ptr));
      if (!v10)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v5);
      }
    }
  }
  return v4;
}

- (void)setObservedWindow:(id)a3
{
  id WeakRetained;
  const void *v6;

  if (WTF::linkedOnOrAfterSDKWithBehavior())
  {
    if (a3)
      CFRetain(a3);
    WeakRetained = objc_loadWeakRetained(&self->_window.m_weakReference);
    v6 = WeakRetained;
    if (WeakRetained != a3)
    {
      if (WeakRetained)
        objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, CFSTR("windowScene"));
      objc_storeWeak(&self->_window.m_weakReference, a3);
      if (a3)
        objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("windowScene"), 1, WebKit::WKUIWindowSceneObserverContext);
    }
    if (v6)
      CFRelease(v6);
    if (a3)
      CFRelease(a3);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD *v8;
  _QWORD *v9;

  if ((void *)WebKit::WKUIWindowSceneObserverContext == a6)
  {
    if (self)
      CFRetain(self);
    if (a5)
      CFRetain(a5);
    v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
    *v8 = &off_1E34BA148;
    v8[1] = self;
    v8[2] = self;
    v8[3] = a5;
    v9 = v8;
    WTF::ensureOnMainThread();
    if (v9)
      (*(void (**)(_QWORD *))(*v9 + 8))(v9);
  }
}

- (void).cxx_destruct
{
  void *v3;
  unsigned int *m_ptr;
  unsigned int v5;
  unsigned int v6;

  objc_destroyWeak(&self->_window.m_weakReference);
  m_ptr = (unsigned int *)self->_parent.m_impl.m_ptr;
  self->_parent.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v5 = __ldaxr(m_ptr);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, m_ptr));
    if (!v6)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v3);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)a1 ofObject:change:context:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E34BA148;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E34BA148;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (unsigned)observeValueForKeyPath:(unsigned int *)result ofObject:change:context:
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;
  char isKindOfClass;
  uint64_t v5;
  id *v6;
  UIScene *v7;

  v1 = *(_QWORD *)(*((_QWORD *)result + 1) + 8);
  if (v1 && *(_QWORD *)(v1 + 8))
  {
    v2 = result;
    v3 = objc_msgSend(*((id *)result + 3), "valueForKey:", *MEMORY[0x1E0CB2CB8]);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = *(_QWORD *)(*((_QWORD *)v2 + 1) + 8);
    if ((isKindOfClass & 1) != 0)
    {
      if (v5)
        v6 = *(id **)(v5 + 8);
      else
        v6 = 0;
      v7 = (UIScene *)v3;
    }
    else
    {
      if (v5)
        v6 = *(id **)(v5 + 8);
      else
        v6 = 0;
      v7 = 0;
    }
    return WebKit::ApplicationStateTracker::setScene(v6, v7);
  }
  return result;
}

@end
