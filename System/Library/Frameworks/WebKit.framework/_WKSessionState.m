@implementation _WKSessionState

- (_WKSessionState)initWithData:(id)a3
{
  id v4;
  SessionState *v5;
  _WKSessionState *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_WKSessionState;
  v4 = -[_WKSessionState init](&v8, sel_init);
  v6 = (_WKSessionState *)v4;
  if (v4 && (WebKit::decodeSessionState((WebKit *)a3, (NSData *)v4 + 1, v5) & 1) == 0)
  {

    return 0;
  }
  return v6;
}

- (id)_initWithSessionState:(SessionState *)a3
{
  id v4;
  _BYTE *v5;
  unsigned int v6;
  unsigned int val;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_WKSessionState;
  v4 = -[_WKSessionState init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *((_DWORD *)v4 + 5);
    if (v6)
      WTF::VectorDestructor<true,WebKit::BackForwardListItemState>::destruct(*((WTF::StringImpl **)v4 + 1), (WTF::StringImpl *)(*((_QWORD *)v4 + 1) + 312 * v6));
    WTF::VectorBuffer<WebCore::TextList,0ul,WTF::FastMalloc>::adopt((uint64_t)(v5 + 8), a3);
    val = a3->backForwardListState.currentIndex.var0.__val_;
    v5[28] = a3->backForwardListState.currentIndex.__engaged_;
    *((_DWORD *)v5 + 6) = val;
    *((_QWORD *)v5 + 4) = a3->renderTreeSize;
    WTF::URL::operator=((uint64_t)(v5 + 40), (WTF::StringImpl *)&a3->provisionalURL);
    v5[80] = a3->isAppInitiated;
  }
  return v5;
}

- (NSData)data
{
  CFTypeRef cf;

  WebKit::encodeSessionState((WebKit *)&self->_sessionState, &cf);
  return (NSData *)(id)CFMakeCollectable(cf);
}

- (void).cxx_destruct
{
  StringImpl *m_ptr;

  m_ptr = self->_sessionState.provisionalURL.m_string.m_impl.m_ptr;
  self->_sessionState.provisionalURL.m_string.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (WTF::StringImpl *)a2);
    else
      *(_DWORD *)m_ptr -= 2;
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_sessionState, (void *)a2);
}

- (id).cxx_construct
{
  self->_sessionState.backForwardListState.items.m_buffer = 0;
  self->_sessionState.backForwardListState.currentIndex.__engaged_ = 0;
  *(_QWORD *)&self->_sessionState.backForwardListState.items.m_capacity = 0;
  self->_sessionState.backForwardListState.currentIndex.var0.__null_state_ = 0;
  WTF::URL::URL((WTF::URL *)&self->_sessionState.provisionalURL);
  self->_sessionState.isAppInitiated = 1;
  return self;
}

@end
