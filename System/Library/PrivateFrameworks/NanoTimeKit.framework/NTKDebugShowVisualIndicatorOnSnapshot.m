@implementation NTKDebugShowVisualIndicatorOnSnapshot

uint64_t __NTKDebugShowVisualIndicatorOnSnapshot_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("ShowVisualIndicatorOnSnapshot"), CFSTR("com.apple.NanoTimeKit.face"), 0);
  NTKDebugShowVisualIndicatorOnSnapshot___flag = (_DWORD)result != 0;
  return result;
}

@end
