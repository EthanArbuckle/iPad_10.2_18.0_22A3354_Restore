@implementation CADeviceSupportsAPT

const char *__CADeviceSupportsAPT_block_invoke()
{
  const char *result;

  CADeviceSupportsAPT::supports_apt = MGGetBoolAnswer();
  result = getenv("CA_DISABLE_APT");
  if (result)
  {
    result = (const char *)atoi(result);
    if ((_DWORD)result)
      CADeviceSupportsAPT::supports_apt = 0;
  }
  return result;
}

@end
