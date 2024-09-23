@implementation NTKDebugShowSpriteKitDebugHUD

uint64_t __NTKDebugShowSpriteKitDebugHUD_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = NTKInternalBuild(a1, a2);
  if ((_DWORD)result)
  {
    result = CFPreferencesGetAppBooleanValue(CFSTR("AnalogFaceShowDebug"), CFSTR("com.apple.NanoTimeKit.face"), 0);
    NTKDebugShowSpriteKitDebugHUD___flag = (_DWORD)result != 0;
  }
  return result;
}

@end
