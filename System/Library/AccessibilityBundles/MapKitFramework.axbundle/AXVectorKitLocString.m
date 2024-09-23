@implementation AXVectorKitLocString

void __AXVectorKitLocString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.VectorKit.axbundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXVectorKitLocString_bundle;
  AXVectorKitLocString_bundle = v0;

}

@end
