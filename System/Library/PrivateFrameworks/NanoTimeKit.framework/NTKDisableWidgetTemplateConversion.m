@implementation NTKDisableWidgetTemplateConversion

uint64_t __NTKDisableWidgetTemplateConversion_block_invoke()
{
  uint64_t result;

  result = CLKInternalBuild();
  if ((_DWORD)result)
  {
    result = CFPreferencesGetAppBooleanValue(CFSTR("DisableWidgetTemplateConversion"), CFSTR("com.apple.NanoTimeKit"), 0);
    NTKDisableWidgetTemplateConversion___flag = (_DWORD)result != 0;
  }
  return result;
}

@end
