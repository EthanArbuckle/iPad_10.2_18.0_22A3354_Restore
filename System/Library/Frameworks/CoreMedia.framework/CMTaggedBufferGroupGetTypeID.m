@implementation CMTaggedBufferGroupGetTypeID

uint64_t __CMTaggedBufferGroupGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CMTaggedBufferGroupGetTypeID_sTaggedBufferGroupTypeID = result;
  return result;
}

@end
