@implementation MTAlarmRepeatString

uint64_t __MTAlarmRepeatString_block_invoke(uint64_t result, unint64_t a2)
{
  if (a2 <= 6)
    return objc_msgSend(*(id *)(result + 32), "appendString:", off_1E39CD3D0[a2]);
  return result;
}

@end
