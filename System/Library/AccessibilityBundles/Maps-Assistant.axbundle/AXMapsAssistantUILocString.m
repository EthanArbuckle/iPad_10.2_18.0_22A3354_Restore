@implementation AXMapsAssistantUILocString

void __AXMapsAssistantUILocString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Maps-Assistant.axbundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXMapsAssistantUILocString_bundle;
  AXMapsAssistantUILocString_bundle = v0;

}

@end
