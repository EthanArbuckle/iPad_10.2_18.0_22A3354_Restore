@implementation WKProcessPool

void __51__WKProcessPool_IAMMessages__webContentProcessPool__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDFA978]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.InAppMessages"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "builtInPlugInsURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("InAppMessagesWebProcessBundle.bundle"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setInjectedBundleURL:", v2);
  objc_msgSend(v5, "setAlwaysRunsAtBackgroundPriority:", 1);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDFA8E8]), "_initWithConfiguration:", v5);
  v4 = (void *)webContentProcessPool_contentProcessPool;
  webContentProcessPool_contentProcessPool = v3;

}

@end
