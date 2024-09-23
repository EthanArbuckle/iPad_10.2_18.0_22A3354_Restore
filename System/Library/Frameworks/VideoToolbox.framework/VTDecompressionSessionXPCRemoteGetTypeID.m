@implementation VTDecompressionSessionXPCRemoteGetTypeID

uint64_t __VTDecompressionSessionXPCRemoteGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  VTDecompressionSessionXPCRemoteGetTypeID_sVTDecompressionSessionXPCRemoteID = result;
  return result;
}

@end
