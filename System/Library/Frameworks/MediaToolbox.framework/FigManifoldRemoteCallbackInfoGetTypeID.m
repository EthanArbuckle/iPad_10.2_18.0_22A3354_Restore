@implementation FigManifoldRemoteCallbackInfoGetTypeID

uint64_t __FigManifoldRemoteCallbackInfoGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gCallbackInfoTypeID = result;
  return result;
}

@end
