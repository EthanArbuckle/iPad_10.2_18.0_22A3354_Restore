@implementation _WKWebContentProcessInfo

- (_WKWebContentProcessInfo)initWithTaskInfo:(const TaskInfo *)a3 process:(const void *)a4
{
  _WKWebContentProcessInfo *v5;
  _WKWebContentProcessInfo *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  id m_ptr;
  void *v12;
  uint64_t v14;
  unsigned int v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_WKWebContentProcessInfo;
  v5 = -[_WKProcessInfo initWithTaskInfo:](&v16, sel_initWithTaskInfo_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_webContentState = 2;
    if (*((_BYTE *)a4 + 778))
    {
      v5->_webContentState = 0;
    }
    else if (*((_BYTE *)a4 + 712))
    {
      v5->_webContentState = 1;
    }
    else
    {
      WebKit::WebProcessProxy::pages((WebKit::WebProcessProxy *)a4, (uint64_t)&v14);
      if (v15)
      {
        v8 = v14;
        v9 = 8 * v15;
        do
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)v8 + 32) + 1984));
          if (WeakRetained)
          {
            m_ptr = v6->_webViews.m_ptr;
            if (!m_ptr)
            {
              m_ptr = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v12 = v6->_webViews.m_ptr;
              v6->_webViews.m_ptr = m_ptr;
              if (v12)
              {
                CFRelease(v12);
                m_ptr = v6->_webViews.m_ptr;
              }
            }
            objc_msgSend(m_ptr, "addObject:", WeakRetained);
            CFRelease(WeakRetained);
          }
          v8 += 8;
          v9 -= 8;
        }
        while (v9);
      }
      WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v7);
    }
    v6->_runningServiceWorkers = *((_BYTE *)a4 + 872);
    v6->_runningSharedWorkers = *((_BYTE *)a4 + 952);
    v6->_totalForegroundTime = WebKit::WebProcessProxy::totalForegroundTime((WebKit::WebProcessProxy *)a4);
    v6->_totalBackgroundTime = WebKit::WebProcessProxy::totalBackgroundTime((WebKit::WebProcessProxy *)a4);
    v6->_totalSuspendedTime = WebKit::WebProcessProxy::totalSuspendedTime((WebKit::WebProcessProxy *)a4);
  }
  return v6;
}

- (NSArray)webViews
{
  return (NSArray *)self->_webViews.m_ptr;
}

- (int64_t)webContentState
{
  return self->_webContentState;
}

- (BOOL)runningServiceWorkers
{
  return self->_runningServiceWorkers;
}

- (BOOL)runningSharedWorkers
{
  return self->_runningSharedWorkers;
}

- (double)totalForegroundTime
{
  return self->_totalForegroundTime;
}

- (double)totalBackgroundTime
{
  return self->_totalBackgroundTime;
}

- (double)totalSuspendedTime
{
  return self->_totalSuspendedTime;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_webViews.m_ptr;
  self->_webViews.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
