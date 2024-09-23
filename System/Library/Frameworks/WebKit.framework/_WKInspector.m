@implementation _WKInspector

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  return self;
}

- (Object)_apiObject
{
  return (Object *)&self->_inspector;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate.m_weakReference);
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::WebInspectorUIProxy> *))self->_inspector.data.__lx)(&self->_inspector);
    v4.receiver = self;
    v4.super_class = (Class)_WKInspector;
    -[_WKInspector dealloc](&v4, sel_dealloc);
  }
}

- (_WKInspectorDelegate)delegate
{
  _WKInspectorDelegate *WeakRetained;
  _WKInspectorDelegate *v3;

  WeakRetained = (_WKInspectorDelegate *)objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v3 = WeakRetained;
  if (WeakRetained)
    CFRelease(WeakRetained);
  return v3;
}

- (void)setDelegate:(id)a3
{
  uint64_t v5;
  char v6;
  uint64_t v7;

  objc_storeWeak(&self->_delegate.m_weakReference, a3);
  v5 = WTF::fastMalloc((WTF *)0x18);
  *(_QWORD *)v5 = off_1E34C2C88;
  *(_QWORD *)(v5 + 8) = 0;
  objc_initWeak((id *)(v5 + 8), a3);
  *(_BYTE *)(v5 + 16) = *(_BYTE *)(v5 + 16) & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)(v5 + 16) = *(_BYTE *)(v5 + 16) & 0xFD | v6;
  v7 = *(_QWORD *)&self->_anon_38[8];
  *(_QWORD *)&self->_anon_38[8] = v5;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
}

- (WKWebView)webView
{
  uint64_t v2;
  uint64_t v3;
  WKWebView *v4;
  CFTypeRef cf;

  v2 = *(_QWORD *)&self->_inspector.data.__lx[40];
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
    return 0;
  CFRetain(*(CFTypeRef *)(v3 - 8));
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  v4 = (id)CFMakeCollectable(cf);
  CFRelease(*(CFTypeRef *)(v3 - 8));
  return v4;
}

- (BOOL)isConnected
{
  uint64_t v2;

  v2 = *(_QWORD *)self->_anon_38;
  return v2 && *(_QWORD *)(v2 + 8) != 0;
}

- (BOOL)isVisible
{
  return self->_anon_38[25];
}

- (BOOL)isFront
{
  return 0;
}

- (BOOL)isProfilingPage
{
  return self->_anon_38[28];
}

- (BOOL)isElementSelectionActive
{
  return self->_anon_38[31];
}

- (void)connect
{
  const WTF::StringImpl *v2;

  WebKit::WebInspectorUIProxy::connect((uint64_t)&self->_inspector, (uint64_t)a2, v2);
}

- (void)show
{
  const WTF::StringImpl *v2;

  WebKit::WebInspectorUIProxy::show((char *)&self->_inspector, (uint64_t)a2, v2);
}

- (void)hide
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->_inspector.data.__lx[40];
  if (v2)
  {
    if (*(_QWORD *)(v2 + 8))
      self->_anon_38[25] = 0;
  }
}

- (void)close
{
  WebKit::WebInspectorUIProxy::close((WebKit::WebInspectorUIProxy *)&self->_inspector);
}

- (void)showConsole
{
  WebKit::WebInspectorUIProxy::showConsole(self->_inspector.data.__lx, (void *)a2);
}

- (void)showResources
{
  WebKit::WebInspectorUIProxy::showResources(self->_inspector.data.__lx, (void *)a2);
}

- (void)showMainResourceForFrame:(id)a3
{
  if (a3)
    WebKit::WebInspectorUIProxy::showMainResourceForFrame((WebKit::WebInspectorUIProxy *)&self->_inspector, *((void **)a3 + 3), *((_QWORD *)a3 + 4));
}

- (void)attach
{
  WebKit::WebInspectorUIProxy::attach((IPC::Encoder *)&self->_inspector, 0);
}

- (void)detach
{
  WebKit::WebInspectorUIProxy::detach((uint64_t)&self->_inspector);
}

- (void)togglePageProfiling
{
  WebKit::WebInspectorUIProxy::togglePageProfiling((uint64_t)&self->_inspector);
}

- (void)toggleElementSelection
{
  const WTF::StringImpl *v2;

  WebKit::WebInspectorUIProxy::toggleElementSelection((uint64_t)&self->_inspector, (uint64_t)a2, v2);
}

- (void)printErrorToConsole:(id)a3
{
  WKWebView *v4;

  v4 = -[_WKInspector webView](self, "webView");
  -[WKWebView evaluateJavaScript:completionHandler:](v4, "evaluateJavaScript:completionHandler:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("console.error(\"%@\");"), a3),
    0);
}

- (void)_setDiagnosticLoggingDelegate:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v5 = -[_WKInspector inspectorWebView](self, "inspectorWebView");
  if (v5)
  {
    objc_msgSend(v5, "_setDiagnosticLoggingDelegate:", a3);
    v6 = *(_QWORD *)(*(_QWORD *)self->_anon_38 + 8);
    v7 = v6 - 16;
    if (!v6)
      v7 = 0;
    v8 = *(_QWORD *)(v7 + 208);
    v9 = a3 != 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebInspectorUI::SetDiagnosticLoggingAvailable>(v8, (char *)&v9, *(_QWORD *)(*(_QWORD *)(v6 + 16) + 1896), 0);
  }
}

- (void)registerExtensionWithID:(id)a3 extensionBundleIdentifier:(id)a4 displayName:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0), 0);
}

- (void)unregisterExtension:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0));
}

- (id)inspectorWebView
{
  uint64_t v2;
  uint64_t v3;
  CFTypeRef v4;
  CFTypeRef cf;

  v2 = *(_QWORD *)self->_anon_38;
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
    return 0;
  CFRetain(*(CFTypeRef *)(v3 - 8));
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  v4 = (id)CFMakeCollectable(cf);
  CFRelease(*(CFTypeRef *)(v3 - 8));
  return (id)v4;
}

- (void)_fetchURLForTesting:(id)a3
{
  ObjectStorage<WebKit::WebInspectorUIProxy> *p_inspector;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  p_inspector = &self->_inspector;
  MEMORY[0x19AEABCC8](&v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fetch(\"%@\")"), objc_msgSend(a3, "absoluteString")));
  WebKit::WebInspectorUIProxy::evaluateInFrontendForTesting((WebKit::WebInspectorUIProxy *)p_inspector, (const WTF::String *)&v6);
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

- (void)_openURLExternallyForTesting:(id)a3 useFrontendAPI:(BOOL)a4
{
  ObjectStorage<WebKit::WebInspectorUIProxy> *p_inspector;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  id v8;
  WTF::StringImpl *v9;

  if (a4)
  {
    p_inspector = &self->_inspector;
    MEMORY[0x19AEABCC8](&v9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("InspectorFrontendHost.openURLExternally(\"%@\")"), objc_msgSend(a3, "absoluteString")));
    WebKit::WebInspectorUIProxy::evaluateInFrontendForTesting((WebKit::WebInspectorUIProxy *)p_inspector, (const WTF::String *)&v9);
    v7 = v9;
    v9 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v6);
      else
        *(_DWORD *)v7 -= 2;
    }
  }
  else
  {
    v8 = -[_WKInspector inspectorWebView](self, "inspectorWebView");
    objc_msgSend(v8, "loadRequest:", objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", a3));
  }
}

@end
