@implementation NSBundle

void __46__NSBundle_MediaRemoteUI__mediaRemoteUIBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaControls"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mediaRemoteUIBundle___mediaRemoteUIBundle;
  mediaRemoteUIBundle___mediaRemoteUIBundle = v0;

}

void __46__NSBundle_MediaControls__mediaControlsBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaControls"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mediaControlsBundle___mediaControlsBundle;
  mediaControlsBundle___mediaControlsBundle = v0;

}

@end
