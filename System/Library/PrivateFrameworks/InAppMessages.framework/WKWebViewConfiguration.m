@implementation WKWebViewConfiguration

void __64__WKWebViewConfiguration_IAMShared__sharedMessagesConfiguration__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x24BDFA920]);
  v1 = (void *)sharedMessagesConfiguration_sharedConfiguration;
  sharedMessagesConfiguration_sharedConfiguration = (uint64_t)v0;

  objc_msgSend((id)sharedMessagesConfiguration_sharedConfiguration, "setAllowsInlineMediaPlayback:", 1);
  objc_msgSend(MEMORY[0x24BDFA8E8], "webContentProcessPool");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedMessagesConfiguration_sharedConfiguration, "setProcessPool:", v3);
  v2 = objc_alloc_init(MEMORY[0x24BDFA8E0]);
  objc_msgSend(v2, "_setAllowFileAccessFromFileURLs:", 1);
  objc_msgSend((id)sharedMessagesConfiguration_sharedConfiguration, "setPreferences:", v2);
  objc_msgSend((id)sharedMessagesConfiguration_sharedConfiguration, "_setWaitsForPaintAfterViewDidMoveToWindow:", 0);

}

@end
