@implementation AssetExplorerBundle

void __AssetExplorerBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("AEExplorerViewController")));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__AssetExplorerBundle;
  __AssetExplorerBundle = v0;

}

@end
