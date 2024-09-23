@implementation HKApplicationSDKVersionToken

uint64_t __HKApplicationSDKVersionToken_block_invoke()
{
  uint64_t result;

  result = dyld_get_program_sdk_version_token();
  HKApplicationSDKVersionToken__sdkVersionToken = result;
  return result;
}

@end
