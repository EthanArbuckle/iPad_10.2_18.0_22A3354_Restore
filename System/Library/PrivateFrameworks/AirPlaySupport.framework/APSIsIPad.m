@implementation APSIsIPad

uint64_t __APSIsIPad_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  if ((_DWORD)result == 3)
    APSIsIPad_sIsiPad = 1;
  return result;
}

@end
