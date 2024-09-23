@implementation MRCreateOriginArrayFromXPCMessage

MROrigin *__MRCreateOriginArrayFromXPCMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  return -[MROrigin initWithData:]([MROrigin alloc], "initWithData:", a2);
}

@end
