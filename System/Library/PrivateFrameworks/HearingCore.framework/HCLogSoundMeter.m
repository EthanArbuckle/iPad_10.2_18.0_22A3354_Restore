@implementation HCLogSoundMeter

void __HCLogSoundMeter_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Hearing", "HCSoundMeter");
  v1 = (void *)HCLogSoundMeter___logObj;
  HCLogSoundMeter___logObj = (uint64_t)v0;

}

@end
