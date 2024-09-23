@implementation MSNMonitorSetCameraNonStandardCameraClient

char *__MSNMonitorSetCameraNonStandardCameraClient_block_invoke(uint64_t a1)
{
  char *result;

  free((void *)g_cameraExceptionState);
  result = *(char **)(a1 + 32);
  if (result)
    result = strdup(result);
  g_cameraExceptionState = (uint64_t)result;
  return result;
}

@end
