@implementation NSBundle

void __52__NSBundle_MediaPlayerCore__mediaPlaybackCoreBundle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlaybackCore"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)mediaPlaybackCoreBundle___mediaPlayerCoreBundle;
  mediaPlaybackCoreBundle___mediaPlayerCoreBundle = v2;

  if (!mediaPlaybackCoreBundle___mediaPlayerCoreBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("NSBundle+MediaPlaybackCore.m"), 18, CFSTR("unable to find MediaPlaybackCore framework"));

  }
}

@end
