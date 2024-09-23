@implementation _WKAutomationSession

- (_WKAutomationSession)init
{
  _WKAutomationSessionConfiguration *v3;
  _WKAutomationSession *v4;

  v3 = objc_alloc_init(_WKAutomationSessionConfiguration);
  v4 = -[_WKAutomationSession initWithConfiguration:](self, "initWithConfiguration:", v3);
  if (v3)
    CFRelease(v3);
  return v4;
}

- (_WKAutomationSession)initWithConfiguration:(id)a3
{
  _WKAutomationSession *v4;
  _WKAutomationSession *v5;
  uint64_t v6;
  void *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_WKAutomationSession;
  v4 = -[_WKAutomationSession init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_QWORD *)WebKit::WebAutomationSession::WebAutomationSession((WebKit::WebAutomationSession *)-[_WKAutomationSession _apiObject](v4, "_apiObject"))+ 1) = v4;
    v6 = objc_msgSend(a3, "copy");
    m_ptr = v5->_configuration.m_ptr;
    v5->_configuration.m_ptr = (void *)v6;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v5;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v5 = *(_QWORD *)&self->_anon_38[8];
    *(_QWORD *)&self->_anon_38[8] = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    WebKit::WebAutomationSession::~WebAutomationSession((WebKit::WebAutomationSession *)&self->_session, v4);
    v6.receiver = self;
    v6.super_class = (Class)_WKAutomationSession;
    -[_WKAutomationSession dealloc](&v6, sel_dealloc);
  }
}

- (_WKAutomationSessionDelegate)delegate
{
  return (_WKAutomationSessionDelegate *)objc_loadWeak(&self->_delegate.m_weakReference);
}

- (void)setDelegate:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  objc_storeWeak(&self->_delegate.m_weakReference, a3);
  if (a3)
  {
    v5 = WTF::fastMalloc((WTF *)0x18);
    WebKit::AutomationSessionClient::AutomationSessionClient(v5, a3);
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)&self->_anon_38[8];
  *(_QWORD *)&self->_anon_38[8] = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
}

- (NSString)sessionIdentifier
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)&self->_anon_38[16];
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (void)setSessionIdentifier:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self->_anon_38[16], (WTF::StringImpl *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (_WKAutomationSessionConfiguration)configuration
{
  return (_WKAutomationSessionConfiguration *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(self->_configuration.m_ptr, "copy"));
}

- (BOOL)isPaired
{
  return *(_BYTE *)(*(_QWORD *)&self->_anon_38[264] + 20);
}

- (BOOL)isPendingTermination
{
  return *(_BYTE *)(*(_QWORD *)&self->_anon_38[264] + 21);
}

- (BOOL)isSimulatingUserInteraction
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->_anon_38[128];
  return v2 && *(_DWORD *)(v2 - 12) || self->_anon_38[252] != 0;
}

- (void)terminate
{
  WebKit::WebAutomationSession::terminate((WebKit::WebAutomationSession *)&self->_session);
}

- (Object)_apiObject
{
  return (Object *)&self->_session;
}

- (void).cxx_destruct
{
  void *m_ptr;

  objc_destroyWeak(&self->_delegate.m_weakReference);
  m_ptr = self->_configuration.m_ptr;
  self->_configuration.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 41) = 0;
  *((_QWORD *)self + 42) = 0;
  return self;
}

@end
