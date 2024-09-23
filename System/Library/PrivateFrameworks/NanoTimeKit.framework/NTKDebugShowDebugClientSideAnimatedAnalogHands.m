@implementation NTKDebugShowDebugClientSideAnimatedAnalogHands

uint64_t __NTKDebugShowDebugClientSideAnimatedAnalogHands_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = NTKInternalBuild(a1, a2);
  if ((_DWORD)result)
  {
    result = CFPreferencesGetAppBooleanValue(CFSTR("ShowDebugClientSideAnimatedAnalogHands"), CFSTR("com.apple.NanoTimeKit.face"), 0);
    NTKDebugShowDebugClientSideAnimatedAnalogHands___flag = (_DWORD)result != 0;
  }
  return result;
}

@end
