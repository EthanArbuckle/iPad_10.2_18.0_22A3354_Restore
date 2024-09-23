@implementation GetTimebase

uint64_t __GetTimebase_block_invoke()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = mach_timebase_info((mach_timebase_info_t)&GetTimebase___timebase);
  if ((_DWORD)result)
  {
    GetTimebase___timebase = 0x100000001;
  }
  else if ((_DWORD)GetTimebase___timebase != HIDWORD(GetTimebase___timebase))
  {
    if (GetTimebase___timebase >= HIDWORD(GetTimebase___timebase))
      v1 = HIDWORD(GetTimebase___timebase);
    else
      v1 = GetTimebase___timebase;
    if (GetTimebase___timebase <= HIDWORD(GetTimebase___timebase))
      v2 = HIDWORD(GetTimebase___timebase);
    else
      v2 = GetTimebase___timebase;
    if ((_DWORD)v1)
    {
      do
      {
        v3 = v1;
        v1 = v2 % v1;
        v2 = v3;
      }
      while (v1);
    }
    else
    {
      v3 = v2;
    }
    LODWORD(GetTimebase___timebase) = GetTimebase___timebase / v3;
    HIDWORD(GetTimebase___timebase) = HIDWORD(GetTimebase___timebase) / v3;
  }
  return result;
}

@end
