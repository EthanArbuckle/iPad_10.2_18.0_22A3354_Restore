@implementation CADeviceIsSystemSessionClient

const char *__CADeviceIsSystemSessionClient_block_invoke()
{
  const char *result;
  BOOL v1;

  result = getenv("CA_SYSTEM_SESSION_CLIENT");
  if (result)
  {
    result = (const char *)atoi(result);
    if ((_DWORD)result)
    {
      result = (const char *)getuid();
      v1 = (_DWORD)result == 0;
    }
    else
    {
      v1 = 0;
    }
    CADeviceIsSystemSessionClient::enabled = v1;
  }
  return result;
}

@end
