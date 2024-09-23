@implementation AXIsASVAssetViewer

void __AXIsASVAssetViewer_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  AXIsASVAssetViewer_sIsASVAssetViewer = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.AssetViewer.ASVAssetViewer"));
}

@end
