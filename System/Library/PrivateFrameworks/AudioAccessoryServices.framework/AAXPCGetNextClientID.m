@implementation AAXPCGetNextClientID

uint64_t __AAXPCGetNextClientID_block_invoke()
{
  uint64_t result;

  result = RandomBytes();
  AAXPCGetNextClientID_sNext = (unsigned __int16)word_2542AEE2A << 16;
  return result;
}

@end
