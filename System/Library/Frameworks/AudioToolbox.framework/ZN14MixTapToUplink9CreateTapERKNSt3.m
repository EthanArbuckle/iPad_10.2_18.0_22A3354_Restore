@implementation ZN14MixTapToUplink9CreateTapERKNSt3

_QWORD *___ZN14MixTapToUplink9CreateTapERKNSt3__113unordered_mapIjiNS0_4hashIjEENS0_8equal_toIjEENS0_9allocatorINS0_4pairIKjiEEEEEE_block_invoke(PlatformUtilities_iOS *a1)
{
  _QWORD *result;
  BOOL *v2;

  result = (_QWORD *)PlatformUtilities_iOS::IsInternalBuild(a1);
  if ((_DWORD)result)
    return CASmartPreferences::Read((CASmartPreferences *)CFSTR("aqme_capturemixtouplink"), CFSTR("com.apple.coreaudio"), (const __CFString *)&MixTapToUplink::sEnableCapture, v2);
  return result;
}

@end
