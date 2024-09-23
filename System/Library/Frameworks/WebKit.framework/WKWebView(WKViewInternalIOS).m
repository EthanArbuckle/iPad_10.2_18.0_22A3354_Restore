@implementation WKWebView(WKViewInternalIOS)

- (void)_rescheduleEndLiveResizeTimer
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_endLiveResize");
  if (WeakRetained)
    CFRelease(WeakRetained);
}

- (void)_acquireResizeAssertionForReason:
{
  id WeakRetained;
  const void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 4))
    {
      objc_msgSend(WeakRetained, "_invalidateResizeAssertions");
      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 4) = 1;
    }
    CFRelease(v3);
  }
}

- (_QWORD)_firePresentationUpdateForPendingStableStatePresentationCallbacks
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34C58D0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_firePresentationUpdateForPendingStableStatePresentationCallbacks
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 1648), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 8), "_firePresentationUpdateForPendingStableStatePresentationCallbacks");
  return result;
}

- (void)_endLiveResize
{
  const void *v2;

  v2 = *(const void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (v2)
    CFRelease(v2);
}

- (uint64_t)_endLiveResize
{
  return objc_msgSend(*(id *)(a1 + 8), "removeFromSuperview");
}

- (void)_presentLockdownMode
{
  void *v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CFTypeRef v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  CFTypeRef v11;
  void *v12;
  CFTypeRef v13;
  CFTypeRef cf;
  CFTypeRef arg;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = objc_msgSend(v2, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AAC8]);
  if (!v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = objc_msgSend(v5, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE88]);
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  WebCore::copyLocalizedString((WebCore *)CFSTR("Lockdown Mode is Turned On For “%@“"), v3);
  if (arg)
  {
    CFAutorelease(arg);
    v7 = arg;
  }
  else
  {
    v7 = 0;
  }
  WebKit::createUIAlertController((WebKit *)objc_msgSend(v6, "stringWithFormat:", v7, v4), *(NSString **)(a1 + 8), &cf);
  v8 = (void *)cf;
  v9 = (void *)MEMORY[0x1E0CEA2E0];
  WebCore::copyLocalizedString((WebCore *)CFSTR("OK"), v10);
  if (arg)
  {
    CFAutorelease(arg);
    v11 = arg;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v8, "addAction:", objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, 0));
  v12 = (void *)objc_msgSend(*(id *)(a1 + 16), "_wk_viewControllerForFullScreenPresentation");
  objc_msgSend(v12, "presentViewController:animated:completion:", cf, 1, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "setBool:forKey:", 1, CFSTR("WebKitCaptivePortalModeAlertShown"));
  v13 = cf;
  cf = 0;
  if (v13)
    CFRelease(v13);
}

- (WTF::RunLoop)_presentLockdownMode
{
  WTF::RunLoop *v2;
  uint64_t v3;
  uint64_t v4;
  WTF::RunLoop *v5;
  WTF::RunLoop *v6;

  if (a2 == 2)
  {
    lockdownModeWarningNeeded = 1;
  }
  else
  {
    lockdownModeWarningNeeded = 0;
    if (a2 == 3)
    {
      return (WTF::RunLoop *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "setBool:forKey:", 1, CFSTR("WebKitCaptivePortalModeAlertShown"));
    }
    else
    {
      v2 = result;
      WTF::RunLoop::main(result);
      v3 = *((_QWORD *)v2 + 4);
      if (v3)
        CFRetain(*((CFTypeRef *)v2 + 4));
      v4 = *((_QWORD *)v2 + 5);
      *((_QWORD *)v2 + 5) = 0;
      v5 = (WTF::RunLoop *)WTF::fastMalloc((WTF *)0x18);
      *(_QWORD *)v5 = &off_1E34C5978;
      *((_QWORD *)v5 + 1) = v3;
      *((_QWORD *)v5 + 2) = v4;
      v6 = v5;
      WTF::RunLoop::dispatch();
      result = v6;
      if (v6)
        return (WTF::RunLoop *)(*(uint64_t (**)(WTF::RunLoop *))(*(_QWORD *)v6 + 8))(v6);
    }
  }
  return result;
}

- (_QWORD)_presentLockdownMode
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E34C5978;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)_presentLockdownMode
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E34C5978;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (_QWORD)_restorePageScrollPosition:()WKViewInternalIOS scrollOrigin:previousObscuredInset:scale:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34C5B30;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_restorePageScrollPosition:()WKViewInternalIOS scrollOrigin:previousObscuredInset:scale:
{
  LODWORD(a2) = *(_DWORD *)(a1 + 28);
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  LODWORD(a4) = *(_DWORD *)(a1 + 36);
  LODWORD(a5) = *(_DWORD *)(a1 + 40);
  LODWORD(a6) = *(_DWORD *)(a1 + 44);
  LODWORD(a7) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 8), "_restorePageScrollPosition:scrollOrigin:previousObscuredInset:scale:", *(_QWORD *)(a1 + 16), *(unsigned int *)(a1 + 24), a2, a3, a4, a5, a6, a7, *(double *)(a1 + 56));
}

- (_QWORD)_restorePageStateToUnobscuredCenter:()WKViewInternalIOS scale:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34C5B58;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_restorePageStateToUnobscuredCenter:()WKViewInternalIOS scale:
{
  return objc_msgSend(*(id *)(a1 + 8), "_restorePageStateToUnobscuredCenter:scale:", *(_QWORD *)(a1 + 16), *(unsigned int *)(a1 + 24), *(double *)(a1 + 32));
}

- (_QWORD)_takeViewSnapshot
{
  WebKit::ViewSnapshot *v2;

  v2 = (WebKit::ViewSnapshot *)a1[1];
  *a1 = &off_1E34C5B80;
  a1[1] = 0;
  if (v2)
    WTF::RefCounted<WebKit::ViewSnapshot>::deref(v2);
  return a1;
}

- (uint64_t)_takeViewSnapshot
{
  WebKit::ViewSnapshot *v3;

  v3 = (WebKit::ViewSnapshot *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34C5B80;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    WTF::RefCounted<WebKit::ViewSnapshot>::deref(v3);
  return WTF::fastFree(this, a2);
}

- (WebCore::IOSurface)_takeViewSnapshot
{
  WebCore::IOSurface *v2;
  WebCore::IOSurface **v3;
  WTF *v4;
  void *v5;
  WebCore::IOSurface *v6;

  v2 = *a2;
  *a2 = 0;
  if (v2)
  {
    v3 = (WebCore::IOSurface **)*((_QWORD *)result + 1);
    v6 = v2;
    WebKit::ViewSnapshot::setSurface(v3, &v6);
    result = v6;
    if (v6)
    {
      WebCore::IOSurface::~IOSurface(v6);
      return (WebCore::IOSurface *)WTF::fastFree(v4, v5);
    }
  }
  return result;
}

- (uint64_t)scrollView:()WKViewInternalIOS handleScrollUpdate:completion:
{
  id *v2;
  void *v3;

  *a1 = off_1E34C5BA8;
  v2 = (id *)(a1 + 1);
  _Block_release(a1[2]);
  objc_destroyWeak(v2);
  return WTF::fastFree((WTF *)a1, v3);
}

- (void)scrollView:()WKViewInternalIOS handleScrollUpdate:completion:
{
  char *WeakRetained;
  const void *v5;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (*(_BYTE *)(a1 + 24))
    {
      if (!WeakRetained[1666])
        *(_WORD *)(WeakRetained + 1665) = a2 ^ 1 | 0x100;
      (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
    }
    CFRelease(v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  }
}

- (uint64_t)_acquireResizeAssertionForReason:()WKViewInternalIOS
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  *(_QWORD *)a1 = off_1E34C5BD0;
  v3 = *(unsigned int **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v3)
  {
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      atomic_store(1u, v3);
      WTF::fastFree((WTF *)v3, a2);
    }
  }
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;

  *(_QWORD *)a1 = off_1E34C5BD0;
  v3 = *(unsigned int **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v3)
  {
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      atomic_store(1u, v3);
      WTF::fastFree((WTF *)v3, a2);
    }
  }
  objc_destroyWeak((id *)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v6);
}

- (void)_acquireResizeAssertionForReason:()WKViewInternalIOS
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 16) + 4))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      v3 = WeakRetained;
      v4 = qword_1ECE71A28;
      if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 134217984;
        v6 = v3;
        _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "WKWebView %p next visible content rect update took too long; clearing resize assertions",
          (uint8_t *)&v5,
          0xCu);
      }
      objc_msgSend(v3, "_invalidateResizeAssertions");
      *(_BYTE *)(*(_QWORD *)(a1 + 16) + 4) = 1;
      CFRelease(v3);
    }
  }
}

- (_QWORD)_scheduleVisibleContentRectUpdateAfterScrollInView:()WKViewInternalIOS
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34C5BF8;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_scheduleVisibleContentRectUpdateAfterScrollInView:()WKViewInternalIOS
{
  void *v1;
  uint64_t result;

  v1 = *(void **)(a1 + 8);
  result = objc_msgSend(v1, "_isValid");
  if ((_DWORD)result)
    return objc_msgSend(v1, "_addUpdateVisibleContentRectPreCommitHandler");
  return result;
}

- (_QWORD)_updateVisibleContentRects
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34C5C20;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_updateVisibleContentRects
{
  return objc_msgSend(*(id *)(a1 + 8), "setContentOffset:animated:", 0, *(double *)(a1 + 16), *(double *)(a1 + 24));
}

- (_QWORD)_endLiveResize
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34C5C48;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

@end
