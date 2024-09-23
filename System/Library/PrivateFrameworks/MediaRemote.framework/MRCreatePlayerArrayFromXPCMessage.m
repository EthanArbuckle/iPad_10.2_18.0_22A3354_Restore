@implementation MRCreatePlayerArrayFromXPCMessage

MRPlayer *__MRCreatePlayerArrayFromXPCMessage_block_invoke(uint64_t a1, uint64_t a2)
{
  return -[MRPlayer initWithData:]([MRPlayer alloc], "initWithData:", a2);
}

@end
