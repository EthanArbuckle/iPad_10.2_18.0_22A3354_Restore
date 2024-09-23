@implementation _WKAPSConnectionDelegate

- (_WKAPSConnectionDelegate)initWithConnection:(void *)a3
{
  void *v4;
  _WKAPSConnectionDelegate *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int *m_ptr;
  unsigned int v9;
  unsigned int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_WKAPSConnectionDelegate;
  v5 = -[_WKAPSConnectionDelegate init](&v12, sel_init);
  if (v5)
  {
    if (a3)
    {
      WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 2, (uint64_t)a3);
      v6 = (unsigned int *)*((_QWORD *)a3 + 1);
      if (v6)
      {
        do
          v7 = __ldaxr(v6);
        while (__stlxr(v7 + 1, v6));
      }
    }
    else
    {
      v6 = 0;
    }
    m_ptr = (unsigned int *)v5->_connection.m_impl.m_ptr;
    v5->_connection.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
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
        WTF::fastFree((WTF *)m_ptr, v4);
      }
    }
  }
  return v5;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  char *v5;
  void *v7;
  DefaultWeakPtrImpl *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  WTF *v12;
  WTF *v13;
  char *v14;
  uint64_t v15;
  void *v16;
  WTF *v17;
  WTF *v18;
  WTF *v19;
  uint64_t v20;

  m_ptr = self->_connection.m_impl.m_ptr;
  if (!m_ptr)
    return;
  if (!*((_QWORD *)m_ptr + 1))
    return;
  v5 = (char *)a4;
  if (!objc_msgSend(a4, "length", a3))
    return;
  v8 = self->_connection.m_impl.m_ptr;
  if (v8)
  {
    v9 = *((_QWORD *)v8 + 1);
    if (v5)
      goto LABEL_6;
  }
  else
  {
    v9 = 0;
    if (v5)
    {
LABEL_6:
      v10 = objc_msgSend(v5, "bytes");
      v11 = objc_msgSend(v5, "length");
      v5 = (char *)v11;
      v19 = 0;
      LODWORD(v20) = 0;
      HIDWORD(v20) = v11;
      if (v11)
      {
        if (HIDWORD(v11))
        {
          __break(0xC471u);
          return;
        }
        v12 = (WTF *)WTF::fastMalloc((WTF *)v11);
        v13 = v12;
        v14 = 0;
        LODWORD(v20) = (_DWORD)v5;
        v19 = v12;
        do
        {
          v14[(_QWORD)v12] = v14[v10];
          ++v14;
        }
        while (v5 != v14);
      }
      else
      {
        v13 = 0;
      }
      goto LABEL_10;
    }
  }
  v13 = 0;
  v19 = 0;
  v20 = 0;
LABEL_10:
  v15 = *(_QWORD *)(v9 + 16);
  if (v15)
  {
    (*(void (**)(uint64_t, WTF **))(*(_QWORD *)v15 + 16))(v15, &v19);
    v17 = v19;
    if (v19)
    {
      v19 = 0;
      LODWORD(v20) = 0;
      WTF::fastFree(v17, v16);
    }
  }
  else
  {
    v18 = *(WTF **)(v9 + 24);
    if (v18)
    {
      *(_QWORD *)(v9 + 24) = 0;
      *(_DWORD *)(v9 + 32) = 0;
      WTF::fastFree(v18, v7);
    }
    *(_QWORD *)(v9 + 24) = v13;
    *(_DWORD *)(v9 + 32) = (_DWORD)v5;
    *(_DWORD *)(v9 + 36) = (_DWORD)v5;
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  WebPushD::PushServiceConnection *v5;

  m_ptr = self->_connection.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = (WebPushD::PushServiceConnection *)*((_QWORD *)m_ptr + 1);
    if (v5)
      WebPushD::PushServiceConnection::didReceivePushMessage(v5, (NSString *)objc_msgSend(a4, "topic", a3), (NSDictionary *)objc_msgSend(a4, "userInfo"));
  }
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_connection.m_impl.m_ptr;
  self->_connection.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
