@implementation AAUIDeviceInfo

+ (BOOL)deviceIsiPad
{
  if (deviceIsiPad_onceToken != -1)
    dispatch_once(&deviceIsiPad_onceToken, &__block_literal_global_7);
  return deviceIsiPad_result;
}

uint64_t __30__AAUIDeviceInfo_deviceIsiPad__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceIsiPad_result = (_DWORD)result == 3;
  return result;
}

@end
