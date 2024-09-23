@implementation APSRTPPacketHandlerGetTypeID

uint64_t __APSRTPPacketHandlerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APSRTPPacketHandlerGetTypeID_typeID = result;
  return result;
}

@end
