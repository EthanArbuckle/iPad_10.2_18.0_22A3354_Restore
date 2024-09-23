@implementation FBKIsAppleConnectAvailable

uint64_t __FBKIsAppleConnectAvailable_block_invoke()
{
  uint64_t result;

  result = AppleConnectClientLibraryCore();
  if (result)
    FBKIsAppleConnectAvailable_isAvailable = 1;
  return result;
}

@end
