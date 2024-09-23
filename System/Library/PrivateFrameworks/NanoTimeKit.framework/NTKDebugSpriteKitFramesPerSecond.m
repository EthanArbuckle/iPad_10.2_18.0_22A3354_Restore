@implementation NTKDebugSpriteKitFramesPerSecond

void __NTKDebugSpriteKitFramesPerSecond_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  if (NTKInternalBuild(a1, a2))
  {
    v2 = (id)CFPreferencesCopyAppValue(CFSTR("SpriteKitFPS"), CFSTR("com.apple.NanoTimeKit.face"));
    NTKDebugSpriteKitFramesPerSecond___fps = objc_msgSend(v2, "integerValue");

  }
}

@end
