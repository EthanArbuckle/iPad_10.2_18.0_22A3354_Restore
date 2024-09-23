@implementation WKWebView(WKTestingIOS)

- (void)_doAfterNextVisibleContentRectAndStablePresentationUpdate:
{
  const void *v2;

  _Block_release(*(const void **)(a1 + 40));
  v2 = *(const void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (v2)
    CFRelease(v2);
}

- (uint64_t)_doAfterNextVisibleContentRectAndStablePresentationUpdate:
{
  return objc_msgSend(*(id *)(a1 + 32), "_doAfterNextStablePresentationUpdate:", *(_QWORD *)(a1 + 40));
}

- (uint64_t)_setDeviceOrientationUserPermissionHandlerForTesting:()WKTestingIOS
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

@end
