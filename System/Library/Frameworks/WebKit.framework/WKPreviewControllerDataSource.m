@implementation WKPreviewControllerDataSource

void __71___WKPreviewControllerDataSource_previewController_previewItemAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  const void *v4;
  uint64_t v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = WeakRetained[8];
    if (v5 && *(_DWORD *)(v5 + 4))
    {
      v6 = WTF::URL::operator NSURL *();
      (*(void (**)(uint64_t, uint64_t, _QWORD))(a2 + 16))(a2, v6, 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "setCompletionHandler:", a2);
    }
    CFRelease(v4);
  }
}

@end
