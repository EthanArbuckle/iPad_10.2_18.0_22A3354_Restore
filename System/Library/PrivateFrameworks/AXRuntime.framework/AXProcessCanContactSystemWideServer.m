@implementation AXProcessCanContactSystemWideServer

void __AXProcessCanContactSystemWideServer_block_invoke()
{
  void *v0;
  void *v1;
  int v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.WebKit.WebContent"));

  if (v2)
    AXProcessCanContactSystemWideServer_CanContact = 1;
}

@end
