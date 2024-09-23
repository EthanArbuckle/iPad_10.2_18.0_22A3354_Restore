@implementation WristDetectSettingChanged

uint64_t __WristDetectSettingChanged_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWristDetectSetting");
}

@end
