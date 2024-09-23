@implementation CUXPCGetNextClientID

uint64_t __CUXPCGetNextClientID_block_invoke()
{
  uint64_t result;

  result = RandomBytes(&CUXPCGetNextClientID_sNext, 4uLL);
  CUXPCGetNextClientID_sNext = (unsigned __int16)word_1EE069342 << 16;
  return result;
}

@end
