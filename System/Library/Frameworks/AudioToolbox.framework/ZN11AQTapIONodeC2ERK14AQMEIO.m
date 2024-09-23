@implementation ZN11AQTapIONodeC2ERK14AQMEIO

_QWORD *___ZN11AQTapIONodeC2ERK14AQMEIO_BindingRK17AudioTapSpecifier_block_invoke(PlatformUtilities_iOS *a1)
{
  _QWORD *result;
  BOOL *v2;

  result = (_QWORD *)PlatformUtilities_iOS::IsInternalBuild(a1);
  if ((_DWORD)result)
    return CASmartPreferences::Read((CASmartPreferences *)CFSTR("aqme_capturetap"), CFSTR("com.apple.coreaudio"), (const __CFString *)&AQTapIONode::sEnableCapture, v2);
  return result;
}

@end
