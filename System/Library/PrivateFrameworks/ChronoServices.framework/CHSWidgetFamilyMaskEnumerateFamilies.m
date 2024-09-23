@implementation CHSWidgetFamilyMaskEnumerateFamilies

uint64_t __CHSWidgetFamilyMaskEnumerateFamilies_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if ((a2 & ~*(_QWORD *)(result + 40)) == 0)
  {
    v2 = *(_QWORD *)(result + 32);
    if ((a2 & 2) != 0)
    {
      v3 = 1;
    }
    else if ((a2 & 4) != 0)
    {
      v3 = 2;
    }
    else if ((a2 & 8) != 0)
    {
      v3 = 3;
    }
    else if ((a2 & 0x20) != 0)
    {
      v3 = 5;
    }
    else if ((a2 & 0x4000) != 0)
    {
      v3 = 14;
    }
    else if ((a2 & 0x2000) != 0)
    {
      v3 = 13;
    }
    else if ((a2 & 0x10) != 0)
    {
      v3 = 4;
    }
    else if ((a2 & 0x40) != 0)
    {
      v3 = 6;
    }
    else if ((a2 & 0x400) != 0)
    {
      v3 = 10;
    }
    else if ((a2 & 0x800) != 0)
    {
      v3 = 11;
    }
    else
    {
      v3 = (a2 << 51 >> 63) & 0xC;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  return result;
}

@end
