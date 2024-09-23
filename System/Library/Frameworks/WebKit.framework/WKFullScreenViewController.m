@implementation WKFullScreenViewController

- (WKFullScreenViewController)initWithWebView:(id)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WKFullScreenViewController;
  v4 = -[WKFullScreenViewController init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarFrame");
    *((_QWORD *)v4 + 155) = v5;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__statusBarFrameDidChange_, *MEMORY[0x1E0CEB278], 0);
    *(_OWORD *)(v4 + 1096) = xmmword_1978CE340;
    *(_OWORD *)(v4 + 1112) = xmmword_1978CE350;
    *(_OWORD *)(v4 + 1128) = xmmword_1978CE360;
    *((_QWORD *)v4 + 143) = 0x3FB999999999999ALL;
    objc_msgSend(v4, "set_webView:", a3);
    objc_storeWeak((id *)v4 + 153, v4);
    v4[968] = 1;
    v4[1264] = 0;
  }
  return (WKFullScreenViewController *)v4;
}

- (void)invalidate
{
  WKFullScreenViewControllerPlaybackSessionModelClient *v2;

  if (self->_valid)
  {
    v2 = (WKFullScreenViewControllerPlaybackSessionModelClient *)self;
    self->_valid = 0;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideUI, 0);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v2, sel_hideBanner, 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", v2);
    v2 += 30;
    objc_storeWeak(&v2->m_parent.m_weakReference, 0);
    WKFullScreenViewControllerPlaybackSessionModelClient::setInterface(v2, 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[WKFullScreenViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WKFullScreenViewController;
  -[WKFullScreenViewController dealloc](&v3, sel_dealloc);
}

- (WKFullScreenViewControllerDelegate)delegate
{
  WKFullScreenViewControllerDelegate *WeakRetained;
  WKFullScreenViewControllerDelegate *v3;

  WeakRetained = (WKFullScreenViewControllerDelegate *)objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v3 = WeakRetained;
  if (WeakRetained)
    CFRelease(WeakRetained);
  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate.m_weakReference, a3);
}

- (void)setSupportedOrientations:(unint64_t)a3
{
  self->_supportedOrientations.var0.__val_ = a3;
  self->_supportedOrientations.__engaged_ = 1;
  -[WKFullScreenViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (void)resetSupportedOrientations
{
  if (self->_supportedOrientations.__engaged_)
    self->_supportedOrientations.__engaged_ = 0;
  -[WKFullScreenViewController setNeedsUpdateOfSupportedInterfaceOrientations](self, "setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3;

  if (self->_supportedOrientations.__engaged_)
    return self->_supportedOrientations.var0.__val_;
  v3.receiver = self;
  v3.super_class = (Class)WKFullScreenViewController;
  return -[WKFullScreenViewController supportedInterfaceOrientations](&v3, sel_supportedInterfaceOrientations);
}

- (void)showUI
{
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideUI, 0);
  if (self->_playing)
    -[WKFullScreenViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideUI, 0, 4.0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__WKFullScreenViewController_showUI__block_invoke;
  v3[3] = &unk_1E34BAF80;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, 0.1);
}

uint64_t __36__WKFullScreenViewController_showUI__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  uint64_t v5;
  const void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "showUI");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setHidden:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setPrefersStatusBarHidden:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPrefersHomeIndicatorAutoHidden:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 1072))
  {
    v8[0] = *(_QWORD *)(v2 + 1072);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1));
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 1064), "topAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "safeAreaLayoutGuide"), "topAnchor"));
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v3)
    CFRetain(v3);
  v6 = *(const void **)(v5 + 1072);
  *(_QWORD *)(v5 + 1072) = v4;
  if (v6)
    CFRelease(v6);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setActive:", 1);
}

- (void)hideUI
{
  _QWORD v3[5];
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideUI, 0);
  if (!self->_isShowingMenu)
  {
    v3[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __36__WKFullScreenViewController_hideUI__block_invoke;
    v4[3] = &unk_1E34BAF80;
    v4[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __36__WKFullScreenViewController_hideUI__block_invoke_2;
    v3[3] = &unk_1E34CF1C8;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v4, v3, 0.1);
  }
}

uint64_t __36__WKFullScreenViewController_hideUI__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  const void *v5;
  const void *v6;
  uint64_t v7;
  const void *v8;
  id *v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "hideUI");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 1072))
  {
    v12[0] = *(_QWORD *)(v2 + 1072);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1));
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = (void *)objc_msgSend(*(id *)(v2 + 1064), "topAnchor");
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "topAnchor");
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "safeAreaInsets");
  v5 = (const void *)objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (v5)
    CFRetain(v5);
  v8 = *(const void **)(v7 + 1072);
  *(_QWORD *)(v7 + 1072) = v6;
  if (v8)
    CFRelease(v8);
  v10 = *(_QWORD *)(a1 + 32);
  v9 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(v10 + 1072), "setActive:", 1);
  objc_msgSend(*((id *)*v9 + 125), "setAlpha:", 0.0);
  objc_msgSend(*v9, "setPrefersStatusBarHidden:", 1);
  return objc_msgSend(*v9, "setPrefersHomeIndicatorAutoHidden:", 1);
}

uint64_t __36__WKFullScreenViewController_hideUI__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1000), "setHidden:", 1);
  return result;
}

- (void)showBanner
{
  double v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideBanner, 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__WKFullScreenViewController_showBanner__block_invoke;
  v4[3] = &unk_1E34BAF80;
  v4[4] = self;
  WTF::MonotonicTime::now((WTF::MonotonicTime *)objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, 0.1));
  self->_bannerMinimumHideDelayTime.m_value = v3 + 1.0;
  -[WKFullScreenViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideBanner, 0, 4.0);
}

uint64_t __40__WKFullScreenViewController_showBanner__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setHidden:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", 1.0);
}

- (void)hideBanner
{
  _QWORD v3[5];
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideBanner, 0);
  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__WKFullScreenViewController_hideBanner__block_invoke;
  v4[3] = &unk_1E34BAF80;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__WKFullScreenViewController_hideBanner__block_invoke_2;
  v3[3] = &unk_1E34CF1C8;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v4, v3, 0.1);
}

uint64_t __40__WKFullScreenViewController_hideBanner__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", 0.0);
}

uint64_t __40__WKFullScreenViewController_hideBanner__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 1008), "setHidden:", 1);
  return result;
}

- (void)_bannerDismissalRecognized:(id)a3
{
  double v4;

  WTF::MonotonicTime::now((WTF::MonotonicTime *)self);
  if (self->_bannerMinimumHideDelayTime.m_value - v4 <= 0.0)
    -[WKFullScreenViewController hideBanner](self, "hideBanner");
  else
    -[WKFullScreenViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideBanner, 0);
}

- (void)videoControlsManagerDidChange
{
  WKWebView *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  WKWebView *v13;
  const WTF::StringImpl *v14;
  uint64_t v15;
  const WTF::StringImpl *v16;
  uint64_t v17;
  int BoolValueForKey;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = -[WKFullScreenViewController _webView](self, "_webView");
  if (!v3)
  {
    v22 = 0;
LABEL_8:
    v5 = 0;
    v6 = 0;
    v4 = 0;
    v21 = 0;
    v7 = 1;
    v8 = 1;
    goto LABEL_9;
  }
  -[WKWebView _page](v3, "_page");
  if (!v22)
    goto LABEL_8;
  v4 = *(_QWORD *)(v22 + 384);
  if (!v4)
    goto LABEL_8;
  ++*(_DWORD *)(v4 + 16);
  WebKit::VideoPresentationManagerProxy::controlsManagerInterface((unsigned __int8 **)v4, &v21);
  v5 = v21;
  if (v21)
  {
    v6 = *(_QWORD *)(v21 + 264);
    if (v6)
    {
      v7 = 0;
      v8 = 0;
      ++*(_DWORD *)(v6 + 16);
      goto LABEL_9;
    }
  }
  else
  {
    v6 = 0;
  }
  v8 = 0;
  v7 = 1;
LABEL_9:
  WKFullScreenViewControllerPlaybackSessionModelClient::setInterface(&self->_playbackClient, (PlaybackSessionInterfaceIOS *)v6);
  if (v6)
  {
    v9 = WebCore::PlaybackSessionInterfaceIOS::playbackSessionModel((WebCore::PlaybackSessionInterfaceIOS *)v6);
    v10 = v9;
    if (v9)
    {
      v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 304))(v9);
      v12 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = 0;
  v12 = 1;
LABEL_14:
  -[WKFullScreenViewController setPlaying:](self, "setPlaying:", v11);
  v13 = -[WKFullScreenViewController _webView](self, "_webView");
  if (!v13)
    goto LABEL_23;
  -[WKWebView _page](v13, "_page");
  if (!v20)
    goto LABEL_23;
  v15 = *(_QWORD *)(v20 + 224);
  {
    WebKit::WebPreferencesKey::pictureInPictureAPIEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::pictureInPictureAPIEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::pictureInPictureAPIEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v15 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::pictureInPictureAPIEnabledKey(void)::key, v14))
  {
    v17 = *(_QWORD *)(v20 + 224);
    {
      WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::$_0::operator() const(void)::impl;
    }
    BoolValueForKey = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v17 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::key, v16);
    if ((v12 & 1) == 0)
      goto LABEL_22;
  }
  else
  {
LABEL_23:
    BoolValueForKey = 0;
    if ((v12 & 1) == 0)
    {
LABEL_22:
      v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 456))(v10);
      goto LABEL_25;
    }
  }
  v19 = 0;
LABEL_25:
  objc_msgSend(self->_pipButton.m_ptr, "setHidden:", BoolValueForKey & v19 ^ 1u);
  if ((v7 & 1) != 0)
    goto LABEL_28;
  if (*(_DWORD *)(v6 + 16) != 1)
  {
    --*(_DWORD *)(v6 + 16);
LABEL_28:
    if (!v5)
      goto LABEL_30;
    goto LABEL_29;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  if (v5)
LABEL_29:
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v5 + 64));
LABEL_30:
  if ((v8 & 1) == 0)
  {
    if (*(_DWORD *)(v4 + 16) == 1)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    else
      --*(_DWORD *)(v4 + 16);
  }
}

- (void)setAnimatingViewAlpha:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__WKFullScreenViewController_setAnimatingViewAlpha___block_invoke;
  v3[3] = &unk_1E34CE0B0;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, 0.2);
}

uint64_t __52__WKFullScreenViewController_setAnimatingViewAlpha___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", *(double *)(a1 + 40));
}

+ (id)keyPathsForValuesAffectingAdditionalSafeAreaInsets
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("prefersStatusBarHidden"), CFSTR("view.window.windowScene.statusBarManager.statusBarHidden"), CFSTR("view.window.safeAreaInsets"), 0);
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double v3;
  double *p_nonZeroStatusBarHeight;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "window"), "windowScene"), "statusBarManager"), "isStatusBarHidden") & 1) != 0&& -[WKFullScreenViewController prefersStatusBarHidden](self, "prefersStatusBarHidden")&& (objc_msgSend((id)objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "window"), "safeAreaInsets"), v3 <= 0.0))
  {
    p_nonZeroStatusBarHeight = &self->_nonZeroStatusBarHeight;
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
  }
  else
  {
    p_nonZeroStatusBarHeight = (double *)MEMORY[0x1E0CEB4B0];
    v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v7 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  v8 = *p_nonZeroStatusBarHeight;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v8;
  return result;
}

- (void)setPrefersStatusBarHidden:(BOOL)a3
{
  self->_prefersStatusBarHidden = a3;
  -[WKFullScreenViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  -[WKFullScreenViewController _updateWebViewFullscreenInsets](self, "_updateWebViewFullscreenInsets");
}

- (void)setPrefersHomeIndicatorAutoHidden:(BOOL)a3
{
  self->_prefersHomeIndicatorAutoHidden = a3;
  -[WKFullScreenViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    if (-[WKFullScreenViewController viewIfLoaded](self, "viewIfLoaded"))
    {
      if (self->_playing)
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideUI, 0);
        -[WKFullScreenViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideUI, 0, 4.0);
      }
      else
      {
        -[WKFullScreenViewController showUI](self, "showUI");
      }
    }
  }
}

- (void)setPictureInPictureActive:(BOOL)a3
{
  if (self->_pictureInPictureActive != a3)
  {
    self->_pictureInPictureActive = a3;
    objc_msgSend(self->_pipButton.m_ptr, "setSelected:");
  }
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (-[WKFullScreenViewController viewIfLoaded](self, "viewIfLoaded"))
    {
      if (self->_animating)
        -[WKFullScreenViewController hideUI](self, "hideUI");
      else
        -[WKFullScreenViewController showUI](self, "showUI");
    }
    else
    {
      -[WKFullScreenViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    }
  }
}

- (NSString)location
{
  if (self->_location.m_impl.m_ptr)
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setLocation:(id)a3
{
  WTF::StringImpl *v4;
  StringImpl *v5;
  WTF::StringImpl *m_ptr;
  int v7;
  void *v8;
  void *v9;
  CFTypeRef v10;
  CFTypeRef arg;

  MEMORY[0x19AEABCC8](&arg, a3);
  v5 = (StringImpl *)arg;
  arg = 0;
  m_ptr = (WTF::StringImpl *)self->_location.m_impl.m_ptr;
  self->_location.m_impl.m_ptr = v5;
  if (!m_ptr)
    goto LABEL_6;
  v7 = *(_DWORD *)m_ptr - 2;
  if (*(_DWORD *)m_ptr != 2)
    goto LABEL_5;
  WTF::StringImpl::destroy(m_ptr, v4);
  m_ptr = (WTF::StringImpl *)arg;
  arg = 0;
  if (!m_ptr)
    goto LABEL_6;
  v7 = *(_DWORD *)m_ptr - 2;
  if (*(_DWORD *)m_ptr == 2)
    WTF::StringImpl::destroy(m_ptr, v4);
  else
LABEL_5:
    *(_DWORD *)m_ptr = v7;
LABEL_6:
  v8 = self->_bannerLabel.m_ptr;
  v9 = (void *)MEMORY[0x1E0CB3940];
  WebCore::copyLocalizedString((WebCore *)CFSTR("”%@” is in full screen.\nSwipe down to exit."), (const __CFString *)v4);
  if (arg)
  {
    CFAutorelease(arg);
    v10 = arg;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v8, "setText:", objc_msgSend(v9, "stringWithFormat:", v10, -[WKFullScreenViewController location](self, "location")));
  objc_msgSend(self->_bannerLabel.m_ptr, "sizeToFit");
}

- (void)loadView
{
  const WTF::StringImpl *v3;
  uint64_t v4;
  int BoolValueForKey;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  const void *v12;
  id v13;
  void *v14;
  void *m_ptr;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  WKFullscreenStackView *v24;
  void *v25;
  _WKInsetLabel *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  _QWORD *v31;
  WKFullscreenStackView *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  _QWORD *arg;
  _QWORD v53[6];

  v53[5] = *MEMORY[0x1E0C80C00];
  -[WKWebView _page](-[WKFullScreenViewController _webView](self, "_webView"), "_page");
  v4 = arg[28];
  {
    WebKit::WebPreferencesKey::alternateFullScreenControlDesignEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::alternateFullScreenControlDesignEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::alternateFullScreenControlDesignEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  BoolValueForKey = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v4 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::alternateFullScreenControlDesignEnabledKey(void)::key, v3);
  if (BoolValueForKey)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("arrow.down.right.and.arrow.up.left"));
    v7 = 0;
    v8 = 0;
    v9 = 44.0;
    v10 = 44.0;
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("Done"), v11, 0);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("StartPictureInPictureButton"), v11, 0);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("StopPictureInPictureButton"), v11, 0);
    v10 = 47.0;
    v9 = 60.0;
  }
  v12 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  -[WKFullScreenViewController setView:](self, "setView:", v12);
  if (v12)
    CFRelease(v12);
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "setAutoresizingMask:", 18);
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "blackColor"));
  v13 = objc_alloc(MEMORY[0x1E0CEABB0]);
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "bounds");
  v14 = (void *)objc_msgSend(v13, "initWithFrame:");
  m_ptr = self->_animatingView.m_ptr;
  self->_animatingView.m_ptr = v14;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v14 = self->_animatingView.m_ptr;
  }
  objc_msgSend(v14, "setAutoresizingMask:", 18);
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "addSubview:", self->_animatingView.m_ptr);
  v16 = -[WKFullScreenViewController _createButtonWithExtrinsicContentSize:](self, "_createButtonWithExtrinsicContentSize:", v9, v10);
  v17 = v16;
  if (v16)
    CFRetain(v16);
  v18 = self->_cancelButton.m_ptr;
  self->_cancelButton.m_ptr = v17;
  if (v18)
  {
    CFRelease(v18);
    v17 = self->_cancelButton.m_ptr;
  }
  objc_msgSend(v17, "setImage:forState:", objc_msgSend(v6, "imageWithRenderingMode:", 2), 0);
  objc_msgSend(self->_cancelButton.m_ptr, "sizeToFit");
  objc_msgSend(self->_cancelButton.m_ptr, "addTarget:action:forControlEvents:", self, sel__cancelAction_, 64);
  if (BoolValueForKey)
  {
    objc_msgSend(self->_cancelButton.m_ptr, "setConfiguration:", objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration"));
    v19 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
    v20 = self->_stackView.m_ptr;
    self->_stackView.m_ptr = v19;
    if (v20)
    {
      CFRelease(v20);
      v19 = self->_stackView.m_ptr;
    }
    objc_msgSend(v19, "addArrangedSubview:", self->_cancelButton.m_ptr);
    objc_msgSend(self->_stackView.m_ptr, "addArrangedSubview:", self->_pipButton.m_ptr);
    objc_msgSend(self->_stackView.m_ptr, "setSpacing:", 24.0);
  }
  else
  {
    v21 = -[WKFullScreenViewController _createButtonWithExtrinsicContentSize:](self, "_createButtonWithExtrinsicContentSize:", v9, v10);
    v22 = v21;
    if (v21)
      CFRetain(v21);
    v23 = self->_pipButton.m_ptr;
    self->_pipButton.m_ptr = v22;
    if (v23)
    {
      CFRelease(v23);
      v22 = self->_pipButton.m_ptr;
    }
    objc_msgSend(v22, "setImage:forState:", objc_msgSend(v8, "imageWithRenderingMode:", 2), 0);
    objc_msgSend(self->_pipButton.m_ptr, "setImage:forState:", objc_msgSend(v7, "imageWithRenderingMode:", 2), 4);
    objc_msgSend(self->_pipButton.m_ptr, "sizeToFit");
    objc_msgSend(self->_pipButton.m_ptr, "addTarget:action:forControlEvents:", self, sel__togglePiPAction_, 64);
    v24 = objc_alloc_init(WKFullscreenStackView);
    -[WKFullscreenStackView addArrangedSubview:applyingMaterialStyle:tintEffectStyle:](v24, "addArrangedSubview:applyingMaterialStyle:tintEffectStyle:", self->_cancelButton.m_ptr, 1, 1);
    -[WKFullscreenStackView addArrangedSubview:applyingMaterialStyle:tintEffectStyle:](v24, "addArrangedSubview:applyingMaterialStyle:tintEffectStyle:", self->_pipButton.m_ptr, 0, 1);
    v25 = self->_stackView.m_ptr;
    self->_stackView.m_ptr = v24;
    if (v25)
      CFRelease(v25);
  }
  objc_msgSend(self->_stackView.m_ptr, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(self->_animatingView.m_ptr, "addSubview:", self->_stackView.m_ptr);
  v26 = -[_WKInsetLabel initWithFrame:]([_WKInsetLabel alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  v27 = self->_bannerLabel.m_ptr;
  self->_bannerLabel.m_ptr = v26;
  if (v27)
  {
    CFRelease(v27);
    v26 = (_WKInsetLabel *)self->_bannerLabel.m_ptr;
  }
  -[_WKInsetLabel setEdgeInsets:](v26, "setEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
  objc_msgSend(self->_bannerLabel.m_ptr, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
  objc_msgSend(self->_bannerLabel.m_ptr, "setNumberOfLines:", 0);
  objc_msgSend(self->_bannerLabel.m_ptr, "setLineBreakMode:", 0);
  objc_msgSend(self->_bannerLabel.m_ptr, "setTextAlignment:", 1);
  v28 = self->_bannerLabel.m_ptr;
  v29 = (void *)MEMORY[0x1E0CB3940];
  WebCore::copyLocalizedString((WebCore *)CFSTR("”%@” is in full screen.\nSwipe down to exit."), v30);
  if (arg)
  {
    CFAutorelease(arg);
    v31 = arg;
  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v28, "setText:", objc_msgSend(v29, "stringWithFormat:", v31, -[WKFullScreenViewController location](self, "location")));
  v32 = objc_alloc_init(WKFullscreenStackView);
  -[WKFullscreenStackView addArrangedSubview:applyingMaterialStyle:tintEffectStyle:](v32, "addArrangedSubview:applyingMaterialStyle:tintEffectStyle:", self->_bannerLabel.m_ptr, 1, 1);
  v33 = self->_banner.m_ptr;
  self->_banner.m_ptr = v32;
  if (v33)
    CFRelease(v33);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__bannerDismissalRecognized_);
  v35 = self->_bannerTapToDismissRecognizer.m_ptr;
  self->_bannerTapToDismissRecognizer.m_ptr = v34;
  if (v35)
  {
    CFRelease(v35);
    v34 = self->_bannerTapToDismissRecognizer.m_ptr;
  }
  objc_msgSend(v34, "setDelegate:", self);
  objc_msgSend(self->_banner.m_ptr, "addGestureRecognizer:", self->_bannerTapToDismissRecognizer.m_ptr);
  objc_msgSend(self->_banner.m_ptr, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(self->_animatingView.m_ptr, "addSubview:", self->_banner.m_ptr);
  v36 = (void *)objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "safeAreaLayoutGuide");
  v37 = (void *)objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "layoutMarginsGuide");
  v38 = objc_alloc_init(MEMORY[0x1E0CEA710]);
  v39 = self->_topGuide.m_ptr;
  self->_topGuide.m_ptr = v38;
  if (v39)
    CFRelease(v39);
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "addLayoutGuide:", self->_topGuide.m_ptr);
  v40 = (void *)objc_msgSend(self->_topGuide.m_ptr, "topAnchor");
  v41 = (void *)objc_msgSend(self->_stackView.m_ptr, "topAnchor");
  if (BoolValueForKey)
    v42 = objc_msgSend(v41, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v40, 3.0);
  else
    v42 = objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v43 = v42;
  v44 = (void *)objc_msgSend(v40, "constraintEqualToAnchor:", objc_msgSend(v36, "topAnchor"));
  v45 = v44;
  if (v44)
    CFRetain(v44);
  v46 = self->_topConstraint.m_ptr;
  self->_topConstraint.m_ptr = v45;
  if (v46)
  {
    CFRelease(v46);
    v45 = self->_topConstraint.m_ptr;
  }
  v47 = (void *)MEMORY[0x1E0CB3718];
  v53[0] = v45;
  v53[1] = v43;
  v53[2] = objc_msgSend((id)objc_msgSend(self->_banner.m_ptr, "topAnchor"), "constraintEqualToSystemSpacingBelowAnchor:multiplier:", objc_msgSend(self->_stackView.m_ptr, "bottomAnchor"), 3.0);
  v53[3] = objc_msgSend((id)objc_msgSend(self->_banner.m_ptr, "centerXAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "centerXAnchor"));
  v53[4] = objc_msgSend((id)objc_msgSend(self->_stackView.m_ptr, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v37, "leadingAnchor"));
  objc_msgSend(v47, "activateConstraints:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 5));
  objc_msgSend(self->_stackView.m_ptr, "setAlpha:", 0.0);
  objc_msgSend(self->_stackView.m_ptr, "setHidden:", 1);
  -[WKFullScreenViewController videoControlsManagerDidChange](self, "videoControlsManagerDidChange");
  v48 = self->_bannerLabel.m_ptr;
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "bounds");
  objc_msgSend(v48, "setPreferredMaxLayoutWidth:", v49);
  objc_msgSend(self->_banner.m_ptr, "setAlpha:", 0.0);
  objc_msgSend(self->_banner.m_ptr, "setHidden:", 1);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel__touchDetected_);
  v51 = self->_touchGestureRecognizer.m_ptr;
  self->_touchGestureRecognizer.m_ptr = v50;
  if (v51)
  {
    CFRelease(v51);
    v50 = self->_touchGestureRecognizer.m_ptr;
  }
  objc_msgSend(v50, "setCancelsTouchesInView:", 0);
  objc_msgSend(self->_touchGestureRecognizer.m_ptr, "setMinimumPressDuration:", 0.0);
  objc_msgSend(self->_touchGestureRecognizer.m_ptr, "setDelegate:", self);
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "addGestureRecognizer:", self->_touchGestureRecognizer.m_ptr);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  uint64_t *v13;
  uint64_t v14;

  v3 = a3;
  -[WKWebView setAutoresizingMask:](-[WKFullScreenViewController _webView](self, "_webView"), "setAutoresizingMask:", 18);
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "bounds");
  -[WKWebView setFrame:](-[WKFullScreenViewController _webView](self, "_webView"), "setFrame:", v5, v6, v7, v8);
  objc_msgSend(self->_animatingView.m_ptr, "insertSubview:atIndex:", -[WKFullScreenViewController _webView](self, "_webView"), 0);
  v9 = -[WKFullScreenViewController _manager](self, "_manager");
  if (v9)
  {
    v14 = 0x3FB999999999999ALL;
    v10 = v9[3];
    v11 = *(_QWORD *)(v10 + 208);
    v13 = &v14;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetFullscreenAutoHideDuration>(v11, &v13, *(_QWORD *)(*(_QWORD *)(v10 + 32) + 1896), 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)WKFullScreenViewController;
  -[WKFullScreenViewController viewWillAppear:](&v12, sel_viewWillAppear_, v3);
}

- (void)viewDidLayoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  WKWebView *v5;
  void *m_ptr;
  double v7;

  -[WKFullScreenViewController _updateWebViewFullscreenInsets](self, "_updateWebViewFullscreenInsets");
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "bounds");
  self->_secheuristic.m_size.width = v3;
  self->_secheuristic.m_size.height = v4;
  v5 = -[WKFullScreenViewController _webView](self, "_webView");
  objc_msgSend(self->_animatingView.m_ptr, "bounds");
  -[WKWebView setFrame:](v5, "setFrame:");
  m_ptr = self->_bannerLabel.m_ptr;
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "bounds");
  objc_msgSend(m_ptr, "setPreferredMaxLayoutWidth:", v7);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKFullScreenViewController;
  -[WKFullScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a3.width, a3.height);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__WKFullScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v6[3] = &unk_1E34CF1F0;
  v6[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v6, 0);
}

uint64_t __81__WKFullScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "_webView");
  return objc_msgSend(v1, "_setInterfaceOrientationOverride:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarOrientation"));
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return self->_animating || self->_prefersStatusBarHidden;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (!-[WKFullScreenViewController isAnimating](self, "isAnimating", a3, a4))
    -[WKFullScreenViewController showUI](self, "showUI");
  return 1;
}

- (void)_manager
{
  void *result;
  uint64_t v3;

  result = -[WKFullScreenViewController _webView](self, "_webView");
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

- (RectEdges<float>)_effectiveFullscreenInsets
{
  double v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  RectEdges<float> result;
  CGRect v20;
  CGRect v21;

  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(self->_cancelButton.m_ptr, "frame");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  MaxX = CGRectGetMaxX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  objc_msgSend(self->_cancelButton.m_ptr, "convertPoint:toView:", -[WKFullScreenViewController view](self, "view"), MaxX, CGRectGetMaxY(v21));
  v15 = v14;
  v16 = v4;
  v17 = v6;
  v18 = v8;
  result.m_sides.__elems_[3] = v18;
  result.m_sides.__elems_[2] = v17;
  result.m_sides.__elems_[1] = v16;
  result.m_sides.__elems_[0] = v15;
  return result;
}

- (void)_cancelAction:(id)a3
{
  -[WKFullScreenViewControllerDelegate requestExitFullScreen](-[WKFullScreenViewController delegate](self, "delegate", a3), "requestExitFullScreen");
}

- (void)_togglePiPAction:(id)a3
{
  WKWebView *v3;
  uint64_t v4;
  uint64_t v5;
  WebCore::PlaybackSessionInterfaceIOS *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[WKFullScreenViewController _webView](self, "_webView", a3);
  if (v3)
  {
    -[WKWebView _page](v3, "_page");
    if (v8)
    {
      v4 = *(_QWORD *)(v8 + 376);
      if (v4)
      {
        v5 = *(_QWORD *)(v4 + 48);
        if (v5)
        {
          v6 = (WebCore::PlaybackSessionInterfaceIOS *)WebKit::PlaybackSessionManagerProxy::ensureModelAndInterface(v4, v5)[1];
          ++*((_DWORD *)v6 + 4);
          v7 = WebCore::PlaybackSessionInterfaceIOS::playbackSessionModel(v6);
          if (v7)
            (*(void (**)(uint64_t))(*(_QWORD *)v7 + 176))(v7);
          if (*((_DWORD *)v6 + 4) == 1)
            (*(void (**)(WebCore::PlaybackSessionInterfaceIOS *))(*(_QWORD *)v6 + 8))(v6);
          else
            --*((_DWORD *)v6 + 4);
        }
      }
    }
  }
}

- (void)_touchDetected:(id)a3
{
  double v4;
  CGPoint v5;

  if (objc_msgSend(self->_touchGestureRecognizer.m_ptr, "state", a3) == 3
    && !-[WKWebView _shouldAvoidSecurityHeuristicScoreUpdates](-[WKFullScreenViewController _webView](self, "_webView"), "_shouldAvoidSecurityHeuristicScoreUpdates"))
  {
    objc_msgSend(self->_touchGestureRecognizer.m_ptr, "locationInView:", -[WKFullScreenViewController view](self, "view"));
    WebKit::FullscreenTouchSecheuristic::scoreOfNextTouch((WebKit::FullscreenTouchSecheuristic *)&self->_secheuristic, v5);
    if (v4 > self->_secheuristic.m_parameters.requiredScore)
      -[WKFullScreenViewController _showPhishingAlert](self, "_showPhishingAlert");
  }
  if (!-[WKFullScreenViewController isAnimating](self, "isAnimating"))
    -[WKFullScreenViewController showUI](self, "showUI");
}

- (void)_statusBarFrameDidChange:(id)a3
{
  double v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication", a3), "statusBarFrame");
  if (v4 != 0.0 && v4 != self->_nonZeroStatusBarHeight)
  {
    self->_nonZeroStatusBarHeight = v4;
    -[WKFullScreenViewController _updateWebViewFullscreenInsets](self, "_updateWebViewFullscreenInsets");
  }
}

- (void)_updateWebViewFullscreenInsets
{
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v11[4];
  int *v12;

  v3 = -[WKFullScreenViewController _manager](self, "_manager");
  if (v3)
  {
    v4 = v3;
    -[WKFullScreenViewController _effectiveFullscreenInsets](self, "_effectiveFullscreenInsets");
    v11[0] = v5;
    v11[1] = v6;
    v11[2] = v7;
    v11[3] = v8;
    v9 = v4[3];
    v10 = *(_QWORD *)(v9 + 208);
    v12 = v11;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetFullscreenInsets>(v10, &v12, *(_QWORD *)(*(_QWORD *)(v9 + 32) + 1896), 0);
  }
}

- (void)_showPhishingAlert
{
  WTF::StringImpl *v3;
  WebKit *v4;
  WTF::StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  WKWebView *v8;
  const __CFString *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  void *v19;
  const __CFString *v20;
  WTF::StringImpl *v21;
  uint64_t v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD *v27;
  WTF::StringImpl *v28;
  WTF::StringImpl *v29;

  WebCore::localizedString((WebCore *)CFSTR("It looks like you are typing while in full screen"), (const __CFString *)a2);
  if (v29)
  {
    v4 = (WebKit *)WTF::StringImpl::operator NSString *();
    v5 = v29;
    v29 = 0;
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  else
  {
    v4 = (WebKit *)&stru_1E351F1B8;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  WebCore::copyLocalizedString((WebCore *)CFSTR("Typing is not allowed in full screen websites. “%@” may be showing a fake keyboard to trick you into disclosing personal or financial information."), (const __CFString *)v3);
  if (v29)
  {
    CFAutorelease(v29);
    v7 = v29;
  }
  else
  {
    v7 = 0;
  }
  WebKit::createUIAlertController(v4, (NSString *)objc_msgSend(v6, "stringWithFormat:", v7, -[WKFullScreenViewController location](self, "location")), &v29);
  v8 = -[WKFullScreenViewController _webView](self, "_webView");
  if (v8)
  {
    -[WKWebView _page](v8, "_page");
    v10 = (uint64_t)v28;
    if (v28)
    {
      v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v11 = off_1E34CF3A0;
      v27 = v11;
      WebKit::WebPageProxy::suspendAllMediaPlayback(v10, (uint64_t *)&v27);
      v12 = (uint64_t)v27;
      v27 = 0;
      if (v12)
        (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
      WebKit::WebPageProxy::suspendActiveDOMObjectsAndAnimations((uint64_t)v28);
    }
  }
  v13 = (void *)MEMORY[0x1E0CEA2E0];
  WebCore::localizedString((WebCore *)CFSTR("Exit Full Screen (Element Full Screen)"), v9);
  if (v28)
    v14 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v14 = &stru_1E351F1B8;
  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __48__WKFullScreenViewController__showPhishingAlert__block_invoke;
  v26[3] = &unk_1E34CDA40;
  v26[4] = self;
  v17 = objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, v26);
  v18 = v28;
  v28 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v16);
    else
      *(_DWORD *)v18 -= 2;
  }
  v19 = (void *)MEMORY[0x1E0CEA2E0];
  WebCore::localizedString((WebCore *)CFSTR("Stay in Full Screen (Element Full Screen)"), (const __CFString *)v16);
  if (v28)
    v20 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v20 = &stru_1E351F1B8;
  v25[0] = v15;
  v25[1] = 3221225472;
  v25[2] = __48__WKFullScreenViewController__showPhishingAlert__block_invoke_2;
  v25[3] = &unk_1E34CDA40;
  v25[4] = self;
  v22 = objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v25);
  v23 = v28;
  v28 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2)
      WTF::StringImpl::destroy(v23, v21);
    else
      *(_DWORD *)v23 -= 2;
  }
  -[WTF::StringImpl addAction:](v29, "addAction:", v17);
  -[WTF::StringImpl addAction:](v29, "addAction:", v22);
  -[WKFullScreenViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, 0);
  v24 = v29;
  v29 = 0;
  if (v24)
    CFRelease(v24);
}

WebKit::WebPageProxy *__48__WKFullScreenViewController__showPhishingAlert__block_invoke(uint64_t a1, uint64_t a2)
{
  WebKit::WebPageProxy *result;
  WebKit::WebPageProxy *v4;
  WebKit::WebPageProxy *v5;
  WebKit::WebPageProxy *v6;
  WebKit::WebPageProxy *v7;

  objc_msgSend(*(id *)(a1 + 32), "_cancelAction:", a2);
  result = (WebKit::WebPageProxy *)objc_msgSend(*(id *)(a1 + 32), "_webView");
  if (result)
  {
    -[WebKit::WebPageProxy _page](result, "_page");
    result = v7;
    if (v7)
    {
      WebKit::WebPageProxy::resumeActiveDOMObjectsAndAnimations((uint64_t)v7);
      v4 = v7;
      v5 = (WebKit::WebPageProxy *)WTF::fastMalloc((WTF *)0x10);
      *(_QWORD *)v5 = off_1E34CF3C8;
      v6 = v5;
      WebKit::WebPageProxy::resumeAllMediaPlayback((uint64_t)v4, (uint64_t *)&v6);
      result = v6;
      v6 = 0;
      if (result)
        return (WebKit::WebPageProxy *)(*(uint64_t (**)(WebKit::WebPageProxy *))(*(_QWORD *)result + 8))(result);
    }
  }
  return result;
}

double __48__WKFullScreenViewController__showPhishingAlert__block_invoke_2(uint64_t a1)
{
  void *v2;
  WebKit::WebPageProxy *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  double result;
  _QWORD *v8;
  WebKit::WebPageProxy *v9;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_webView");
  if (v2)
  {
    objc_msgSend(v2, "_page");
    if (v9)
    {
      WebKit::WebPageProxy::resumeActiveDOMObjectsAndAnimations((uint64_t)v9);
      v3 = v9;
      v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v4 = off_1E34CF3F0;
      v8 = v4;
      WebKit::WebPageProxy::resumeAllMediaPlayback((uint64_t)v3, (uint64_t *)&v8);
      v5 = (uint64_t)v8;
      v8 = 0;
      if (v5)
        (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    }
  }
  v6 = *(_QWORD *)(a1 + 32) + 1088;
  result = 0.0;
  *(_OWORD *)(v6 + 80) = xmmword_1978D0440;
  *(_OWORD *)(v6 + 96) = xmmword_1978D0450;
  return result;
}

- (id)_createButtonWithExtrinsicContentSize:(CGSize)a3
{
  double height;
  double width;
  WKExtrinsicButton *v6;

  height = a3.height;
  width = a3.width;
  v6 = +[WKExtrinsicButton buttonWithType:](WKExtrinsicButton, "buttonWithType:", 1);
  -[WKExtrinsicButton setDelegate:](v6, "setDelegate:", self);
  -[WKExtrinsicButton setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WKExtrinsicButton setAdjustsImageWhenHighlighted:](v6, "setAdjustsImageWhenHighlighted:", 0);
  -[WKExtrinsicButton setExtrinsicContentSize:](v6, "setExtrinsicContentSize:", width, height);
  -[WKExtrinsicButton setTintColor:](v6, "setTintColor:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"));
  return v6;
}

- (void)wkExtrinsicButtonWillDisplayMenu:(id)a3
{
  self->_isShowingMenu = 1;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideUI, 0);
}

- (void)wkExtrinsicButtonWillDismissMenu:(id)a3
{
  self->_isShowingMenu = 0;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideUI, 0);
  if (self->_playing)
    -[WKFullScreenViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideUI, 0, 4.0);
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return self->_prefersHomeIndicatorAutoHidden;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPictureInPictureActive
{
  return self->_pictureInPictureActive;
}

- (BOOL)isinWindowFullscreenActive
{
  return self->_inWindowFullscreenActive;
}

- (void)setInWindowFullscreenActive:(BOOL)a3
{
  self->_inWindowFullscreenActive = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
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
  PlaybackSessionInterfaceIOS *m_ptr;
  void *v4;
  WTF::StringImpl *v5;
  StringImpl *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_destroyWeak((id *)&self->__webView);
  m_ptr = self->_playbackClient.m_interface.m_ptr;
  self->_playbackClient.m_interface.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 4) == 1)
      (*(void (**)(PlaybackSessionInterfaceIOS *))(*(_QWORD *)m_ptr + 8))(m_ptr);
    else
      --*((_DWORD *)m_ptr + 4);
  }
  objc_destroyWeak(&self->_playbackClient.m_parent.m_weakReference);
  WTF::WeakPtrFactory<WebKit::WebExtensionTab,WTF::DefaultWeakPtrImpl>::~WeakPtrFactory((unsigned int **)&self->_playbackClient.m_weakPtrFactory, v4);
  v6 = self->_location.m_impl.m_ptr;
  self->_location.m_impl.m_ptr = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = self->_topConstraint.m_ptr;
  self->_topConstraint.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  v8 = self->_topGuide.m_ptr;
  self->_topGuide.m_ptr = 0;
  if (v8)
    CFRelease(v8);
  v9 = self->_locationButton.m_ptr;
  self->_locationButton.m_ptr = 0;
  if (v9)
    CFRelease(v9);
  v10 = self->_pipButton.m_ptr;
  self->_pipButton.m_ptr = 0;
  if (v10)
    CFRelease(v10);
  v11 = self->_cancelButton.m_ptr;
  self->_cancelButton.m_ptr = 0;
  if (v11)
    CFRelease(v11);
  v12 = self->_bannerTapToDismissRecognizer.m_ptr;
  self->_bannerTapToDismissRecognizer.m_ptr = 0;
  if (v12)
    CFRelease(v12);
  v13 = self->_bannerLabel.m_ptr;
  self->_bannerLabel.m_ptr = 0;
  if (v13)
    CFRelease(v13);
  v14 = self->_banner.m_ptr;
  self->_banner.m_ptr = 0;
  if (v14)
    CFRelease(v14);
  v15 = self->_stackView.m_ptr;
  self->_stackView.m_ptr = 0;
  if (v15)
    CFRelease(v15);
  v16 = self->_animatingView.m_ptr;
  self->_animatingView.m_ptr = 0;
  if (v16)
    CFRelease(v16);
  v17 = self->_touchGestureRecognizer.m_ptr;
  self->_touchGestureRecognizer.m_ptr = 0;
  if (v17)
    CFRelease(v17);
  objc_destroyWeak(&self->_delegate.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 122) = 0;
  *((_QWORD *)self + 123) = 0;
  *((_QWORD *)self + 124) = 0;
  *((_QWORD *)self + 125) = 0;
  *((_QWORD *)self + 126) = 0;
  *((_QWORD *)self + 127) = 0;
  *((_QWORD *)self + 128) = 0;
  *((_QWORD *)self + 129) = 0;
  *((_QWORD *)self + 130) = 0;
  *((_QWORD *)self + 131) = 0;
  *((_QWORD *)self + 132) = 0;
  *((_QWORD *)self + 133) = 0;
  *((_QWORD *)self + 134) = 0;
  *((_QWORD *)self + 135) = 0;
  *((_QWORD *)self + 137) = 0;
  *((_QWORD *)self + 138) = 0;
  *((_QWORD *)self + 136) = 0x3FB999999999999ALL;
  *((_QWORD *)self + 145) = 0;
  *((_QWORD *)self + 146) = 0;
  *((_QWORD *)self + 144) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)self + 1176) = _Q0;
  *((_QWORD *)self + 149) = 0;
  *((_DWORD *)self + 304) = 0;
  *((_QWORD *)self + 150) = off_1E34CF298;
  *((_QWORD *)self + 151) = 0;
  *((_QWORD *)self + 153) = 0;
  *((_QWORD *)self + 154) = 0;
  *((_BYTE *)self + 1248) = 0;
  *((_BYTE *)self + 1256) = 0;
  return self;
}

@end
