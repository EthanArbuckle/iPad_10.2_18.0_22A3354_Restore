@implementation MCDMusicBundle

void __MCDMusicBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MusicApplication"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MCDMusicBundle_musicBundle;
  MCDMusicBundle_musicBundle = v0;

}

@end
