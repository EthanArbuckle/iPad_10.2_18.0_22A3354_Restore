@implementation CBXPCGetNextClientID

uint64_t __CBXPCGetNextClientID_block_invoke()
{
  uint64_t result;

  result = RandomBytes();
  unk_1ECF9A188 = (unsigned __int16)word_1ECF9A18A << 16;
  return result;
}

@end
