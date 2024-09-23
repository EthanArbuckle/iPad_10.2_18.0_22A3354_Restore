@implementation BTXPCGetNextClientID

uint64_t __BTXPCGetNextClientID_block_invoke()
{
  uint64_t result;

  result = RandomBytes();
  BTXPCGetNextClientID_sNext = (unsigned __int16)word_2564423F2 << 16;
  return result;
}

@end
