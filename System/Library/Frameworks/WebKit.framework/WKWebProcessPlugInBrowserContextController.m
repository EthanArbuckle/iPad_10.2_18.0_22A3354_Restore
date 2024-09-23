@implementation WKWebProcessPlugInBrowserContextController

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 2504) = 0u;
  *(_OWORD *)((char *)self + 2520) = 0u;
  return self;
}

- (NSString)_groupIdentifier
{
  if (*(_QWORD *)(*(_QWORD *)&self->_anon_38[48] + 16))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)_setFormDelegate:(id)a3
{
  uint64_t v5;
  ObjectStorage<WebKit::WebPage> *p_page;
  _QWORD *v7;

  objc_storeWeak(&self->_formDelegate.m_weakReference, a3);
  if (a3)
  {
    v5 = WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v5 = off_1E34D1598;
    *(_QWORD *)(v5 + 8) = 0;
    objc_initWeak((id *)(v5 + 8), self);
    p_page = &self->_page;
    v7 = (_QWORD *)v5;
  }
  else
  {
    p_page = &self->_page;
    v7 = 0;
  }
  WebKit::WebPage::setInjectedBundleFormClient((uint64_t)p_page, &v7);
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
}

- (_WKRemoteObjectRegistry)_remoteObjectRegistry
{
  _WKRemoteObjectRegistry *result;
  void *m_ptr;

  result = (_WKRemoteObjectRegistry *)self->_remoteObjectRegistry.m_ptr;
  if (!result)
  {
    result = -[_WKRemoteObjectRegistry _initWithWebPage:]([_WKRemoteObjectRegistry alloc], "_initWithWebPage:", &self->_page);
    m_ptr = self->_remoteObjectRegistry.m_ptr;
    self->_remoteObjectRegistry.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (_WKRemoteObjectRegistry *)self->_remoteObjectRegistry.m_ptr;
    }
  }
  return result;
}

- (void)setLoadDelegate:(id)a3
{
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void (*v9)(uint64_t, void *, uint64_t, uint64_t);
  void (*v10)(uint64_t, void *, uint64_t, uint64_t);
  void *v11;
  __int128 v12;
  __int128 v13;
  void (*v14)(uint64_t, void *, uint64_t, uint64_t);
  void (*v15)(uint64_t, void *, uint64_t, uint64_t);
  __int128 v16;
  void (*v17)(uint64_t, void *, void *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void (*v21)(uint64_t, void *, uint64_t);
  uint64_t v22;
  __int128 v23;
  void (*v24)(uint64_t, void *, void *, uint64_t);
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void (*v29)(const OpaqueWKBundlePage *, __int16, const void **, id *);
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  void (*v33)(uint64_t, void *, void *, uint64_t);
  uint64_t (*v34)(id *);
  void (*v35)(uint64_t, void *, void *, uint64_t);

  objc_storeWeak(&self->_loadDelegate.m_weakReference, a3);
  if (a3)
  {
    v31 = 0u;
    v32 = 0u;
    v28 = 0u;
    v30 = 0;
    v26 = 0u;
    v27 = 0u;
    v23 = 0u;
    v25 = 0;
    v19 = 0;
    v22 = 0;
    v18 = 0;
    v13 = 0u;
    *(_QWORD *)&v5 = 11;
    *((_QWORD *)&v5 + 1) = self;
    v6 = didStartProvisionalLoadForFrame;
    v7 = didReceiveServerRedirectForProvisionalLoadForFrame;
    v8 = didFailProvisionalLoadWithErrorForFrame;
    v9 = didCommitLoadForFrame;
    *(_QWORD *)&v12 = didFailLoadWithErrorForFrame;
    *((_QWORD *)&v12 + 1) = didSameDocumentNavigationForFrame;
    v10 = didFinishDocumentLoadForFrame;
    v11 = didFinishLoadForFrame;
    v24 = globalObjectIsAvailableForFrame;
    v35 = serviceWorkerGlobalObjectIsAvailableForFrame;
    v16 = 0u;
    v17 = didClearWindowObjectForFrame;
    v14 = didFirstVisuallyNonEmptyLayoutForFrame;
    v15 = didRemoveFrameFromHierarchy;
    v20 = didHandleOnloadEventsForFrame;
    v21 = didLayoutForFrame;
    v29 = didReachLayoutMilestone;
    v33 = willInjectUserScriptForFrame;
    v34 = layoutMilestones;
    WKBundlePageSetPageLoaderClient(*(void **)&self->_page.data.__lx[8], &v5);
    v9 = 0;
    v12 = 0u;
    *(_QWORD *)&v5 = 1;
    *((_QWORD *)&v5 + 1) = self;
    v6 = didInitiateLoadForResource;
    v7 = willSendRequestForFrame;
    v8 = didReceiveResponseForResource;
    v10 = didFinishLoadForResource;
    v11 = didFailLoadForResource;
    WKBundlePageSetResourceLoadClient(*(void **)&self->_page.data.__lx[8], &v5);
  }
  else
  {
    WKBundlePageSetPageLoaderClient(*(void **)&self->_page.data.__lx[8], 0);
    WKBundlePageSetResourceLoadClient(*(void **)&self->_page.data.__lx[8], 0);
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_page;
}

- (void)_setEditingDelegate:(id)a3
{
  WeakObjCPtr<id<WKWebProcessPlugInEditingDelegate>> *p_editingDelegate;
  uint64_t v6;
  id WeakRetained;
  _QWORD *v8;

  p_editingDelegate = &self->_editingDelegate;
  objc_storeWeak(&self->_editingDelegate.m_weakReference, a3);
  if (a3)
  {
    v6 = WTF::fastMalloc((WTF *)0x18);
    *(_QWORD *)v6 = off_1E34D1610;
    *(_QWORD *)(v6 + 8) = self;
    WeakRetained = objc_loadWeakRetained(&p_editingDelegate->m_weakReference);
    *(_BYTE *)(v6 + 16) = objc_opt_respondsToSelector() & 1;
    *(_BYTE *)(v6 + 17) = objc_opt_respondsToSelector() & 1;
    *(_BYTE *)(v6 + 18) = objc_opt_respondsToSelector() & 1;
    *(_BYTE *)(v6 + 19) = objc_opt_respondsToSelector() & 1;
    *(_BYTE *)(v6 + 20) = objc_opt_respondsToSelector() & 1;
    *(_BYTE *)(v6 + 21) = objc_opt_respondsToSelector() & 1;
    *(_BYTE *)(v6 + 22) = objc_opt_respondsToSelector() & 1;
    if (WeakRetained)
      CFRelease(WeakRetained);
    v8 = (_QWORD *)v6;
  }
  else
  {
    v8 = 0;
  }
  WebKit::WebPage::setInjectedBundleEditorClient((uint64_t)&self->_page, &v8);
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
}

- (WKWebProcessPlugInLoadDelegate)loadDelegate
{
  return (WKWebProcessPlugInLoadDelegate *)objc_loadWeak(&self->_loadDelegate.m_weakReference);
}

- (void)dealloc
{
  objc_class *v3;
  void *m_ptr;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    m_ptr = self->_remoteObjectRegistry.m_ptr;
    if (m_ptr)
      objc_msgSend(m_ptr, "_invalidate");
    (**(void (***)(ObjectStorage<WebKit::WebPage> *))self->_page.data.__lx)(&self->_page);
    v5.receiver = self;
    v5.super_class = (Class)WKWebProcessPlugInBrowserContextController;
    -[WKWebProcessPlugInBrowserContextController dealloc](&v5, sel_dealloc);
  }
}

- (WKDOMDocument)mainFrameDocument
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)self->_anon_38;
  if (v2 && (v3 = *(_QWORD *)(v2 + 160)) != 0 && !*(_BYTE *)(v3 + 144))
    return (WKDOMDocument *)WebKit::toWKDOMNode(*(WebKit **)(v3 + 296), (WebCore::Node *)a2);
  else
    return 0;
}

- (WKDOMRange)selectedRange
{
  WebCore::Range *v2;
  WKDOMRange *v3;
  WebKit *v5;
  _BYTE v6[40];

  WebKit::WebPage::currentSelectionAsRange((WebKit **)&self->_page, (WebCore::Page *)a2, v6);
  if (v6[32])
  {
    WebCore::createLiveRange();
    v3 = (WKDOMRange *)WebKit::toWKDOMRange(v5, v2);
    if (v5)
    {
      if (*((_DWORD *)v5 + 2) == 1)
        (*(void (**)())(*(_QWORD *)v5 + 8))();
      else
        --*((_DWORD *)v5 + 2);
    }
  }
  else
  {
    v3 = 0;
  }
  std::__optional_destruct_base<WebCore::SimpleRange,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v6);
  return v3;
}

- (WKWebProcessPlugInFrame)mainFrame
{
  return *(WKWebProcessPlugInFrame **)(*(_QWORD *)&self->_anon_38[40] + 8);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_remoteObjectRegistry.m_ptr;
  self->_remoteObjectRegistry.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_destroyWeak(&self->_editingDelegate.m_weakReference);
  objc_destroyWeak(&self->_formDelegate.m_weakReference);
  objc_destroyWeak(&self->_loadDelegate.m_weakReference);
}

- (OpaqueWKBundlePage)_bundlePageRef
{
  return *(OpaqueWKBundlePage **)&self->_page.data.__lx[8];
}

- (WKBrowsingContextHandle)handle
{
  return (WKBrowsingContextHandle *)(id)CFMakeCollectable(-[WKBrowsingContextHandle _initWithPage:]([WKBrowsingContextHandle alloc], "_initWithPage:", &self->_page));
}

+ (id)lookUpBrowsingContextFromHandle:(id)a3
{
  id v3;
  uint64_t *v4;
  id result;
  id v6;
  uint64_t v7;

  v3 = a3;
  {
    v4 = (uint64_t *)WebKit::WebProcess::singleton(void)::process;
  }
  else
  {
    v6 = a3;
    v4 = (uint64_t *)WTF::fastMalloc((WTF *)0x330);
    WebKit::WebProcess::WebProcess((WebKit::WebProcess *)v4);
    v3 = v6;
    WebKit::WebProcess::singleton(void)::process = (uint64_t)v4;
  }
  v7 = objc_msgSend(v3, "_webPageID", v6);
  result = (id)WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<PAL::SessionID,std::unique_ptr<WebCore::NetworkStorageSession>,WTF::DefaultHash<PAL::SessionID>,WTF::HashTraits<PAL::SessionID>,WTF::HashTraits<std::unique_ptr<WebCore::NetworkStorageSession>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<PAL::SessionID>>,PAL::SessionID>(v4 + 14, &v7);
  if (result)
    return (id)*((_QWORD *)result + 1);
  return result;
}

- (WKWebProcessPlugInFormDelegatePrivate)_formDelegate
{
  return (WKWebProcessPlugInFormDelegatePrivate *)objc_loadWeak(&self->_formDelegate.m_weakReference);
}

- (WKWebProcessPlugInEditingDelegate)_editingDelegate
{
  return (WKWebProcessPlugInEditingDelegate *)objc_loadWeak(&self->_editingDelegate.m_weakReference);
}

- (BOOL)_defersLoading
{
  return 0;
}

- (BOOL)_usesNonPersistentWebsiteDataStore
{
  return WebKit::WebPage::usesEphemeralSession((WebKit::WebPage *)&self->_page);
}

@end
