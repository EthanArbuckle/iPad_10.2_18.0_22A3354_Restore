@implementation WKNFReaderSessionDelegate

- (WKNFReaderSessionDelegate)initWithConnection:(void *)a3
{
  void *v4;
  WKNFReaderSessionDelegate *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *m_ptr;
  unsigned int v12;
  unsigned int v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WKNFReaderSessionDelegate;
  v5 = -[WKNFReaderSessionDelegate init](&v15, sel_init);
  if (v5)
  {
    v6 = *((_QWORD *)a3 + 1);
    if (v6)
      goto LABEL_16;
    v6 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v6 = 1;
    *(_QWORD *)(v6 + 8) = a3;
    v7 = (unsigned int *)*((_QWORD *)a3 + 1);
    *((_QWORD *)a3 + 1) = v6;
    if (!v7)
      goto LABEL_16;
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, v4);
    }
    v6 = *((_QWORD *)a3 + 1);
    if (v6)
    {
LABEL_16:
      do
        v10 = __ldaxr((unsigned int *)v6);
      while (__stlxr(v10 + 1, (unsigned int *)v6));
    }
    m_ptr = (unsigned int *)v5->_connection.m_impl.m_ptr;
    v5->_connection.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr)
    {
      do
      {
        v12 = __ldaxr(m_ptr);
        v13 = v12 - 1;
      }
      while (__stlxr(v13, m_ptr));
      if (!v13)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v4);
      }
    }
  }
  return v5;
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  unsigned int *m_ptr;
  unsigned int v7;
  _QWORD *v8;
  _QWORD *v9;

  WTF::RunLoop::main((WTF::RunLoop *)self);
  m_ptr = (unsigned int *)self->_connection.m_impl.m_ptr;
  if (m_ptr)
  {
    do
      v7 = __ldaxr(m_ptr);
    while (__stlxr(v7 + 1, m_ptr));
  }
  if (a4)
    CFRetain(a4);
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v8 = &off_1E34CC8D8;
  v8[1] = m_ptr;
  v8[2] = a4;
  v9 = v8;
  WTF::RunLoop::dispatch();
  if (v9)
    (*(void (**)(_QWORD *))(*v9 + 8))(v9);
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

- (_QWORD)readerSession:(_QWORD *)a1 didDetectTags:(void *)a2
{
  const void *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  *a1 = &off_1E34CC8D8;
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

- (uint64_t)readerSession:(WTF *)this didDetectTags:(void *)a2
{
  const void *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  *(_QWORD *)this = &off_1E34CC8D8;
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

- (_QWORD)readerSession:(_QWORD *)result didDetectTags:
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  const void *v14;
  void *v15;
  uint64_t v16;
  const void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _DWORD *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v1 = result[1];
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if (v2)
    {
      v3 = *(_QWORD *)(v2 + 32);
      if (v3)
      {
        if (*(_QWORD *)(v3 + 8))
        {
          v4 = (void *)result[2];
          result = (_QWORD *)objc_msgSend(v4, "count");
          if (result)
          {
            v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0), "tagID");
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
            if (v6)
            {
              v7 = *(_QWORD *)v31;
              while (2)
              {
                for (i = 0; i != v6; ++i)
                {
                  if (*(_QWORD *)v31 != v7)
                    objc_enumerationMutation(v4);
                  if ((objc_msgSend(v5, "isEqualToData:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "tagID")) & 1) == 0)
                  {
                    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 16);
                    if (v20)
                    {
                      v21 = *(_QWORD *)(v20 + 8);
                      if (v21)
                        (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v21 + 24))(v21, 0);
                    }
                    objc_msgSend(*(id *)(v2 + 16), "stopPolling");
                    return (_QWORD *)WTF::RunLoop::TimerBase::start();
                  }
                }
                v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
                if (v6)
                  continue;
                break;
              }
            }
            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
            if (v9)
            {
              v10 = *(_QWORD *)v27;
              while (2)
              {
                for (j = 0; j != v9; ++j)
                {
                  if (*(_QWORD *)v27 != v10)
                    objc_enumerationMutation(v4);
                  v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                  if ((objc_msgSend(v12, "type") == 3
                     || objc_msgSend(v12, "type") == 6
                     || objc_msgSend(v12, "type") == 16)
                    && objc_msgSend(*(id *)(v2 + 16), "connectTag:", v12))
                  {
                    v13 = *(void **)(v2 + 16);
                    v14 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &fido::kCtapNfcAppletSelectionCommand, 13);
                    v15 = (void *)objc_msgSend(v13, "transceive:", v14);
                    if (v14)
                      CFRelease(v14);
                    if (v15)
                    {
                      if (objc_msgSend(v15, "length") == 8
                        && *(_QWORD *)objc_msgSend(v15, "bytes") == 0x9032565F463255)
                      {
                        goto LABEL_47;
                      }
                      if (objc_msgSend(v15, "length") == 10)
                      {
                        v16 = objc_msgSend(v15, "bytes");
                        if (*(_QWORD *)v16 == 0x305F325F4F444946 && *(_WORD *)(v16 + 8) == 144)
                          goto LABEL_47;
                      }
                    }
                    v18 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &fido::kCtapNfcU2fVersionCommand, 5);
                    v19 = (void *)objc_msgSend(v13, "transceive:", v18);
                    if (v18)
                      CFRelease(v18);
                    if (v19
                      && objc_msgSend(v19, "length") == 8
                      && *(_QWORD *)objc_msgSend(v19, "bytes") == 0x9032565F463255)
                    {
LABEL_47:
                      v22 = *(_QWORD *)(v2 + 32);
                      if (v22)
                        v23 = *(_QWORD *)(v22 + 8);
                      else
                        v23 = 0;
                      v24 = *(_DWORD **)(v23 + 32);
                      if (v24)
                        ++*v24;
                      v25 = WTF::fastMalloc((WTF *)0x20);
                      *(_DWORD *)(v25 + 16) = 0;
                      *(_BYTE *)(v25 + 20) = 1;
                      *(_QWORD *)v25 = off_1E34DF078;
                      *(_QWORD *)(v25 + 8) = 0;
                      *(_QWORD *)(v25 + 24) = v24;
                      v34 = (_QWORD *)v25;
                      WebKit::FidoService::getInfo(v23, (uint64_t *)&v34);
                      result = v34;
                      v34 = 0;
                      if (result)
                        return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*result + 8))(result);
                      return result;
                    }
                    objc_msgSend(*(id *)(v2 + 16), "disconnectTag");
                  }
                }
                v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
                if (v9)
                  continue;
                break;
              }
            }
            objc_msgSend(*(id *)(v2 + 16), "stopPolling");
            return (_QWORD *)WTF::RunLoop::TimerBase::start();
          }
        }
      }
    }
  }
  return result;
}

@end
