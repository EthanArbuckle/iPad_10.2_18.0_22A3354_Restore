@implementation ZN12HTTPProtocol14needsThrottlerEv

char *___ZN12HTTPProtocol14needsThrottlerEv_block_invoke()
{
  char *result;

  result = getenv("CFNETWORK_NOTHROTTLE");
  HTTPProtocol::needsThrottler(void)::okToThrottle = result == 0;
  return result;
}

@end
