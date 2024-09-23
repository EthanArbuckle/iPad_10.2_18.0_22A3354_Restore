@implementation WKWebViewConfiguration

- (void)_setAllowedNetworkHosts:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  WTF::StringImpl **v12;
  unint64_t v13;
  WTF::StringImpl *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  WTF *v19;
  _QWORD v20[2];
  WTF *v21;
  uint64_t v22;
  int v23;
  char v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v19 = 0;
    memset(v20, 0, 13);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(a3);
          MEMORY[0x19AEABCC8](&v14, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          WTF::RobinHoodHashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableSizePolicy>::add((uint64_t)&v19, &v14, v8, (uint64_t)&v21);
          v10 = v14;
          v14 = 0;
          if (v10)
          {
            if (*(_DWORD *)v10 == 2)
              WTF::StringImpl::destroy(v10, v9);
            else
              *(_DWORD *)v10 -= 2;
          }
        }
        v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
      }
      while (v5);
    }
    v21 = v19;
    v11 = v20[0];
    v19 = 0;
    memset(v20, 0, 13);
    v22 = v11;
    v23 = v20[1];
    v24 = BYTE4(v20[1]);
    v25 = 1;
    std::__optional_storage_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>>((uint64_t)&self[6]._pageConfiguration.data.__lx[16], (uint64_t *)&v21);
    if (v25)
    {
      if (v21)
        WTF::RobinHoodHashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableSizePolicy>::deallocateTable((WTF::StringImpl **)v21, (WTF::StringImpl *)v22);
    }
    v12 = (WTF::StringImpl **)v19;
    if (v19)
    {
      v13 = LODWORD(v20[0]);
LABEL_21:
      WTF::RobinHoodHashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableSizePolicy>::deallocateTable(v12, (WTF::StringImpl *)v13);
    }
  }
  else
  {
    LOBYTE(v21) = 0;
    v25 = 0;
    std::__optional_storage_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>>((uint64_t)&self[6]._pageConfiguration.data.__lx[16], (uint64_t *)&v21);
    if (v25)
    {
      v12 = (WTF::StringImpl **)v21;
      if (v21)
      {
        v13 = v22;
        goto LABEL_21;
      }
    }
  }
}

- (void)_setMaskedURLSchemes:(id)a3
{
  WTF::StringImpl *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  const WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl **v12;
  WTF::StringImpl **v13;
  WTF::StringImpl *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  WTF::StringImpl **v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(a3);
        MEMORY[0x19AEABCC8](&v16, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v21, &v16, v9, (uint64_t)&v15);
        v11 = v16;
        v16 = 0;
        if (v11)
        {
          if (*(_DWORD *)v11 == 2)
            WTF::StringImpl::destroy(v11, v10);
          else
            *(_DWORD *)v11 -= 2;
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v6);
    v12 = v21;
  }
  else
  {
    v12 = 0;
  }
  LOBYTE(self[6].super.isa) = 1;
  v21 = 0;
  v13 = *(WTF::StringImpl ***)&self[5]._pageConfiguration.data.__lx[40];
  *(_QWORD *)&self[5]._pageConfiguration.data.__lx[40] = v12;
  if (v13)
  {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v13, v5);
    if (v21)
      WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v21, v14);
  }
}

- (BOOL)_systemPreviewEnabled
{
  return self[3]._pageConfiguration.data.__lx[26];
}

- (WKWebView)_relatedWebView
{
  uint64_t v2;
  uint64_t v3;
  WKWebView *v4;
  CFTypeRef cf;

  v2 = *(_QWORD *)&self[2]._pageConfiguration.data.__lx[24];
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

- (BOOL)allowsInlineMediaPlayback
{
  return self[3]._pageConfiguration.data.__lx[16];
}

- (WKWebView)_webViewToCloneSessionStorageFrom
{
  uint64_t v2;
  uint64_t v3;
  WKWebView *v4;
  CFTypeRef cf;

  v2 = *(_QWORD *)&self[2]._pageConfiguration.data.__lx[40];
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

- (BOOL)_waitsForPaintAfterViewDidMoveToWindow
{
  return self[3]._pageConfiguration.data.__lx[29];
}

- (BOOL)_undoManagerAPIEnabled
{
  return self[8]._pageConfiguration.data.__lx[19];
}

- (BOOL)_shouldDeferAsynchronousScriptsUntilAfterDocumentLoad
{
  return self[8]._pageConfiguration.data.__lx[18];
}

- (BOOL)_shouldDecidePolicyBeforeLoadingQuickLookPreview
{
  return self[3]._pageConfiguration.data.__lx[27];
}

- (double)_sampledPageTopColorMinHeight
{
  return *(double *)&self[8].super.isa;
}

- (double)_sampledPageTopColorMaxDifference
{
  return *(double *)&self[7]._pageConfiguration.data.__lx[40];
}

- (BOOL)_respectsImageOrientation
{
  WKPreferences *v2;
  const WTF::StringImpl *v3;

  v2 = -[WKWebViewConfiguration preferences](self, "preferences");
  {
    WebKit::WebPreferencesKey::shouldRespectImageOrientationKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::shouldRespectImageOrientationKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::shouldRespectImageOrientationKey(void)::$_0::operator() const(void)::impl;
  }
  return WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)&v2->_preferences.data.__lx[40], (WTF::StringImpl **)&WebKit::WebPreferencesKey::shouldRespectImageOrientationKey(void)::key, v3);
}

- (BOOL)_needsStorageAccessFromFileURLsQuirk
{
  return self[8]._pageConfiguration.data.__lx[13];
}

- (BOOL)_mediaDataLoadsAutomatically
{
  return self[3]._pageConfiguration.data.__lx[19];
}

- (BOOL)_mainContentUserGestureOverrideEnabled
{
  return self[8]._pageConfiguration.data.__lx[20];
}

- (BOOL)_legacyEncryptedMediaAPIEnabled
{
  return self[8]._pageConfiguration.data.__lx[14];
}

- (BOOL)_isControlledByAutomation
{
  return self[3]._pageConfiguration.data.__lx[31];
}

- (BOOL)_invisibleAutoplayNotPermitted
{
  return self[8]._pageConfiguration.data.__lx[21];
}

- (BOOL)_inlineMediaPlaybackRequiresPlaysInlineAttribute
{
  return self[3]._pageConfiguration.data.__lx[17];
}

- (double)_incrementalRenderingSuppressionTimeout
{
  return *(double *)self[8]._pageConfiguration.data.__lx;
}

- (BOOL)_incompleteImageBorderEnabled
{
  return self[8]._pageConfiguration.data.__lx[17];
}

- (NSString)_groupIdentifier
{
  NSString *result;

  result = *(NSString **)&self[7]._pageConfiguration.data.__lx[8];
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (BOOL)_drawsBackground
{
  return self[3]._pageConfiguration.data.__lx[30];
}

- (BOOL)_convertsPositionStyleOnCopy
{
  return self[8]._pageConfiguration.data.__lx[9];
}

- (BOOL)_colorFilterEnabled
{
  return self[8]._pageConfiguration.data.__lx[16];
}

- (BOOL)_attachmentWideLayoutEnabled
{
  return self[8]._pageConfiguration.data.__lx[23];
}

- (BOOL)_attachmentElementEnabled
{
  return self[8]._pageConfiguration.data.__lx[22];
}

- (BOOL)_applePayEnabled
{
  return HIBYTE(self[7].super.isa);
}

- (BOOL)_appHighlightsEnabled
{
  return self[7]._pageConfiguration.data.__lx[0];
}

- (BOOL)_allowsMetaRefresh
{
  return self[8]._pageConfiguration.data.__lx[10];
}

- (BOOL)_allowsJavaScriptMarkup
{
  return self[8]._pageConfiguration.data.__lx[8];
}

- (BOOL)_allowsInlineMediaPlaybackAfterFullscreen
{
  return self[3]._pageConfiguration.data.__lx[18];
}

- (BOOL)_allowUniversalAccessFromFileURLs
{
  return self[8]._pageConfiguration.data.__lx[11];
}

- (BOOL)_allowTopNavigationToDataURLs
{
  return self[8]._pageConfiguration.data.__lx[12];
}

- (BOOL)_allowMediaContentTypesRequiringHardwareSupportAsFallback
{
  return self[8]._pageConfiguration.data.__lx[15];
}

- (NSArray)_additionalSupportedImageTypes
{
  CFTypeRef v2;
  NSArray *v3;
  CFTypeRef v4;
  CFTypeRef cf;

  if (!self[4]._pageConfiguration.data.__lx[40])
    return 0;
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)&self[4]._pageConfiguration.data.__lx[24], (uint64_t *)&cf);
  v2 = cf;
  cf = 0;
  v3 = (id)CFMakeCollectable(v2);
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
  return v3;
}

- (BOOL)suppressesIncrementalRendering
{
  return BYTE4(self[7].super.isa);
}

- (WKAudiovisualMediaTypes)mediaTypesRequiringUserActionForPlayback
{
  return *(_QWORD *)self[5]._pageConfiguration.data.__lx;
}

- (WKDataDetectorTypes)dataDetectorTypes
{
  return self[3]._pageConfiguration.data.__lx[21] & 0x7F;
}

- (BOOL)allowsPictureInPictureMediaPlayback
{
  return self[3]._pageConfiguration.data.__lx[23];
}

- (BOOL)allowsAirPlayForMediaPlayback
{
  return BYTE6(self[7].super.isa);
}

- (_WKWebExtensionController)_weakWebExtensionController
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)&self[2]._pageConfiguration.data.__lx[8];
  if (v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0)
    return *(_WKWebExtensionController **)(v3 - 8);
  else
    return 0;
}

- (_WKWebExtensionController)_strongWebExtensionController
{
  uint64_t v2;

  v2 = *(_QWORD *)self[2]._pageConfiguration.data.__lx;
  if (v2)
    return *(_WKWebExtensionController **)(v2 + 8);
  else
    return 0;
}

- (BOOL)limitsNavigationsToAppBoundDomains
{
  return BYTE1(self[7].super.isa);
}

- (BOOL)_printsBackgrounds
{
  return -[WKPreferences shouldPrintBackgrounds](-[WKWebViewConfiguration preferences](self, "preferences"), "shouldPrintBackgrounds");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  API::PageConfiguration::Data::operator=((uint64_t)v4 + 24, (uint64_t)&self->_pageConfiguration.data.__lx[16]);
  return v4;
}

- (WKPreferences)preferences
{
  return (WKPreferences *)*((_QWORD *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)&self->_pageConfiguration.data.__lx[40])
                          + 1);
}

- (WKWebsiteDataStore)_websiteDataStoreIfExists
{
  uint64_t v2;

  v2 = *(_QWORD *)&self[1]._pageConfiguration.data.__lx[8];
  if (v2)
    return *(WKWebsiteDataStore **)(v2 + 8);
  else
    return 0;
}

- (WKWebpagePreferences)defaultWebpagePreferences
{
  return (WKWebpagePreferences *)*((_QWORD *)API::PageConfiguration::Data::LazyInitializedRef<API::WebsitePolicies,&API::PageConfiguration::Data::createWebsitePolicies>::get((API::WebsitePolicies **)&self[1]._pageConfiguration)
                                 + 1);
}

- (WKUserContentController)userContentController
{
  return (WKUserContentController *)*((_QWORD *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebUserContentControllerProxy,&API::PageConfiguration::Data::createWebUserContentControllerProxy>::get((WebKit::WebUserContentControllerProxy **)&self->_pageConfiguration.data.__lx[32])
                                    + 1);
}

- (WKProcessPool)processPool
{
  return (WKProcessPool *)*((_QWORD *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((WebKit::WebProcessPool **)&self->_pageConfiguration.data.__lx[24])
                          + 1);
}

- (_WKVisitedLinkStore)_visitedLinkStore
{
  return (_WKVisitedLinkStore *)*((_QWORD *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::VisitedLinkStore,&API::PageConfiguration::Data::createVisitedLinkStore>::get(&self[1].super.isa)
                                + 1);
}

- (NSString)_mediaContentTypesRequiringHardwareSupport
{
  if (*(_QWORD *)&self[7]._pageConfiguration.data.__lx[16])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (WKWebViewConfiguration)init
{
  WKWebViewConfiguration *v2;
  WKWebViewConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKWebViewConfiguration;
  v2 = -[WKWebViewConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
    *((_QWORD *)API::PageConfiguration::PageConfiguration((API::PageConfiguration *)-[WKWebViewConfiguration _apiObject](v2, "_apiObject"))+ 1) = v2;
  return v3;
}

- (void)setProcessPool:(WKProcessPool *)processPool
{
  ObjectStorage<WebKit::WebProcessPool> *p_processPool;
  uint64_t v5;

  if (processPool)
  {
    p_processPool = &processPool->_processPool;
    CFRetain(*(CFTypeRef *)&processPool->_processPool.data.__lx[8]);
  }
  else
  {
    p_processPool = 0;
  }
  v5 = *(_QWORD *)&self->_pageConfiguration.data.__lx[24];
  *(_QWORD *)&self->_pageConfiguration.data.__lx[24] = p_processPool;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (void)setUserContentController:(WKUserContentController *)userContentController
{
  ObjectStorage<WebKit::WebUserContentControllerProxy> *p_userContentControllerProxy;
  uint64_t v5;

  if (userContentController)
  {
    p_userContentControllerProxy = &userContentController->_userContentControllerProxy;
    CFRetain(*(CFTypeRef *)&userContentController->_userContentControllerProxy.data.__lx[8]);
  }
  else
  {
    p_userContentControllerProxy = 0;
  }
  v5 = *(_QWORD *)&self->_pageConfiguration.data.__lx[32];
  *(_QWORD *)&self->_pageConfiguration.data.__lx[32] = p_userContentControllerProxy;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (void)_setRelatedWebView:(id)a3
{
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  if (!a3)
  {
    v7 = *(unsigned int **)&self[2]._pageConfiguration.data.__lx[24];
    *(_QWORD *)&self[2]._pageConfiguration.data.__lx[24] = 0;
    if (!v7)
      return;
    do
    {
      v8 = __ldaxr(v7);
      v9 = --v8 == 0;
    }
    while (__stlxr(v8, v7));
    goto LABEL_12;
  }
  v4 = *((_QWORD *)a3 + 53);
  if (v4)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v4 + 24), v4 + 16);
    v5 = *(unsigned int **)(v4 + 24);
    if (v5)
    {
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 + 1, v5));
    }
  }
  else
  {
    v5 = 0;
  }
  v7 = *(unsigned int **)&self[2]._pageConfiguration.data.__lx[24];
  *(_QWORD *)&self[2]._pageConfiguration.data.__lx[24] = v5;
  if (v7)
  {
    do
    {
      v10 = __ldaxr(v7);
      v9 = --v10 == 0;
    }
    while (__stlxr(v10, v7));
LABEL_12:
    if (v9)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, (void *)a2);
    }
  }
}

- (void)setWebsiteDataStore:(WKWebsiteDataStore *)websiteDataStore
{
  ObjectStorage<WebKit::WebsiteDataStore> *p_websiteDataStore;
  uint64_t v5;

  if (websiteDataStore)
  {
    p_websiteDataStore = &websiteDataStore->_websiteDataStore;
    CFRetain(*(CFTypeRef *)&websiteDataStore->_websiteDataStore.data.__lx[8]);
  }
  else
  {
    p_websiteDataStore = 0;
  }
  v5 = *(_QWORD *)&self[1]._pageConfiguration.data.__lx[8];
  *(_QWORD *)&self[1]._pageConfiguration.data.__lx[8] = p_websiteDataStore;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (void)setPreferences:(WKPreferences *)preferences
{
  ObjectStorage<WebKit::WebPreferences> *p_preferences;
  uint64_t v5;

  if (preferences)
  {
    p_preferences = &preferences->_preferences;
    CFRetain(*(CFTypeRef *)&preferences->_preferences.data.__lx[8]);
  }
  else
  {
    p_preferences = 0;
  }
  v5 = *(_QWORD *)&self->_pageConfiguration.data.__lx[40];
  *(_QWORD *)&self->_pageConfiguration.data.__lx[40] = p_preferences;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (void)_setVisitedLinkStore:(id)a3
{
  objc_class *v4;
  Class isa;

  if (a3)
  {
    v4 = (objc_class *)((char *)a3 + 8);
    CFRetain(*((CFTypeRef *)a3 + 2));
  }
  else
  {
    v4 = 0;
  }
  isa = self[1].super.isa;
  self[1].super.isa = v4;
  if (isa)
    CFRelease(*((CFTypeRef *)isa + 1));
}

- (NSURL)_requiredWebExtensionBaseURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (void)_setWebViewToCloneSessionStorageFrom:(id)a3
{
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  if (!a3)
  {
    v7 = *(unsigned int **)&self[2]._pageConfiguration.data.__lx[40];
    *(_QWORD *)&self[2]._pageConfiguration.data.__lx[40] = 0;
    if (!v7)
      return;
    do
    {
      v8 = __ldaxr(v7);
      v9 = --v8 == 0;
    }
    while (__stlxr(v8, v7));
    goto LABEL_12;
  }
  v4 = *((_QWORD *)a3 + 53);
  if (v4)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v4 + 24), v4 + 16);
    v5 = *(unsigned int **)(v4 + 24);
    if (v5)
    {
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 + 1, v5));
    }
  }
  else
  {
    v5 = 0;
  }
  v7 = *(unsigned int **)&self[2]._pageConfiguration.data.__lx[40];
  *(_QWORD *)&self[2]._pageConfiguration.data.__lx[40] = v5;
  if (v7)
  {
    do
    {
      v10 = __ldaxr(v7);
      v9 = --v10 == 0;
    }
    while (__stlxr(v10, v7));
LABEL_12:
    if (v9)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, (void *)a2);
    }
  }
}

- (void)_setAlternateWebViewForNavigationGestures:(id)a3
{
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int *isa;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  if (!a3)
  {
    isa = (unsigned int *)self[3].super.isa;
    self[3].super.isa = 0;
    if (!isa)
      return;
    do
    {
      v8 = __ldaxr(isa);
      v9 = --v8 == 0;
    }
    while (__stlxr(v8, isa));
    goto LABEL_12;
  }
  v4 = *((_QWORD *)a3 + 53);
  if (v4)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v4 + 24), v4 + 16);
    v5 = *(unsigned int **)(v4 + 24);
    if (v5)
    {
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 + 1, v5));
    }
  }
  else
  {
    v5 = 0;
  }
  isa = (unsigned int *)self[3].super.isa;
  self[3].super.isa = (Class)v5;
  if (isa)
  {
    do
    {
      v10 = __ldaxr(isa);
      v9 = --v10 == 0;
    }
    while (__stlxr(v10, isa));
LABEL_12:
    if (v9)
    {
      atomic_store(1u, isa);
      WTF::fastFree((WTF *)isa, (void *)a2);
    }
  }
}

- (void)setDefaultWebpagePreferences:(WKWebpagePreferences *)defaultWebpagePreferences
{
  ObjectStorage<API::WebsitePolicies> *p_websitePolicies;
  uint64_t v5;

  if (defaultWebpagePreferences)
  {
    p_websitePolicies = &defaultWebpagePreferences->_websitePolicies;
    CFRetain(*(CFTypeRef *)&defaultWebpagePreferences->_websitePolicies.data.__lx[8]);
  }
  else
  {
    p_websitePolicies = 0;
  }
  v5 = *(_QWORD *)self[1]._pageConfiguration.data.__lx;
  *(_QWORD *)self[1]._pageConfiguration.data.__lx = p_websitePolicies;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (void)_setRequiredWebExtensionBaseURL:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6[5];

  MEMORY[0x19AEABB18](v6, a3);
  WTF::URL::operator=((uint64_t)&self[1]._pageConfiguration.data.__lx[16], (WTF::StringImpl *)v6);
  v5 = v6[0];
  v6[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (WKWebsiteDataStore)websiteDataStore
{
  return (WKWebsiteDataStore *)*((_QWORD *)API::PageConfiguration::websiteDataStore((API::PageConfiguration *)&self->_pageConfiguration)
                               + 1);
}

- (BOOL)ignoresViewportScaleLimits
{
  return BYTE5(self[7].super.isa);
}

- (NSString)applicationNameForUserAgent
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  if (self[7]._pageConfiguration.data.__lx[32])
  {
    v2 = *(WTF::StringImpl **)&self[7]._pageConfiguration.data.__lx[24];
    if (v2)
      *(_DWORD *)v2 += 2;
    v7 = v2;
    if (v2)
      goto LABEL_5;
    return 0;
  }
  MEMORY[0x19AEABCC8](&v7, CFSTR("Mobile/15E148"));
  if (!v7)
    return 0;
LABEL_5:
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (NSString)_applicationNameForDesktopUserAgent
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  if (!self[7]._pageConfiguration.data.__lx[32])
    return 0;
  v2 = *(WTF::StringImpl **)&self[7]._pageConfiguration.data.__lx[24];
  if (!v2)
    return 0;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (void)setAllowsInlineMediaPlayback:(BOOL)allowsInlineMediaPlayback
{
  self[3]._pageConfiguration.data.__lx[16] = allowsInlineMediaPlayback;
}

- (void)setURLSchemeHandler:(id)urlSchemeHandler forURLScheme:(NSString *)urlScheme
{
  _BOOL4 v7;
  _QWORD *v8;
  WTF::StringImpl *v9;
  const WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  uint64_t *v12;
  WTF *v13;
  int v14;
  WTF::StringImpl *v15;
  _DWORD *v16;
  WTF::StringImpl *v17;
  uint64_t v18;
  uint64_t v19;
  WTF::StringImpl *v20;
  char v21;
  WTF::StringImpl *v22[3];

  v7 = +[WKWebView handlesURLScheme:](WKWebView, "handlesURLScheme:", urlScheme);
  v8 = (_QWORD *)MEMORY[0x1E0C99778];
  if (v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("'%@' is a URL scheme that WKWebView handles natively"), urlScheme);
  MEMORY[0x19AEABCC8](v22, urlScheme);
  WTF::URLParser::maybeCanonicalizeScheme();
  v11 = v22[0];
  v22[0] = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v9);
    else
      *(_DWORD *)v11 -= 2;
  }
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v8, CFSTR("'%@' is not a valid URL scheme"), urlScheme);
LABEL_25:
    __break(1u);
    return;
  }
  v12 = (uint64_t *)&self[5]._pageConfiguration.data.__lx[16];
  v13 = WTF::HashMap<WTF::String,WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(v12, &v20, v10);
  if (v13)
  {
    v14 = *((_DWORD *)v13 + 2);
    *((_DWORD *)v13 + 2) = v14 + 1;
    if (v14)
      *((_DWORD *)v13 + 2) = v14;
    else
      (*(void (**)(WTF *))(*(_QWORD *)v13 + 8))(v13);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v8, CFSTR("URL scheme '%@' already has a registered URL scheme handler"), urlScheme);
  }
  WebKit::WebURLSchemeHandlerCocoa::create(urlSchemeHandler, &v18);
  v19 = v18;
  if (!v21)
    goto LABEL_25;
  WTF::HashMap<WTF::String,WTF::Ref<WebKit::WebURLSchemeHandler,WTF::RawPtrTraits<WebKit::WebURLSchemeHandler>,WTF::DefaultRefDerefTraits<WebKit::WebURLSchemeHandler>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WebKit::WebURLSchemeHandler,WTF::RawPtrTraits<WebKit::WebURLSchemeHandler>,WTF::DefaultRefDerefTraits<WebKit::WebURLSchemeHandler>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WebKit::WebURLSchemeHandler,WTF::RawPtrTraits<WebKit::WebURLSchemeHandler>,WTF::DefaultRefDerefTraits<WebKit::WebURLSchemeHandler>>>(v12, &v20, (const WTF::StringImpl *)&v19, (uint64_t)v22);
  v16 = (_DWORD *)v19;
  v19 = 0;
  if (v16)
  {
    if (v16[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v16 + 8))(v16);
    else
      --v16[2];
  }
  if (v21)
  {
    v17 = v20;
    v20 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v15);
      else
        *(_DWORD *)v17 -= 2;
    }
  }
}

- (_UIClickInteractionDriving)_clickInteractionDriverForTesting
{
  return *(_UIClickInteractionDriving **)&self[3]._pageConfiguration.data.__lx[8];
}

- (void)_setWaitsForPaintAfterViewDidMoveToWindow:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[29] = a3;
}

- (void)_setMarkedTextInputEnabled:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[24] = a3;
}

- (void)_setColorFilterEnabled:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[16] = a3;
}

- (void)_setAttachmentWideLayoutEnabled:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[23] = a3;
}

- (void)_setAttachmentElementEnabled:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[22] = a3;
}

- (void)_setAllowsMetaRefresh:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[10] = a3;
}

- (void)_setAllowsJavaScriptMarkup:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[8] = a3;
}

- (void)setSelectionGranularity:(WKSelectionGranularity)selectionGranularity
{
  self[3]._pageConfiguration.data.__lx[22] = selectionGranularity == WKSelectionGranularityCharacter;
}

- (void)setDataDetectorTypes:(WKDataDetectorTypes)dataDetectorTypes
{
  self[3]._pageConfiguration.data.__lx[21] = dataDetectorTypes & 0x7F;
}

- (void)_setDelaysWebProcessLaunchUntilFirstLoad:(BOOL)a3
{
  API::PageConfiguration::setDelaysWebProcessLaunchUntilFirstLoad((API::PageConfiguration *)&self->_pageConfiguration, a3);
}

- (void)_setSystemPreviewEnabled:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[26] = a3;
}

- (void)_setSampledPageTopColorMinHeight:(double)a3
{
  *(double *)&self[8].super.isa = a3;
}

- (void)_setSampledPageTopColorMaxDifference:(double)a3
{
  *(double *)&self[7]._pageConfiguration.data.__lx[40] = a3;
}

- (void)_setNeedsStorageAccessFromFileURLsQuirk:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[13] = a3;
}

- (void)_setMediaDataLoadsAutomatically:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[19] = a3;
}

- (void)_setMainContentUserGestureOverrideEnabled:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[20] = a3;
}

- (void)_setLegacyEncryptedMediaAPIEnabled:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[14] = a3;
}

- (void)_setInvisibleAutoplayNotPermitted:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[21] = a3;
}

- (void)_setInlineMediaPlaybackRequiresPlaysInlineAttribute:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[17] = a3;
}

- (void)_setDrawsBackground:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[30] = a3;
}

- (void)_setDragLiftDelay:(unint64_t)a3
{
  unsigned __int8 v3;

  v3 = 2 * (a3 == 2);
  if (a3 == 1)
    v3 = 1;
  self[3]._pageConfiguration.data.__lx[20] = v3;
}

- (void)_setControlledByAutomation:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[31] = a3;
}

- (void)_setApplePayEnabled:(BOOL)a3
{
  HIBYTE(self[7].super.isa) = a3;
}

- (void)_setAppHighlightsEnabled:(BOOL)a3
{
  self[7]._pageConfiguration.data.__lx[0] = a3;
}

- (void)setMediaTypesRequiringUserActionForPlayback:(WKAudiovisualMediaTypes)mediaTypesRequiringUserActionForPlayback
{
  *(_QWORD *)self[5]._pageConfiguration.data.__lx = mediaTypesRequiringUserActionForPlayback;
}

- (void)setIgnoresViewportScaleLimits:(BOOL)ignoresViewportScaleLimits
{
  BYTE5(self[7].super.isa) = ignoresViewportScaleLimits;
}

- (void)_setDeferrableUserScriptsShouldWaitUntilNotification:(BOOL)a3
{
  BYTE1(self[6].super.isa) = a3;
}

- (BOOL)_textInteractionGesturesEnabled
{
  return self[3]._pageConfiguration.data.__lx[24];
}

- (BOOL)allowsInlinePredictions
{
  return self[8]._pageConfiguration.data.__lx[24];
}

- (void)_setAdditionalSupportedImageTypes:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9[2];
  char v10;

  if (a3)
  {
    WTF::makeVector<WTF::String>(a3, (uint64_t)&v7);
    v9[0] = v7;
    v4 = v8;
    v7 = 0;
    v8 = 0;
    v9[1] = v4;
    v10 = 1;
    std::__optional_storage_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>>((WTF *)&self[4]._pageConfiguration.data.__lx[24], v9);
    if (v10)
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v9, v5);
    v6 = &v7;
  }
  else
  {
    LOBYTE(v9[0]) = 0;
    v10 = 0;
    std::__optional_storage_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>>((WTF *)&self[4]._pageConfiguration.data.__lx[24], v9);
    if (!v10)
      return;
    v6 = v9;
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v6, v5);
}

- (void)setApplicationNameForUserAgent:(NSString *)applicationNameForUserAgent
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  char v7;

  MEMORY[0x19AEABCC8](&v6, applicationNameForUserAgent);
  v7 = 1;
  std::__optional_storage_base<WTF::String,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::String,false>>((uint64_t)&self[7]._pageConfiguration.data.__lx[24], (uint64_t)&v6);
  if (v7)
  {
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
}

- (WKWebView)_alternateWebViewForNavigationGestures
{
  Class isa;
  uint64_t v3;
  WKWebView *v4;
  CFTypeRef cf;

  isa = self[3].super.isa;
  if (!isa)
    return 0;
  v3 = *((_QWORD *)isa + 1);
  if (!v3)
    return 0;
  CFRetain(*(CFTypeRef *)(v3 - 8));
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  v4 = (id)CFMakeCollectable(cf);
  CFRelease(*(CFTypeRef *)(v3 - 8));
  return v4;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKWebViewConfiguration accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWebViewConfiguration accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)dealloc
{
  objc_class *v3;
  WTF::StringImpl *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    *(_QWORD *)self->_pageConfiguration.data.__lx = &off_1E34DA000;
    API::PageConfiguration::Data::~Data((API::PageConfiguration::Data *)&self->_pageConfiguration.data.__lx[16], v4);
    v5.receiver = self;
    v5.super_class = (Class)WKWebViewConfiguration;
    -[WKWebViewConfiguration dealloc](&v5, sel_dealloc);
  }
}

- (void)setAllowsInlinePredictions:(BOOL)allowsInlinePredictions
{
  self[8]._pageConfiguration.data.__lx[24] = allowsInlinePredictions;
}

- (WKSelectionGranularity)selectionGranularity
{
  return (unint64_t)self[3]._pageConfiguration.data.__lx[22];
}

- (void)setAllowsPictureInPictureMediaPlayback:(BOOL)allowsPictureInPictureMediaPlayback
{
  self[3]._pageConfiguration.data.__lx[23] = allowsPictureInPictureMediaPlayback;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; processPool = %@; preferences = %@>"),
                       NSStringFromClass(v4),
                       self,
                       -[WKWebViewConfiguration processPool](self, "processPool"),
                       -[WKWebViewConfiguration preferences](self, "preferences"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const __CFString *v5;

  objc_msgSend(a3, "encodeObject:forKey:", -[WKWebViewConfiguration processPool](self, "processPool"), CFSTR("processPool"));
  objc_msgSend(a3, "encodeObject:forKey:", -[WKWebViewConfiguration preferences](self, "preferences"), CFSTR("preferences"));
  objc_msgSend(a3, "encodeObject:forKey:", -[WKWebViewConfiguration userContentController](self, "userContentController"), CFSTR("userContentController"));
  objc_msgSend(a3, "encodeObject:forKey:", -[WKWebViewConfiguration websiteDataStore](self, "websiteDataStore"), CFSTR("websiteDataStore"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration suppressesIncrementalRendering](self, "suppressesIncrementalRendering"), CFSTR("suppressesIncrementalRendering"));
  if (self[7]._pageConfiguration.data.__lx[32])
  {
    if (*(_QWORD *)&self[7]._pageConfiguration.data.__lx[24])
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v5 = &stru_1E351F1B8;
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("applicationNameForUserAgent"));
  }
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration allowsAirPlayForMediaPlayback](self, "allowsAirPlayForMediaPlayback"), CFSTR("allowsAirPlayForMediaPlayback"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _drawsBackground](self, "_drawsBackground"), CFSTR("drawsBackground"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[WKWebViewConfiguration dataDetectorTypes](self, "dataDetectorTypes"), CFSTR("dataDetectorTypes"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration allowsInlineMediaPlayback](self, "allowsInlineMediaPlayback"), CFSTR("allowsInlineMediaPlayback"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _allowsInlineMediaPlaybackAfterFullscreen](self, "_allowsInlineMediaPlaybackAfterFullscreen"), CFSTR("allowsInlineMediaPlaybackAfterFullscreen"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration mediaTypesRequiringUserActionForPlayback](self, "mediaTypesRequiringUserActionForPlayback") != 0, CFSTR("mediaTypesRequiringUserActionForPlayback"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[WKWebViewConfiguration selectionGranularity](self, "selectionGranularity"), CFSTR("selectionGranularity"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration allowsPictureInPictureMediaPlayback](self, "allowsPictureInPictureMediaPlayback"), CFSTR("allowsPictureInPictureMediaPlayback"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration ignoresViewportScaleLimits](self, "ignoresViewportScaleLimits"), CFSTR("ignoresViewportScaleLimits"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[WKWebViewConfiguration _dragLiftDelay](self, "_dragLiftDelay"), CFSTR("dragLiftDelay"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _textInteractionGesturesEnabled](self, "_textInteractionGesturesEnabled"), CFSTR("textInteractionGesturesEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _longPressActionsEnabled](self, "_longPressActionsEnabled"), CFSTR("longPressActionsEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _systemPreviewEnabled](self, "_systemPreviewEnabled"), CFSTR("systemPreviewEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _shouldDecidePolicyBeforeLoadingQuickLookPreview](self, "_shouldDecidePolicyBeforeLoadingQuickLookPreview"), CFSTR("shouldDecidePolicyBeforeLoadingQuickLookPreview"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _scrollToTextFragmentIndicatorEnabled](self, "_scrollToTextFragmentIndicatorEnabled"), CFSTR("scrollToTextFragmentIndicatorEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _scrollToTextFragmentMarkingEnabled](self, "_scrollToTextFragmentMarkingEnabled"), CFSTR("scrollToTextFragmentMarkingEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebViewConfiguration _multiRepresentationHEICInsertionEnabled](self, "_multiRepresentationHEICInsertionEnabled"), CFSTR("multiRepresentationHEICInsertionEnabled"));
}

- (WKWebViewConfiguration)initWithCoder:(id)a3
{
  WKWebViewConfiguration *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = -[WKWebViewConfiguration init](self, "init");
  if (v4)
  {
    -[WKWebViewConfiguration setProcessPool:](v4, "setProcessPool:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processPool")));
    -[WKWebViewConfiguration setPreferences:](v4, "setPreferences:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferences")));
    -[WKWebViewConfiguration setUserContentController:](v4, "setUserContentController:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userContentController")));
    -[WKWebViewConfiguration setWebsiteDataStore:](v4, "setWebsiteDataStore:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("websiteDataStore")));
    -[WKWebViewConfiguration setSuppressesIncrementalRendering:](v4, "setSuppressesIncrementalRendering:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("suppressesIncrementalRendering")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("applicationNameForUserAgent")))
      -[WKWebViewConfiguration setApplicationNameForUserAgent:](v4, "setApplicationNameForUserAgent:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationNameForUserAgent")));
    -[WKWebViewConfiguration setAllowsAirPlayForMediaPlayback:](v4, "setAllowsAirPlayForMediaPlayback:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsAirPlayForMediaPlayback")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("drawsBackground")))
      -[WKWebViewConfiguration _setDrawsBackground:](v4, "_setDrawsBackground:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("drawsBackground")));
    -[WKWebViewConfiguration setDataDetectorTypes:](v4, "setDataDetectorTypes:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("dataDetectorTypes")));
    -[WKWebViewConfiguration setAllowsInlineMediaPlayback:](v4, "setAllowsInlineMediaPlayback:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsInlineMediaPlayback")));
    -[WKWebViewConfiguration _setAllowsInlineMediaPlaybackAfterFullscreen:](v4, "_setAllowsInlineMediaPlaybackAfterFullscreen:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsInlineMediaPlaybackAfterFullscreen")));
    -[WKWebViewConfiguration setMediaTypesRequiringUserActionForPlayback:](v4, "setMediaTypesRequiringUserActionForPlayback:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("mediaTypesRequiringUserActionForPlayback")));
    v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("selectionGranularity"));
    if (v5 <= 1)
      -[WKWebViewConfiguration setSelectionGranularity:](v4, "setSelectionGranularity:", v5);
    -[WKWebViewConfiguration setAllowsPictureInPictureMediaPlayback:](v4, "setAllowsPictureInPictureMediaPlayback:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsPictureInPictureMediaPlayback")));
    -[WKWebViewConfiguration setIgnoresViewportScaleLimits:](v4, "setIgnoresViewportScaleLimits:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("ignoresViewportScaleLimits")));
    v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("dragLiftDelay"));
    if (v6 == 1)
      v7 = 1;
    else
      v7 = 2 * (v6 == 2);
    -[WKWebViewConfiguration _setDragLiftDelay:](v4, "_setDragLiftDelay:", v7);
    -[WKWebViewConfiguration _setTextInteractionGesturesEnabled:](v4, "_setTextInteractionGesturesEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("textInteractionGesturesEnabled")));
    -[WKWebViewConfiguration _setLongPressActionsEnabled:](v4, "_setLongPressActionsEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("longPressActionsEnabled")));
    -[WKWebViewConfiguration _setSystemPreviewEnabled:](v4, "_setSystemPreviewEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("systemPreviewEnabled")));
    -[WKWebViewConfiguration _setShouldDecidePolicyBeforeLoadingQuickLookPreview:](v4, "_setShouldDecidePolicyBeforeLoadingQuickLookPreview:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("shouldDecidePolicyBeforeLoadingQuickLookPreview")));
    -[WKWebViewConfiguration _setScrollToTextFragmentIndicatorEnabled:](v4, "_setScrollToTextFragmentIndicatorEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("scrollToTextFragmentIndicatorEnabled")));
    -[WKWebViewConfiguration _setScrollToTextFragmentMarkingEnabled:](v4, "_setScrollToTextFragmentMarkingEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("scrollToTextFragmentMarkingEnabled")));
    -[WKWebViewConfiguration _setMultiRepresentationHEICInsertionEnabled:](v4, "_setMultiRepresentationHEICInsertionEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("multiRepresentationHEICInsertionEnabled")));
  }
  return v4;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (((objc_msgSend(a4, "isEqualToString:", CFSTR("allowUniversalAccessFromFileURLs")) & 1) != 0
     || objc_msgSend(a4, "isEqualToString:", CFSTR("_allowUniversalAccessFromFileURLs")))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    v7 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = a4;
    }
    -[WKWebViewConfiguration _setAllowUniversalAccessFromFileURLs:](self, "_setAllowUniversalAccessFromFileURLs:", objc_msgSend(a3, "BOOLValue"));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WKWebViewConfiguration;
    -[WKWebViewConfiguration setValue:forKey:](&v8, sel_setValue_forKey_, a3, a4);
  }
}

- (id)valueForKey:(id)a3
{
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (((objc_msgSend(a3, "isEqualToString:", CFSTR("allowUniversalAccessFromFileURLs")) & 1) != 0
     || objc_msgSend(a3, "isEqualToString:", CFSTR("_allowUniversalAccessFromFileURLs")))
    && (WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    v6 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = a3;
    }
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WKWebViewConfiguration _allowUniversalAccessFromFileURLs](self, "_allowUniversalAccessFromFileURLs"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WKWebViewConfiguration;
    return -[WKWebViewConfiguration valueForKey:](&v7, sel_valueForKey_, a3);
  }
}

- (_WKWebExtensionController)_webExtensionController
{
  _WKWebExtensionController *result;

  result = -[WKWebViewConfiguration _weakWebExtensionController](self, "_weakWebExtensionController");
  if (!result)
    return -[WKWebViewConfiguration _strongWebExtensionController](self, "_strongWebExtensionController");
  return result;
}

- (void)_setWebExtensionController:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = objc_msgSend(a3, "_webExtensionController");
    CFRetain(*(CFTypeRef *)(v4 + 8));
  }
  else
  {
    v4 = 0;
  }
  v5 = *(_QWORD *)self[2]._pageConfiguration.data.__lx;
  *(_QWORD *)self[2]._pageConfiguration.data.__lx = v4;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (void)_setWeakWebExtensionController:(id)a3
{
  WebKit::WebExtensionController *v4;

  if (a3)
    v4 = (WebKit::WebExtensionController *)objc_msgSend(a3, "_webExtensionController");
  else
    v4 = 0;
  API::PageConfiguration::setWeakWebExtensionController((API::PageConfiguration *)&self->_pageConfiguration, v4);
}

- (BOOL)upgradeKnownHostsToHTTPS
{
  return BYTE3(self[7].super.isa);
}

- (void)setUpgradeKnownHostsToHTTPS:(BOOL)upgradeKnownHostsToHTTPS
{
  BYTE3(self[7].super.isa) = upgradeKnownHostsToHTTPS;
}

- (void)setSuppressesIncrementalRendering:(BOOL)suppressesIncrementalRendering
{
  BYTE4(self[7].super.isa) = suppressesIncrementalRendering;
}

- (void)setAllowsAirPlayForMediaPlayback:(BOOL)allowsAirPlayForMediaPlayback
{
  BYTE6(self[7].super.isa) = allowsAirPlayForMediaPlayback;
}

- (id)urlSchemeHandlerForURLScheme:(NSString *)urlScheme
{
  WTF::StringImpl *v4;
  const WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF *v7;
  WTF::StringImpl *v8;
  WTF *v9;
  void *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  char v15;

  MEMORY[0x19AEABCC8](&v13, urlScheme);
  WTF::URLParser::maybeCanonicalizeScheme();
  v6 = v13;
  v13 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
  if (!v15)
    return 0;
  v7 = WTF::HashMap<WTF::String,WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::ObjectIdentifierGeneric<WebCore::FileSystemHandleIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>((uint64_t *)&self[5]._pageConfiguration.data.__lx[16], &v14, v5);
  if (v7)
  {
    v9 = v7;
    ++*((_DWORD *)v7 + 2);
    if (((*(uint64_t (**)(WTF *))(*(_QWORD *)v7 + 16))(v7) & 1) != 0)
      v10 = (void *)*((_QWORD *)v9 + 6);
    else
      v10 = 0;
    if (*((_DWORD *)v9 + 2) == 1)
      (*(void (**)(WTF *))(*(_QWORD *)v9 + 8))(v9);
    else
      --*((_DWORD *)v9 + 2);
  }
  else
  {
    v10 = 0;
  }
  if (v15)
  {
    v11 = v14;
    v14 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy(v11, v8);
      else
        *(_DWORD *)v11 -= 2;
    }
  }
  return v10;
}

- (void)setLimitsNavigationsToAppBoundDomains:(BOOL)limitsNavigationsToAppBoundDomains
{
  BYTE1(self[7].super.isa) = limitsNavigationsToAppBoundDomains;
}

- (void)setWritingToolsBehavior:(int64_t)a3
{
  unsigned int v3;

  v3 = 0x20301u >> (8 * a3);
  if ((unint64_t)a3 >= 3)
    LOBYTE(v3) = 0;
  self[8]._pageConfiguration.data.__lx[27] = v3;
}

- (int64_t)writingToolsBehavior
{
  unsigned int v2;

  v2 = self[8]._pageConfiguration.data.__lx[27] - 1;
  if (v2 > 2)
    return -1;
  else
    return qword_1978CF658[(char)v2];
}

- (Object)_apiObject
{
  return (Object *)&self->_pageConfiguration;
}

- (void)_setGroupIdentifier:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)&self[7]._pageConfiguration.data.__lx[8];
  *(_QWORD *)&self[7]._pageConfiguration.data.__lx[8] = v5;
  if (v6)
  {
    v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6)
        return;
      v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (void)_setRespectsImageOrientation:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  WebKit::WebPreferences::setShouldRespectImageOrientation((WebKit::WebPreferences *)(-[WKWebViewConfiguration preferences](self, "preferences") + 8), &v3);
}

- (void)_setPrintsBackgrounds:(BOOL)a3
{
  -[WKPreferences setShouldPrintBackgrounds:](-[WKWebViewConfiguration preferences](self, "preferences"), "setShouldPrintBackgrounds:", a3);
}

- (void)_setIncrementalRenderingSuppressionTimeout:(double)a3
{
  *(double *)self[8]._pageConfiguration.data.__lx = a3;
}

- (void)_setAllowUniversalAccessFromFileURLs:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[11] = a3;
}

- (void)_setAllowTopNavigationToDataURLs:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[12] = a3;
}

- (void)_setConvertsPositionStyleOnCopy:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[9] = a3;
}

- (BOOL)_clientNavigationsRunAtForegroundPriority
{
  return (BOOL)self[5].super.isa;
}

- (void)_setClientNavigationsRunAtForegroundPriority:(BOOL)a3
{
  LOBYTE(self[5].super.isa) = a3;
}

- (NSArray)_portsForUpgradingInsecureSchemeForTesting
{
  unint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)self[4]._pageConfiguration.data.__lx | ((unint64_t)*(unsigned __int16 *)&self[4]._pageConfiguration.data.__lx[4] << 32);
  if ((v2 & 0xFF00000000) == 0)
    return 0;
  v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)*(_DWORD *)self[4]._pageConfiguration.data.__lx);
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", WORD1(v2));
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
}

- (void)_setPortsForUpgradingInsecureSchemeForTesting:(id)a3
{
  unsigned __int16 v5;
  unsigned __int16 v6;

  if (objc_msgSend(a3, "count") == 2
    && !((unint64_t)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedIntegerValue") >> 16)
    && !((unint64_t)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntegerValue") >> 16))
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "unsignedIntegerValue");
    v6 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "unsignedIntegerValue");
    if (self[4]._pageConfiguration.data.__lx[4])
    {
      *(_WORD *)self[4]._pageConfiguration.data.__lx = v5;
      *(_WORD *)&self[4]._pageConfiguration.data.__lx[2] = v6;
    }
    else
    {
      *(_DWORD *)self[4]._pageConfiguration.data.__lx = v5 | (v6 << 16);
      self[4]._pageConfiguration.data.__lx[4] = 1;
    }
  }
}

- (BOOL)_alwaysRunsAtForegroundPriority
{
  return (BOOL)self[5].super.isa;
}

- (void)_setAlwaysRunsAtForegroundPriority:(BOOL)a3
{
  LOBYTE(self[5].super.isa) = a3;
}

- (void)_setAllowsInlineMediaPlaybackAfterFullscreen:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[18] = a3;
}

- (unint64_t)_dragLiftDelay
{
  int v2;

  v2 = self[3]._pageConfiguration.data.__lx[20];
  if (v2 == 1)
    return 1;
  else
    return 2 * (v2 == 2);
}

- (BOOL)_longPressActionsEnabled
{
  return self[3]._pageConfiguration.data.__lx[25];
}

- (void)_setLongPressActionsEnabled:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[25] = a3;
}

- (void)_setShouldDecidePolicyBeforeLoadingQuickLookPreview:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[27] = a3;
}

- (void)_setCanShowWhileLocked:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[0] = a3;
}

- (BOOL)_canShowWhileLocked
{
  return self[3]._pageConfiguration.data.__lx[0];
}

- (void)_setClickInteractionDriverForTesting:(id)a3
{
  const void *v5;

  if (a3)
    CFRetain(a3);
  v5 = *(const void **)&self[3]._pageConfiguration.data.__lx[8];
  *(_QWORD *)&self[3]._pageConfiguration.data.__lx[8] = a3;
  if (v5)
    CFRelease(v5);
}

- (void)_setAppInitiatedOverrideValueForTesting:(unint64_t)a3
{
  unsigned __int8 v3;

  v3 = a3 == 2;
  if (a3 == 1)
    v3 = 2;
  self[3]._pageConfiguration.data.__lx[1] = v3;
}

- (unint64_t)_appInitiatedOverrideValueForTesting
{
  int v2;

  v2 = self[3]._pageConfiguration.data.__lx[1];
  if (v2 == 2)
    return 1;
  else
    return 2 * (v2 == 1);
}

- (BOOL)_ignoresAppBoundDomains
{
  return (BOOL)self[7].super.isa;
}

- (void)_setIgnoresAppBoundDomains:(BOOL)a3
{
  LOBYTE(self[7].super.isa) = a3;
}

- (Class)_attachmentFileWrapperClass
{
  return *(Class *)&self[4]._pageConfiguration.data.__lx[16];
}

- (void)_setAttachmentFileWrapperClass:(Class)a3
{
  const void *v5;

  if (a3)
  {
    if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Class %@ does not inherit from NSFileWrapper"), a3);
    CFRetain(a3);
  }
  v5 = *(const void **)&self[4]._pageConfiguration.data.__lx[16];
  *(_QWORD *)&self[4]._pageConfiguration.data.__lx[16] = a3;
  if (v5)
    CFRelease(v5);
}

- (void)_setIncompleteImageBorderEnabled:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[17] = a3;
}

- (void)_setShouldDeferAsynchronousScriptsUntilAfterDocumentLoad:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[18] = a3;
}

- (NSArray)_corsDisablingPatterns
{
  CFTypeRef v2;
  NSArray *v3;
  CFTypeRef v4;
  CFTypeRef cf;

  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)&self[5]._pageConfiguration.data.__lx[24], (uint64_t *)&cf);
  v2 = cf;
  cf = 0;
  v3 = (id)CFMakeCollectable(v2);
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
  return v3;
}

- (void)_setCORSDisablingPatterns:(id)a3
{
  void *v4;
  uint64_t v5;
  WTF *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WTF::makeVector<WTF::String>(a3, (uint64_t)&v8);
  v5 = *(unsigned int *)&self[5]._pageConfiguration.data.__lx[36];
  if ((_DWORD)v5)
    WTF::VectorDestructor<true,WTF::String>::destruct(*(WTF::StringImpl **)&self[5]._pageConfiguration.data.__lx[24], (WTF::StringImpl *)(*(_QWORD *)&self[5]._pageConfiguration.data.__lx[24] + 8 * v5));
  v6 = *(WTF **)&self[5]._pageConfiguration.data.__lx[24];
  if (v6)
  {
    *(_QWORD *)&self[5]._pageConfiguration.data.__lx[24] = 0;
    *(_DWORD *)&self[5]._pageConfiguration.data.__lx[32] = 0;
    WTF::fastFree(v6, v4);
  }
  *(_QWORD *)&self[5]._pageConfiguration.data.__lx[24] = v8;
  v7 = v9;
  v8 = 0;
  v9 = 0;
  *(_QWORD *)&self[5]._pageConfiguration.data.__lx[32] = v7;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v8, v4);
}

- (NSSet)_maskedURLSchemes
{
  uint64_t v2;
  NSSet *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl **v5;
  WTF::StringImpl *v6;
  WTF::StringImpl **v7;
  WTF::StringImpl **v8;
  const __CFString *v9;
  WTF::StringImpl **v11;

  API::PageConfiguration::maskedURLSchemes((uint64_t *)&self->_pageConfiguration, (uint64_t *)&v11);
  if (v11)
    v2 = *((unsigned int *)v11 - 3);
  else
    v2 = 0;
  v3 = (NSSet *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v2);
  v5 = (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::begin(&v11);
  v6 = v4;
  v7 = v11;
  if (v11)
    v8 = &v11[*((unsigned int *)v11 - 1)];
  else
    v8 = 0;
  if (v8 != v5)
  {
    do
    {
      if (*v5)
        v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
      else
        v9 = &stru_1E351F1B8;
      -[NSSet addObject:](v3, "addObject:", v9);
      while (++v5 != (WTF::StringImpl **)v6)
      {
        if ((unint64_t)*v5 + 1 > 1)
          goto LABEL_14;
      }
      v5 = (WTF::StringImpl **)v6;
LABEL_14:
      ;
    }
    while (v5 != v8);
    v7 = v11;
  }
  if (v7)
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v7, v4);
  return v3;
}

- (void)_setLoadsFromNetwork:(BOOL)a3
{
  char v3;
  WTF *v4;
  unsigned int v5[4];
  char v6;

  if (a3)
  {
    v3 = 0;
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = 0;
    *(_QWORD *)v5 = 0;
    v3 = 1;
    *(_QWORD *)((char *)&v5[1] + 1) = 0;
  }
  v6 = v3;
  std::__optional_storage_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableTraits>,false>>((uint64_t)&self[6]._pageConfiguration.data.__lx[16], (uint64_t *)&v4);
  if (v6)
  {
    if (v4)
      WTF::RobinHoodHashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::MemoryCompactLookupOnlyRobinHoodHashTableSizePolicy>::deallocateTable((WTF::StringImpl **)v4, (WTF::StringImpl *)v5[0]);
  }
}

- (BOOL)_loadsFromNetwork
{
  return self[6]._pageConfiguration.data.__lx[40] == 0;
}

- (NSSet)_allowedNetworkHosts
{
  NSSet *result;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *i;
  uint64_t *v9;
  uint64_t v10;
  const __CFString *v11;

  if (!self[6]._pageConfiguration.data.__lx[40])
    return 0;
  result = (NSSet *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", *(unsigned int *)&self[6]._pageConfiguration.data.__lx[28]);
  if (self[6]._pageConfiguration.data.__lx[40])
  {
    v4 = result;
    if (*(_DWORD *)&self[6]._pageConfiguration.data.__lx[28])
    {
      v5 = *(_QWORD *)&self[6]._pageConfiguration.data.__lx[16];
      v6 = *(unsigned int *)&self[6]._pageConfiguration.data.__lx[24];
      if ((_DWORD)v6)
      {
        v7 = 8 * v6;
        for (i = *(uint64_t **)&self[6]._pageConfiguration.data.__lx[16]; !*i; ++i)
        {
          v7 -= 8;
          if (!v7)
            return v4;
        }
      }
      else
      {
        i = *(uint64_t **)&self[6]._pageConfiguration.data.__lx[16];
      }
      v9 = (uint64_t *)(v5 + 8 * v6);
      if (i != v9)
      {
        v10 = *i;
LABEL_13:
        if (v10)
          v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
        else
          v11 = &stru_1E351F1B8;
        -[NSSet addObject:](v4, "addObject:", v11);
        while (++i != v9)
        {
          v10 = *i;
          if (*i)
          {
            if (i != v9)
              goto LABEL_13;
            return v4;
          }
        }
      }
    }
    return v4;
  }
  __break(1u);
  return result;
}

- (void)_setLoadsSubresources:(BOOL)a3
{
  self[6]._pageConfiguration.data.__lx[8] = a3;
}

- (BOOL)_loadsSubresources
{
  return self[6]._pageConfiguration.data.__lx[8];
}

- (BOOL)_deferrableUserScriptsShouldWaitUntilNotification
{
  return BYTE1(self[6].super.isa);
}

- (void)_setCrossOriginAccessControlCheckEnabled:(BOOL)a3
{
  BYTE2(self[6].super.isa) = a3;
}

- (BOOL)_crossOriginAccessControlCheckEnabled
{
  return BYTE2(self[6].super.isa);
}

- (BOOL)_requiresUserActionForVideoPlayback
{
  return (-[WKWebViewConfiguration mediaTypesRequiringUserActionForPlayback](self, "mediaTypesRequiringUserActionForPlayback") >> 1) & 1;
}

- (void)_setRequiresUserActionForVideoPlayback:(BOOL)a3
{
  _BOOL4 v3;
  WKAudiovisualMediaTypes v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[WKWebViewConfiguration mediaTypesRequiringUserActionForPlayback](self, "mediaTypesRequiringUserActionForPlayback") & 0xFFFFFFFFFFFFFFFDLL;
  v6 = 2;
  if (!v3)
    v6 = 0;
  -[WKWebViewConfiguration setMediaTypesRequiringUserActionForPlayback:](self, "setMediaTypesRequiringUserActionForPlayback:", v5 | v6);
}

- (BOOL)_requiresUserActionForAudioPlayback
{
  return -[WKWebViewConfiguration mediaTypesRequiringUserActionForPlayback](self, "mediaTypesRequiringUserActionForPlayback") & 1;
}

- (void)_setRequiresUserActionForAudioPlayback:(BOOL)a3
{
  -[WKWebViewConfiguration setMediaTypesRequiringUserActionForPlayback:](self, "setMediaTypesRequiringUserActionForPlayback:", -[WKWebViewConfiguration mediaTypesRequiringUserActionForPlayback](self, "mediaTypesRequiringUserActionForPlayback") & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)_initialCapitalizationEnabled
{
  return self[3]._pageConfiguration.data.__lx[28];
}

- (void)_setInitialCapitalizationEnabled:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[28] = a3;
}

- (_WKApplicationManifest)_applicationManifest
{
  uint64_t v2;

  v2 = *(_QWORD *)&self[5]._pageConfiguration.data.__lx[8];
  if (v2)
    return *(_WKApplicationManifest **)(v2 + 8);
  else
    return 0;
}

- (void)_setApplicationManifest:(id)a3
{
  char *v4;
  uint64_t v5;

  if (a3)
  {
    v4 = (char *)a3 + 8;
    CFRetain(*((CFTypeRef *)a3 + 2));
  }
  else
  {
    v4 = 0;
  }
  v5 = *(_QWORD *)&self[5]._pageConfiguration.data.__lx[8];
  *(_QWORD *)&self[5]._pageConfiguration.data.__lx[8] = v4;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (BOOL)_scrollToTextFragmentIndicatorEnabled
{
  return self[8]._pageConfiguration.data.__lx[25];
}

- (void)_setScrollToTextFragmentIndicatorEnabled:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[25] = a3;
}

- (BOOL)_scrollToTextFragmentMarkingEnabled
{
  return self[8]._pageConfiguration.data.__lx[26];
}

- (void)_setScrollToTextFragmentMarkingEnabled:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[26] = a3;
}

- (NSString)_overrideContentSecurityPolicy
{
  if (*(_QWORD *)&self[4]._pageConfiguration.data.__lx[8])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)_setOverrideContentSecurityPolicy:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self[4]._pageConfiguration.data.__lx[8], (WTF::StringImpl *)&v6);
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

- (void)_setMediaContentTypesRequiringHardwareSupport:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)&self[7]._pageConfiguration.data.__lx[16];
  *(_QWORD *)&self[7]._pageConfiguration.data.__lx[16] = v5;
  if (v6)
  {
    v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6)
        return;
      v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (void)_setAllowMediaContentTypesRequiringHardwareSupportAsFallback:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[15] = a3;
}

- (BOOL)_mediaCaptureEnabled
{
  return BYTE2(self[7].super.isa);
}

- (void)_setMediaCaptureEnabled:(BOOL)a3
{
  BYTE2(self[7].super.isa) = a3;
}

- (void)_setUndoManagerAPIEnabled:(BOOL)a3
{
  self[8]._pageConfiguration.data.__lx[19] = a3;
}

- (BOOL)_allowTestOnlyIPC
{
  return self[3]._pageConfiguration.data.__lx[32];
}

- (void)_setAllowTestOnlyIPC:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[32] = a3;
}

- (BOOL)_delaysWebProcessLaunchUntilFirstLoad
{
  return API::PageConfiguration::delaysWebProcessLaunchUntilFirstLoad((API::PageConfiguration *)&self->_pageConfiguration);
}

- (BOOL)_shouldRelaxThirdPartyCookieBlocking
{
  return self[8]._pageConfiguration.data.__lx[28];
}

- (void)_setShouldRelaxThirdPartyCookieBlocking:(BOOL)a3
{
  WTF::StringImpl *v5;
  int v6;
  WebCore::IOSApplication *v7;
  uint64_t isMobileSafari;
  int isSafariViewService;
  WTF::StringImpl *v10;

  WebCore::applicationBundleIdentifier((WebCore *)self);
  v6 = MEMORY[0x19AEABBCC](v10, "com.apple.WebKit.TestWebKitAPI", 30);
  v7 = v10;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      v7 = (WebCore::IOSApplication *)WTF::StringImpl::destroy(v10, v5);
    else
      *(_DWORD *)v10 -= 2;
  }
  isMobileSafari = WebCore::IOSApplication::isMobileSafari(v7);
  if ((isMobileSafari & 1) != 0)
    isSafariViewService = 1;
  else
    isSafariViewService = WebCore::IOSApplication::isSafariViewService((WebCore::IOSApplication *)isMobileSafari);
  if (!(isSafariViewService | v6 | *(_DWORD *)&self[1]._pageConfiguration.data.__lx[24] & 1))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2FC0], CFSTR("_shouldRelaxThirdPartyCookieBlocking may only be used by Safari."));
  self[8]._pageConfiguration.data.__lx[28] = a3;
}

- (NSString)_processDisplayName
{
  if (*(_QWORD *)self[6]._pageConfiguration.data.__lx)
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)_setProcessDisplayName:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self[6]._pageConfiguration, (WTF::StringImpl *)&v6);
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

- (void)_setAttributedBundleIdentifier:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  int v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)&self[8]._pageConfiguration.data.__lx[32];
  *(_QWORD *)&self[8]._pageConfiguration.data.__lx[32] = v5;
  if (v6)
  {
    v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6)
        return;
      v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (NSString)_attributedBundleIdentifier
{
  NSString *result;

  result = *(NSString **)&self[8]._pageConfiguration.data.__lx[32];
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (void)_setContentSecurityPolicyModeForExtension:(unint64_t)a3
{
  unsigned __int8 v3;

  v3 = a3 == 1;
  if (a3 == 2)
    v3 = 2;
  self[8]._pageConfiguration.data.__lx[40] = v3;
}

- (unint64_t)_contentSecurityPolicyModeForExtension
{
  int v2;

  v2 = self[8]._pageConfiguration.data.__lx[40];
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (BOOL)_markedTextInputEnabled
{
  return self[8]._pageConfiguration.data.__lx[24];
}

- (void)_setMultiRepresentationHEICInsertionEnabled:(BOOL)a3
{
  self[7]._pageConfiguration.data.__lx[1] = a3;
}

- (BOOL)_multiRepresentationHEICInsertionEnabled
{
  return self[7]._pageConfiguration.data.__lx[1];
}

- (BOOL)requiresUserActionForMediaPlayback
{
  return -[WKWebViewConfiguration mediaTypesRequiringUserActionForPlayback](self, "mediaTypesRequiringUserActionForPlayback") == -1;
}

- (void)setRequiresUserActionForMediaPlayback:(BOOL)requiresUserActionForMediaPlayback
{
  -[WKWebViewConfiguration setMediaTypesRequiringUserActionForPlayback:](self, "setMediaTypesRequiringUserActionForPlayback:", requiresUserActionForMediaPlayback << 63 >> 63);
}

- (void)_setTextInteractionGesturesEnabled:(BOOL)a3
{
  self[3]._pageConfiguration.data.__lx[24] = a3;
}

@end
