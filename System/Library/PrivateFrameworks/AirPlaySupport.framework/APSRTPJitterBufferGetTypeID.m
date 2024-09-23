@implementation APSRTPJitterBufferGetTypeID

uint64_t __APSRTPJitterBufferGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APSRTPJitterBufferGetTypeID_typeID = result;
  return result;
}

@end
