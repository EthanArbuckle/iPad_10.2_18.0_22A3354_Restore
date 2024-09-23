@implementation WKWebView(WKPrivateIOS)

- (uint64_t)_doAfterNextStablePresentationUpdate:()WKPrivateIOS
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_detectDataWithTypes:()WKPrivateIOS completionHandler:
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 8);
    if (v4)
      WebKit::WebPageProxy::setDataDetectionResult(v4 - 16, a2);
  }
  result = *(_QWORD *)(a1 + 8);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (uint64_t)_snapshotRectAfterScreenUpdates:()WKPrivateIOS rectInViewCoordinates:intoImageOfWidth:completionHandler:
{
  void *v3;
  uint64_t result;
  CFTypeRef cf;
  WTF *v6;

  if (!*(_BYTE *)(a2 + 64))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  WebCore::ShareableBitmap::create();
  if (v6)
  {
    WebCore::ShareableBitmap::makeCGImage();
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
    if (cf)
      CFRelease(cf);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }
  result = (uint64_t)v6;
  if (v6)
    return WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v6, v3);
  return result;
}

- (uint64_t)_isNavigatingToAppBoundDomain:()WKPrivateIOS
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_isForcedIntoAppBoundMode:()WKPrivateIOS
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_addLayerForFindOverlay
{
  void *v2;

  *a1 = off_1E34C5D60;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_addLayerForFindOverlay
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    WeakRetained[125] = a2;
    WeakRetained[126] = a3;
    CFRelease(WeakRetained);
  }
}

- (uint64_t)_removeLayerForFindOverlay
{
  void *v2;

  *a1 = off_1E34C5D88;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_removeLayerForFindOverlay
{
  id WeakRetained;
  const void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_didRemoveLayerForFindOverlay");
    CFRelease(v2);
  }
}

@end
