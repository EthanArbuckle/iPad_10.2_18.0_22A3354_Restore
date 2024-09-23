@implementation WKFullScreenWindowController

- (WKFullScreenWindowController)initWithWebView:(id)a3
{
  WKFullScreenWindowController *v4;
  WKFullScreenWindowController *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int *m_ptr;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WKFullScreenWindowController;
  v4 = -[WKFullScreenWindowController init](&v19, sel_init);
  v5 = v4;
  if (v4)
  {
    -[WKFullScreenWindowController set_webView:](v4, "set_webView:", a3);
    if (a3)
    {
      objc_msgSend(a3, "_page");
      if (v18)
      {
        CFRetain(*(CFTypeRef *)(v18 + 8));
        v6 = WebKit::WebPageProxy::logger((WebKit::WebPageProxy *)v18);
        v7 = (unsigned int *)(v6 + 8);
        do
          v8 = __ldaxr(v7);
        while (__stlxr(v8 + 1, v7));
        m_ptr = (unsigned int *)v5->_logger.m_ptr;
        v5->_logger.m_ptr = (Logger *)v6;
        if (m_ptr)
        {
          v10 = m_ptr + 2;
          do
          {
            v11 = __ldaxr(v10);
            v12 = v11 - 1;
          }
          while (__stlxr(v12, v10));
          if (!v12)
          {
            atomic_store(1u, m_ptr + 2);
            (*(void (**)(unsigned int *))(*(_QWORD *)m_ptr + 8))(m_ptr);
          }
        }
        v13 = *(_QWORD *)(*(_QWORD *)(v18 + 32) + 744) + ~(*(_QWORD *)(*(_QWORD *)(v18 + 32) + 744) << 32);
        v14 = 9
            * (((v13 ^ (v13 >> 22)) + ~((v13 ^ (v13 >> 22)) << 13)) ^ (((v13 ^ (v13 >> 22))
                                                                      + ~((v13 ^ (v13 >> 22)) << 13)) >> 8));
        v15 = (v14 ^ (v14 >> 15)) + ~((v14 ^ (v14 >> 15)) << 27);
        v5->_logIdentifier = (const void *)((v15 >> 31) ^ v15);
        CFRelease(*(CFTypeRef *)(v18 + 8));
      }
    }
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v16, "addObserver:selector:name:object:", v5, sel__applicationDidBecomeActive_, *MEMORY[0x1E0CEB270], objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)WKFullScreenWindowController;
  -[WKFullScreenWindowController dealloc](&v3, sel_dealloc);
}

- (BOOL)isFullScreen
{
  return (unint64_t)(self->_fullScreenState - 1) < 5;
}

- (UIView)webViewPlaceholder
{
  return (UIView *)self->_webViewPlaceholder.m_ptr;
}

- (WKFullScreenViewController)fullScreenViewController
{
  return (WKFullScreenViewController *)self->_fullscreenViewController.m_ptr;
}

- (void)setSupportedOrientations:(unint64_t)a3
{
  objc_msgSend(self->_fullscreenViewController.m_ptr, "setSupportedOrientations:", a3);
}

- (void)resetSupportedOrientations
{
  objc_msgSend(self->_fullscreenViewController.m_ptr, "resetSupportedOrientations");
}

- (void)enterFullScreen:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  WKWebView *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  WKFullScreenWindowController *v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  id location;

  height = a3.height;
  width = a3.width;
  if (!-[WKFullScreenWindowController isFullScreen](self, "isFullScreen"))
  {
    v6 = -[WKFullScreenWindowController _webView](self, "_webView");
    if (v6)
    {
      -[WKWebView _page](v6, "_page");
      if (v10)
      {
        CFRetain(*(CFTypeRef *)(v10 + 8));
        self->_fullScreenState = 1;
        location = 0;
        objc_initWeak(&location, self);
        v7 = *(_QWORD *)(v10 + 368);
        *(_QWORD *)&v11 = "-[WKFullScreenWindowController enterFullScreen:]";
        *((_QWORD *)&v11 + 1) = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
        v12 = self;
        v13 = 0;
        objc_moveWeak(&v13, &location);
        *(CGFloat *)&v14 = width;
        *((CGFloat *)&v14 + 1) = height;
        v8 = WTF::fastMalloc((WTF *)0x48);
        *(_QWORD *)v8 = off_1E34CF418;
        *(_QWORD *)(v8 + 40) = v12;
        *(_OWORD *)(v8 + 24) = v11;
        *(_OWORD *)(v8 + 8) = 0uLL;
        *(_QWORD *)(v8 + 48) = 0;
        objc_moveWeak((id *)(v8 + 48), &v13);
        *(_OWORD *)(v8 + 56) = v14;
        v15 = v8;
        (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v7 + 56))(v7, &v15);
        v9 = v15;
        v15 = 0;
        if (v9)
          (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
        CFRelease(*(CFTypeRef *)(v10 + 8));
      }
    }
  }
}

- (void)_enterFullScreen:(CGSize)a3 windowScene:(id)a4
{
  WKWebView *v6;
  WKWebView *v7;
  _BYTE *v8;
  _BYTE *v9;
  _BYTE *v10;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *m_ptr;
  id v16;
  void *v17;
  id v18;
  const void *v19;
  WKFullScreenViewController *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  WKFullScreenPlaceholderView *v61;
  void *v62;
  const void *v63;
  _QWORD v64[6];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  __n128 (*v68)(uint64_t, uint64_t);
  uint64_t (*v69)();
  void *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  const void *v74;
  char v75[8];
  WebKit::WebPageProxy *v76;
  CGSize v77;

  v77 = a3;
  v6 = -[WKFullScreenWindowController _webView](self, "_webView");
  v7 = v6;
  if (v6)
  {
    CFRetain(v6);
    -[WKWebView _page](v7, "_page");
  }
  else
  {
    v76 = 0;
  }
  v8 = -[WKFullScreenWindowController _manager](self, "_manager");
  if (v76)
  {
    v9 = v8;
    if (v8)
    {
      if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
      {
        if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
        {
          v10 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
          v11 = -[WKFullScreenWindowController logChannel](self, "logChannel");
          v65 = 0;
          v66 = 0;
          v67 = (uint64_t)"-[WKFullScreenWindowController _enterFullScreen:windowScene:]";
          v68 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
          WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v75, &v77);
          if (v10[12])
            WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebCore::FloatSize>((uint64_t)v11, 0, (WTF::Logger::LogSiteIdentifier *)&v65, (WebCore::FloatSize *)v75);
        }
      }
      -[WKFullScreenWindowController _invalidateEVOrganizationName](self, "_invalidateEVOrganizationName");
      self->_blocksReturnToFullscreenFromPictureInPicture = v9[41];
      objc_msgSend((id)-[WKWebView window](v7, "window"), "frame");
      self->_originalWindowSize.width = v12;
      self->_originalWindowSize.height = v13;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC18]), "initWithWindowScene:", a4);
      m_ptr = self->_window.m_ptr;
      self->_window.m_ptr = v14;
      if (m_ptr)
      {
        CFRelease(m_ptr);
        v14 = self->_window.m_ptr;
      }
      objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
      objc_msgSend(self->_window.m_ptr, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -1.0);
      objc_msgSend(self->_window.m_ptr, "setHidden:", 0);
      v16 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
      v17 = self->_rootViewController.m_ptr;
      self->_rootViewController.m_ptr = v16;
      if (v17)
        CFRelease(v17);
      v18 = objc_alloc(MEMORY[0x1E0CEABB0]);
      objc_msgSend(self->_window.m_ptr, "bounds");
      v19 = (const void *)objc_msgSend(v18, "initWithFrame:");
      objc_msgSend(self->_rootViewController.m_ptr, "setView:", v19);
      if (v19)
        CFRelease(v19);
      objc_msgSend((id)objc_msgSend(self->_rootViewController.m_ptr, "view"), "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
      objc_msgSend((id)objc_msgSend(self->_rootViewController.m_ptr, "view"), "setAutoresizingMask:", 18);
      objc_msgSend(self->_rootViewController.m_ptr, "setModalPresentationStyle:", 4);
      objc_msgSend(self->_rootViewController.m_ptr, "setTransitioningDelegate:", self);
      objc_msgSend(self->_window.m_ptr, "setRootViewController:", self->_rootViewController.m_ptr);
      v20 = -[WKFullScreenViewController initWithWebView:]([WKFullScreenViewController alloc], "initWithWebView:", v7);
      v21 = self->_fullscreenViewController.m_ptr;
      self->_fullscreenViewController.m_ptr = v20;
      if (v21)
      {
        CFRelease(v21);
        v20 = (WKFullScreenViewController *)self->_fullscreenViewController.m_ptr;
      }
      -[WKFullScreenViewController setModalPresentationStyle:](v20, "setModalPresentationStyle:", 4);
      objc_msgSend(self->_fullscreenViewController.m_ptr, "setTransitioningDelegate:", self);
      objc_msgSend(self->_fullscreenViewController.m_ptr, "setModalPresentationCapturesStatusBarAppearance:", 1);
      objc_msgSend(self->_fullscreenViewController.m_ptr, "setDelegate:", self);
      objc_msgSend((id)objc_msgSend(self->_rootViewController.m_ptr, "view"), "bounds");
      objc_msgSend((id)objc_msgSend(self->_fullscreenViewController.m_ptr, "view"), "setFrame:", v22, v23, v24, v25);
      -[WKFullScreenWindowController _updateLocationInfo](self, "_updateLocationInfo");
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA30]), "initWithTarget:action:", self, sel__startToDismissFullscreenChanged_);
      v27 = self->_startDismissGestureRecognizer.m_ptr;
      self->_startDismissGestureRecognizer.m_ptr = v26;
      if (v27)
      {
        CFRelease(v27);
        v26 = self->_startDismissGestureRecognizer.m_ptr;
      }
      objc_msgSend(v26, "setDelegate:", self);
      objc_msgSend(self->_startDismissGestureRecognizer.m_ptr, "setCancelsTouchesInView:", 1);
      objc_msgSend(self->_startDismissGestureRecognizer.m_ptr, "setNumberOfTouchesRequired:", 1);
      objc_msgSend(self->_startDismissGestureRecognizer.m_ptr, "setDirection:", 8);
      objc_msgSend((id)objc_msgSend(self->_fullscreenViewController.m_ptr, "view"), "addGestureRecognizer:", self->_startDismissGestureRecognizer.m_ptr);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__interactiveDismissChanged_);
      v29 = self->_interactivePanDismissGestureRecognizer.m_ptr;
      self->_interactivePanDismissGestureRecognizer.m_ptr = v28;
      if (v29)
      {
        CFRelease(v29);
        v28 = self->_interactivePanDismissGestureRecognizer.m_ptr;
      }
      objc_msgSend(v28, "setDelegate:", self);
      objc_msgSend(self->_interactivePanDismissGestureRecognizer.m_ptr, "setCancelsTouchesInView:", 0);
      objc_msgSend((id)objc_msgSend(self->_fullscreenViewController.m_ptr, "view"), "addGestureRecognizer:", self->_interactivePanDismissGestureRecognizer.m_ptr);
      v30 = *((_QWORD *)v9 + 3);
      v31 = *(_QWORD *)(v30 + 208);
      LOBYTE(v65) = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SaveScrollPosition>(v31, (uint64_t)&v65, *(_QWORD *)(*(_QWORD *)(v30 + 32) + 1896), 0);
      WebKit::WebPageProxy::setSuppressVisibilityUpdates(v76, 1);
      v32 = -[WKWebView _wkScrollView](v7, "_wkScrollView");
      -[WKWebView _pageScale](v7, "_pageScale");
      self->_viewState._savedPageScale = v33;
      self->_viewState._savedHaveSetObscuredInsets = -[WKWebView _haveSetObscuredInsets](v7, "_haveSetObscuredInsets");
      -[WKWebView _obscuredInsets](v7, "_obscuredInsets");
      self->_viewState._savedObscuredInsets.top = v34;
      self->_viewState._savedObscuredInsets.left = v35;
      self->_viewState._savedObscuredInsets.bottom = v36;
      self->_viewState._savedObscuredInsets.right = v37;
      self->_viewState._savedObscuredInsetEdgesAffectedBySafeArea = -[WKWebView _obscuredInsetEdgesAffectedBySafeArea](v7, "_obscuredInsetEdgesAffectedBySafeArea");
      self->_viewState._savedContentInsetWasExternallyOverridden = objc_msgSend(v32, "_contentInsetWasExternallyOverridden");
      objc_msgSend(v32, "contentInset");
      self->_viewState._savedEdgeInset.top = v38;
      self->_viewState._savedEdgeInset.left = v39;
      self->_viewState._savedEdgeInset.bottom = v40;
      self->_viewState._savedEdgeInset.right = v41;
      objc_msgSend(v32, "contentOffset");
      self->_viewState._savedContentOffset.x = v42;
      self->_viewState._savedContentOffset.y = v43;
      objc_msgSend(v32, "scrollIndicatorInsets");
      self->_viewState._savedScrollIndicatorInsets.top = v44;
      self->_viewState._savedScrollIndicatorInsets.left = v45;
      self->_viewState._savedScrollIndicatorInsets.bottom = v46;
      self->_viewState._savedScrollIndicatorInsets.right = v47;
      self->_viewState._savedContentInsetAdjustmentBehaviorWasExternallyOverridden = objc_msgSend(v32, "_contentInsetAdjustmentBehaviorWasExternallyOverridden");
      if (v7)
      {
        -[WKWebView _page](v7, "_page");
        v48 = v65;
        if (v65)
        {
          self->_viewState._savedTopContentInset = *(float *)(v65 + 700);
          self->_viewState._savedForceAlwaysUserScalable = *(_BYTE *)(v48 + 1005);
        }
      }
      -[WKWebView _viewScale](v7, "_viewScale");
      self->_viewState._savedViewScale = v49;
      objc_msgSend(v32, "zoomScale");
      self->_viewState._savedZoomScale = v50;
      -[WKWebView _contentZoomScale](v7, "_contentZoomScale");
      self->_viewState._savedContentZoomScale = v51;
      self->_viewState._savedBouncesZoom = objc_msgSend(v32, "bouncesZoom");
      -[WKWebView _minimumEffectiveDeviceWidth](v7, "_minimumEffectiveDeviceWidth");
      self->_viewState._savedMinimumEffectiveDeviceWidth = v52;
      self->_viewState._savedHaveSetUnobscuredSafeAreaInsets = -[WKWebView _haveSetUnobscuredSafeAreaInsets](v7, "_haveSetUnobscuredSafeAreaInsets");
      -[WKWebView _unobscuredSafeAreaInsets](v7, "_unobscuredSafeAreaInsets");
      self->_viewState._savedUnobscuredSafeAreaInsets.top = v53;
      self->_viewState._savedUnobscuredSafeAreaInsets.left = v54;
      self->_viewState._savedUnobscuredSafeAreaInsets.bottom = v55;
      self->_viewState._savedUnobscuredSafeAreaInsets.right = v56;
      self->_viewState._savedHasOverriddenLayoutParameters = -[WKWebView _hasOverriddenLayoutParameters](v7, "_hasOverriddenLayoutParameters");
      -[WKWebView _maximumUnobscuredSizeOverride](v7, "_maximumUnobscuredSizeOverride");
      self->_viewState._savedMaximumUnobscuredSizeOverride.width = v57;
      self->_viewState._savedMaximumUnobscuredSizeOverride.height = v58;
      -[WKWebView _minimumUnobscuredSizeOverride](v7, "_minimumUnobscuredSizeOverride");
      self->_viewState._savedMinimumUnobscuredSizeOverride.width = v59;
      self->_viewState._savedMinimumUnobscuredSizeOverride.height = v60;
      v61 = objc_alloc_init(WKFullScreenPlaceholderView);
      v62 = self->_webViewPlaceholder.m_ptr;
      self->_webViewPlaceholder.m_ptr = v61;
      if (v62)
      {
        CFRelease(v62);
        v61 = (WKFullScreenPlaceholderView *)self->_webViewPlaceholder.m_ptr;
      }
      -[WKFullScreenPlaceholderView setParent:](v61, "setParent:", self);
      objc_msgSend((id)objc_msgSend(self->_webViewPlaceholder.m_ptr, "layer"), "setName:", CFSTR("Fullscreen Placeholder View"));
      v65 = 0;
      v66 = &v65;
      v67 = 0x5012000000;
      v68 = __Block_byref_object_copy__9;
      v69 = __Block_byref_object_dispose__9;
      v70 = &unk_197A0BBD2;
      v63 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      v71 = 0;
      v72 = 0;
      v73 = "-[WKFullScreenWindowController _enterFullScreen:windowScene:]";
      v74 = v63;
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __61__WKFullScreenWindowController__enterFullScreen_windowScene___block_invoke;
      v64[3] = &unk_1E34CF240;
      v64[4] = self;
      v64[5] = &v65;
      -[WKWebView takeSnapshotWithConfiguration:completionHandler:](v7, "takeSnapshotWithConfiguration:completionHandler:", 0, v64);
      _Block_object_dispose(&v65, 8);
    }
  }
  if (v7)
    CFRelease(v7);
}

void __61__WKFullScreenWindowController__enterFullScreen_windowScene___block_invoke(uint64_t a1, void *a2)
{
  WKWebView *v4;
  WKWebView *v5;
  void *v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  NSObject *v11;
  WTF *v12;
  void *v13;
  char *v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t i;
  WTF::StringImpl *v25;
  int v26;
  WTF::StringImpl *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  WTF::Logger::LogSiteIdentifier *v48;
  uint64_t v49;
  uint64_t v50;
  WTF *v51[2];
  WTF::StringImpl *v52;
  WTF::StringImpl *v53;
  WTF::StringImpl *v54;
  uint8_t buf[40];
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[48];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _OWORD v65[5];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = (WKWebView *)objc_msgSend(*(id *)(a1 + 32), "_webView");
  v5 = v4;
  if (v4)
    CFRetain(v4);
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "_webView");
  if (v6)
  {
    objc_msgSend(v6, "_page");
    if (v50)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "loggerPtr"))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "logChannel"))
        {
          v7 = objc_msgSend(*(id *)(a1 + 32), "loggerPtr");
          v49 = objc_msgSend(*(id *)(a1 + 32), "logChannel");
          if (*(_BYTE *)(v7 + 12))
          {
            v48 = (WTF::Logger::LogSiteIdentifier *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
            WTF::Logger::LogSiteIdentifier::toString(v48);
            WTF::String::String((WTF::String *)&v52, "snapshot completed");
            *(_QWORD *)buf = v53;
            v51[0] = v52;
            WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v51, &v54);
            if (!v54)
            {
              __break(0xC471u);
              return;
            }
            v9 = v52;
            v52 = 0;
            if (v9)
            {
              if (*(_DWORD *)v9 == 2)
                WTF::StringImpl::destroy(v9, v8);
              else
                *(_DWORD *)v9 -= 2;
            }
            v10 = v53;
            v53 = 0;
            if (v10)
            {
              if (*(_DWORD *)v10 == 2)
                WTF::StringImpl::destroy(v10, v8);
              else
                *(_DWORD *)v10 -= 2;
            }
            v11 = *(NSObject **)(v49 + 32);
            v12 = (WTF *)os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v12)
            {
              WTF::String::utf8();
              v14 = v51[0] ? (char *)v51[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v14;
              _os_log_impl(&dword_196BCC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              v12 = v51[0];
              v51[0] = 0;
              if (v12)
              {
                if (*(_DWORD *)v12 == 1)
                  v12 = (WTF *)WTF::fastFree(v12, v13);
                else
                  --*(_DWORD *)v12;
              }
            }
            if (*(_BYTE *)v49)
            {
              v15 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
              while (1)
              {
                v16 = *v15;
                if ((v16 & 1) != 0)
                  break;
                v17 = __ldaxr(v15);
                if (v17 == v16)
                {
                  if (!__stxr(v16 | 1, v15))
                  {
                    v18 = WTF::Logger::observers(v12);
                    v19 = *(unsigned int *)(v18 + 12);
                    if ((_DWORD)v19)
                    {
                      v20 = *(uint64_t **)v18;
                      v21 = *(_QWORD *)v18 + 8 * v19;
                      do
                      {
                        v22 = *v20;
                        *(_DWORD *)buf = 0;
                        WTF::Logger::LogSiteIdentifier::toString(v48);
                        *(_DWORD *)&buf[16] = 0;
                        WTF::String::String((WTF::String *)&buf[24], "snapshot completed");
                        WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v51, (uint64_t)buf, 2uLL);
                        (*(void (**)(uint64_t, uint64_t, _QWORD, WTF **))(*(_QWORD *)v22 + 16))(v22, v49, 0, v51);
                        WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v51, v23);
                        for (i = 24; i != -8; i -= 16)
                        {
                          v25 = *(WTF::StringImpl **)&buf[i];
                          *(_QWORD *)&buf[i] = 0;
                          if (v25)
                          {
                            if (*(_DWORD *)v25 == 2)
                              WTF::StringImpl::destroy(v25, (WTF::StringImpl *)v13);
                            else
                              *(_DWORD *)v25 -= 2;
                          }
                        }
                        ++v20;
                      }
                      while (v20 != (uint64_t *)v21);
                    }
                    v26 = __ldxr(v15);
                    if (v26 == 1)
                    {
                      if (!__stlxr(0, v15))
                        break;
                    }
                    else
                    {
                      __clrex();
                    }
                    WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                    break;
                  }
                }
                else
                {
                  __clrex();
                }
              }
            }
            v27 = v54;
            v54 = 0;
            if (v27)
            {
              if (*(_DWORD *)v27 == 2)
                WTF::StringImpl::destroy(v27, (WTF::StringImpl *)v13);
              else
                *(_DWORD *)v27 -= 2;
            }
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin", v48);
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "layer"), "setContents:", objc_msgSend(a2, "CGImage"));
      v28 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[WKWebView frame](v5, "frame");
      objc_msgSend(v28, "setFrame:");
      objc_msgSend(v28, "setAutoresizingMask:", -[WKWebView autoresizingMask](v5, "autoresizingMask"));
      objc_msgSend((id)-[WKWebView superview](v5, "superview"), "insertSubview:aboveSubview:", v28, v5);
      -[WKWebView removeFromSuperview](v5, "removeFromSuperview");
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      -[WKWebView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "bounds");
      -[WKWebView setFrame:](v5, "setFrame:");
      -[WKWebView _setMinimumEffectiveDeviceWidth:](v5, "_setMinimumEffectiveDeviceWidth:", 0.0);
      -[WKWebView _setViewScale:](v5, "_setViewScale:", 1.0);
      memset(buf, 0, 32);
      v29 = *MEMORY[0x1E0C9D820];
      memset(&v65[1], 0, 32);
      v65[0] = 0u;
      v30 = *MEMORY[0x1E0C9D538];
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      *(_OWORD *)&v59[32] = 0u;
      v60 = 0u;
      *(_OWORD *)&v59[16] = 0u;
      v56 = 0;
      v57 = 0u;
      v58 = 0u;
      *(_OWORD *)v59 = 0u;
      __asm { FMOV            V4.2D, #1.0 }
      *(_OWORD *)&buf[8] = _Q4;
      *(_OWORD *)&buf[24] = _Q4;
      v36 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
      v57 = *MEMORY[0x1E0CEB4B0];
      v58 = v36;
      v37 = *MEMORY[0x1E0CEB4B0];
      *(_OWORD *)&v59[24] = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
      *(_OWORD *)&v59[8] = v37;
      v38 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
      v60 = *MEMORY[0x1E0CEB4B0];
      v61 = v38;
      v63 = v30;
      *(_OWORD *)((char *)&v65[1] + 8) = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
      *(_QWORD *)&v59[40] = 15;
      *(_OWORD *)((char *)v65 + 8) = v37;
      v39 = *MEMORY[0x1E0C9D820];
      v65[3] = v29;
      v65[4] = v39;
      WebKit::WKWebViewState::applyTo((WebKit::WKWebViewState *)buf, v5);
      -[WKWebView _overrideZoomScaleParametersWithMinimumZoomScale:maximumZoomScale:allowUserScaling:](v5, "_overrideZoomScaleParametersWithMinimumZoomScale:maximumZoomScale:allowUserScaling:", 0, 1.0, 1.0);
      -[WKWebView _resetContentOffset](v5, "_resetContentOffset");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "insertSubview:atIndex:", v5, 0);
      -[WKWebView setNeedsLayout](v5, "setNeedsLayout");
      -[WKWebView layoutIfNeeded](v5, "layoutIfNeeded");
      v40 = objc_msgSend(*(id *)(a1 + 32), "_manager");
      if (v40)
      {
        v41 = *(_QWORD *)(v40 + 24);
        v42 = *(_QWORD *)(v41 + 208);
        buf[0] = 1;
        WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v42, buf, *(_QWORD *)(*(_QWORD *)(v41 + 32) + 1896), 0);
      }
      v43 = *(_QWORD *)(a1 + 32);
      if (v43)
      {
        CFRetain(*(CFTypeRef *)(a1 + 32));
        v44 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v44 = 0;
      }
      v45 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v46 = *(_OWORD *)(v45 + 64);
      *(_OWORD *)buf = *(_OWORD *)(v45 + 48);
      *(_OWORD *)&buf[16] = v46;
      v47 = WTF::fastMalloc((WTF *)0x38);
      *(_QWORD *)v47 = &off_1E34CF440;
      *(_QWORD *)(v47 + 8) = v43;
      *(_QWORD *)(v47 + 16) = v44;
      *(_OWORD *)(v47 + 24) = *(_OWORD *)buf;
      *(_OWORD *)(v47 + 40) = *(_OWORD *)&buf[16];
      v51[0] = (WTF *)v47;
      WebKit::WebPageProxy::updateRenderingWithForcedRepaint(v50, (uint64_t *)v51);
      if (v51[0])
        (*(void (**)(WTF *))(*(_QWORD *)v51[0] + 8))(v51[0]);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
  if (v5)
    CFRelease(v5);
}

- (void)beganEnterFullScreenWithInitialFrame:(CGRect)a3 finalFrame:(CGRect)a4
{
  int64_t fullScreenState;
  const void *v6;
  _BYTE *v7;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v8;
  CGSize size;
  CGSize v10;
  double x;
  double y;
  double v17;
  double v18;
  CGFloat width;
  CGFloat height;
  BOOL v21;
  WKWebView *v23;
  WKWebView *v24;
  _BOOL4 returnToFullscreenFromPictureInPicture;
  const void *v26;
  void *m_ptr;
  void *v28;
  _BYTE *v29;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;
  NSObject *var4;
  WTF *v36;
  void *v37;
  char *v38;
  unsigned __int8 *v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  void *v48;
  uint64_t i;
  WTF::StringImpl *v50;
  int v51;
  WTF::StringImpl *v52;
  CGSize v53;
  _QWORD v54[6];
  _QWORD v55[4];
  CGRect v56;
  CGRect v57;
  WTF *v58[2];
  WTF::StringImpl *v59;
  WTF::StringImpl *v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  uint8_t buf[16];
  uint64_t v64;
  __n128 (*v65)(uint64_t, uint64_t);
  uint64_t (*v66)();
  _QWORD v67[7];

  v67[5] = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v56 = a4;
  fullScreenState = self->_fullScreenState;
  v6 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
  if (fullScreenState == 1)
  {
    if (v6)
    {
      if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
      {
        v7 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
        v8 = -[WKFullScreenWindowController logChannel](self, "logChannel");
        *(_OWORD *)buf = 0uLL;
        v64 = (uint64_t)"-[WKFullScreenWindowController beganEnterFullScreenWithInitialFrame:finalFrame:]";
        v65 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v55, &v57);
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v58, &v56);
        if (v7[12])
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebCore::FloatRect,char [3],WebCore::FloatRect>((uint64_t)v8, (WTF::Logger::LogSiteIdentifier *)buf, (WebCore::FloatRect *)v55, (WebCore::FloatRect *)v58);
      }
    }
    self->_fullScreenState = 2;
    size = v57.size;
    self->_initialFrame.origin = v57.origin;
    self->_initialFrame.size = size;
    v10 = v56.size;
    self->_finalFrame.origin = v56.origin;
    self->_finalFrame.size = v10;
    __asm { FMOV            V2.2D, #1.0 }
    v53 = (CGSize)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)self->_initialFrame.size), (int8x16_t)_Q2, (int8x16_t)self->_initialFrame.size);
    self->_initialFrame.size = v53;
    self->_finalFrame.size = (CGSize)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)self->_finalFrame.size), (int8x16_t)_Q2, (int8x16_t)self->_finalFrame.size);
    x = self->_initialFrame.origin.x;
    y = self->_initialFrame.origin.y;
    objc_msgSend((id)objc_msgSend(self->_rootViewController.m_ptr, "view"), "frame");
    width = v53.width;
    if (y > v18
      || ((height = v53.height, y >= -v53.height) ? (v21 = x <= v17) : (v21 = 0),
          v21 ? (_NF = x < -v53.width) : (_NF = 1),
          _NF))
    {
      x = v17 * 0.5;
      y = v18 * 0.5;
      width = 1.0;
      height = 1.0;
    }
    self->_initialFrame.origin.x = x;
    self->_initialFrame.origin.y = y;
    self->_initialFrame.size.width = width;
    self->_initialFrame.size.height = height;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v23 = -[WKFullScreenWindowController _webView](self, "_webView");
    v24 = v23;
    if (v23)
      CFRetain(v23);
    -[WKWebView removeFromSuperview](v24, "removeFromSuperview");
    objc_msgSend(self->_window.m_ptr, "setWindowLevel:", *MEMORY[0x1E0CEBE28]);
    objc_msgSend(self->_window.m_ptr, "makeKeyAndVisible");
    objc_msgSend(self->_fullscreenViewController.m_ptr, "setPrefersStatusBarHidden:", 0);
    objc_msgSend(self->_fullscreenViewController.m_ptr, "showUI");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    returnToFullscreenFromPictureInPicture = self->_returnToFullscreenFromPictureInPicture;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    v64 = 0x5012000000;
    v65 = __Block_byref_object_copy__9;
    v66 = __Block_byref_object_dispose__9;
    v67[0] = &unk_197A0BBD2;
    v26 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
    v67[1] = 0;
    v67[2] = 0;
    v67[3] = "-[WKFullScreenWindowController beganEnterFullScreenWithInitialFrame:finalFrame:]";
    v67[4] = v26;
    m_ptr = self->_rootViewController.m_ptr;
    v28 = self->_fullscreenViewController.m_ptr;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __80__WKFullScreenWindowController_beganEnterFullScreenWithInitialFrame_finalFrame___block_invoke;
    v54[3] = &unk_1E34CF268;
    v54[4] = self;
    v54[5] = buf;
    objc_msgSend(m_ptr, "presentViewController:animated:completion:", v28, !returnToFullscreenFromPictureInPicture, v54);
    _Block_object_dispose(buf, 8);
    if (v24)
      CFRelease(v24);
  }
  else if (v6)
  {
    if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v29 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v30 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      v55[0] = 0;
      v55[1] = 0;
      v55[2] = "-[WKFullScreenWindowController beganEnterFullScreenWithInitialFrame:finalFrame:]";
      v55[3] = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v29[12])
      {
        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v55);
        WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v60, self->_fullScreenState);
        WTF::String::String((WTF::String *)&v59, " != WaitingToEnterFullScreen, dropping");
        WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v61, (uint64_t *)&v60, (uint64_t *)&v59, &v62);
        v32 = v59;
        v59 = 0;
        if (v32)
        {
          if (*(_DWORD *)v32 == 2)
            WTF::StringImpl::destroy(v32, v31);
          else
            *(_DWORD *)v32 -= 2;
        }
        v33 = v60;
        v60 = 0;
        if (v33)
        {
          if (*(_DWORD *)v33 == 2)
            WTF::StringImpl::destroy(v33, v31);
          else
            *(_DWORD *)v33 -= 2;
        }
        v34 = v61;
        v61 = 0;
        if (v34)
        {
          if (*(_DWORD *)v34 == 2)
            WTF::StringImpl::destroy(v34, v31);
          else
            *(_DWORD *)v34 -= 2;
        }
        var4 = v30->var4;
        v36 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v36)
        {
          WTF::String::utf8();
          v38 = v58[0] ? (char *)v58[0] + 16 : 0;
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v38;
          _os_log_impl(&dword_196BCC000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          v36 = v58[0];
          v58[0] = 0;
          if (v36)
          {
            if (*(_DWORD *)v36 == 1)
              v36 = (WTF *)WTF::fastFree(v36, v37);
            else
              --*(_DWORD *)v36;
          }
        }
        if (v30->var0 && v30->var2)
        {
          v39 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
          while (1)
          {
            v40 = *v39;
            if ((v40 & 1) != 0)
              break;
            v41 = __ldaxr(v39);
            if (v41 == v40)
            {
              if (!__stxr(v40 | 1, v39))
              {
                v42 = WTF::Logger::observers(v36);
                v43 = *(unsigned int *)(v42 + 12);
                if ((_DWORD)v43)
                {
                  v44 = *(uint64_t **)v42;
                  v45 = *(_QWORD *)v42 + 8 * v43;
                  do
                  {
                    v46 = *v44;
                    *(_DWORD *)buf = 0;
                    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v55);
                    v47 = self->_fullScreenState;
                    LODWORD(v64) = 0;
                    WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v65, v47);
                    LODWORD(v66) = 0;
                    WTF::String::String((WTF::String *)v67, " != WaitingToEnterFullScreen, dropping");
                    WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v58, (uint64_t)buf, 3uLL);
                    (*(void (**)(uint64_t, $C8D0F0E4FA2D55374FC6C0BB194058F2 *, uint64_t, WTF **))(*(_QWORD *)v46 + 16))(v46, v30, 1, v58);
                    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v58, v48);
                    for (i = 40; i != -8; i -= 16)
                    {
                      v50 = *(WTF::StringImpl **)&buf[i];
                      *(_QWORD *)&buf[i] = 0;
                      if (v50)
                      {
                        if (*(_DWORD *)v50 == 2)
                          WTF::StringImpl::destroy(v50, (WTF::StringImpl *)v37);
                        else
                          *(_DWORD *)v50 -= 2;
                      }
                    }
                    ++v44;
                  }
                  while (v44 != (uint64_t *)v45);
                }
                v51 = __ldxr(v39);
                if (v51 == 1)
                {
                  if (!__stlxr(0, v39))
                    break;
                }
                else
                {
                  __clrex();
                }
                WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                break;
              }
            }
            else
            {
              __clrex();
            }
          }
        }
        v52 = v62;
        v62 = 0;
        if (v52)
        {
          if (*(_DWORD *)v52 == 2)
            WTF::StringImpl::destroy(v52, (WTF::StringImpl *)v37);
          else
            *(_DWORD *)v52 -= 2;
        }
      }
    }
  }
}

uint64_t __80__WKFullScreenWindowController_beganEnterFullScreenWithInitialFrame_finalFrame___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  WTF::Logger::LogSiteIdentifier *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  void *v9;
  uint64_t v10;
  WebKit::WebFullScreenManagerProxy *v11;
  BOOL v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  WTF::Logger::LogSiteIdentifier *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  NSObject *v27;
  WTF *v28;
  void *v29;
  char *v30;
  unsigned __int8 *v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t i;
  WTF::StringImpl *v41;
  int v42;
  WTF::StringImpl *v43;
  WTF::StringImpl *v44;
  NSObject *v45;
  WTF *v46;
  void *v47;
  char *v48;
  NSObject *v49;
  WTF *v50;
  void *v51;
  char *v52;
  WTF::StringImpl *v53;
  uint64_t result;
  unsigned __int8 *v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t k;
  WTF::StringImpl *v65;
  int v66;
  unsigned __int8 *v67;
  int v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t j;
  WTF::StringImpl *v77;
  int v78;
  WTF::StringImpl *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  void *v86;
  uint64_t v87;
  WTF *v88;
  uint64_t v89;
  unsigned __int8 **v90;
  int v92;
  void *v93;
  WTF::StringImpl *v94;
  WTF::Logger::LogSiteIdentifier *v95;
  WebKit::WebPageProxy *v96;
  WTF *v97[2];
  WTF::StringImpl *v98;
  WTF::StringImpl *v99;
  WTF::StringImpl *v100;
  _BYTE buf[12];
  int v102;
  _QWORD v103[3];

  v103[2] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 3;
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[474])
  {
    v2[474] = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "loggerPtr"))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "logChannel"))
      {
        v3 = objc_msgSend(*(id *)(a1 + 32), "loggerPtr");
        v4 = objc_msgSend(*(id *)(a1 + 32), "logChannel");
        if (*(_BYTE *)(v3 + 12))
        {
          v5 = v4;
          v6 = (WTF::Logger::LogSiteIdentifier *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
          WTF::Logger::LogSiteIdentifier::toString(v6);
          WTF::String::String((WTF::String *)&v98, "presentation completed, but exit requested");
          *(_QWORD *)buf = v99;
          v97[0] = v98;
          WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v97, &v100);
          if (v100)
          {
            v8 = v98;
            v98 = 0;
            if (v8)
            {
              if (*(_DWORD *)v8 == 2)
                WTF::StringImpl::destroy(v8, v7);
              else
                *(_DWORD *)v8 -= 2;
            }
            v26 = v99;
            v99 = 0;
            if (v26)
            {
              if (*(_DWORD *)v26 == 2)
                WTF::StringImpl::destroy(v26, v7);
              else
                *(_DWORD *)v26 -= 2;
            }
            v27 = *(NSObject **)(v5 + 32);
            v28 = (WTF *)os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v28)
            {
              WTF::String::utf8();
              v30 = v97[0] ? (char *)v97[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v30;
              _os_log_impl(&dword_196BCC000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              v28 = v97[0];
              v97[0] = 0;
              if (v28)
              {
                if (*(_DWORD *)v28 == 1)
                  v28 = (WTF *)WTF::fastFree(v28, v29);
                else
                  --*(_DWORD *)v28;
              }
            }
            if (*(_BYTE *)v5 && *(_BYTE *)(v5 + 16))
            {
              v31 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
              while (1)
              {
                v32 = *v31;
                if ((v32 & 1) != 0)
                  break;
                v33 = __ldaxr(v31);
                if (v33 == v32)
                {
                  if (!__stxr(v32 | 1, v31))
                  {
                    v34 = WTF::Logger::observers(v28);
                    v35 = *(unsigned int *)(v34 + 12);
                    if ((_DWORD)v35)
                    {
                      v36 = *(uint64_t **)v34;
                      v37 = *(_QWORD *)v34 + 8 * v35;
                      do
                      {
                        v38 = *v36;
                        *(_DWORD *)buf = 0;
                        WTF::Logger::LogSiteIdentifier::toString(v6);
                        v102 = 0;
                        WTF::String::String((WTF::String *)v103, "presentation completed, but exit requested");
                        WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v97, (uint64_t)buf, 2uLL);
                        (*(void (**)(uint64_t, uint64_t, uint64_t, WTF **))(*(_QWORD *)v38 + 16))(v38, v5, 1, v97);
                        WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v97, v39);
                        for (i = 24; i != -8; i -= 16)
                        {
                          v41 = *(WTF::StringImpl **)&buf[i];
                          *(_QWORD *)&buf[i] = 0;
                          if (v41)
                          {
                            if (*(_DWORD *)v41 == 2)
                              WTF::StringImpl::destroy(v41, (WTF::StringImpl *)v29);
                            else
                              *(_DWORD *)v41 -= 2;
                          }
                        }
                        ++v36;
                      }
                      while (v36 != (uint64_t *)v37);
                    }
                    v42 = __ldxr(v31);
                    if (v42 == 1)
                    {
                      if (!__stlxr(0, v31))
                        break;
                    }
                    else
                    {
                      __clrex();
                    }
                    WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                    break;
                  }
                }
                else
                {
                  __clrex();
                }
              }
            }
            v53 = v100;
            v100 = 0;
            if (v53)
            {
              if (*(_DWORD *)v53 == 2)
                WTF::StringImpl::destroy(v53, (WTF::StringImpl *)v29);
              else
                *(_DWORD *)v53 -= 2;
            }
            return objc_msgSend(*(id *)(a1 + 32), "_exitFullscreenImmediately");
          }
LABEL_182:
          __break(0xC471u);
          JUMPOUT(0x1972C3C6CLL);
        }
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_exitFullscreenImmediately");
  }
  v9 = (void *)objc_msgSend(v2, "_webView");
  if (v9)
    objc_msgSend(v9, "_page");
  else
    v96 = 0;
  v10 = objc_msgSend(*(id *)(a1 + 32), "_manager");
  v11 = (WebKit::WebFullScreenManagerProxy *)v10;
  if (v96)
    v12 = v10 == 0;
  else
    v12 = 1;
  v13 = !v12;
  v14 = objc_msgSend(*(id *)(a1 + 32), "loggerPtr");
  if (!v13)
  {
    if (v14)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "logChannel"))
      {
        v20 = objc_msgSend(*(id *)(a1 + 32), "loggerPtr");
        v21 = objc_msgSend(*(id *)(a1 + 32), "logChannel");
        if (*(_BYTE *)(v20 + 12))
        {
          v22 = v21;
          v23 = (WTF::Logger::LogSiteIdentifier *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
          WTF::Logger::LogSiteIdentifier::toString(v23);
          WTF::String::String((WTF::String *)&v98, "presentation completed, but page or manager missing");
          *(_QWORD *)buf = v99;
          v97[0] = v98;
          WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v97, &v100);
          if (v100)
          {
            v25 = v98;
            v98 = 0;
            if (v25)
            {
              if (*(_DWORD *)v25 == 2)
                WTF::StringImpl::destroy(v25, v24);
              else
                *(_DWORD *)v25 -= 2;
            }
            v44 = v99;
            v99 = 0;
            if (v44)
            {
              if (*(_DWORD *)v44 == 2)
                WTF::StringImpl::destroy(v44, v24);
              else
                *(_DWORD *)v44 -= 2;
            }
            v49 = *(NSObject **)(v22 + 32);
            v50 = (WTF *)os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v50)
            {
              WTF::String::utf8();
              v52 = v97[0] ? (char *)v97[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v52;
              _os_log_impl(&dword_196BCC000, v49, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              v50 = v97[0];
              v97[0] = 0;
              if (v50)
              {
                if (*(_DWORD *)v50 == 1)
                  v50 = (WTF *)WTF::fastFree(v50, v51);
                else
                  --*(_DWORD *)v50;
              }
            }
            if (*(_BYTE *)v22 && *(_BYTE *)(v22 + 16))
            {
              v67 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
              while (1)
              {
                v68 = *v67;
                if ((v68 & 1) != 0)
                  break;
                v69 = __ldaxr(v67);
                if (v69 == v68)
                {
                  if (!__stxr(v68 | 1, v67))
                  {
                    v70 = WTF::Logger::observers(v50);
                    v71 = *(unsigned int *)(v70 + 12);
                    if ((_DWORD)v71)
                    {
                      v72 = *(uint64_t **)v70;
                      v73 = *(_QWORD *)v70 + 8 * v71;
                      do
                      {
                        v74 = *v72;
                        *(_DWORD *)buf = 0;
                        WTF::Logger::LogSiteIdentifier::toString(v23);
                        v102 = 0;
                        WTF::String::String((WTF::String *)v103, "presentation completed, but page or manager missing");
                        WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v97, (uint64_t)buf, 2uLL);
                        (*(void (**)(uint64_t, uint64_t, uint64_t, WTF **))(*(_QWORD *)v74 + 16))(v74, v22, 1, v97);
                        WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v97, v75);
                        for (j = 24; j != -8; j -= 16)
                        {
                          v77 = *(WTF::StringImpl **)&buf[j];
                          *(_QWORD *)&buf[j] = 0;
                          if (v77)
                          {
                            if (*(_DWORD *)v77 == 2)
                              WTF::StringImpl::destroy(v77, (WTF::StringImpl *)v51);
                            else
                              *(_DWORD *)v77 -= 2;
                          }
                        }
                        ++v72;
                      }
                      while (v72 != (uint64_t *)v73);
                    }
                    v78 = __ldxr(v67);
                    if (v78 == 1)
                    {
                      if (!__stlxr(0, v67))
                        break;
                    }
                    else
                    {
                      __clrex();
                    }
                    WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                    break;
                  }
                }
                else
                {
                  __clrex();
                }
              }
            }
            v94 = v100;
            v100 = 0;
            if (v94)
            {
              if (*(_DWORD *)v94 == 2)
                WTF::StringImpl::destroy(v94, (WTF::StringImpl *)v51);
              else
                *(_DWORD *)v94 -= 2;
            }
            return objc_msgSend(*(id *)(a1 + 32), "_exitFullscreenImmediately");
          }
          goto LABEL_182;
        }
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_exitFullscreenImmediately");
  }
  if (v14)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "logChannel"))
    {
      v15 = objc_msgSend(*(id *)(a1 + 32), "loggerPtr");
      v16 = objc_msgSend(*(id *)(a1 + 32), "logChannel");
      if (*(_BYTE *)(v15 + 12))
      {
        v17 = v16;
        v95 = (WTF::Logger::LogSiteIdentifier *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
        WTF::Logger::LogSiteIdentifier::toString(v95);
        WTF::String::String((WTF::String *)&v98, "presentation completed");
        *(_QWORD *)buf = v99;
        v97[0] = v98;
        WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v97, &v100);
        if (!v100)
        {
          __break(0xC471u);
          JUMPOUT(0x1972C3C74);
        }
        v19 = v98;
        v98 = 0;
        if (v19)
        {
          if (*(_DWORD *)v19 == 2)
            WTF::StringImpl::destroy(v19, v18);
          else
            *(_DWORD *)v19 -= 2;
        }
        v43 = v99;
        v99 = 0;
        if (v43)
        {
          if (*(_DWORD *)v43 == 2)
            WTF::StringImpl::destroy(v43, v18);
          else
            *(_DWORD *)v43 -= 2;
        }
        v45 = *(NSObject **)(v17 + 32);
        v46 = (WTF *)os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v46)
        {
          WTF::String::utf8();
          v48 = v97[0] ? (char *)v97[0] + 16 : 0;
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v48;
          _os_log_impl(&dword_196BCC000, v45, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          v46 = v97[0];
          v97[0] = 0;
          if (v46)
          {
            if (*(_DWORD *)v46 == 1)
              v46 = (WTF *)WTF::fastFree(v46, v47);
            else
              --*(_DWORD *)v46;
          }
        }
        if (*(_BYTE *)v17)
        {
          v55 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
          while (1)
          {
            v56 = *v55;
            if ((v56 & 1) != 0)
              break;
            v57 = __ldaxr(v55);
            if (v57 == v56)
            {
              if (!__stxr(v56 | 1, v55))
              {
                v58 = WTF::Logger::observers(v46);
                v59 = *(unsigned int *)(v58 + 12);
                if ((_DWORD)v59)
                {
                  v60 = *(uint64_t **)v58;
                  v61 = *(_QWORD *)v58 + 8 * v59;
                  do
                  {
                    v62 = *v60;
                    *(_DWORD *)buf = 0;
                    WTF::Logger::LogSiteIdentifier::toString(v95);
                    v102 = 0;
                    WTF::String::String((WTF::String *)v103, "presentation completed");
                    WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v97, (uint64_t)buf, 2uLL);
                    (*(void (**)(uint64_t, uint64_t, _QWORD, WTF **))(*(_QWORD *)v62 + 16))(v62, v17, 0, v97);
                    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v97, v63);
                    for (k = 24; k != -8; k -= 16)
                    {
                      v65 = *(WTF::StringImpl **)&buf[k];
                      *(_QWORD *)&buf[k] = 0;
                      if (v65)
                      {
                        if (*(_DWORD *)v65 == 2)
                          WTF::StringImpl::destroy(v65, (WTF::StringImpl *)v47);
                        else
                          *(_DWORD *)v65 -= 2;
                      }
                    }
                    ++v60;
                  }
                  while (v60 != (uint64_t *)v61);
                }
                v66 = __ldxr(v55);
                if (v66 == 1)
                {
                  if (!__stlxr(0, v55))
                    break;
                }
                else
                {
                  __clrex();
                }
                WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                break;
              }
            }
            else
            {
              __clrex();
            }
          }
        }
        v79 = v100;
        v100 = 0;
        if (v79)
        {
          if (*(_DWORD *)v79 == 2)
            WTF::StringImpl::destroy(v79, (WTF::StringImpl *)v47);
          else
            *(_DWORD *)v79 -= 2;
        }
      }
    }
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_webView"), "becomeFirstResponder");
  WebKit::WebFullScreenManagerProxy::didEnterFullScreen(v11);
  v80 = *((_QWORD *)v11 + 3);
  v81 = *(_QWORD *)(v80 + 208);
  buf[0] = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v81, buf, *(_QWORD *)(*(_QWORD *)(v80 + 32) + 1896), 0);
  WebKit::WebPageProxy::setSuppressVisibilityUpdates(v96, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "showBanner");
  result = objc_msgSend(*(id *)(a1 + 32), "_videoPresentationManager");
  v82 = result;
  v83 = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (!*(_QWORD *)(v83 + 368))
    {
      v84 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      v85 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v85 = off_1E34CF378;
      v85[1] = v83;
      *v84 = 0;
      v84[1] = v85;
      v87 = *(_QWORD *)(a1 + 32);
      v88 = *(WTF **)(v87 + 368);
      *(_QWORD *)(v87 + 368) = v84;
      if (v88)
        std::default_delete<WTF::Observer<void ()(BOOL)>>::operator()[abi:sn180100](v88, v86);
      WTF::WeakHashSet<WTF::Observer<void ()(BOOL)>,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::add<WTF::Observer<void ()(BOOL)>>(v82 + 96, *(_QWORD **)(*(_QWORD *)(a1 + 32) + 368), (uint64_t)buf);
    }
    WebKit::VideoPresentationManagerProxy::returningToStandbyInterface(v82, buf);
    result = *(_QWORD *)buf;
    if (!*(_QWORD *)buf)
      goto LABEL_154;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 378))
    {
      result = WebCore::VideoPresentationInterfaceIOS::preparedToReturnToStandby(*(WebCore::VideoPresentationInterfaceIOS **)buf);
      goto LABEL_152;
    }
    if (!*(_BYTE *)(*(_QWORD *)buf + 160) && (*(_BYTE *)(*(_QWORD *)buf + 156) & 2) == 0
      || (v89 = *(_QWORD *)(*(_QWORD *)buf + 136)) == 0)
    {
LABEL_152:
      if (*(_QWORD *)buf)
        result = (uint64_t)WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*(unsigned __int8 **)(*(_QWORD *)buf + 64));
LABEL_154:
      v83 = *(_QWORD *)(a1 + 32);
      goto LABEL_155;
    }
    v90 = *(unsigned __int8 ***)(*(_QWORD *)buf + 144);
    if (__ldaxr((unsigned __int8 *)v89))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v89))
    {
      goto LABEL_163;
    }
    result = MEMORY[0x19AEABB3C](v89);
LABEL_163:
    if (*(_QWORD *)(v89 + 24))
      ++*(_QWORD *)(v89 + 8);
    else
      v90 = 0;
    v92 = __ldxr((unsigned __int8 *)v89);
    if (v92 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v89))
      {
LABEL_171:
        if (v90)
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 377) = 1;
          (*((void (**)(unsigned __int8 **, _QWORD, _QWORD))*v90 + 4))(v90, 0, 0);
          result = (uint64_t)WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaSessionHelper,(WTF::DestructionThread)0>(v90[1], v93);
        }
        goto LABEL_152;
      }
    }
    else
    {
      __clrex();
    }
    result = WTF::Lock::unlockSlow((WTF::Lock *)v89);
    goto LABEL_171;
  }
LABEL_155:
  *(_BYTE *)(v83 + 378) = 0;
  return result;
}

- (void)requestRestoreFullScreen:(void *)a3
{
  _BYTE *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WKWebView *v8;
  _QWORD *v9;
  const void *v10;
  _BYTE *v11;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v12;
  _BYTE *v13;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  NSObject *var4;
  WTF *v20;
  void *v21;
  char *v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  int64_t fullScreenState;
  void *v32;
  uint64_t i;
  WTF::StringImpl *v34;
  int v35;
  WTF::StringImpl *v36;
  NSObject *v37;
  WTF *v38;
  char *v39;
  unsigned __int8 *v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t j;
  WTF::StringImpl *v50;
  int v51;
  WTF::StringImpl *v52;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  const void *v57;
  WTF::StringImpl *v58;
  WTF *v59[2];
  WTF::StringImpl *v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  uint8_t buf[16];
  const char *v64;
  const void *v65;
  int v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  if (self->_fullScreenState)
  {
    if (!-[WKFullScreenWindowController loggerPtr](self, "loggerPtr", a3))
      return;
    if (!-[WKFullScreenWindowController logChannel](self, "logChannel"))
      return;
    v4 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
    v53 = -[WKFullScreenWindowController logChannel](self, "logChannel");
    v54 = 0;
    v55 = 0;
    v56 = "-[WKFullScreenWindowController requestRestoreFullScreen:]";
    v57 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
    if (!v4[12])
      return;
    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v54);
    WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v60, self->_fullScreenState);
    WTF::String::String((WTF::String *)&v58, " != NotInFullScreen, dropping");
    WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v61, (uint64_t *)&v60, (uint64_t *)&v58, &v62);
    v6 = v58;
    v58 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
        WTF::StringImpl::destroy(v6, v5);
      else
        *(_DWORD *)v6 -= 2;
    }
    v17 = v60;
    v60 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v5);
      else
        *(_DWORD *)v17 -= 2;
    }
    v18 = v61;
    v61 = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
        WTF::StringImpl::destroy(v18, v5);
      else
        *(_DWORD *)v18 -= 2;
    }
    var4 = v53->var4;
    v20 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v20)
    {
      WTF::String::utf8();
      v22 = v59[0] ? (char *)v59[0] + 16 : 0;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v22;
      _os_log_impl(&dword_196BCC000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      v20 = v59[0];
      v59[0] = 0;
      if (v20)
      {
        if (*(_DWORD *)v20 == 1)
          v20 = (WTF *)WTF::fastFree(v20, v21);
        else
          --*(_DWORD *)v20;
      }
    }
    if (v53->var0)
    {
      v23 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
      while (1)
      {
        v24 = *v23;
        if ((v24 & 1) != 0)
          break;
        v25 = __ldaxr(v23);
        if (v25 == v24)
        {
          if (!__stxr(v24 | 1, v23))
          {
            v26 = WTF::Logger::observers(v20);
            v27 = *(unsigned int *)(v26 + 12);
            if ((_DWORD)v27)
            {
              v28 = *(uint64_t **)v26;
              v29 = *(_QWORD *)v26 + 8 * v27;
              do
              {
                v30 = *v28;
                *(_DWORD *)buf = 0;
                WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v54);
                fullScreenState = self->_fullScreenState;
                LODWORD(v64) = 0;
                WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v65, fullScreenState);
                v66 = 0;
                WTF::String::String((WTF::String *)v67, " != NotInFullScreen, dropping");
                WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v59, (uint64_t)buf, 3uLL);
                (*(void (**)(uint64_t, $C8D0F0E4FA2D55374FC6C0BB194058F2 *, _QWORD, WTF **))(*(_QWORD *)v30 + 16))(v30, v53, 0, v59);
                WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v59, v32);
                for (i = 40; i != -8; i -= 16)
                {
                  v34 = *(WTF::StringImpl **)&buf[i];
                  *(_QWORD *)&buf[i] = 0;
                  if (v34)
                  {
                    if (*(_DWORD *)v34 == 2)
                      WTF::StringImpl::destroy(v34, (WTF::StringImpl *)v21);
                    else
                      *(_DWORD *)v34 -= 2;
                  }
                }
                ++v28;
              }
              while (v28 != (uint64_t *)v29);
            }
            v35 = __ldxr(v23);
            if (v35 != 1)
              goto LABEL_93;
            if (__stlxr(0, v23))
              goto LABEL_94;
            break;
          }
        }
        else
        {
          __clrex();
        }
      }
    }
LABEL_95:
    v52 = v62;
    v62 = 0;
    if (v52)
    {
      if (*(_DWORD *)v52 == 2)
        WTF::StringImpl::destroy(v52, (WTF::StringImpl *)v21);
      else
        *(_DWORD *)v52 -= 2;
    }
    return;
  }
  v8 = -[WKFullScreenWindowController _webView](self, "_webView");
  if (v8)
  {
    -[WKWebView _page](v8, "_page");
    if (*(_QWORD *)buf)
      (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)buf + 104) + 32))(*(_QWORD *)(*(_QWORD *)buf + 104));
  }
  v9 = -[WKFullScreenWindowController _manager](self, "_manager");
  v10 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
  if (!v9)
  {
    if (!v10)
      return;
    if (!-[WKFullScreenWindowController logChannel](self, "logChannel"))
      return;
    v13 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
    v14 = -[WKFullScreenWindowController logChannel](self, "logChannel");
    v54 = 0;
    v55 = 0;
    v56 = "-[WKFullScreenWindowController requestRestoreFullScreen:]";
    v57 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
    if (!v13[12])
      return;
    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v54);
    WTF::String::String((WTF::String *)&v60, "manager missing, dropping");
    *(_QWORD *)buf = v61;
    v59[0] = v60;
    WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v59, &v62);
    if (!v62)
    {
      __break(0xC471u);
      return;
    }
    v16 = v60;
    v60 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v15);
      else
        *(_DWORD *)v16 -= 2;
    }
    v36 = v61;
    v61 = 0;
    if (v36)
    {
      if (*(_DWORD *)v36 == 2)
        WTF::StringImpl::destroy(v36, v15);
      else
        *(_DWORD *)v36 -= 2;
    }
    v37 = v14->var4;
    v38 = (WTF *)os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v38)
    {
      WTF::String::utf8();
      v39 = v59[0] ? (char *)v59[0] + 16 : 0;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v39;
      _os_log_impl(&dword_196BCC000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      v38 = v59[0];
      v59[0] = 0;
      if (v38)
      {
        if (*(_DWORD *)v38 == 1)
          v38 = (WTF *)WTF::fastFree(v38, v21);
        else
          --*(_DWORD *)v38;
      }
    }
    if (v14->var0 && v14->var2)
    {
      v40 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
      while (1)
      {
        v41 = *v40;
        if ((v41 & 1) != 0)
          break;
        v42 = __ldaxr(v40);
        if (v42 == v41)
        {
          if (!__stxr(v41 | 1, v40))
          {
            v43 = WTF::Logger::observers(v38);
            v44 = *(unsigned int *)(v43 + 12);
            if ((_DWORD)v44)
            {
              v45 = *(uint64_t **)v43;
              v46 = *(_QWORD *)v43 + 8 * v44;
              do
              {
                v47 = *v45;
                *(_DWORD *)buf = 0;
                WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v54);
                LODWORD(v64) = 0;
                WTF::String::String((WTF::String *)&v65, "manager missing, dropping");
                WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v59, (uint64_t)buf, 2uLL);
                (*(void (**)(uint64_t, $C8D0F0E4FA2D55374FC6C0BB194058F2 *, uint64_t, WTF **))(*(_QWORD *)v47 + 16))(v47, v14, 1, v59);
                WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v59, v48);
                for (j = 24; j != -8; j -= 16)
                {
                  v50 = *(WTF::StringImpl **)&buf[j];
                  *(_QWORD *)&buf[j] = 0;
                  if (v50)
                  {
                    if (*(_DWORD *)v50 == 2)
                      WTF::StringImpl::destroy(v50, (WTF::StringImpl *)v21);
                    else
                      *(_DWORD *)v50 -= 2;
                  }
                }
                ++v45;
              }
              while (v45 != (uint64_t *)v46);
            }
            v51 = __ldxr(v40);
            if (v51 == 1)
            {
              if (!__stlxr(0, v40))
                goto LABEL_95;
            }
            else
            {
LABEL_93:
              __clrex();
            }
LABEL_94:
            WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
            goto LABEL_95;
          }
        }
        else
        {
          __clrex();
        }
      }
    }
    goto LABEL_95;
  }
  if (v10)
  {
    if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v11 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v12 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      *(_OWORD *)buf = 0uLL;
      v64 = "-[WKFullScreenWindowController requestRestoreFullScreen:]";
      v65 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v11[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v12, 0, (WTF::Logger::LogSiteIdentifier *)buf);
    }
  }
  WebKit::WebFullScreenManagerProxy::requestRestoreFullScreen(v9, (uint64_t *)a3);
}

- (void)requestExitFullScreen
{
  WebKit::WebFullScreenManagerProxy *v3;
  const void *v4;
  _BYTE *v5;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v6;
  _BYTE *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  _BYTE *v10;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  NSObject *var4;
  WTF *v15;
  void *v16;
  char *v17;
  unsigned __int8 *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  int64_t fullScreenState;
  void *v27;
  uint64_t i;
  WTF::StringImpl *v29;
  int v30;
  WTF::StringImpl *v31;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v32;
  _QWORD v33[4];
  WTF *v34[2];
  WTF::StringImpl *v35;
  WTF::StringImpl *v36;
  WTF::StringImpl *v37;
  WTF::StringImpl *v38;
  uint8_t buf[16];
  const char *v40;
  const void *v41;
  int v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  if (self->_fullScreenState == 3)
  {
    v3 = -[WKFullScreenWindowController _manager](self, "_manager");
    v4 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
    if (v3)
    {
      if (v4 && -[WKFullScreenWindowController logChannel](self, "logChannel"))
      {
        v5 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
        v6 = -[WKFullScreenWindowController logChannel](self, "logChannel");
        *(_OWORD *)buf = 0uLL;
        v40 = "-[WKFullScreenWindowController requestExitFullScreen]";
        v41 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
        if (v5[12])
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v6, 0, (WTF::Logger::LogSiteIdentifier *)buf);
      }
      WebKit::WebFullScreenManagerProxy::requestExitFullScreen(v3);
      self->_exitingFullScreen = 1;
    }
    else
    {
      if (v4)
      {
        if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
        {
          v10 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
          v11 = -[WKFullScreenWindowController logChannel](self, "logChannel");
          *(_OWORD *)buf = 0uLL;
          v40 = "-[WKFullScreenWindowController requestExitFullScreen]";
          v41 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
          if (v10[12])
            WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [16]>((uint64_t)v11, (WTF::Logger::LogSiteIdentifier *)buf);
        }
      }
      -[WKFullScreenWindowController _exitFullscreenImmediately](self, "_exitFullscreenImmediately");
    }
  }
  else
  {
    if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
    {
      if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
      {
        v7 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
        v32 = -[WKFullScreenWindowController logChannel](self, "logChannel");
        v33[0] = 0;
        v33[1] = 0;
        v33[2] = "-[WKFullScreenWindowController requestExitFullScreen]";
        v33[3] = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
        if (v7[12])
        {
          WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v33);
          WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v36, self->_fullScreenState);
          WTF::String::String((WTF::String *)&v35, " != InFullScreen");
          WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v37, (uint64_t *)&v36, (uint64_t *)&v35, &v38);
          v9 = v35;
          v35 = 0;
          if (v9)
          {
            if (*(_DWORD *)v9 == 2)
              WTF::StringImpl::destroy(v9, v8);
            else
              *(_DWORD *)v9 -= 2;
          }
          v12 = v36;
          v36 = 0;
          if (v12)
          {
            if (*(_DWORD *)v12 == 2)
              WTF::StringImpl::destroy(v12, v8);
            else
              *(_DWORD *)v12 -= 2;
          }
          v13 = v37;
          v37 = 0;
          if (v13)
          {
            if (*(_DWORD *)v13 == 2)
              WTF::StringImpl::destroy(v13, v8);
            else
              *(_DWORD *)v13 -= 2;
          }
          var4 = v32->var4;
          v15 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v15)
          {
            WTF::String::utf8();
            v17 = v34[0] ? (char *)v34[0] + 16 : 0;
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = v17;
            _os_log_impl(&dword_196BCC000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            v15 = v34[0];
            v34[0] = 0;
            if (v15)
            {
              if (*(_DWORD *)v15 == 1)
                v15 = (WTF *)WTF::fastFree(v15, v16);
              else
                --*(_DWORD *)v15;
            }
          }
          if (v32->var0)
          {
            v18 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
            while (1)
            {
              v19 = *v18;
              if ((v19 & 1) != 0)
                break;
              v20 = __ldaxr(v18);
              if (v20 == v19)
              {
                if (!__stxr(v19 | 1, v18))
                {
                  v21 = WTF::Logger::observers(v15);
                  v22 = *(unsigned int *)(v21 + 12);
                  if ((_DWORD)v22)
                  {
                    v23 = *(uint64_t **)v21;
                    v24 = *(_QWORD *)v21 + 8 * v22;
                    do
                    {
                      v25 = *v23;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v33);
                      fullScreenState = self->_fullScreenState;
                      LODWORD(v40) = 0;
                      WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v41, fullScreenState);
                      v42 = 0;
                      WTF::String::String((WTF::String *)v43, " != InFullScreen");
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v34, (uint64_t)buf, 3uLL);
                      (*(void (**)(uint64_t, $C8D0F0E4FA2D55374FC6C0BB194058F2 *, _QWORD, WTF **))(*(_QWORD *)v25 + 16))(v25, v32, 0, v34);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v34, v27);
                      for (i = 40; i != -8; i -= 16)
                      {
                        v29 = *(WTF::StringImpl **)&buf[i];
                        *(_QWORD *)&buf[i] = 0;
                        if (v29)
                        {
                          if (*(_DWORD *)v29 == 2)
                            WTF::StringImpl::destroy(v29, (WTF::StringImpl *)v16);
                          else
                            *(_DWORD *)v29 -= 2;
                        }
                      }
                      ++v23;
                    }
                    while (v23 != (uint64_t *)v24);
                  }
                  v30 = __ldxr(v18);
                  if (v30 == 1)
                  {
                    if (!__stlxr(0, v18))
                      break;
                  }
                  else
                  {
                    __clrex();
                  }
                  WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                  break;
                }
              }
              else
              {
                __clrex();
              }
            }
          }
          v31 = v38;
          v38 = 0;
          if (v31)
          {
            if (*(_DWORD *)v31 == 2)
              WTF::StringImpl::destroy(v31, (WTF::StringImpl *)v16);
            else
              *(_DWORD *)v31 -= 2;
          }
        }
      }
    }
    self->_exitRequested = 1;
  }
}

- (void)exitFullScreen
{
  int64_t fullScreenState;
  uint64_t *p_fullScreenState;
  _BYTE *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  _BYTE *v8;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v9;
  _QWORD *v10;
  const void *v11;
  _BYTE *v12;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  NSObject *var4;
  WTF *v21;
  void *v22;
  char *v23;
  unsigned __int8 *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t i;
  WTF::StringImpl *v34;
  int v35;
  WTF::StringImpl *v36;
  uint64_t v37;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v38;
  _QWORD v39[4];
  WTF *v40[2];
  WTF::StringImpl *v41;
  WTF::StringImpl *v42;
  WTF::StringImpl *v43;
  WTF::StringImpl *v44;
  uint8_t buf[16];
  const char *v46;
  const void *v47;
  int v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  p_fullScreenState = &self->_fullScreenState;
  fullScreenState = self->_fullScreenState;
  if (fullScreenState)
  {
    if (fullScreenState > 2)
    {
      -[WKWebView _beginAnimatedFullScreenExit](-[WKFullScreenWindowController _webView](self, "_webView"), "_beginAnimatedFullScreenExit");
      self->_fullScreenState = 4;
      self->_exitingFullScreen = 1;
      v10 = -[WKFullScreenWindowController _manager](self, "_manager");
      v11 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      if (v10)
      {
        if (v11)
        {
          if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
          {
            v12 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
            v13 = -[WKFullScreenWindowController logChannel](self, "logChannel");
            *(_OWORD *)buf = 0uLL;
            v46 = "-[WKFullScreenWindowController exitFullScreen]";
            v47 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
            if (v12[12])
              WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v13, 0, (WTF::Logger::LogSiteIdentifier *)buf);
          }
        }
        v14 = v10[3];
        v15 = *(_QWORD *)(v14 + 208);
        buf[0] = 1;
        WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v15, buf, *(_QWORD *)(*(_QWORD *)(v14 + 32) + 1896), 0);
        WebKit::WebFullScreenManagerProxy::willExitFullScreen((WebKit::WebFullScreenManagerProxy *)v10);
      }
      else
      {
        if (v11)
        {
          if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
          {
            v16 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
            v17 = -[WKFullScreenWindowController logChannel](self, "logChannel");
            *(_OWORD *)buf = 0uLL;
            v46 = "-[WKFullScreenWindowController exitFullScreen]";
            v47 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
            if (v16[12])
              WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [16]>((uint64_t)v17, (WTF::Logger::LogSiteIdentifier *)buf);
          }
        }
        -[WKFullScreenWindowController _exitFullscreenImmediately](self, "_exitFullscreenImmediately");
      }
    }
    else
    {
      if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
      {
        if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
        {
          v5 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
          v38 = -[WKFullScreenWindowController logChannel](self, "logChannel");
          v39[0] = 0;
          v39[1] = 0;
          v39[2] = "-[WKFullScreenWindowController exitFullScreen]";
          v39[3] = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
          if (v5[12])
          {
            WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v39);
            WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v42, *p_fullScreenState);
            WTF::String::String((WTF::String *)&v41, " < InFullScreen");
            WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v43, (uint64_t *)&v42, (uint64_t *)&v41, &v44);
            v7 = v41;
            v41 = 0;
            if (v7)
            {
              if (*(_DWORD *)v7 == 2)
                WTF::StringImpl::destroy(v7, v6);
              else
                *(_DWORD *)v7 -= 2;
            }
            v18 = v42;
            v42 = 0;
            if (v18)
            {
              if (*(_DWORD *)v18 == 2)
                WTF::StringImpl::destroy(v18, v6);
              else
                *(_DWORD *)v18 -= 2;
            }
            v19 = v43;
            v43 = 0;
            if (v19)
            {
              if (*(_DWORD *)v19 == 2)
                WTF::StringImpl::destroy(v19, v6);
              else
                *(_DWORD *)v19 -= 2;
            }
            var4 = v38->var4;
            v21 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v21)
            {
              WTF::String::utf8();
              v23 = v40[0] ? (char *)v40[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v23;
              _os_log_impl(&dword_196BCC000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              v21 = v40[0];
              v40[0] = 0;
              if (v21)
              {
                if (*(_DWORD *)v21 == 1)
                  v21 = (WTF *)WTF::fastFree(v21, v22);
                else
                  --*(_DWORD *)v21;
              }
            }
            if (v38->var0)
            {
              v24 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
              while (1)
              {
                v25 = *v24;
                if ((v25 & 1) != 0)
                  break;
                v26 = __ldaxr(v24);
                if (v26 == v25)
                {
                  if (!__stxr(v25 | 1, v24))
                  {
                    v27 = WTF::Logger::observers(v21);
                    v28 = *(unsigned int *)(v27 + 12);
                    if ((_DWORD)v28)
                    {
                      v29 = *(uint64_t **)v27;
                      v37 = *(_QWORD *)v27 + 8 * v28;
                      do
                      {
                        v30 = *v29;
                        *(_DWORD *)buf = 0;
                        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v39);
                        v31 = *p_fullScreenState;
                        LODWORD(v46) = 0;
                        WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v47, v31);
                        v48 = 0;
                        WTF::String::String((WTF::String *)v49, " < InFullScreen");
                        WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v40, (uint64_t)buf, 3uLL);
                        (*(void (**)(uint64_t, $C8D0F0E4FA2D55374FC6C0BB194058F2 *, _QWORD, WTF **))(*(_QWORD *)v30 + 16))(v30, v38, 0, v40);
                        WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v40, v32);
                        for (i = 40; i != -8; i -= 16)
                        {
                          v34 = *(WTF::StringImpl **)&buf[i];
                          *(_QWORD *)&buf[i] = 0;
                          if (v34)
                          {
                            if (*(_DWORD *)v34 == 2)
                              WTF::StringImpl::destroy(v34, (WTF::StringImpl *)v22);
                            else
                              *(_DWORD *)v34 -= 2;
                          }
                        }
                        ++v29;
                      }
                      while (v29 != (uint64_t *)v37);
                    }
                    v35 = __ldxr(v24);
                    if (v35 == 1)
                    {
                      if (!__stlxr(0, v24))
                        break;
                    }
                    else
                    {
                      __clrex();
                    }
                    WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                    break;
                  }
                }
                else
                {
                  __clrex();
                }
              }
            }
            v36 = v44;
            v44 = 0;
            if (v36)
            {
              if (*(_DWORD *)v36 == 2)
                WTF::StringImpl::destroy(v36, (WTF::StringImpl *)v22);
              else
                *(_DWORD *)v36 -= 2;
            }
          }
        }
      }
      self->_exitRequested = 1;
    }
  }
  else if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
  {
    if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v8 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v9 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      *(_OWORD *)buf = 0uLL;
      v46 = "-[WKFullScreenWindowController exitFullScreen]";
      v47 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v8[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebKit::FullScreenState,char [11]>((uint64_t)v9, (WTF::Logger::LogSiteIdentifier *)buf, p_fullScreenState);
    }
  }
}

- (void)beganExitFullScreenWithInitialFrame:(CGRect)a3 finalFrame:(CGRect)a4
{
  int64_t fullScreenState;
  const void *v6;
  _BYTE *v7;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v8;
  CGSize size;
  CGSize v10;
  CGSize v15;
  double x;
  double y;
  double v18;
  double v19;
  CGFloat width;
  CGFloat height;
  BOOL v22;
  WKWebView *v24;
  _QWORD *v25;
  _BYTE *v26;
  WTF::StringImpl *v27;
  WTF::StringImpl *v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  NSObject *var4;
  WTF *v32;
  void *v33;
  char *v34;
  unsigned __int8 *v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  void *v44;
  uint64_t i;
  WTF::StringImpl *v46;
  int v47;
  WTF::StringImpl *v48;
  CGSize v49;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v50;
  _QWORD v51[4];
  CGRect v52;
  CGRect v53;
  WTF *v54[2];
  WTF::StringImpl *v55;
  WTF::StringImpl *v56;
  WTF::StringImpl *v57;
  WTF::StringImpl *v58;
  uint8_t buf[16];
  const char *v60;
  const void *v61;
  int v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v52 = a4;
  fullScreenState = self->_fullScreenState;
  v6 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
  if (fullScreenState == 4)
  {
    if (v6)
    {
      if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
      {
        v7 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
        v8 = -[WKFullScreenWindowController logChannel](self, "logChannel");
        *(_OWORD *)buf = 0uLL;
        v60 = "-[WKFullScreenWindowController beganExitFullScreenWithInitialFrame:finalFrame:]";
        v61 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v51, &v53);
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v54, &v52);
        if (v7[12])
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebCore::FloatRect,char [3],WebCore::FloatRect>((uint64_t)v8, (WTF::Logger::LogSiteIdentifier *)buf, (WebCore::FloatRect *)v51, (WebCore::FloatRect *)v54);
      }
    }
    size = v53.size;
    self->_initialFrame.origin = v53.origin;
    self->_initialFrame.size = size;
    v10 = v52.size;
    self->_finalFrame.origin = v52.origin;
    self->_finalFrame.size = v10;
    __asm { FMOV            V2.2D, #1.0 }
    v15 = (CGSize)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)self->_initialFrame.size), (int8x16_t)_Q2, (int8x16_t)self->_initialFrame.size);
    self->_fullScreenState = 5;
    self->_initialFrame.size = v15;
    v49 = (CGSize)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)self->_finalFrame.size), (int8x16_t)_Q2, (int8x16_t)self->_finalFrame.size);
    self->_finalFrame.size = v49;
    x = self->_finalFrame.origin.x;
    y = self->_finalFrame.origin.y;
    objc_msgSend((id)objc_msgSend(self->_rootViewController.m_ptr, "view"), "frame");
    width = v49.width;
    if (y > v19
      || ((height = v49.height, y >= -v49.height) ? (v22 = x <= v18) : (v22 = 0),
          v22 ? (_NF = x < -v49.width) : (_NF = 1),
          _NF))
    {
      x = v18 * 0.5;
      y = v19 * 0.5;
      width = 1.0;
      height = 1.0;
    }
    self->_finalFrame.origin.x = x;
    self->_finalFrame.origin.y = y;
    self->_finalFrame.size.width = width;
    self->_finalFrame.size.height = height;
    v24 = -[WKFullScreenWindowController _webView](self, "_webView");
    if (v24)
    {
      -[WKWebView _page](v24, "_page");
      if (*(_QWORD *)buf)
        WebKit::WebPageProxy::setSuppressVisibilityUpdates(*(WebKit::WebPageProxy **)buf, 1);
    }
    CFRetain(self);
    v25 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v25 = &off_1E34CF488;
    v25[1] = self;
    v25[2] = self;
    WTF::Detail::CallableWrapper<-[WKFullScreenWindowController beganExitFullScreenWithInitialFrame:finalFrame:]::$_6,void>::call((uint64_t)v25);
    (*(void (**)(_QWORD *))(*v25 + 8))(v25);
  }
  else if (v6)
  {
    if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v26 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v50 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      v51[0] = 0;
      v51[1] = 0;
      v51[2] = "-[WKFullScreenWindowController beganExitFullScreenWithInitialFrame:finalFrame:]";
      v51[3] = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v26[12])
      {
        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v51);
        WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v56, self->_fullScreenState);
        WTF::String::String((WTF::String *)&v55, " != WaitingToExitFullScreen, dropping");
        WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v57, (uint64_t *)&v56, (uint64_t *)&v55, &v58);
        v28 = v55;
        v55 = 0;
        if (v28)
        {
          if (*(_DWORD *)v28 == 2)
            WTF::StringImpl::destroy(v28, v27);
          else
            *(_DWORD *)v28 -= 2;
        }
        v29 = v56;
        v56 = 0;
        if (v29)
        {
          if (*(_DWORD *)v29 == 2)
            WTF::StringImpl::destroy(v29, v27);
          else
            *(_DWORD *)v29 -= 2;
        }
        v30 = v57;
        v57 = 0;
        if (v30)
        {
          if (*(_DWORD *)v30 == 2)
            WTF::StringImpl::destroy(v30, v27);
          else
            *(_DWORD *)v30 -= 2;
        }
        var4 = v50->var4;
        v32 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v32)
        {
          WTF::String::utf8();
          v34 = v54[0] ? (char *)v54[0] + 16 : 0;
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v34;
          _os_log_impl(&dword_196BCC000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          v32 = v54[0];
          v54[0] = 0;
          if (v32)
          {
            if (*(_DWORD *)v32 == 1)
              v32 = (WTF *)WTF::fastFree(v32, v33);
            else
              --*(_DWORD *)v32;
          }
        }
        if (v50->var0)
        {
          v35 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
          while (1)
          {
            v36 = *v35;
            if ((v36 & 1) != 0)
              break;
            v37 = __ldaxr(v35);
            if (v37 == v36)
            {
              if (!__stxr(v36 | 1, v35))
              {
                v38 = WTF::Logger::observers(v32);
                v39 = *(unsigned int *)(v38 + 12);
                if ((_DWORD)v39)
                {
                  v40 = *(uint64_t **)v38;
                  v41 = *(_QWORD *)v38 + 8 * v39;
                  do
                  {
                    v42 = *v40;
                    *(_DWORD *)buf = 0;
                    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v51);
                    v43 = self->_fullScreenState;
                    LODWORD(v60) = 0;
                    WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v61, v43);
                    v62 = 0;
                    WTF::String::String((WTF::String *)v63, " != WaitingToExitFullScreen, dropping");
                    WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v54, (uint64_t)buf, 3uLL);
                    (*(void (**)(uint64_t, $C8D0F0E4FA2D55374FC6C0BB194058F2 *, _QWORD, WTF **))(*(_QWORD *)v42 + 16))(v42, v50, 0, v54);
                    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v54, v44);
                    for (i = 40; i != -8; i -= 16)
                    {
                      v46 = *(WTF::StringImpl **)&buf[i];
                      *(_QWORD *)&buf[i] = 0;
                      if (v46)
                      {
                        if (*(_DWORD *)v46 == 2)
                          WTF::StringImpl::destroy(v46, (WTF::StringImpl *)v33);
                        else
                          *(_DWORD *)v46 -= 2;
                      }
                    }
                    ++v40;
                  }
                  while (v40 != (uint64_t *)v41);
                }
                v47 = __ldxr(v35);
                if (v47 == 1)
                {
                  if (!__stlxr(0, v35))
                    break;
                }
                else
                {
                  __clrex();
                }
                WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                break;
              }
            }
            else
            {
              __clrex();
            }
          }
        }
        v48 = v58;
        v58 = 0;
        if (v48)
        {
          if (*(_DWORD *)v48 == 2)
            WTF::StringImpl::destroy(v48, (WTF::StringImpl *)v33);
          else
            *(_DWORD *)v48 -= 2;
        }
      }
    }
  }
}

- (void)_reinsertWebViewUnderPlaceholder
{
  WKWebView *v3;
  WKWebView *v4;
  _BYTE v5[60];
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v3 = -[WKFullScreenWindowController _webView](self, "_webView");
  v4 = v3;
  if (v3)
    CFRetain(v3);
  objc_msgSend((id)objc_msgSend(self->_webViewPlaceholder.m_ptr, "superview"), "insertSubview:belowSubview:", v4, self->_webViewPlaceholder.m_ptr);
  objc_msgSend(self->_webViewPlaceholder.m_ptr, "frame");
  -[WKWebView setFrame:](v4, "setFrame:");
  -[WKWebView setAutoresizingMask:](v4, "setAutoresizingMask:", objc_msgSend(self->_webViewPlaceholder.m_ptr, "autoresizingMask"));
  -[WKWebView becomeFirstResponder](v4, "becomeFirstResponder");
  -[WKWebView _clearOverrideZoomScaleParameters](v4, "_clearOverrideZoomScaleParameters");
  WebKit::WKWebViewState::applyTo((WebKit::WKWebViewState *)&self->_viewState, v4);
  if (v4)
  {
    -[WKWebView _page](v4, "_page");
    if (v6)
    {
      v5[0] = 0;
      v5[56] = 0;
      WebKit::WebPageProxy::setOverrideViewportArguments(v6, (uint64_t)v5);
    }
  }
  -[WKWebView setNeedsLayout](v4, "setNeedsLayout");
  -[WKWebView layoutIfNeeded](v4, "layoutIfNeeded");
  -[WKWebView _endAnimatedFullScreenExit](v4, "_endAnimatedFullScreenExit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (v4)
    CFRelease(v4);
}

- (void)_completedExitFullScreen
{
  _BYTE *v3;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v4;
  char v5;
  _QWORD *v6;
  WebKit::WebFullScreenManagerProxy *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  _BYTE *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  void *m_ptr;
  const void *v18;
  uint64_t v19;
  WKWebView *v20;
  void *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  NSObject *var4;
  WTF *v25;
  void *v26;
  char *v27;
  unsigned __int8 *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t fullScreenState;
  void *v37;
  uint64_t i;
  WTF::StringImpl *v39;
  int v40;
  WTF::StringImpl *v41;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v42;
  uint64_t v43[4];
  WTF *v44[2];
  WTF::StringImpl *v45;
  WTF::StringImpl *v46;
  WTF::StringImpl *v47;
  WTF::StringImpl *v48;
  _BYTE buf[24];
  const void *v50;
  int v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  if (self->_fullScreenState == 5)
  {
    self->_fullScreenState = 0;
    if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
    {
      if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
      {
        v3 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
        v4 = -[WKFullScreenWindowController logChannel](self, "logChannel");
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        *(_QWORD *)&buf[16] = "-[WKFullScreenWindowController _completedExitFullScreen]";
        v50 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
        if (v3[12])
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v4, 0, (WTF::Logger::LogSiteIdentifier *)buf);
      }
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v5 = objc_msgSend(self->_window.m_ptr, "isKeyWindow");
    -[WKFullScreenWindowController _reinsertWebViewUnderPlaceholder](self, "_reinsertWebViewUnderPlaceholder");
    v6 = -[WKFullScreenWindowController _manager](self, "_manager");
    v7 = (WebKit::WebFullScreenManagerProxy *)v6;
    if (v6)
    {
      v8 = v6[3];
      v9 = *(_QWORD *)(v8 + 208);
      buf[0] = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::RestoreScrollPosition>(v9, (uint64_t)buf, *(_QWORD *)(*(_QWORD *)(v8 + 32) + 1896), 0);
      v10 = *((_QWORD *)v7 + 3);
      v11 = *(_QWORD *)(v10 + 208);
      buf[0] = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v11, buf, *(_QWORD *)(*(_QWORD *)(v10 + 32) + 1896), 0);
      WebKit::WebFullScreenManagerProxy::didExitFullScreen(v7);
    }
    if (-[WKFullScreenWindowController _videoPresentationManager](self, "_videoPresentationManager"))
    {
      WebKit::VideoPresentationManagerProxy::controlsManagerInterface((unsigned __int8 **)-[WKFullScreenWindowController _videoPresentationManager](self, "_videoPresentationManager"), v43);
      v12 = v43[0];
      if (v43[0])
      {
        if (*(_BYTE *)(v43[0] + 160))
          LOBYTE(v13) = 1;
        else
          v13 = (*(unsigned __int8 *)(v43[0] + 156) >> 1) & 1;
        goto LABEL_20;
      }
    }
    else
    {
      v12 = 0;
    }
    LOBYTE(v13) = 0;
LABEL_20:
    self->_shouldReturnToFullscreenFromPictureInPicture = v13;
    objc_msgSend(self->_window.m_ptr, "setHidden:", 1);
    m_ptr = self->_window.m_ptr;
    self->_window.m_ptr = 0;
    if (m_ptr)
      CFRelease(m_ptr);
    CFRetain(self);
    v18 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
    *(_QWORD *)&buf[15] = 0;
    *(_QWORD *)&buf[7] = 0;
    v19 = WTF::fastMalloc((WTF *)0x40);
    *(_QWORD *)v19 = &off_1E34CF4B0;
    *(_QWORD *)(v19 + 8) = self;
    *(_QWORD *)(v19 + 16) = self;
    *(_BYTE *)(v19 + 24) = v5;
    *(_OWORD *)(v19 + 25) = *(_OWORD *)buf;
    *(_QWORD *)(v19 + 40) = *(_QWORD *)&buf[15];
    *(_QWORD *)(v19 + 48) = "-[WKFullScreenWindowController _completedExitFullScreen]";
    *(_QWORD *)(v19 + 56) = v18;
    v44[0] = (WTF *)v19;
    v20 = -[WKFullScreenWindowController _webView](self, "_webView");
    if (v20
      && (-[WKWebView _page](v20, "_page"), *(_QWORD *)buf)
      && (*(_WORD *)(*(_QWORD *)(*(_QWORD *)buf + 32) + 48) & 2) != 0)
    {
      WebKit::WebPageProxy::updateRenderingWithForcedRepaint(*(uint64_t *)buf, (uint64_t *)v44);
    }
    else
    {
      v44[0] = 0;
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19);
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
    }
    objc_msgSend(self->_fullscreenViewController.m_ptr, "setPrefersStatusBarHidden:", 1);
    objc_msgSend(self->_fullscreenViewController.m_ptr, "invalidate");
    v21 = self->_fullscreenViewController.m_ptr;
    self->_fullscreenViewController.m_ptr = 0;
    if (v21)
      CFRelease(v21);
    if (v44[0])
      (*(void (**)(WTF *))(*(_QWORD *)v44[0] + 8))(v44[0]);
    if (v12)
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v12 + 64));
    return;
  }
  if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
  {
    if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v14 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v42 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      v43[0] = 0;
      v43[1] = 0;
      v43[2] = (uint64_t)"-[WKFullScreenWindowController _completedExitFullScreen]";
      v43[3] = (uint64_t)-[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v14[12])
      {
        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v43);
        WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v46, self->_fullScreenState);
        WTF::String::String((WTF::String *)&v45, " != ExitingFullScreen, dropping");
        WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v47, (uint64_t *)&v46, (uint64_t *)&v45, &v48);
        v16 = v45;
        v45 = 0;
        if (v16)
        {
          if (*(_DWORD *)v16 == 2)
            WTF::StringImpl::destroy(v16, v15);
          else
            *(_DWORD *)v16 -= 2;
        }
        v22 = v46;
        v46 = 0;
        if (v22)
        {
          if (*(_DWORD *)v22 == 2)
            WTF::StringImpl::destroy(v22, v15);
          else
            *(_DWORD *)v22 -= 2;
        }
        v23 = v47;
        v47 = 0;
        if (v23)
        {
          if (*(_DWORD *)v23 == 2)
            WTF::StringImpl::destroy(v23, v15);
          else
            *(_DWORD *)v23 -= 2;
        }
        var4 = v42->var4;
        v25 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v25)
        {
          WTF::String::utf8();
          v27 = v44[0] ? (char *)v44[0] + 16 : 0;
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v27;
          _os_log_impl(&dword_196BCC000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          v25 = v44[0];
          v44[0] = 0;
          if (v25)
          {
            if (*(_DWORD *)v25 == 1)
              v25 = (WTF *)WTF::fastFree(v25, v26);
            else
              --*(_DWORD *)v25;
          }
        }
        if (v42->var0)
        {
          v28 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
          while (1)
          {
            v29 = *v28;
            if ((v29 & 1) != 0)
              break;
            v30 = __ldaxr(v28);
            if (v30 == v29)
            {
              if (!__stxr(v29 | 1, v28))
              {
                v31 = WTF::Logger::observers(v25);
                v32 = *(unsigned int *)(v31 + 12);
                if ((_DWORD)v32)
                {
                  v33 = *(uint64_t **)v31;
                  v34 = *(_QWORD *)v31 + 8 * v32;
                  do
                  {
                    v35 = *v33;
                    *(_DWORD *)buf = 0;
                    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v43);
                    fullScreenState = self->_fullScreenState;
                    *(_DWORD *)&buf[16] = 0;
                    WTF::LogArgument<WebKit::FullScreenState>::toString((uint64_t)&v50, fullScreenState);
                    v51 = 0;
                    WTF::String::String((WTF::String *)v52, " != ExitingFullScreen, dropping");
                    WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v44, (uint64_t)buf, 3uLL);
                    (*(void (**)(uint64_t, $C8D0F0E4FA2D55374FC6C0BB194058F2 *, _QWORD, WTF **))(*(_QWORD *)v35 + 16))(v35, v42, 0, v44);
                    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v44, v37);
                    for (i = 40; i != -8; i -= 16)
                    {
                      v39 = *(WTF::StringImpl **)&buf[i];
                      *(_QWORD *)&buf[i] = 0;
                      if (v39)
                      {
                        if (*(_DWORD *)v39 == 2)
                          WTF::StringImpl::destroy(v39, (WTF::StringImpl *)v26);
                        else
                          *(_DWORD *)v39 -= 2;
                      }
                    }
                    ++v33;
                  }
                  while (v33 != (uint64_t *)v34);
                }
                v40 = __ldxr(v28);
                if (v40 == 1)
                {
                  if (!__stlxr(0, v28))
                    break;
                }
                else
                {
                  __clrex();
                }
                WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                break;
              }
            }
            else
            {
              __clrex();
            }
          }
        }
        v41 = v48;
        v48 = 0;
        if (v41)
        {
          if (*(_DWORD *)v41 == 2)
            WTF::StringImpl::destroy(v41, (WTF::StringImpl *)v26);
          else
            *(_DWORD *)v41 -= 2;
        }
      }
    }
  }
}

- (void)close
{
  _BYTE *v3;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const void *v8;

  if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
  {
    if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v3 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v4 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      v5 = 0;
      v6 = 0;
      v7 = "-[WKFullScreenWindowController close]";
      v8 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v3[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v4, 0, (WTF::Logger::LogSiteIdentifier *)&v5);
    }
  }
  -[WKFullScreenWindowController _exitFullscreenImmediately](self, "_exitFullscreenImmediately", v5, v6, v7, v8);
  -[WKFullScreenWindowController set_webView:](self, "set_webView:", 0);
}

- (void)webViewDidRemoveFromSuperviewWhileInFullscreen
{
  _BYTE *v3;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v4;
  _QWORD v5[4];

  if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
  {
    if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v3 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v4 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      v5[0] = 0;
      v5[1] = 0;
      v5[2] = "-[WKFullScreenWindowController webViewDidRemoveFromSuperviewWhileInFullscreen]";
      v5[3] = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v3[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebKit::FullScreenState>((uint64_t)v4, (WTF::Logger::LogSiteIdentifier *)v5, &self->_fullScreenState);
    }
  }
  if (self->_fullScreenState == 3
    && (void *)-[WKWebView window](-[WKFullScreenWindowController _webView](self, "_webView"), "window") != self->_window.m_ptr)
  {
    -[WKFullScreenWindowController _exitFullscreenImmediately](self, "_exitFullscreenImmediately");
  }
}

- (void)videoControlsManagerDidChange
{
  void *m_ptr;

  m_ptr = self->_fullscreenViewController.m_ptr;
  if (m_ptr)
    objc_msgSend(m_ptr, "videoControlsManagerDidChange");
}

- (void)placeholderWillMoveToSuperview:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  if (!a3)
  {
    WTF::RunLoop::main((WTF::RunLoop *)self);
    if (self)
      CFRetain(self);
    v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v4 = &off_1E34CF4D8;
    v4[1] = self;
    v4[2] = self;
    v5 = v4;
    WTF::RunLoop::dispatch();
    if (v5)
      (*(void (**)(_QWORD *))(*v5 + 8))(v5);
  }
}

- (void)didEnterPictureInPicture
{
  _BYTE *v3;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v4;
  _QWORD v5[4];

  if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
  {
    if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v3 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v4 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      v5[0] = 0;
      v5[1] = 0;
      v5[2] = "-[WKFullScreenWindowController didEnterPictureInPicture]";
      v5[3] = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v3[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebKit::FullScreenState>((uint64_t)v4, (WTF::Logger::LogSiteIdentifier *)v5, &self->_fullScreenState);
    }
  }
  self->_shouldReturnToFullscreenFromPictureInPicture = !self->_blocksReturnToFullscreenFromPictureInPicture;
  if (self->_fullScreenState == 3)
    -[WKFullScreenWindowController requestExitFullScreen](self, "requestExitFullScreen");
}

- (void)didExitPictureInPicture
{
  _BYTE *v3;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v4;
  unsigned __int8 **v5;
  _BYTE *v6;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  const char *v12;
  const void *v13;
  uint64_t v14;

  if (!self->_enterFullscreenNeedsExitPictureInPicture && self->_shouldReturnToFullscreenFromPictureInPicture)
  {
    if (-[WKFullScreenWindowController _videoPresentationManager](self, "_videoPresentationManager"))
    {
      WebKit::VideoPresentationManagerProxy::returningToStandbyInterface((uint64_t)-[WKFullScreenWindowController _videoPresentationManager](self, "_videoPresentationManager"), &v14);
      v5 = (unsigned __int8 **)v14;
      if (v14)
      {
        if (*(_BYTE *)(v14 + 206))
        {
          if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
          {
            if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
            {
              v6 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
              v7 = -[WKFullScreenWindowController logChannel](self, "logChannel");
              v10 = 0;
              v11 = 0;
              v12 = "-[WKFullScreenWindowController didExitPictureInPicture]";
              v13 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
              if (v6[12])
                WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [21]>((uint64_t)v7, (WTF::Logger::LogSiteIdentifier *)&v10, "returning to standby");
            }
          }
          if (self->_exitingFullScreen)
          {
            self->_enterRequested = 1;
          }
          else if (self->_fullScreenState == 3)
          {
            WebCore::VideoPresentationInterfaceIOS::preparedToReturnToStandby((WebCore::VideoPresentationInterfaceIOS *)v5);
          }
          else
          {
            WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<WebKit::RemoteAudioHardwareListener,(WTF::DestructionThread)0>::ref(v5 + 8);
            v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
            *v8 = &off_1E34CF500;
            v8[1] = v5;
            v10 = v8;
            -[WKFullScreenWindowController requestRestoreFullScreen:](self, "requestRestoreFullScreen:", &v10);
            v9 = v10;
            v10 = 0;
            if (v9)
              (*(void (**)(_QWORD *))(*v9 + 8))(v9);
          }
          self->_returnToFullscreenFromPictureInPicture = 1;
          WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(v5[8]);
          return;
        }
        WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v14 + 64));
      }
    }
  }
  if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr")
    && -[WKFullScreenWindowController logChannel](self, "logChannel"))
  {
    v3 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
    v4 = -[WKFullScreenWindowController logChannel](self, "logChannel");
    v10 = 0;
    v11 = 0;
    v12 = "-[WKFullScreenWindowController didExitPictureInPicture]";
    v13 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
    if (v3[12])
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v4, 0, (WTF::Logger::LogSiteIdentifier *)&v10);
  }
  self->_enterFullscreenNeedsExitPictureInPicture = 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  WKFullscreenAnimationController *v7;

  v7 = objc_alloc_init(WKFullscreenAnimationController);
  -[WKFullscreenAnimationController setViewController:](v7, "setViewController:", a3);
  -[WKFullscreenAnimationController setInitialFrame:](v7, "setInitialFrame:", self->_initialFrame.origin.x, self->_initialFrame.origin.y, self->_initialFrame.size.width, self->_initialFrame.size.height);
  -[WKFullscreenAnimationController setFinalFrame:](v7, "setFinalFrame:", self->_finalFrame.origin.x, self->_finalFrame.origin.y, self->_finalFrame.size.width, self->_finalFrame.size.height);
  -[WKFullscreenAnimationController setAnimatingIn:](v7, "setAnimatingIn:", 1);
  return (id)(id)CFMakeCollectable(v7);
}

- (id)animationControllerForDismissedController:(id)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  WKFullscreenAnimationController *v12;

  if (self->_inInteractiveDismiss)
    height = self->_finalFrame.size.height;
  else
    height = self->_initialFrame.size.height;
  if (self->_inInteractiveDismiss)
    width = self->_finalFrame.size.width;
  else
    width = self->_initialFrame.size.width;
  if (self->_inInteractiveDismiss)
    y = self->_finalFrame.origin.y;
  else
    y = self->_initialFrame.origin.y;
  if (self->_inInteractiveDismiss)
    x = self->_finalFrame.origin.x;
  else
    x = self->_initialFrame.origin.x;
  if (self->_inInteractiveDismiss)
    v8 = self->_initialFrame.size.height;
  else
    v8 = self->_finalFrame.size.height;
  if (self->_inInteractiveDismiss)
    v9 = self->_initialFrame.size.width;
  else
    v9 = self->_finalFrame.size.width;
  if (self->_inInteractiveDismiss)
    v10 = self->_initialFrame.origin.y;
  else
    v10 = self->_finalFrame.origin.y;
  if (self->_inInteractiveDismiss)
    v11 = self->_initialFrame.origin.x;
  else
    v11 = self->_finalFrame.origin.x;
  v12 = objc_alloc_init(WKFullscreenAnimationController);
  -[WKFullscreenAnimationController setViewController:](v12, "setViewController:", a3);
  -[WKFullscreenAnimationController setInitialFrame:](v12, "setInitialFrame:", x, y, width, height);
  -[WKFullscreenAnimationController setFinalFrame:](v12, "setFinalFrame:", v11, v10, v9, v8);
  -[WKFullscreenAnimationController setAnimatingIn:](v12, "setAnimatingIn:", 0);
  return (id)(id)CFMakeCollectable(v12);
}

- (id)interactionControllerForDismissal:(id)a3
{
  id result;
  double v6;
  double v7;
  double v8;
  double v9;
  void *m_ptr;

  if (!self->_inInteractiveDismiss)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  result = self->_interactiveDismissTransitionCoordinator.m_ptr;
  if (!result)
  {
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    if (objc_msgSend(self->_interactivePanDismissGestureRecognizer.m_ptr, "state") == 1)
    {
      objc_msgSend(self->_interactivePanDismissGestureRecognizer.m_ptr, "locationInView:", objc_msgSend(self->_fullscreenViewController.m_ptr, "view"));
      v6 = v8;
      v7 = v9;
    }
    result = -[WKFullScreenInteractiveTransition initWithAnimator:anchor:]([WKFullScreenInteractiveTransition alloc], "initWithAnimator:anchor:", a3, v6, v7);
    m_ptr = self->_interactiveDismissTransitionCoordinator.m_ptr;
    self->_interactiveDismissTransitionCoordinator.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return self->_interactiveDismissTransitionCoordinator.m_ptr;
    }
  }
  return result;
}

- (void)_exitFullscreenImmediately
{
  uint64_t *p_fullScreenState;
  int64_t fullScreenState;
  const void *v5;
  _BYTE *v6;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v7;
  WKWebView *v8;
  WebKit::WebPageProxy *v9;
  char v10;
  _BYTE *v11;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v12;
  _QWORD *v13;
  WebKit::WebFullScreenManagerProxy *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *m_ptr;
  void *v22;
  void *v23;
  WebKit::WebPageProxy *v24;
  uint64_t v25;
  const char *v26;
  const void *v27;

  p_fullScreenState = &self->_fullScreenState;
  fullScreenState = self->_fullScreenState;
  v5 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
  if (fullScreenState)
  {
    if (v5)
    {
      if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
      {
        v6 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
        v7 = -[WKFullScreenWindowController logChannel](self, "logChannel");
        v24 = 0;
        v25 = 0;
        v26 = "-[WKFullScreenWindowController _exitFullscreenImmediately]";
        v27 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
        if (v6[12])
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v7, 0, (WTF::Logger::LogSiteIdentifier *)&v24);
      }
    }
    self->_exitRequested = 0;
    self->_exitingFullScreen = 0;
    self->_fullScreenState = 0;
    self->_shouldReturnToFullscreenFromPictureInPicture = 0;
    v8 = -[WKFullScreenWindowController _webView](self, "_webView", v24, v25, v26, v27);
    if (v8)
    {
      -[WKWebView _page](v8, "_page");
      v9 = v24;
      if (v24)
      {
        WebKit::WebPageProxy::setSuppressVisibilityUpdates(v24, 1);
        v10 = 0;
LABEL_15:
        -[WKFullScreenWindowController _reinsertWebViewUnderPlaceholder](self, "_reinsertWebViewUnderPlaceholder");
        v13 = -[WKFullScreenWindowController _manager](self, "_manager");
        if (v13)
        {
          v14 = (WebKit::WebFullScreenManagerProxy *)v13;
          WebKit::WebFullScreenManagerProxy::requestExitFullScreen((WebKit::WebFullScreenManagerProxy *)v13);
          v15 = *((_QWORD *)v14 + 3);
          v16 = *(_QWORD *)(v15 + 208);
          LOBYTE(v24) = 1;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v16, &v24, *(_QWORD *)(*(_QWORD *)(v15 + 32) + 1896), 0);
          WebKit::WebFullScreenManagerProxy::willExitFullScreen(v14);
          v17 = *((_QWORD *)v14 + 3);
          v18 = *(_QWORD *)(v17 + 208);
          LOBYTE(v24) = 0;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::RestoreScrollPosition>(v18, (uint64_t)&v24, *(_QWORD *)(*(_QWORD *)(v17 + 32) + 1896), 0);
          v19 = *((_QWORD *)v14 + 3);
          v20 = *(_QWORD *)(v19 + 208);
          LOBYTE(v24) = 0;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v20, &v24, *(_QWORD *)(*(_QWORD *)(v19 + 32) + 1896), 0);
          WebKit::WebFullScreenManagerProxy::didExitFullScreen(v14);
        }
        objc_msgSend(self->_webViewPlaceholder.m_ptr, "removeFromSuperview");
        m_ptr = self->_webViewPlaceholder.m_ptr;
        self->_webViewPlaceholder.m_ptr = 0;
        if (m_ptr)
          CFRelease(m_ptr);
        objc_msgSend(self->_window.m_ptr, "setHidden:", 1);
        v22 = self->_window.m_ptr;
        self->_window.m_ptr = 0;
        if (v22)
          CFRelease(v22);
        if ((v10 & 1) == 0)
        {
          WebKit::WebPageProxy::setSuppressVisibilityUpdates(v9, 0);
          LOBYTE(v24) = 0;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetNeedsDOMWindowResizeEvent>(*((_QWORD *)v9 + 26), (uint64_t)&v24, *(_QWORD *)(*((_QWORD *)v9 + 4) + 1896), 0);
        }
        objc_msgSend(self->_fullscreenViewController.m_ptr, "setPrefersStatusBarHidden:", 1);
        objc_msgSend(self->_fullscreenViewController.m_ptr, "invalidate");
        v23 = self->_fullscreenViewController.m_ptr;
        self->_fullscreenViewController.m_ptr = 0;
        if (v23)
          CFRelease(v23);
        return;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = 1;
    goto LABEL_15;
  }
  if (v5)
  {
    if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v11 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v12 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      v24 = 0;
      v25 = 0;
      v26 = "-[WKFullScreenWindowController _exitFullscreenImmediately]";
      v27 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v11[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebKit::FullScreenState,char [11]>((uint64_t)v12, (WTF::Logger::LogSiteIdentifier *)&v24, p_fullScreenState);
    }
  }
}

- (void)_invalidateEVOrganizationName
{
  void *m_ptr;

  m_ptr = self->_EVOrganizationName.m_ptr;
  self->_EVOrganizationName.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  self->_EVOrganizationNameIsValid = 0;
}

- (BOOL)_isSecure
{
  return -[WKWebView hasOnlySecureContent](-[WKFullScreenWindowController _webView](self, "_webView"), "hasOnlySecureContent");
}

- (__SecTrust)_serverTrust
{
  return -[WKWebView serverTrust](-[WKFullScreenWindowController _webView](self, "_webView"), "serverTrust");
}

- (id)_EVOrganizationName
{
  void *v3;
  __SecTrust *v4;
  __SecTrust *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *m_ptr;

  if (!-[WKFullScreenWindowController _isSecure](self, "_isSecure"))
    return 0;
  if (self->_EVOrganizationNameIsValid)
    return self->_EVOrganizationName.m_ptr;
  self->_EVOrganizationNameIsValid = 1;
  v4 = -[WKFullScreenWindowController _serverTrust](self, "_serverTrust");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (void *)SecTrustCopyInfo();
  if (!v6)
  {
    v3 = 0;
    if (!SecTrustEvaluateWithError(v5, 0))
      return v3;
    v6 = (void *)SecTrustCopyInfo();
    if (!v6)
      return 0;
  }
  v7 = (void *)objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CD7050]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v7, "BOOLValue") & 1) != 0
    && (v8 = (void *)objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CD7068]),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CD7048]);
    v3 = v9;
    if (v9)
      CFRetain(v9);
    m_ptr = self->_EVOrganizationName.m_ptr;
    self->_EVOrganizationName.m_ptr = v3;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v3 = self->_EVOrganizationName.m_ptr;
    }
  }
  else
  {
    v3 = 0;
  }
  CFRelease(v6);
  return v3;
}

- (void)_updateLocationInfo
{
  NSURL *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = -[WKWebView _committedURL](-[WKFullScreenWindowController _webView](self, "_webView"), "_committedURL");
  v4 = -[WKFullScreenWindowController _EVOrganizationName](self, "_EVOrganizationName");
  v5 = -[__CFString length](v4, "length");
  v6 = -[NSURL _lp_simplifiedDisplayString](v3, "_lp_simplifiedDisplayString");
  v7 = -[NSString caseInsensitiveCompare:](-[NSURL scheme](v3, "scheme"), "caseInsensitiveCompare:", CFSTR("data"));
  if (v5)
    v8 = v4;
  else
    v8 = (const __CFString *)v6;
  if (v7)
    v9 = v8;
  else
    v9 = CFSTR("data:");
  objc_msgSend(self->_fullscreenViewController.m_ptr, "setLocation:", v9);
}

- (void)_manager
{
  void *result;
  uint64_t v3;

  result = -[WKFullScreenWindowController _webView](self, "_webView");
  if (result)
  {
    objc_msgSend(result, "_page");
    if (v3)
      return *(void **)(v3 + 360);
    else
      return 0;
  }
  return result;
}

- (void)_videoPresentationManager
{
  void *result;
  uint64_t v3;

  result = -[WKFullScreenWindowController _webView](self, "_webView");
  if (result)
  {
    objc_msgSend(result, "_page");
    if (v3)
      return *(void **)(v3 + 384);
    else
      return 0;
  }
  return result;
}

- (void)_startToDismissFullscreenChanged:(id)a3
{
  _BYTE *v4;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const void *v9;

  if (!self->_inInteractiveDismiss)
  {
    if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr", a3)
      && -[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v4 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v5 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      v6 = 0;
      v7 = 0;
      v8 = "-[WKFullScreenWindowController _startToDismissFullscreenChanged:]";
      v9 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v4[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v5, 0, (WTF::Logger::LogSiteIdentifier *)&v6);
    }
    self->_inInteractiveDismiss = 1;
    -[WKFullScreenWindowController _dismissFullscreenViewController](self, "_dismissFullscreenViewController", v6, v7, v8, v9);
  }
}

- (void)_dismissFullscreenViewController
{
  void *m_ptr;
  const void *v4;
  _BYTE *v5;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v6;
  const void *v7;
  void *v8;
  _BYTE *v9;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  NSObject *var4;
  WTF *v15;
  void *v16;
  char *v17;
  unsigned __int8 *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t i;
  WTF::StringImpl *v28;
  int v29;
  WTF::StringImpl *v30;
  _QWORD v31[6];
  _QWORD v32[4];
  WTF *v33[2];
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  WTF::StringImpl *v36;
  uint8_t buf[16];
  uint64_t v38;
  _QWORD v39[9];

  v39[7] = *MEMORY[0x1E0C80C00];
  m_ptr = self->_fullscreenViewController.m_ptr;
  v4 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
  if (m_ptr)
  {
    if (v4 && -[WKFullScreenWindowController logChannel](self, "logChannel"))
    {
      v5 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
      v6 = -[WKFullScreenWindowController logChannel](self, "logChannel");
      *(_OWORD *)buf = 0uLL;
      v38 = (uint64_t)"-[WKFullScreenWindowController _dismissFullscreenViewController]";
      v39[0] = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
      if (v5[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v6, 0, (WTF::Logger::LogSiteIdentifier *)buf);
    }
    objc_msgSend(self->_fullscreenViewController.m_ptr, "setAnimating:", 1);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    v38 = 0x5012000000;
    v39[0] = __Block_byref_object_copy__9;
    v39[1] = __Block_byref_object_dispose__9;
    v39[2] = &unk_197A0BBD2;
    v7 = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
    v39[3] = 0;
    v39[4] = 0;
    v39[5] = "-[WKFullScreenWindowController _dismissFullscreenViewController]";
    v39[6] = v7;
    v8 = self->_fullscreenViewController.m_ptr;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __64__WKFullScreenWindowController__dismissFullscreenViewController__block_invoke;
    v31[3] = &unk_1E34CF268;
    v31[4] = self;
    v31[5] = buf;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v31);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v4)
    {
      if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
      {
        v9 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
        v10 = -[WKFullScreenWindowController logChannel](self, "logChannel");
        v32[0] = 0;
        v32[1] = 0;
        v32[2] = "-[WKFullScreenWindowController _dismissFullscreenViewController]";
        v32[3] = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
        if (v9[12])
        {
          WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v32);
          WTF::String::String((WTF::String *)&v34, "no fullscreenViewController");
          *(_QWORD *)buf = v35;
          v33[0] = v34;
          WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v33, &v36);
          if (!v36)
          {
            __break(0xC471u);
            return;
          }
          v12 = v34;
          v34 = 0;
          if (v12)
          {
            if (*(_DWORD *)v12 == 2)
              WTF::StringImpl::destroy(v12, v11);
            else
              *(_DWORD *)v12 -= 2;
          }
          v13 = v35;
          v35 = 0;
          if (v13)
          {
            if (*(_DWORD *)v13 == 2)
              WTF::StringImpl::destroy(v13, v11);
            else
              *(_DWORD *)v13 -= 2;
          }
          var4 = v10->var4;
          v15 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v15)
          {
            WTF::String::utf8();
            v17 = v33[0] ? (char *)v33[0] + 16 : 0;
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = v17;
            _os_log_impl(&dword_196BCC000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            v15 = v33[0];
            v33[0] = 0;
            if (v15)
            {
              if (*(_DWORD *)v15 == 1)
                v15 = (WTF *)WTF::fastFree(v15, v16);
              else
                --*(_DWORD *)v15;
            }
          }
          if (v10->var0 && v10->var2)
          {
            v18 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
            while (1)
            {
              v19 = *v18;
              if ((v19 & 1) != 0)
                break;
              v20 = __ldaxr(v18);
              if (v20 == v19)
              {
                if (!__stxr(v19 | 1, v18))
                {
                  v21 = WTF::Logger::observers(v15);
                  v22 = *(unsigned int *)(v21 + 12);
                  if ((_DWORD)v22)
                  {
                    v23 = *(uint64_t **)v21;
                    v24 = *(_QWORD *)v21 + 8 * v22;
                    do
                    {
                      v25 = *v23;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v32);
                      LODWORD(v38) = 0;
                      WTF::String::String((WTF::String *)v39, "no fullscreenViewController");
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v33, (uint64_t)buf, 2uLL);
                      (*(void (**)(uint64_t, $C8D0F0E4FA2D55374FC6C0BB194058F2 *, uint64_t, WTF **))(*(_QWORD *)v25 + 16))(v25, v10, 1, v33);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v33, v26);
                      for (i = 24; i != -8; i -= 16)
                      {
                        v28 = *(WTF::StringImpl **)&buf[i];
                        *(_QWORD *)&buf[i] = 0;
                        if (v28)
                        {
                          if (*(_DWORD *)v28 == 2)
                            WTF::StringImpl::destroy(v28, (WTF::StringImpl *)v16);
                          else
                            *(_DWORD *)v28 -= 2;
                        }
                      }
                      ++v23;
                    }
                    while (v23 != (uint64_t *)v24);
                  }
                  v29 = __ldxr(v18);
                  if (v29 == 1)
                  {
                    if (!__stlxr(0, v18))
                      break;
                  }
                  else
                  {
                    __clrex();
                  }
                  WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                  break;
                }
              }
              else
              {
                __clrex();
              }
            }
          }
          v30 = v36;
          v36 = 0;
          if (v30)
          {
            if (*(_DWORD *)v30 == 2)
              WTF::StringImpl::destroy(v30, (WTF::StringImpl *)v16);
            else
              *(_DWORD *)v30 -= 2;
          }
        }
      }
    }
    -[WKFullScreenWindowController _completedExitFullScreen](self, "_completedExitFullScreen");
  }
}

void __64__WKFullScreenWindowController__dismissFullscreenViewController__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  id *v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_webView");
  if (v2)
  {
    objc_msgSend(v2, "_page");
    if (v9)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "loggerPtr"))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "logChannel"))
        {
          v3 = objc_msgSend(*(id *)(a1 + 32), "loggerPtr");
          v4 = objc_msgSend(*(id *)(a1 + 32), "logChannel");
          if (*(_BYTE *)(v3 + 12))
            WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [18]>(v4, (WTF::Logger::LogSiteIdentifier *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), "dismiss completed");
        }
      }
      v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "animator"), "context"), "transitionWasCancelled");
      v6 = *(id **)(a1 + 32);
      if (v5)
        objc_msgSend(v6[42], "setAnimating:", 0);
      else
        objc_msgSend(v6, "_completedExitFullScreen");
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const void **)(v7 + 360);
      *(_QWORD *)(v7 + 360) = 0;
      if (v8)
        CFRelease(v8);
    }
  }
}

- (void)_interactiveDismissChanged:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BYTE *v12;
  $C8D0F0E4FA2D55374FC6C0BB194058F2 *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  NSObject *var4;
  WTF *v18;
  void *v19;
  char *v20;
  unsigned __int8 *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t i;
  WTF::StringImpl *v31;
  int v32;
  WTF::StringImpl *v33;
  _QWORD v34[4];
  WTF *v35[2];
  WTF::StringImpl *v36;
  WTF::StringImpl *v37;
  WTF::StringImpl *v38;
  uint8_t buf[16];
  int v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  if (self->_inInteractiveDismiss)
  {
    objc_msgSend(self->_interactivePanDismissGestureRecognizer.m_ptr, "translationInView:", objc_msgSend(self->_fullscreenViewController.m_ptr, "view", a3));
    v5 = v4;
    v7 = v6;
    objc_msgSend(self->_interactivePanDismissGestureRecognizer.m_ptr, "velocityInView:", objc_msgSend(self->_fullscreenViewController.m_ptr, "view"));
    v9 = v8;
    objc_msgSend((id)objc_msgSend(self->_fullscreenViewController.m_ptr, "view"), "bounds");
    v11 = fmin(fmax(v7 / (v10 * 0.5), 0.0), 1.0);
    if (objc_msgSend(self->_interactivePanDismissGestureRecognizer.m_ptr, "state") != 3)
    {
      objc_msgSend(self->_interactiveDismissTransitionCoordinator.m_ptr, "updateInteractiveTransition:withTranslation:", v11, v5, v7);
      return;
    }
    self->_inInteractiveDismiss = 0;
    if (-[WKFullScreenWindowController loggerPtr](self, "loggerPtr"))
    {
      if (-[WKFullScreenWindowController logChannel](self, "logChannel"))
      {
        v12 = -[WKFullScreenWindowController loggerPtr](self, "loggerPtr");
        v13 = -[WKFullScreenWindowController logChannel](self, "logChannel");
        v34[0] = 0;
        v34[1] = 0;
        v34[2] = "-[WKFullScreenWindowController _interactiveDismissChanged:]";
        v34[3] = -[WKFullScreenWindowController logIdentifier](self, "logIdentifier");
        if (v12[12])
        {
          WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v34);
          WTF::String::String((WTF::String *)&v36, "ended");
          *(_QWORD *)buf = v37;
          v35[0] = v36;
          WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v35, &v38);
          if (!v38)
          {
            __break(0xC471u);
            return;
          }
          v15 = v36;
          v36 = 0;
          if (v15)
          {
            if (*(_DWORD *)v15 == 2)
              WTF::StringImpl::destroy(v15, v14);
            else
              *(_DWORD *)v15 -= 2;
          }
          v16 = v37;
          v37 = 0;
          if (v16)
          {
            if (*(_DWORD *)v16 == 2)
              WTF::StringImpl::destroy(v16, v14);
            else
              *(_DWORD *)v16 -= 2;
          }
          var4 = v13->var4;
          v18 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v18)
          {
            WTF::String::utf8();
            v20 = v35[0] ? (char *)v35[0] + 16 : 0;
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = v20;
            _os_log_impl(&dword_196BCC000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            v18 = v35[0];
            v35[0] = 0;
            if (v18)
            {
              if (*(_DWORD *)v18 == 1)
                v18 = (WTF *)WTF::fastFree(v18, v19);
              else
                --*(_DWORD *)v18;
            }
          }
          if (v13->var0)
          {
            v21 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
            while (1)
            {
              v22 = *v21;
              if ((v22 & 1) != 0)
                break;
              v23 = __ldaxr(v21);
              if (v23 == v22)
              {
                if (!__stxr(v22 | 1, v21))
                {
                  v24 = WTF::Logger::observers(v18);
                  v25 = *(unsigned int *)(v24 + 12);
                  if ((_DWORD)v25)
                  {
                    v26 = *(uint64_t **)v24;
                    v27 = *(_QWORD *)v24 + 8 * v25;
                    do
                    {
                      v28 = *v26;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v34);
                      v40 = 0;
                      WTF::String::String((WTF::String *)v41, "ended");
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v35, (uint64_t)buf, 2uLL);
                      (*(void (**)(uint64_t, $C8D0F0E4FA2D55374FC6C0BB194058F2 *, _QWORD, WTF **))(*(_QWORD *)v28 + 16))(v28, v13, 0, v35);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v35, v29);
                      for (i = 24; i != -8; i -= 16)
                      {
                        v31 = *(WTF::StringImpl **)&buf[i];
                        *(_QWORD *)&buf[i] = 0;
                        if (v31)
                        {
                          if (*(_DWORD *)v31 == 2)
                            WTF::StringImpl::destroy(v31, (WTF::StringImpl *)v19);
                          else
                            *(_DWORD *)v31 -= 2;
                        }
                      }
                      ++v26;
                    }
                    while (v26 != (uint64_t *)v27);
                  }
                  v32 = __ldxr(v21);
                  if (v32 == 1)
                  {
                    if (!__stlxr(0, v21))
                      break;
                  }
                  else
                  {
                    __clrex();
                  }
                  WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                  break;
                }
              }
              else
              {
                __clrex();
              }
            }
          }
          v33 = v38;
          v38 = 0;
          if (v33)
          {
            if (*(_DWORD *)v33 == 2)
              WTF::StringImpl::destroy(v33, (WTF::StringImpl *)v19);
            else
              *(_DWORD *)v33 -= 2;
          }
        }
      }
    }
    if (v11 <= 0.25 && (v11 <= 0.0 || v9 <= 5.0))
      objc_msgSend(self->_interactiveDismissTransitionCoordinator.m_ptr, "cancelInteractiveTransition");
    else
      -[WKFullScreenWindowController requestExitFullScreen](self, "requestExitFullScreen");
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  objc_msgSend(self->_fullscreenViewController.m_ptr, "showBanner", a3);
}

- (WKWebView)_webView
{
  return (WKWebView *)objc_loadWeak((id *)&self->__webView);
}

- (void)set_webView:(id)a3
{
  objc_storeWeak((id *)&self->__webView, a3);
}

- (void).cxx_destruct
{
  void *v3;
  Logger *m_ptr;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  WTF *value;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_destroyWeak((id *)&self->__webView);
  m_ptr = self->_logger.m_ptr;
  self->_logger.m_ptr = 0;
  if (m_ptr)
  {
    v5 = (unsigned int *)((char *)m_ptr + 8);
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
    {
      atomic_store(1u, (unsigned int *)m_ptr + 2);
      (*(void (**)(Logger *))(*(_QWORD *)m_ptr + 8))(m_ptr);
    }
  }
  v8 = self->_notificationListener.m_ptr;
  self->_notificationListener.m_ptr = 0;
  if (v8)
    CFRelease(v8);
  v9 = self->_EVOrganizationName.m_ptr;
  self->_EVOrganizationName.m_ptr = 0;
  if (v9)
    CFRelease(v9);
  value = (WTF *)self->_pipObserver.__ptr_.__value_;
  self->_pipObserver.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<WTF::Observer<void ()(BOOL)>>::operator()[abi:sn180100](value, v3);
  v11 = self->_interactiveDismissTransitionCoordinator.m_ptr;
  self->_interactiveDismissTransitionCoordinator.m_ptr = 0;
  if (v11)
    CFRelease(v11);
  v12 = self->_interactivePanDismissGestureRecognizer.m_ptr;
  self->_interactivePanDismissGestureRecognizer.m_ptr = 0;
  if (v12)
    CFRelease(v12);
  v13 = self->_startDismissGestureRecognizer.m_ptr;
  self->_startDismissGestureRecognizer.m_ptr = 0;
  if (v13)
    CFRelease(v13);
  v14 = self->_fullscreenViewController.m_ptr;
  self->_fullscreenViewController.m_ptr = 0;
  if (v14)
    CFRelease(v14);
  v15 = self->_viewControllerForPresentation.m_ptr;
  self->_viewControllerForPresentation.m_ptr = 0;
  if (v15)
    CFRelease(v15);
  v16 = self->_rootViewController.m_ptr;
  self->_rootViewController.m_ptr = 0;
  if (v16)
    CFRelease(v16);
  v17 = self->_window.m_ptr;
  self->_window.m_ptr = 0;
  if (v17)
    CFRelease(v17);
  v18 = self->_webViewPlaceholder.m_ptr;
  self->_webViewPlaceholder.m_ptr = 0;
  if (v18)
    CFRelease(v18);
}

- (id).cxx_construct
{
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD *v11;

  *((_QWORD *)self + 1) = 0;
  *((_DWORD *)self + 6) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)self + 2) = _Q0;
  *((_OWORD *)self + 3) = _Q0;
  *((_BYTE *)self + 64) = 0;
  v7 = (_OWORD *)MEMORY[0x1E0CEB4B0];
  v8 = *MEMORY[0x1E0CEB4B0];
  v9 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  *(_OWORD *)((char *)self + 72) = *MEMORY[0x1E0CEB4B0];
  *(_OWORD *)((char *)self + 88) = v9;
  *((_BYTE *)self + 104) = 0;
  *(_OWORD *)((char *)self + 152) = v8;
  *((_OWORD *)self + 7) = v8;
  *((_OWORD *)self + 8) = v9;
  *((_QWORD *)self + 18) = 15;
  *(_OWORD *)((char *)self + 168) = v9;
  *((_BYTE *)self + 184) = 0;
  *((_QWORD *)self + 24) = 0;
  *(_OWORD *)((char *)self + 200) = *MEMORY[0x1E0C9D538];
  *((_WORD *)self + 108) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_BYTE *)self + 232) = 0;
  v10 = v7[1];
  *((_OWORD *)self + 15) = *v7;
  *((_OWORD *)self + 16) = v10;
  *((_BYTE *)self + 272) = 0;
  v11 = (_OWORD *)MEMORY[0x1E0C9D820];
  *(_OWORD *)((char *)self + 280) = *MEMORY[0x1E0C9D820];
  *(_OWORD *)((char *)self + 296) = *v11;
  *((_QWORD *)self + 58) = 0;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *((_QWORD *)self + 60) = 0;
  *((_QWORD *)self + 61) = 0;
  return self;
}

- (const)logIdentifier
{
  return self->_logIdentifier;
}

- (const)loggerPtr
{
  return self->_logger.m_ptr;
}

- ($C8D0F0E4FA2D55374FC6C0BB194058F2)logChannel
{
  return ($C8D0F0E4FA2D55374FC6C0BB194058F2 *)&WebKit2LogFullscreen;
}

- (uint64_t)enterFullScreen:(uint64_t)a1
{
  *(_QWORD *)a1 = off_1E34CF418;
  objc_destroyWeak((id *)(a1 + 48));
  return a1;
}

- (uint64_t)enterFullScreen:(id *)a1
{
  void *v2;

  *a1 = off_1E34CF418;
  objc_destroyWeak(a1 + 6);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)enterFullScreen:(void *)a3
{
  id WeakRetained;
  const void *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  WTF::StringImpl *v27;
  WTF::StringImpl *v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  NSObject *v31;
  WTF *v32;
  void *v33;
  char *v34;
  unsigned __int8 *v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  uint64_t i;
  WTF::StringImpl *v44;
  WTF::StringImpl *v45;
  NSObject *v46;
  WTF *v47;
  char *v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t j;
  WTF::StringImpl *v58;
  int v59;
  WTF::StringImpl *v60;
  WTF::StringImpl *v61;
  NSObject *v62;
  WTF *v63;
  void *v64;
  char *v65;
  WTF::StringImpl *v66;
  NSObject *v67;
  WTF *v68;
  void *v69;
  char *v70;
  unsigned __int8 *v71;
  int v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t k;
  WTF::StringImpl *v81;
  int v82;
  unsigned __int8 *v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t m;
  WTF::StringImpl *v93;
  int v94;
  WTF::StringImpl *v95;
  WTF::StringImpl *v96;
  uint64_t v97;
  uint64_t v98;
  const void *v99;
  const void *v100;
  const void *v101;
  uint64_t v102;
  WTF::Logger::LogSiteIdentifier *v103;
  WTF::StringImpl *v104;
  WTF *v105[2];
  WTF::StringImpl *v106;
  WTF::StringImpl *v107;
  WTF::StringImpl *v108;
  uint8_t buf[16];
  int v110;
  _DWORD v111[4];
  _QWORD v112[3];

  v112[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = *(_BYTE **)(a1 + 40);
    if (a3)
    {
      if (objc_msgSend(v8, "loggerPtr"))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "logChannel"))
        {
          v9 = objc_msgSend(*(id *)(a1 + 40), "loggerPtr");
          v10 = objc_msgSend(*(id *)(a1 + 40), "logChannel");
          if (*(_BYTE *)(v9 + 12))
          {
            v11 = v10;
            WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 8));
            WTF::String::String((WTF::String *)&v106, "request for window scene failed with error: ");
            MEMORY[0x19AEABCC8](&v104, objc_msgSend(a3, "localizedDescription"));
            WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v107, (uint64_t *)&v106, (uint64_t *)&v104, &v108);
            v13 = v104;
            v104 = 0;
            if (v13)
            {
              if (*(_DWORD *)v13 == 2)
                WTF::StringImpl::destroy(v13, v12);
              else
                *(_DWORD *)v13 -= 2;
            }
            v29 = v106;
            v106 = 0;
            if (v29)
            {
              if (*(_DWORD *)v29 == 2)
                WTF::StringImpl::destroy(v29, v12);
              else
                *(_DWORD *)v29 -= 2;
            }
            v30 = v107;
            v107 = 0;
            if (v30)
            {
              if (*(_DWORD *)v30 == 2)
                WTF::StringImpl::destroy(v30, v12);
              else
                *(_DWORD *)v30 -= 2;
            }
            v31 = *(NSObject **)(v11 + 32);
            v32 = (WTF *)os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v32)
            {
              WTF::String::utf8();
              v34 = v105[0] ? (char *)v105[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v34;
              _os_log_impl(&dword_196BCC000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              v32 = v105[0];
              v105[0] = 0;
              if (v32)
              {
                if (*(_DWORD *)v32 == 1)
                  v32 = (WTF *)WTF::fastFree(v32, v33);
                else
                  --*(_DWORD *)v32;
              }
            }
            if (*(_BYTE *)v11 && *(_BYTE *)(v11 + 16))
            {
              v35 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
              while (1)
              {
                v36 = *v35;
                if ((v36 & 1) != 0)
                  break;
                v37 = __ldaxr(v35);
                if (v37 == v36)
                {
                  if (!__stxr(v36 | 1, v35))
                  {
                    v99 = v7;
                    v38 = WTF::Logger::observers(v32);
                    v39 = *(unsigned int *)(v38 + 12);
                    if ((_DWORD)v39)
                    {
                      v40 = *(uint64_t **)v38;
                      v102 = *(_QWORD *)v38 + 8 * v39;
                      do
                      {
                        v41 = *v40;
                        *(_DWORD *)buf = 0;
                        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 8));
                        v110 = 0;
                        WTF::String::String((WTF::String *)v111, "request for window scene failed with error: ");
                        v111[2] = 0;
                        MEMORY[0x19AEABCC8](v112, objc_msgSend(a3, "localizedDescription"));
                        WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v105, (uint64_t)buf, 3uLL);
                        (*(void (**)(uint64_t, uint64_t, uint64_t, WTF **))(*(_QWORD *)v41 + 16))(v41, v11, 1, v105);
                        WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v105, v42);
                        for (i = 40; i != -8; i -= 16)
                        {
                          v44 = *(WTF::StringImpl **)&buf[i];
                          *(_QWORD *)&buf[i] = 0;
                          if (v44)
                          {
                            if (*(_DWORD *)v44 == 2)
                              WTF::StringImpl::destroy(v44, (WTF::StringImpl *)v33);
                            else
                              *(_DWORD *)v44 -= 2;
                          }
                        }
                        ++v40;
                      }
                      while (v40 != (uint64_t *)v102);
                    }
                    goto LABEL_96;
                  }
                }
                else
                {
                  __clrex();
                }
              }
            }
LABEL_101:
            v60 = v108;
            v108 = 0;
            if (v60)
            {
              if (*(_DWORD *)v60 == 2)
                WTF::StringImpl::destroy(v60, (WTF::StringImpl *)v33);
              else
                *(_DWORD *)v60 -= 2;
            }
          }
        }
      }
LABEL_105:
      objc_msgSend(*(id *)(a1 + 40), "_exitFullscreenImmediately");
LABEL_106:
      CFRelease(v7);
      return;
    }
    if (v8[474])
    {
      if (!objc_msgSend(v8, "loggerPtr"))
        goto LABEL_105;
      if (!objc_msgSend(*(id *)(a1 + 40), "logChannel"))
        goto LABEL_105;
      v14 = objc_msgSend(*(id *)(a1 + 40), "loggerPtr");
      v15 = objc_msgSend(*(id *)(a1 + 40), "logChannel");
      if (!*(_BYTE *)(v14 + 12))
        goto LABEL_105;
      v16 = v15;
      WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 8));
      WTF::String::String((WTF::String *)&v106, "received window scene but exit requested");
      *(_QWORD *)buf = v107;
      v105[0] = v106;
      WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v105, &v108);
      if (v108)
      {
        v18 = v106;
        v106 = 0;
        if (v18)
        {
          if (*(_DWORD *)v18 == 2)
            WTF::StringImpl::destroy(v18, v17);
          else
            *(_DWORD *)v18 -= 2;
        }
        v45 = v107;
        v107 = 0;
        if (v45)
        {
          if (*(_DWORD *)v45 == 2)
            WTF::StringImpl::destroy(v45, v17);
          else
            *(_DWORD *)v45 -= 2;
        }
        v46 = *(NSObject **)(v16 + 32);
        v47 = (WTF *)os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v47)
        {
          WTF::String::utf8();
          v48 = v105[0] ? (char *)v105[0] + 16 : 0;
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v48;
          _os_log_impl(&dword_196BCC000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          v47 = v105[0];
          v105[0] = 0;
          if (v47)
          {
            if (*(_DWORD *)v47 == 1)
              v47 = (WTF *)WTF::fastFree(v47, v33);
            else
              --*(_DWORD *)v47;
          }
        }
        if (*(_BYTE *)v16)
        {
          v35 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
          while (1)
          {
            v49 = *v35;
            if ((v49 & 1) != 0)
              break;
            v50 = __ldaxr(v35);
            if (v50 == v49)
            {
              if (!__stxr(v49 | 1, v35))
              {
                v99 = v7;
                v51 = WTF::Logger::observers(v47);
                v52 = *(unsigned int *)(v51 + 12);
                if ((_DWORD)v52)
                {
                  v53 = *(uint64_t **)v51;
                  v54 = *(_QWORD *)v51 + 8 * v52;
                  do
                  {
                    v55 = *v53;
                    *(_DWORD *)buf = 0;
                    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 8));
                    v110 = 0;
                    WTF::String::String((WTF::String *)v111, "received window scene but exit requested");
                    WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v105, (uint64_t)buf, 2uLL);
                    (*(void (**)(uint64_t, uint64_t, _QWORD, WTF **))(*(_QWORD *)v55 + 16))(v55, v16, 0, v105);
                    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v105, v56);
                    for (j = 24; j != -8; j -= 16)
                    {
                      v58 = *(WTF::StringImpl **)&buf[j];
                      *(_QWORD *)&buf[j] = 0;
                      if (v58)
                      {
                        if (*(_DWORD *)v58 == 2)
                          WTF::StringImpl::destroy(v58, (WTF::StringImpl *)v33);
                        else
                          *(_DWORD *)v58 -= 2;
                      }
                    }
                    ++v53;
                  }
                  while (v53 != (uint64_t *)v54);
                }
LABEL_96:
                v59 = __ldxr(v35);
                if (v59 == 1)
                {
                  v7 = v99;
                  if (!__stlxr(0, v35))
                    goto LABEL_101;
                }
                else
                {
                  __clrex();
                  v7 = v99;
                }
                WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                goto LABEL_101;
              }
            }
            else
            {
              __clrex();
            }
          }
        }
        goto LABEL_101;
      }
LABEL_193:
      __break(0xC471u);
      JUMPOUT(0x1972C91ACLL);
    }
    v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "view"), "window"), "windowScene");
    v20 = *(void **)(a1 + 40);
    if (v19)
    {
      if (objc_msgSend(v20, "loggerPtr"))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "logChannel"))
        {
          v21 = objc_msgSend(*(id *)(a1 + 40), "loggerPtr");
          v103 = (WTF::Logger::LogSiteIdentifier *)objc_msgSend(*(id *)(a1 + 40), "logChannel");
          if (*(_BYTE *)(v21 + 12))
          {
            WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 8));
            WTF::String::String((WTF::String *)&v106, "using window scene from presenting view controller");
            *(_QWORD *)buf = v107;
            v105[0] = v106;
            WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v105, &v108);
            if (!v108)
            {
              __break(0xC471u);
              JUMPOUT(0x1972C91B4);
            }
            v23 = v106;
            v106 = 0;
            if (v23)
            {
              if (*(_DWORD *)v23 == 2)
                WTF::StringImpl::destroy(v23, v22);
              else
                *(_DWORD *)v23 -= 2;
            }
            v61 = v107;
            v107 = 0;
            if (v61)
            {
              if (*(_DWORD *)v61 == 2)
                WTF::StringImpl::destroy(v61, v22);
              else
                *(_DWORD *)v61 -= 2;
            }
            v62 = *((_QWORD *)v103 + 4);
            v63 = (WTF *)os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v63)
            {
              WTF::String::utf8();
              v65 = v105[0] ? (char *)v105[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v65;
              _os_log_impl(&dword_196BCC000, v62, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              v63 = v105[0];
              v105[0] = 0;
              if (v63)
              {
                if (*(_DWORD *)v63 == 1)
                  v63 = (WTF *)WTF::fastFree(v63, v64);
                else
                  --*(_DWORD *)v63;
              }
            }
            if (*(_BYTE *)v103)
            {
              v71 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
              while (1)
              {
                v72 = *v71;
                if ((v72 & 1) != 0)
                  break;
                v73 = __ldaxr(v71);
                if (v73 == v72)
                {
                  if (!__stxr(v72 | 1, v71))
                  {
                    v100 = v7;
                    v74 = WTF::Logger::observers(v63);
                    v75 = *(unsigned int *)(v74 + 12);
                    if ((_DWORD)v75)
                    {
                      v76 = *(uint64_t **)v74;
                      v77 = *(_QWORD *)v74 + 8 * v75;
                      do
                      {
                        v78 = *v76;
                        *(_DWORD *)buf = 0;
                        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 8));
                        v110 = 0;
                        WTF::String::String((WTF::String *)v111, "using window scene from presenting view controller");
                        WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v105, (uint64_t)buf, 2uLL);
                        (*(void (**)(uint64_t, WTF::Logger::LogSiteIdentifier *, _QWORD, WTF **))(*(_QWORD *)v78 + 16))(v78, v103, 0, v105);
                        WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v105, v79);
                        for (k = 24; k != -8; k -= 16)
                        {
                          v81 = *(WTF::StringImpl **)&buf[k];
                          *(_QWORD *)&buf[k] = 0;
                          if (v81)
                          {
                            if (*(_DWORD *)v81 == 2)
                              WTF::StringImpl::destroy(v81, (WTF::StringImpl *)v64);
                            else
                              *(_DWORD *)v81 -= 2;
                          }
                        }
                        ++v76;
                      }
                      while (v76 != (uint64_t *)v77);
                    }
                    v82 = __ldxr(v71);
                    if (v82 == 1)
                    {
                      v7 = v100;
                      if (!__stlxr(0, v71))
                        break;
                    }
                    else
                    {
                      __clrex();
                      v7 = v100;
                    }
                    WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                    break;
                  }
                }
                else
                {
                  __clrex();
                }
              }
            }
            v95 = v108;
            v108 = 0;
            if (v95)
            {
              if (*(_DWORD *)v95 == 2)
                WTF::StringImpl::destroy(v95, (WTF::StringImpl *)v64);
              else
                *(_DWORD *)v95 -= 2;
            }
          }
        }
      }
    }
    else
    {
      if (objc_msgSend(v20, "loggerPtr"))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "logChannel"))
        {
          v24 = objc_msgSend(*(id *)(a1 + 40), "loggerPtr");
          v25 = objc_msgSend(*(id *)(a1 + 40), "logChannel");
          if (*(_BYTE *)(v24 + 12))
          {
            v26 = v25;
            WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 8));
            WTF::String::String((WTF::String *)&v106, "using window scene from web view");
            *(_QWORD *)buf = v107;
            v105[0] = v106;
            WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v105, &v108);
            if (!v108)
              goto LABEL_193;
            v28 = v106;
            v106 = 0;
            if (v28)
            {
              if (*(_DWORD *)v28 == 2)
                WTF::StringImpl::destroy(v28, v27);
              else
                *(_DWORD *)v28 -= 2;
            }
            v66 = v107;
            v107 = 0;
            if (v66)
            {
              if (*(_DWORD *)v66 == 2)
                WTF::StringImpl::destroy(v66, v27);
              else
                *(_DWORD *)v66 -= 2;
            }
            v67 = *(NSObject **)(v26 + 32);
            v68 = (WTF *)os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v68)
            {
              WTF::String::utf8();
              v70 = v105[0] ? (char *)v105[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v70;
              _os_log_impl(&dword_196BCC000, v67, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              v68 = v105[0];
              v105[0] = 0;
              if (v68)
              {
                if (*(_DWORD *)v68 == 1)
                  v68 = (WTF *)WTF::fastFree(v68, v69);
                else
                  --*(_DWORD *)v68;
              }
            }
            if (*(_BYTE *)v26)
            {
              v83 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
              while (1)
              {
                v84 = *v83;
                if ((v84 & 1) != 0)
                  break;
                v85 = __ldaxr(v83);
                if (v85 == v84)
                {
                  if (!__stxr(v84 | 1, v83))
                  {
                    v101 = v7;
                    v86 = WTF::Logger::observers(v68);
                    v87 = *(unsigned int *)(v86 + 12);
                    if ((_DWORD)v87)
                    {
                      v88 = *(uint64_t **)v86;
                      v89 = *(_QWORD *)v86 + 8 * v87;
                      do
                      {
                        v90 = *v88;
                        *(_DWORD *)buf = 0;
                        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 8));
                        v110 = 0;
                        WTF::String::String((WTF::String *)v111, "using window scene from web view");
                        WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v105, (uint64_t)buf, 2uLL);
                        (*(void (**)(uint64_t, uint64_t, _QWORD, WTF **))(*(_QWORD *)v90 + 16))(v90, v26, 0, v105);
                        WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v105, v91);
                        for (m = 24; m != -8; m -= 16)
                        {
                          v93 = *(WTF::StringImpl **)&buf[m];
                          *(_QWORD *)&buf[m] = 0;
                          if (v93)
                          {
                            if (*(_DWORD *)v93 == 2)
                              WTF::StringImpl::destroy(v93, (WTF::StringImpl *)v69);
                            else
                              *(_DWORD *)v93 -= 2;
                          }
                        }
                        ++v88;
                      }
                      while (v88 != (uint64_t *)v89);
                    }
                    v94 = __ldxr(v83);
                    if (v94 == 1)
                    {
                      v7 = v101;
                      if (!__stlxr(0, v83))
                        break;
                    }
                    else
                    {
                      __clrex();
                      v7 = v101;
                    }
                    WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                    break;
                  }
                }
                else
                {
                  __clrex();
                }
              }
            }
            v96 = v108;
            v108 = 0;
            if (v96)
            {
              if (*(_DWORD *)v96 == 2)
                WTF::StringImpl::destroy(v96, (WTF::StringImpl *)v69);
              else
                *(_DWORD *)v96 -= 2;
            }
          }
        }
      }
      v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_webView"), "window"), "windowScene");
      if (!v19)
      {
        if (objc_msgSend(*(id *)(a1 + 40), "loggerPtr"))
        {
          if (objc_msgSend(*(id *)(a1 + 40), "logChannel"))
          {
            v97 = objc_msgSend(*(id *)(a1 + 40), "loggerPtr");
            v98 = objc_msgSend(*(id *)(a1 + 40), "logChannel");
            if (*(_BYTE *)(v97 + 12))
              WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [30]>(v98, 1u, (WTF::Logger::LogSiteIdentifier *)(a1 + 8), "failed to find a window scene");
          }
        }
        objc_msgSend(*(id *)(a1 + 40), "_exitFullscreenImmediately");
        goto LABEL_106;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_enterFullScreen:windowScene:", v19, *(double *)(a1 + 56), *(double *)(a1 + 64));
    goto LABEL_106;
  }
}

- (_QWORD)beganExitFullScreenWithInitialFrame:(_QWORD *)a1 finalFrame:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34CF488;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)beganExitFullScreenWithInitialFrame:(WTF *)this finalFrame:(void *)a2
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34CF488;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (void)beganExitFullScreenWithInitialFrame:(uint64_t)a1 finalFrame:
{
  void *v2;
  uint64_t v3;
  const void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 16) + 336), "setPrefersStatusBarHidden:", 0);
  v2 = *(void **)(*(_QWORD *)(a1 + 16) + 360);
  if (v2)
  {
    objc_msgSend(v2, "finishInteractiveTransition");
    v3 = *(_QWORD *)(a1 + 16);
    v4 = *(const void **)(v3 + 360);
    *(_QWORD *)(v3 + 360) = 0;
    if (v4)
      CFRelease(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 16), "_dismissFullscreenViewController");
  }
}

- (_QWORD)_completedExitFullScreen
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34CF4B0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_completedExitFullScreen
{
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  NSObject *v13;
  WTF *v14;
  void *v15;
  char *v16;
  unsigned __int8 *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t i;
  WTF::StringImpl *v27;
  int v28;
  WTF::StringImpl *v29;
  void *v30;
  uint64_t v31;
  WTF *v32[2];
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  _BYTE buf[12];
  int v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 16) + 8), "setParent:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 16) + 8), "removeFromSuperview");
  v2 = (void *)objc_msgSend(*(id *)(a1 + 16), "_webView");
  if (v2)
  {
    objc_msgSend(v2, "_page");
    if (*(_QWORD *)buf)
    {
      WebKit::WebPageProxy::setSuppressVisibilityUpdates(*(WebKit::WebPageProxy **)buf, 0);
      LOBYTE(v32[0]) = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetNeedsDOMWindowResizeEvent>(*(_QWORD *)(*(_QWORD *)buf + 208), (uint64_t)v32, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)buf + 32) + 1896), 0);
    }
  }
  v3 = *(_BYTE **)(a1 + 16);
  v3[474] = 0;
  v3[476] = 0;
  if (v3[475])
  {
    v3[475] = 0;
    if (objc_msgSend(v3, "loggerPtr"))
    {
      if (objc_msgSend(*(id *)(a1 + 16), "logChannel"))
      {
        v4 = objc_msgSend(*(id *)(a1 + 16), "loggerPtr");
        v5 = objc_msgSend(*(id *)(a1 + 16), "logChannel");
        if (*(_BYTE *)(v4 + 12))
        {
          v6 = v5;
          WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 32));
          WTF::String::String((WTF::String *)&v33, "repaint completed, enter requested");
          *(_QWORD *)buf = v34;
          v32[0] = v33;
          result = WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v32, &v35);
          if (!v35)
          {
            __break(0xC471u);
            return result;
          }
          v9 = v33;
          v33 = 0;
          if (v9)
          {
            if (*(_DWORD *)v9 == 2)
              WTF::StringImpl::destroy(v9, v8);
            else
              *(_DWORD *)v9 -= 2;
          }
          v12 = v34;
          v34 = 0;
          if (v12)
          {
            if (*(_DWORD *)v12 == 2)
              WTF::StringImpl::destroy(v12, v8);
            else
              *(_DWORD *)v12 -= 2;
          }
          v13 = *(NSObject **)(v6 + 32);
          v14 = (WTF *)os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v14)
          {
            WTF::String::utf8();
            v16 = v32[0] ? (char *)v32[0] + 16 : 0;
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = v16;
            _os_log_impl(&dword_196BCC000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            v14 = v32[0];
            v32[0] = 0;
            if (v14)
            {
              if (*(_DWORD *)v14 == 1)
                v14 = (WTF *)WTF::fastFree(v14, v15);
              else
                --*(_DWORD *)v14;
            }
          }
          if (*(_BYTE *)v6)
          {
            v17 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
            while (1)
            {
              v18 = *v17;
              if ((v18 & 1) != 0)
                break;
              v19 = __ldaxr(v17);
              if (v19 == v18)
              {
                if (!__stxr(v18 | 1, v17))
                {
                  v20 = WTF::Logger::observers(v14);
                  v21 = *(unsigned int *)(v20 + 12);
                  if ((_DWORD)v21)
                  {
                    v22 = *(uint64_t **)v20;
                    v23 = *(_QWORD *)v20 + 8 * v21;
                    do
                    {
                      v24 = *v22;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)(a1 + 32));
                      v37 = 0;
                      WTF::String::String((WTF::String *)v38, "repaint completed, enter requested");
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v32, (uint64_t)buf, 2uLL);
                      (*(void (**)(uint64_t, uint64_t, _QWORD, WTF **))(*(_QWORD *)v24 + 16))(v24, v6, 0, v32);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v32, v25);
                      for (i = 24; i != -8; i -= 16)
                      {
                        v27 = *(WTF::StringImpl **)&buf[i];
                        *(_QWORD *)&buf[i] = 0;
                        if (v27)
                        {
                          if (*(_DWORD *)v27 == 2)
                            WTF::StringImpl::destroy(v27, (WTF::StringImpl *)v15);
                          else
                            *(_DWORD *)v27 -= 2;
                        }
                      }
                      ++v22;
                    }
                    while (v22 != (uint64_t *)v23);
                  }
                  v28 = __ldxr(v17);
                  if (v28 == 1)
                  {
                    if (!__stlxr(0, v17))
                      break;
                  }
                  else
                  {
                    __clrex();
                  }
                  WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                  break;
                }
              }
              else
              {
                __clrex();
              }
            }
          }
          v29 = v35;
          v35 = 0;
          if (v29)
          {
            if (*(_DWORD *)v29 == 2)
              WTF::StringImpl::destroy(v29, (WTF::StringImpl *)v15);
            else
              *(_DWORD *)v29 -= 2;
          }
        }
      }
    }
    v30 = *(void **)(a1 + 16);
    *(_QWORD *)buf = 0;
    objc_msgSend(v30, "requestRestoreFullScreen:", buf);
    v31 = *(_QWORD *)buf;
    *(_QWORD *)buf = 0;
    if (v31)
      (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
  }
  else if (objc_msgSend(v3, "loggerPtr"))
  {
    if (objc_msgSend(*(id *)(a1 + 16), "logChannel"))
    {
      v10 = objc_msgSend(*(id *)(a1 + 16), "loggerPtr");
      v11 = objc_msgSend(*(id *)(a1 + 16), "logChannel");
      if (*(_BYTE *)(v10 + 12))
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [18]>(v11, (WTF::Logger::LogSiteIdentifier *)(a1 + 32), "repaint completed");
    }
  }
  if (*(_BYTE *)(a1 + 24))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "_webView"), "window"), "makeKeyWindow");
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (_QWORD)placeholderWillMoveToSuperview:(_QWORD *)a1
{
  const void *v2;

  *a1 = &off_1E34CF4D8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)placeholderWillMoveToSuperview:(WTF *)this
{
  const void *v3;

  *(_QWORD *)this = &off_1E34CF4D8;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (void)placeholderWillMoveToSuperview:(uint64_t)a1
{
  void *result;

  result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 8), "superview");
  if (!result)
  {
    result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 8), "parent");
    if (result == *(void **)(a1 + 8))
      return (void *)objc_msgSend(result, "close");
  }
  return result;
}

- (_QWORD)didExitPictureInPicture
{
  uint64_t v2;

  v2 = a1[1];
  *a1 = &off_1E34CF500;
  a1[1] = 0;
  if (v2)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v2 + 64));
  return a1;
}

- (uint64_t)didExitPictureInPicture
{
  if ((a2 & 1) == 0)
    return WebCore::VideoPresentationInterfaceIOS::failedToRestoreFullscreen(*(WebCore::VideoPresentationInterfaceIOS **)(result + 8));
  return result;
}

@end
