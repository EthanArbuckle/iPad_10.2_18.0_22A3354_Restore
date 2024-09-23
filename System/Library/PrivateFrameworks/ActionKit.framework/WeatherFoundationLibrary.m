@implementation WeatherFoundationLibrary

void *__WeatherFoundationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/WeatherFoundation.framework/WeatherFoundation", 2);
  WeatherFoundationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
