@implementation AXWeatherLocString

void __AXWeatherLocString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Weather.axbundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXWeatherLocString_bundle;
  AXWeatherLocString_bundle = v0;

}

@end
