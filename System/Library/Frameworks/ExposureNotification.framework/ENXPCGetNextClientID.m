@implementation ENXPCGetNextClientID

uint64_t __ENXPCGetNextClientID_block_invoke()
{
  uint64_t result;

  result = RandomBytes();
  ENXPCGetNextClientID_sNext = (unsigned __int16)word_254617BEA << 16;
  return result;
}

@end
