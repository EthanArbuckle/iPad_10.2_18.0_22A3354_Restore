@implementation MCDCarDisplayBundle

void __MCDCarDisplayBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileMusicPlayer.MusicCarDisplayUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MCDCarDisplayBundle_carDisplayBundle;
  MCDCarDisplayBundle_carDisplayBundle = v0;

}

@end
