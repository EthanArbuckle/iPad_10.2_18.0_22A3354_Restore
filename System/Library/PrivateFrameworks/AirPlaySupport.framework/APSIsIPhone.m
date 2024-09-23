@implementation APSIsIPhone

uint64_t __APSIsIPhone_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  if ((_DWORD)result == 1)
    APSIsIPhone_sIsiPhone = 1;
  return result;
}

@end
