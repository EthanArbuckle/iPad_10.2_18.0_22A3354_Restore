@implementation MRCreateClientArrayFromXPCMessage

MRClient *__MRCreateClientArrayFromXPCMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  return -[MRClient initWithData:]([MRClient alloc], "initWithData:", a2);
}

@end
