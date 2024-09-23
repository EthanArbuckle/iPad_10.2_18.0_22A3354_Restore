@implementation MTIsHorseman

uint64_t __MTIsHorseman_block_invoke()
{
  uint64_t result;
  BOOL v2;

  result = MGGetSInt32Answer();
  v2 = (_DWORD)result == 7 || (_DWORD)result == 4;
  MTIsHorseman_isHorseman = v2;
  return result;
}

@end
