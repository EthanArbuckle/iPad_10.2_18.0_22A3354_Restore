@implementation _WKSmartCardSlotStateObserver

- (_WKSmartCardSlotStateObserver)initWithService:(void *)a3 slot:(void *)a4
{
  _WKSmartCardSlotStateObserver *v6;
  void *v7;
  _WKSmartCardSlotStateObserver *v8;
  DefaultWeakPtrImpl *v9;
  unsigned int *m_ptr;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_WKSmartCardSlotStateObserver;
  v6 = -[_WKSmartCardSlotStateObserver init](&v16, sel_init);
  v8 = v6;
  if (v6)
  {
    v9 = *(DefaultWeakPtrImpl **)a3;
    *(_QWORD *)a3 = 0;
    m_ptr = (unsigned int *)v6->m_service.m_impl.m_ptr;
    v8->m_service.m_impl.m_ptr = v9;
    if (m_ptr)
    {
      do
      {
        v11 = __ldaxr(m_ptr);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, m_ptr));
      if (!v12)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v7);
      }
    }
    v13 = *(void **)a4;
    *(_QWORD *)a4 = 0;
    v14 = v8->m_slot.m_ptr;
    v8->m_slot.m_ptr = v13;
    if (v14)
      CFRelease(v14);
  }
  return v8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  DefaultWeakPtrImpl *m_ptr;
  int v9;
  const void *v10;
  const void *v11;
  unsigned int *v12;
  unsigned int v13;
  _QWORD *v14;
  _QWORD *v15;

  m_ptr = self->m_service.m_impl.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 1))
  {
    v9 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "intValue");
    if (v9 == 4)
    {
      v10 = (const void *)objc_msgSend(a4, "makeSmartCard");
      v11 = v10;
      v12 = (unsigned int *)self->m_service.m_impl.m_ptr;
      if (v12)
      {
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 + 1, v12));
      }
      if (v10)
        CFRetain(v10);
      v14 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
      *v14 = &off_1E34CC620;
      v14[1] = v12;
      v14[2] = v11;
      v15 = v14;
      WTF::callOnMainRunLoop();
      if (v15)
        (*(void (**)(_QWORD *))(*v15 + 8))(v15);
    }
    else if (!v9)
    {
      -[_WKSmartCardSlotStateObserver removeObserver](self, "removeObserver");
    }
  }
}

- (void)removeObserver
{
  void *m_ptr;
  void *v4;

  m_ptr = self->m_slot.m_ptr;
  if (m_ptr)
  {
    objc_msgSend(m_ptr, "removeObserver:forKeyPath:", self, CFSTR("state"));
    v4 = self->m_slot.m_ptr;
    self->m_slot.m_ptr = 0;
    if (v4)
      CFRelease(v4);
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  m_ptr = self->m_slot.m_ptr;
  self->m_slot.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = (unsigned int *)self->m_service.m_impl.m_ptr;
  self->m_service.m_impl.m_ptr = 0;
  if (v4)
  {
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      atomic_store(1u, v4);
      WTF::fastFree((WTF *)v4, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)a1 ofObject:(void *)a2 change:context:
{
  const void *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  *a1 = &off_1E34CC620;
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (unsigned int *)a1[1];
  a1[1] = 0;
  if (v4)
  {
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      atomic_store(1u, v4);
      WTF::fastFree((WTF *)v4, a2);
    }
  }
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  const void *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  *(_QWORD *)this = &off_1E34CC620;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (unsigned int *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
  {
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      atomic_store(1u, v4);
      WTF::fastFree((WTF *)v4, a2);
    }
  }
  return WTF::fastFree(this, a2);
}

- (WebKit::CcidConnection)observeValueForKeyPath:(WebKit::CcidConnection *)result ofObject:change:context:
{
  uint64_t v1;
  uint64_t v2;

  v1 = *((_QWORD *)result + 1);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if (v2)
      return WebKit::CcidService::onValidCard(v2, (uint64_t *)result + 2);
  }
  return result;
}

@end
