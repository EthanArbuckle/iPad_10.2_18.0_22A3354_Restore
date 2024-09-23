@implementation WKVisibilityPropagationView

- (void)propagateVisibilityToProcess:(void *)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  CFTypeRef v10;
  Vector<std::pair<WTF::WeakPtr<WebKit::AuxiliaryProcessProxy>, WTF::RetainPtr<id<UIInteraction>>>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_processesAndInteractions;
  unint64_t m_size;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int *m_buffer;
  unsigned int **v17;
  void *v18;
  unsigned int **v19;
  _QWORD *v20;
  unsigned int **v21;
  CFTypeRef v22;
  CFTypeRef cf;
  _BYTE v24[8];
  int v25;
  char v26;
  uint8_t buf[4];
  CFTypeRef v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!-[WKVisibilityPropagationView _containsInteractionForProcess:](self, "_containsInteractionForProcess:"))
  {
    v5 = *((_QWORD *)a3 + 17);
    if (v5)
    {
      std::__optional_copy_base<WebKit::ExtensionProcess,false>::__optional_copy_base[abi:sn180100](v24, v5 + 40);
      if (v26)
      {
        WebKit::ExtensionProcess::createVisibilityPropagationInteraction((WebKit::ExtensionProcess *)v24, &cf);
        if (cf)
        {
          -[WKVisibilityPropagationView addInteraction:](self, "addInteraction:");
          v6 = qword_1ECE71C68;
          if (os_log_type_enabled((os_log_t)qword_1ECE71C68, OS_LOG_TYPE_DEFAULT))
          {
            v7 = *((_QWORD *)a3 + 17);
            if (v7)
              LODWORD(v7) = *(_DWORD *)(v7 + 108);
            *(_DWORD *)buf = 138412546;
            v28 = cf;
            v29 = 1024;
            v30 = v7;
            _os_log_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEFAULT, "Created visibility propagation interaction %@ for process with PID=%d", buf, 0x12u);
          }
          WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 2, (uint64_t)a3);
          v8 = (unsigned int *)*((_QWORD *)a3 + 1);
          if (v8)
          {
            do
              v9 = __ldaxr(v8);
            while (__stlxr(v9 + 1, v8));
          }
          v10 = cf;
          if (cf)
            CFRetain(cf);
          p_processesAndInteractions = &self->_processesAndInteractions;
          m_size = self->_processesAndInteractions.m_size;
          if ((_DWORD)m_size == self->_processesAndInteractions.m_capacity)
          {
            v13 = m_size + (m_size >> 2);
            if (v13 >= 0x10)
              v14 = v13 + 1;
            else
              v14 = 16;
            if (v14 <= m_size + 1)
              v15 = m_size + 1;
            else
              v15 = v14;
            if (v15 >> 28)
            {
              __break(0xC471u);
              return;
            }
            m_buffer = (unsigned int *)p_processesAndInteractions->m_buffer;
            v17 = (unsigned int **)WTF::fastMalloc((WTF *)(16 * v15));
            p_processesAndInteractions->m_capacity = v15;
            p_processesAndInteractions->m_buffer = v17;
            WTF::VectorMover<false,std::pair<WTF::WeakPtr<WebKit::AuxiliaryProcessProxy,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::RetainPtr<objc_object  {objcproto13UIInteraction}*>>>::move(m_buffer, &m_buffer[4 * m_size], v17);
            if (m_buffer)
            {
              if (p_processesAndInteractions->m_buffer == m_buffer)
              {
                p_processesAndInteractions->m_buffer = 0;
                p_processesAndInteractions->m_capacity = 0;
              }
              WTF::fastFree((WTF *)m_buffer, v18);
            }
            m_size = p_processesAndInteractions->m_size;
            v19 = (unsigned int **)((char *)p_processesAndInteractions->m_buffer + 16 * m_size);
            *v19 = v8;
            v20 = v19 + 1;
          }
          else
          {
            v21 = (unsigned int **)((char *)p_processesAndInteractions->m_buffer + 16 * m_size);
            *v21 = v8;
            v20 = v21 + 1;
          }
          *v20 = v10;
          p_processesAndInteractions->m_size = m_size + 1;
          v22 = cf;
          cf = 0;
          if (v22)
            CFRelease(v22);
        }
        if (v26)
        {
          if (v25 != -1)
            ((void (*)(uint8_t *, _BYTE *))off_1E34CE498[v25])(buf, v24);
        }
      }
    }
  }
}

- (BOOL)_containsInteractionForProcess:(void *)a3
{
  uint64_t m_size;
  char *i;

  m_size = self->_processesAndInteractions.m_size;
  if (!(_DWORD)m_size)
    return 0;
  for (i = (char *)self->_processesAndInteractions.m_buffer; !*(_QWORD *)i || *(void **)(*(_QWORD *)i + 8) != a3; i += 16)
  {
    if (!--m_size)
      return 0;
  }
  return 1;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 53) = 0;
  return self;
}

- (void).cxx_destruct
{
  Vector<std::pair<WTF::WeakPtr<WebKit::AuxiliaryProcessProxy>, WTF::RetainPtr<id<UIInteraction>>>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_processesAndInteractions;
  uint64_t m_size;
  unsigned int **m_buffer;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  WTF *v10;

  p_processesAndInteractions = &self->_processesAndInteractions;
  m_size = self->_processesAndInteractions.m_size;
  if ((_DWORD)m_size)
  {
    m_buffer = (unsigned int **)p_processesAndInteractions->m_buffer;
    v5 = (uint64_t)p_processesAndInteractions->m_buffer + 16 * m_size;
    do
    {
      v6 = m_buffer[1];
      m_buffer[1] = 0;
      if (v6)
        CFRelease(v6);
      v7 = *m_buffer;
      *m_buffer = 0;
      if (v7)
      {
        do
        {
          v8 = __ldaxr(v7);
          v9 = v8 - 1;
        }
        while (__stlxr(v9, v7));
        if (!v9)
        {
          atomic_store(1u, v7);
          WTF::fastFree((WTF *)v7, (void *)a2);
        }
      }
      m_buffer += 2;
    }
    while (m_buffer != (unsigned int **)v5);
  }
  v10 = (WTF *)p_processesAndInteractions->m_buffer;
  if (p_processesAndInteractions->m_buffer)
  {
    p_processesAndInteractions->m_buffer = 0;
    p_processesAndInteractions->m_capacity = 0;
    WTF::fastFree(v10, (void *)a2);
  }
}

- (void)stopPropagatingVisibilityToProcess:(void *)a3
{
  __int128 v3;
  Vector<std::pair<WTF::WeakPtr<WebKit::AuxiliaryProcessProxy>, WTF::RetainPtr<id<UIInteraction>>>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_processesAndInteractions;
  unsigned int *m_buffer;
  uint64_t m_size;
  unsigned int **v7;
  int v10;
  unsigned int *v11;
  unsigned int **v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  unsigned int **v18;
  const void *v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int *v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_processesAndInteractions = &self->_processesAndInteractions;
  m_buffer = (unsigned int *)self->_processesAndInteractions.m_buffer;
  m_size = self->_processesAndInteractions.m_size;
  v7 = (unsigned int **)&m_buffer[4 * m_size];
  if ((_DWORD)m_size)
  {
    v10 = 0;
    *(_QWORD *)&v3 = 134217984;
    v24 = v3;
    v11 = &m_buffer[4 * m_size];
    v12 = (unsigned int **)v11;
    do
    {
      if (!*(_QWORD *)m_buffer
        || ((v13 = *(void **)(*(_QWORD *)m_buffer + 8)) != 0 ? (v14 = v13 == a3) : (v14 = 1), v14))
      {
        v15 = qword_1ECE71C68;
        if (os_log_type_enabled((os_log_t)qword_1ECE71C68, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *((_QWORD *)m_buffer + 1);
          *(_DWORD *)buf = v24;
          v26 = v16;
          _os_log_impl(&dword_196BCC000, v15, OS_LOG_TYPE_DEFAULT, "Removing visibility propagation interaction %p", buf, 0xCu);
        }
        -[WKVisibilityPropagationView removeInteraction:](self, "removeInteraction:", *((_QWORD *)m_buffer + 1), v24);
        v18 = (unsigned int **)m_buffer;
        if (v12 != (unsigned int **)p_processesAndInteractions->m_buffer + 2 * p_processesAndInteractions->m_size)
        {
          if (v11 == m_buffer)
          {
            v18 = v12;
          }
          else
          {
            WTF::VectorMover<false,std::pair<WTF::WeakPtr<WebKit::AuxiliaryProcessProxy,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::RetainPtr<objc_object  {objcproto13UIInteraction}*>>>::moveOverlapping(v11, m_buffer, v12);
            v18 = (unsigned int **)((char *)v12 + (char *)m_buffer - (char *)v11);
          }
        }
        v19 = (const void *)*((_QWORD *)m_buffer + 1);
        *((_QWORD *)m_buffer + 1) = 0;
        if (v19)
          CFRelease(v19);
        v20 = *(unsigned int **)m_buffer;
        *(_QWORD *)m_buffer = 0;
        if (v20)
        {
          do
          {
            v21 = __ldaxr(v20);
            v22 = v21 - 1;
          }
          while (__stlxr(v22, v20));
          if (!v22)
          {
            atomic_store(1u, v20);
            WTF::fastFree((WTF *)v20, v17);
          }
        }
        v11 = m_buffer + 4;
        ++v10;
        v12 = v18;
      }
      else
      {
        v18 = v12;
      }
      m_buffer += 4;
    }
    while (m_buffer < (unsigned int *)v7);
    m_buffer = (unsigned int *)p_processesAndInteractions->m_buffer;
    LODWORD(m_size) = p_processesAndInteractions->m_size;
    v7 = v18;
  }
  else
  {
    v10 = 0;
    v11 = &m_buffer[4 * m_size];
  }
  v23 = &m_buffer[4 * m_size];
  if (v11 != v23)
  {
    WTF::VectorMover<false,std::pair<WTF::WeakPtr<WebKit::AuxiliaryProcessProxy,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::RetainPtr<objc_object  {objcproto13UIInteraction}*>>>::moveOverlapping(v11, v23, v7);
    LODWORD(m_size) = p_processesAndInteractions->m_size;
  }
  p_processesAndInteractions->m_size = m_size - v10;
}

@end
