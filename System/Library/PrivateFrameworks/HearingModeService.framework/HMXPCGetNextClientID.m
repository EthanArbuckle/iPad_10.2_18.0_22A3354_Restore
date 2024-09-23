@implementation HMXPCGetNextClientID

uint64_t __HMXPCGetNextClientID_block_invoke()
{
  uint64_t result;

  result = RandomBytes();
  HMXPCGetNextClientID_sNext = (unsigned __int16)word_2543319AA << 16;
  return result;
}

@end
