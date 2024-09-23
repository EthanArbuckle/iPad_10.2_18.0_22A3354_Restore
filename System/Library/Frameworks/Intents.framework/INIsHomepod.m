@implementation INIsHomepod

uint64_t __INIsHomepod_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  INIsHomepod_isHomepod = (_DWORD)result == 7;
  return result;
}

@end
