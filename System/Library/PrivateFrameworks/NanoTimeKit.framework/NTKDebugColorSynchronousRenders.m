@implementation NTKDebugColorSynchronousRenders

uint64_t __NTKDebugColorSynchronousRenders_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("ColorSynchronousRenders"), CFSTR("com.apple.NanoTimeKit.face"), 0);
  NTKDebugColorSynchronousRenders___flag = (_DWORD)result != 0;
  return result;
}

@end
