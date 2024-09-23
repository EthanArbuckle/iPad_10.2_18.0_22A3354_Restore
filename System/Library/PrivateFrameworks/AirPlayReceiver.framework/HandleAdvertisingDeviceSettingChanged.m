@implementation HandleAdvertisingDeviceSettingChanged

void ___HandleAdvertisingDeviceSettingChanged_block_invoke(uint64_t a1)
{
  _NotifySessionsSystemInfoChange(*(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
