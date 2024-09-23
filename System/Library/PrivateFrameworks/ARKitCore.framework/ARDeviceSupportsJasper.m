@implementation ARDeviceSupportsJasper

BOOL __ARDeviceSupportsJasper_block_invoke()
{
  _BOOL8 result;

  result = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.jasper.enabled"));
  s_deviceSupportsJasper = result;
  return result;
}

@end
