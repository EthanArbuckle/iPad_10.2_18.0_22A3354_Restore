@implementation ZN18AQHapticOutputNodeC2ERi

_QWORD *___ZN18AQHapticOutputNodeC2ERi_block_invoke()
{
  _QWORD *v0;
  float *v1;

  v0 = (_QWORD *)operator new();
  v0[1] = 0;
  *v0 = os_log_create("com.apple.coreaudio", "AQPT");
  kAQPassthroughSubsystem = (uint64_t)v0;
  return CASmartPreferences::Read((CASmartPreferences *)CFSTR("override_iobuffer_duration"), CFSTR("com.apple.coreaudio"), (const __CFString *)&gHapticIODuration, v1);
}

@end
