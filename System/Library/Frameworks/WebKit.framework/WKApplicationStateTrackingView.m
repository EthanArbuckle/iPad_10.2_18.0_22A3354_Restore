@implementation WKApplicationStateTrackingView

- (void)didMoveToWindow
{
  id Weak;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  uint8_t buf[4];
  WKApplicationStateTrackingView *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[UIView window](-[WKApplicationStateTrackingView _contentView](self, "_contentView"), "window"))
  {
    Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
    if (Weak)
    {
      objc_msgSend(Weak, "_page");
      if (v9)
        v4 = *(unsigned __int8 *)(v9 + 1033) != 0;
      else
        v4 = 0;
    }
    else
    {
      v4 = 0;
      v9 = 0;
    }
    WebKit::ApplicationStateTracker::setWindow((id *)self->_applicationStateTracker.__ptr_.__value_, -[UIView window](-[WKApplicationStateTrackingView _contentView](self, "_contentView"), "window"));
    v5 = qword_1ECE71A28;
    if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
    {
      if (v9)
        v6 = *(_QWORD *)(*(_QWORD *)(v9 + 32) + 744);
      else
        v6 = 0;
      v7 = -[WKApplicationStateTrackingView isBackground](self, "isBackground");
      *(_DWORD *)buf = 134219008;
      v11 = self;
      v12 = 2048;
      v13 = v9;
      v14 = 2048;
      v15 = v6;
      v16 = 1024;
      v17 = v4;
      v18 = 1024;
      v19 = v7;
      _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKApplicationStateTrackingView: View with page [%p, pageProxyID=%llu] was added to a window, _lastObservedStateWasBackground=%d, isNowBackground=%d", buf, 0x2Cu);
    }
    v8 = -[WKApplicationStateTrackingView isBackground](self, "isBackground");
    if (v4)
    {
      if (!v8)
        -[WKApplicationStateTrackingView _applicationWillEnterForeground](self, "_applicationWillEnterForeground");
    }
    else if (v8)
    {
      -[WKApplicationStateTrackingView _applicationDidEnterBackground](self, "_applicationDidEnterBackground");
    }
  }
}

- (BOOL)isBackground
{
  ApplicationStateTracker *value;

  value = self->_applicationStateTracker.__ptr_.__value_;
  return !value || *((_BYTE *)value + 88) != 0;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 53) = 0;
  return self;
}

- (void)willMoveToWindow:(id)a3
{
  UIWindow *v5;
  id Weak;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint8_t buf[4];
  WKApplicationStateTrackingView *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[WKApplicationStateTrackingView window](self, "window"))
  {
    v5 = -[UIView window](-[WKApplicationStateTrackingView _contentView](self, "_contentView"), "window");
    if (a3 || !v5)
      return;
  }
  else if (a3)
  {
    return;
  }
  Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
    objc_msgSend(Weak, "_page");
  else
    v10 = 0;
  v7 = qword_1ECE71A28;
  if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
  {
    if (v10)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v10 + 32) + 744);
      v9 = *(unsigned __int8 *)(v10 + 1033);
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    *(_DWORD *)buf = 134218752;
    v12 = self;
    v13 = 2048;
    v14 = v10;
    v15 = 2048;
    v16 = v8;
    v17 = 1024;
    v18 = v9;
    _os_log_impl(&dword_196BCC000, v7, OS_LOG_TYPE_DEFAULT, "%p - WKApplicationStateTrackingView: View with page [%p, pageProxyID=%llu] was removed from a window, _lastObservedStateWasBackground=%d", buf, 0x26u);
  }
  WebKit::ApplicationStateTracker::setWindow((id *)self->_applicationStateTracker.__ptr_.__value_, 0);
}

- (void).cxx_destruct
{
  std::unique_ptr<WebKit::ApplicationStateTracker>::reset[abi:sn180100]((id **)&self->_applicationStateTracker, 0);
  objc_destroyWeak(&self->_webViewToTrack.m_weakReference);
}

- (WKApplicationStateTrackingView)initWithFrame:(CGRect)a3 webView:(id)a4
{
  WKApplicationStateTrackingView *v5;
  WKApplicationStateTrackingView *v6;
  WebKit::ApplicationStateTracker *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKApplicationStateTrackingView;
  v5 = -[WKApplicationStateTrackingView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_webViewToTrack.m_weakReference, a4);
    v7 = (WebKit::ApplicationStateTracker *)WTF::fastMalloc((WTF *)0x80);
    WebKit::ApplicationStateTracker::ApplicationStateTracker(v7, &v6->super, (objc_selector *)sel__applicationDidEnterBackground, (objc_selector *)sel__applicationWillEnterForeground, (objc_selector *)sel__willBeginSnapshotSequence, (objc_selector *)sel__didCompleteSnapshotSequence);
    std::unique_ptr<WebKit::ApplicationStateTracker>::reset[abi:sn180100]((id **)&v6->_applicationStateTracker, (id *)v7);
  }
  return v6;
}

- (void)_applicationDidEnterBackground
{
  id Weak;
  WebKit::WebPageProxy *v3;

  Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
  {
    objc_msgSend(Weak, "_page");
    if (v3)
    {
      WebKit::WebPageProxy::applicationDidEnterBackground(v3);
      WebKit::WebPageProxy::activityStateDidChange((uint64_t)v3, 1007, 0, 0);
    }
  }
}

- (void)_applicationDidFinishSnapshottingAfterEnteringBackground
{
  id Weak;
  WebKit::WebPageProxy *v4;
  NSObject *v5;
  uint64_t v6;
  WebKit::WebPageProxy *v7;
  uint8_t buf[4];
  WKApplicationStateTrackingView *v9;
  __int16 v10;
  WebKit::WebPageProxy *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
  {
    objc_msgSend(Weak, "_page");
    v4 = v7;
    if (v7)
    {
      v5 = qword_1ECE71A28;
      if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(*((_QWORD *)v7 + 4) + 744);
        *(_DWORD *)buf = 134218496;
        v9 = self;
        v10 = 2048;
        v11 = v7;
        v12 = 2048;
        v13 = v6;
        _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p - WKApplicationStateTrackingView: View with page [%p, pageProxyID=%llu] did finish snapshotting after entering background", buf, 0x20u);
        v4 = v7;
      }
      WebKit::WebPageProxy::applicationDidFinishSnapshottingAfterEnteringBackground(v4);
    }
  }
}

- (void)_applicationWillEnterForeground
{
  id Weak;
  WebKit::WebPageProxy *v3;

  Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
  {
    objc_msgSend(Weak, "_page");
    if (v3)
    {
      WebKit::WebPageProxy::applicationWillEnterForeground(v3);
      WebKit::WebPageProxy::activityStateDidChange((uint64_t)v3, 1007, 1, 1);
    }
  }
}

- (void)_willBeginSnapshotSequence
{
  id Weak;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t buf[4];
  WKApplicationStateTrackingView *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
  {
    objc_msgSend(Weak, "_page");
    if (v6)
    {
      if (-[UIView window](-[WKApplicationStateTrackingView _contentView](self, "_contentView"), "window"))
      {
        v4 = qword_1ECE71A28;
        if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
        {
          if (v6)
            v5 = *(_QWORD *)(*(_QWORD *)(v6 + 32) + 744);
          else
            v5 = 0;
          *(_DWORD *)buf = 134218496;
          v8 = self;
          v9 = 2048;
          v10 = v6;
          v11 = 2048;
          v12 = v5;
          _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "%p - WKApplicationStateTrackingView: View with page [%p, pageProxyID=%llu] will begin snapshot sequence", buf, 0x20u);
        }
        buf[0] = 1;
        WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsTakingSnapshotsForApplicationSuspension>(*(_QWORD *)(v6 + 208), buf, *(_QWORD *)(*(_QWORD *)(v6 + 32) + 1896), 0);
      }
    }
  }
}

- (void)_didCompleteSnapshotSequence
{
  id Weak;
  NSObject *v4;
  uint64_t v5;
  WebKit::WebPageProxy *v6;
  uint8_t buf[4];
  WKApplicationStateTrackingView *v8;
  __int16 v9;
  WebKit::WebPageProxy *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak(&self->_webViewToTrack.m_weakReference);
  if (Weak)
  {
    objc_msgSend(Weak, "_page");
    if (v6)
    {
      if (-[UIView window](-[WKApplicationStateTrackingView _contentView](self, "_contentView"), "window"))
      {
        v4 = qword_1ECE71A28;
        if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
        {
          if (v6)
            v5 = *(_QWORD *)(*((_QWORD *)v6 + 4) + 744);
          else
            v5 = 0;
          *(_DWORD *)buf = 134218496;
          v8 = self;
          v9 = 2048;
          v10 = v6;
          v11 = 2048;
          v12 = v5;
          _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "%p - WKApplicationStateTrackingView: View with page [%p, pageProxyID=%llu] did complete snapshot sequence", buf, 0x20u);
        }
        buf[0] = 0;
        WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsTakingSnapshotsForApplicationSuspension>(*((_QWORD *)v6 + 26), buf, *(_QWORD *)(*((_QWORD *)v6 + 4) + 1896), 0);
        if (-[WKApplicationStateTrackingView isBackground](self, "isBackground"))
          WebKit::WebPageProxy::applicationDidFinishSnapshottingAfterEnteringBackground(v6);
      }
    }
  }
}

@end
