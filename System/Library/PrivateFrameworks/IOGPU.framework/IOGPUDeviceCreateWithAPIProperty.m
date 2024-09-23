@implementation IOGPUDeviceCreateWithAPIProperty

_DWORD *__IOGPUDeviceCreateWithAPIProperty_block_invoke()
{
  _DWORD *result;

  result = (_DWORD *)IOSurfaceGetGraphicsCommPageAddress();
  __globalGPUCommPage = (uint64_t)result;
  if (!result)
  {
    result = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    __globalGPUCommPage = (uint64_t)result;
    *result = 0;
  }
  return result;
}

@end
