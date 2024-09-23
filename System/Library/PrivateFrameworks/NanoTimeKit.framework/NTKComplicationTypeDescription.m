@implementation NTKComplicationTypeDescription

uint64_t __NTKComplicationTypeDescription_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __CFString *v4;

  v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 0x39 && ((0x3FABFFFDFFFFEFFuLL >> v2) & 1) != 0)
  {
    v3 = result;
    v4 = off_1E6BDBA10[v2];
    if (objc_msgSend(*(id *)(result + 32), "length"))
      objc_msgSend(*(id *)(v3 + 32), "appendString:", CFSTR("|"));
    return objc_msgSend(*(id *)(v3 + 32), "appendString:", v4);
  }
  return result;
}

@end
